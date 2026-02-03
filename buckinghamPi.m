function results = buckinghamPi(params, dimNames, dimMatrix)
% Author: Emmanuel J Rodriguez, with executive assistant ChatGPT
% emmanueljrodriguez.com
% Date: 2FEB2026 | Location: Renton, WA
%
%BUCKINGHAMPI Compute Buckingham Pi groups using symbolic toolbox.
% Literature: Cengel, Y. (2018). Fluid Mechanics: Fundamentals and Applications (4th ed.). New York: McGraw-Hill.
%        Ref: Ch. 7, Sec 7-4 The Method of Repeating Variables and the
%        Buckingham Pi Theorem; pp. 281 - 286.
%
%   results = buckinghamPi(params, dimNames, dimMatrix)
%
% INPUTS
%   params     : 1xn string/cellstr list of parameter names (dependent + independent)
%                e.g. ["delta","omega","rho","mu", "alpha"]
%
%   dimNames   : 1xj string/cellstr list of primary dimensions (order matters)
%                e.g. ["M","L","T"]
%
%   dimMatrix  : nxj numeric matrix of exponents for each parameter in dimNames order
%                Row i corresponds to params(i)
%                Example for ["delta","omega","rho","mu"] with ["M","L","T"]:
%                   delta: [0  1  0]
%                   omega: [0  0 -1]
%                   rho  : [1 -3  0]
%                   mu   : [1 -1 -1]
%                   alpha: [0  0  0]
%
% OUTPUT
%   results is a struct containing:
%       .n, .j, .k
%       .repeatingIdx, .repeatingParams
%       .piGroups (symbolic expressions)
%       .exponents (table of exponents for each Pi group)

% CAUTION: The piGroups must still be manipulated, if applicable, as necessary to achieve 
% established dimensionless groups (ref: Table(s) 7-4, p. 286, and 7-5, pp. 287 - 288).

% NOTE: When prompted, choose repeating parameters according to guidelines in Table 7-3 (p. 284).
% (A wise selection for fluid flow problems is a LENGTH, a VELOCITY, and a MASS or DENSITY.)


    % ---- Input cleanup ----
    params   = string(params);
    dimNames = string(dimNames);

    n = numel(params);
    j = numel(dimNames);

    if size(dimMatrix,1) ~= n || size(dimMatrix,2) ~= j
        error("dimMatrix must be size n-by-j where n=numel(params), j=numel(dimNames).");
    end

    k = n - j;

    fprintf("\n--- Buckingham Pi Setup ---\n");
    fprintf("n = %d parameters\n", n);
    fprintf("j = %d primary dimensions: %s\n", j, strjoin(dimNames, ", "));
    fprintf("k = n - j = %d expected Pi group(s)\n\n", k);

    if k <= 0
        error("k = n-j must be >= 1 to form Pi groups. Check your inputs.");
    end

    % ---- Show parameter list & dimension matrix ----
    fprintf("Parameters and their dimension exponents (rows):\n");
    header = "Param";
    for d = 1:j, header = header + sprintf("\t%s", dimNames(d)); end
    fprintf("%s\n", header);
    for i = 1:n
        fprintf("%s", params(i));
        fprintf("\t%d", dimMatrix(i,:));
        fprintf("\n");
    end
    fprintf("\n");

    % ---- Ask user for repeating parameters ----
    fprintf("Choose %d repeating parameters.\n", j);
    fprintf("Rule of thumb (fluids): pick ones that span %s and are independent.\n", strjoin(dimNames,", "));
    fprintf("(A wise selection for fluid flow problems is a length, a velocity, and a mass or density.)");
    fprintf("Available: %s\n\n", strjoin(params, ", "));

    repInput = input(sprintf("Enter %d repeating parameter names (e.g. {'rho','omega','mu'}): ", j), "s");
    repCell  = str2cell(repInput);  %#ok<NASGU>
    % Parse the user string into a cell array safely
    try
        repeatingParams = string(evalin("base", repInput));
    catch
        try
            repeatingParams = string(eval(repInput));
        catch
            error("Could not parse repeating parameter input. Use format like {'rho','omega','mu'}.");
        end
    end

    if numel(repeatingParams) ~= j
        error("You must enter exactly %d repeating parameters.", j);
    end

    % Map names to indices
    repeatingIdx = zeros(1,j);
    for r = 1:j
        idx = find(params == repeatingParams(r), 1);
        if isempty(idx)
            error("Repeating parameter '%s' not found in params list.", repeatingParams(r));
        end
        repeatingIdx(r) = idx;
    end

    % Non-repeating indices
    nonRepeatingIdx = setdiff(1:n, repeatingIdx, "stable");

    if numel(nonRepeatingIdx) ~= k
        % This should always hold if j repeating vars chosen
        warning("Non-repeating count (%d) does not match k (%d).", numel(nonRepeatingIdx), k);
    end

    % ---- Check independence of repeating parameters ----
    Dr = dimMatrix(repeatingIdx, :);      % j-by-j
    rankDr = rank(double(Dr));
    if rankDr < j
        error("Chosen repeating parameters are not dimensionally independent (rank=%d < %d). Choose a different set.", rankDr, j);
    end

    fprintf("\nRepeating parameters chosen: %s\n", strjoin(params(repeatingIdx), ", "));
    fprintf("Non-repeating parameters:     %s\n\n", strjoin(params(nonRepeatingIdx), ", "));

    % ---- Symbolic variables for params ----
    % Create symbolic symbols with same names as params
    % (Safe as long as they are valid identifiers.)
    symVars = sym(params);

    % ---- Build Pi groups ----
    piGroups  = sym(zeros(1, numel(nonRepeatingIdx)));
    expMatrix = sym(zeros(numel(nonRepeatingIdx), j)); % each row: exponents on repeating vars

    for g = 1:numel(nonRepeatingIdx)
        idxNR = nonRepeatingIdx(g);

        % dimension vector for current non-repeating variable (1-by-j -> column)
        di = dimMatrix(idxNR, :).';

        % Solve Dr^T * x = -di for x (x are exponents on repeating vars)
        % Dr is j-by-j, di is j-by-1
        x = sym(Dr.');   % convert to sym
        rhs = -sym(di);

        solExp = simplify(x \ rhs);  % j-by-1

        expMatrix(g, :) = solExp.';  % store as row

        % Construct Pi_g = (nonrepeat var) * product(repeating var ^ exponent)
        Pi_g = symVars(idxNR);
        for r = 1:j
            Pi_g = Pi_g * symVars(repeatingIdx(r))^(solExp(r));
        end

        piGroups(g) = simplify(Pi_g);
    end

    % ---- Display results ----
    fprintf("--- Results ---\n");
    fprintf("Computed %d Pi group(s):\n\n", numel(piGroups));

    for g = 1:numel(piGroups)
        fprintf("Pi_%d = ", g);
        disp(piGroups(g));

        fprintf("  Exponents on repeating parameters [%s]:\n    ", strjoin(params(repeatingIdx), ", "));
        disp(expMatrix(g,:));
        fprintf("\n");
    end

    % Table of exponents
    expTable = array2table(double(expMatrix), "VariableNames", cellstr(params(repeatingIdx)));
    expTable.PiGroup = (1:size(expTable,1)).';
    expTable = movevars(expTable, "PiGroup", "Before", 1);

    % Pack output
    results = struct();
    results.n = n; results.j = j; results.k = k;
    results.params = params;
    results.dimNames = dimNames;
    results.dimMatrix = dimMatrix;
    results.repeatingIdx = repeatingIdx;
    results.repeatingParams = params(repeatingIdx);
    results.nonRepeatingParams = params(nonRepeatingIdx);
    results.piGroups = piGroups;
    results.exponents = expTable;
end

% --- helper: convert input string to cell (fallback) ---
function c = str2cell(s) %#ok<DEFNU>
%STR2CELL Attempt to interpret a string like "{'a','b','c'}" to a cell array.
    try
        c = eval(s);
    catch
        error("Could not parse repeating parameter input string.");
    end
end


%[appendix]{"version":"1.0"}
%---
