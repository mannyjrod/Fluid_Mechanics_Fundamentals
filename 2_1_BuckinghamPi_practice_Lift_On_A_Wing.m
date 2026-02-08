%% buckinghamPi sub-routine practice with
% Ex. 7-8 Lift ona a Wing Ref: Cengel, pp. 291 - 294

params = ["Fl", "V", "Lc", "rho", "mu", "c", "alpha"];
dimNames = ["M", "L", "T"];
dimMatrix = [1  1 -2;   % Fl
             0  1 -1;   % V
             0  1  0;   % Lc
             1 -3  0;   % rho
             1 -1 -1;   % mu
             0  1 -1;   % c
             0  0  0];  % alpha
%%
results = buckinghamPi(params, dimNames, dimMatrix);
disp(results.exponents)
disp(results.piGroups)
%% 
% checks out! -ERODRIGUEZ2, 4FEB2026 17:59