function results = buckinghamPiMulti(params, depParams, dimNames, dimMatrix, opts)
% Author: Emmanuel J Rodriguez, with executive assistant ChatGPT
% emmanueljrodriguez.com
% Date: 2FEB2026 | Location: Renton, WA
%
%BUCKINGHAMPIMULTI Buckingham Pi groups with multiple dependent variables.
%
% results = buckinghamPiMulti(params, depParams, dimNames, dimMatrix, opts)
%
% INPUTS
%   params     : 1xn list of all parameters (dependent + independent), e.g. ["Cd","Re","rho","U","L","mu"]
%   depParams  : 1xnd list of dependent parameters subset of params, e.g. ["delta1","delta2"]
%   dimNames   : 1xj list of primary dimensions (order), e.g. ["M","L","T"]
%   dimMatrix  : n x j numeric matrix of dimension exponents per params row
%
%   opts (optional struct):
%     .askRepeating (default true) -> prompt user to enter repeating variables
%     .repeatingParams (default []) -> if provided, use these instead of prompting
%     .buildAllNonRepeating (default true) -> if true, build Pi groups for ALL non-repeating vars (k groups)
%                                            if false, build only for depParams
%
% OUTPUT
%   results struct with:
%     .n, .j, .k, .ndep
%     .repeatingParams, .nonRepeatingParams
%     .piGroups (sym array), .piInfo (table)

    if nargin < 5 || isempty(opts), opts = struct(); end
    if ~isfield(opts,"askRepeating"), opts.askRepeating = true; end
    if ~isfield(opts,"repeatingParams"), opts.repeatingParams = string.empty; end
    if ~isfield(opts,"buildAllNonRepeating"), opts.buildAllNonRepeating = true; end

    params    = string(params);
    depParams = string(depParams);
    dimNames  = string(dimNames);

    n = numel(params);
    j = numel(dimNames);
    k = n - j;
    ndep = numel(depParams);

    if size(dimMatrix,1) ~= n || size(dimMatrix,2) ~= j
        error("dimMatrix must be size n-by-j where n=numel(params), j=numel(dimNames).");
    end
    if k <= 0
        error("k = n-j must be >= 1 to form Pi groups.");
    end

    % --- Map depParams to indices ---
    depIdx = zeros(1, ndep);
    for d = 1:ndep
        idx = find(params == depParams(d), 1);
        if isempty(idx)
            error("Dependent parameter '%s' not found in params.", depParams(d));
        end
        depIdx(d) = idx;
    end

    fprintf("\n--- Buckingham Pi (Multi-Dependent) ---\n");
    fprintf("n = %d parameters\n", n);
    fprintf("j = %d primary dimensions: %s\n", j, strjoin(dimNames, ", "));
    fprintf("k = n - j = %d expected Pi group(s)\n", k);
    fprintf("ndep = %d dependent variable(s): %s\n\n", ndep, strjoin(depParams, ", "));

    % --- Choose repeating parameters ---
    if ~isempty(opts.repeatingParams)
        repeatingParams = string(opts.repeatingParams);
        if numel(repeatingParams) ~= j
            error("opts.repeatingParams must have exactly j=%d entries.", j);
        end
    else
        if ~opts.askRepeating
            error("Either set opts.repeatingParams or set opts.askRepeating=true.");
        end

        fprintf("Choose %d repeating parameters.\n", j);
        fprintf("Available: %s\n\n", strjoin(params, ", "));
        repInput = input(sprintf("Enter %d repeating parameter names (e.g. {'rho','U','L'}): ", j), "s");

        try
            repeatingParams = string(eval(repInput));
        catch
            error("Could not parse repeating parameter input. Use format like {'rho','U','L'}.");
        end

        if numel(repeatingParams) ~= j
            error("You must enter exactly %d repeating parameters.", j);
        end
    end

    repeatingIdx = zeros(1,j);
    for r = 1:j
        idx = find(params == repeatingParams(r), 1);
        if isempty(idx)
            error("Repeating parameter '%s' not found in params list.", repeatingParams(r));
        end
        repeatingIdx(r) = idx;
    end

    % Independence check
    Dr = dimMatrix(repeatingIdx, :); % j-by-j
    if rank(double(Dr)) < j
        error("Chosen repeating parameters are not independent (rank < j). Choose a different set.");
    end

    nonRepeatingIdx = setdiff(1:n, repeatingIdx, "stable");

    fprintf("\nRepeating parameters:   %s\n", strjoin(params(repeatingIdx), ", "));
    fprintf("Non-repeating params:   %s\n", strjoin(params(nonRepeatingIdx), ", "));
    fprintf("\n");

    % --- Decide which variables to build Pi groups for ---
    if opts.buildAllNonRepeating
        buildIdx = nonRepeatingIdx; % should produce k groups
        buildLabel = "ALL non-repeating variables";
    else
        % only build Pi groups for dependent variables (must be non-repeating)
        buildIdx = depIdx;
        if any(ismember(buildIdx, repeatingIdx))
            error("A dependent variable was chosen as repeating. Remove it from repeating set.");
        end
        buildLabel = "dependent variables only";
    end

    fprintf("Building Pi groups for: %s\n\n", buildLabel);

    % --- Symbolic vars ---
    symVars = sym(params);

    % --- Solve exponents and build Pi groups ---
    DrT = sym(Dr.'); % j-by-j
    piGroups = sym(zeros(1, numel(buildIdx)));
    expOnRepeats = sym(zeros(numel(buildIdx), j));

    for g = 1:numel(buildIdx)
        idxNR = buildIdx(g);
        di = dimMatrix(idxNR, :).';      % j-by-1
        solExp = simplify(DrT \ (-sym(di))); % j-by-1

        expOnRepeats(g,:) = solExp.';

        Pi_g = symVars(idxNR);
        for r = 1:j
            Pi_g = Pi_g * symVars(repeatingIdx(r))^(solExp(r));
        end
        piGroups(g) = simplify(Pi_g);
    end

    % --- Build output table ---
    repNames = params(repeatingIdx);
    base = array2table(string(params(buildIdx)), "VariableNames", "TargetParam");
    for r = 1:j
        base.(repNames(r)) = expOnRepeats(:,r);
    end
    base.PiGroup = piGroups.';
    base = movevars(base, "PiGroup", "After", "TargetParam");

    % --- Display ---
    fprintf("--- Results ---\n");
    for g = 1:numel(piGroups)
        fprintf("Target: %s\n", params(buildIdx(g)));
        fprintf("Pi_%d = ", g); disp(piGroups(g));
        fprintf("Exponents on repeating [%s]:\n", strjoin(repNames, ", "));
        disp(expOnRepeats(g,:));
        fprintf("\n");
    end

    % --- Pack results ---
    results = struct();
    results.n = n; results.j = j; results.k = k; results.ndep = ndep;
    results.params = params; results.depParams = depParams;
    results.dimNames = dimNames; results.dimMatrix = dimMatrix;
    results.repeatingParams = params(repeatingIdx);
    results.nonRepeatingParams = params(nonRepeatingIdx);
    results.piGroups = piGroups;
    results.piInfo = base;
end

%[appendix]{"version":"1.0"}
%---
