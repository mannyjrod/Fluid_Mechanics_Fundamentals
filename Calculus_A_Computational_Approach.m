%[text] # Calculus: A Computational Approach
%[text] %[text:anchor:TMP_3624] Purpose: Practice calculus fundamental rules
%[text] Author: Emmanuel Rodriguez
%[text] [emmanueljrodriguez.com](https://emmanueljrodriguez.com/)
%[text] Date: 10FEB2026
%[text] Location: Renton, Seattle, WA
%%
%[text:tableOfContents]{"heading":"**Table of Contents**"}
%[text] 
%%
%[text] ## Integration
%[text] ### Mathematical target: Natural logarithm
%[text] Ref: Compression of an Air-Fuel Mixture, example 9 - 1 (Cengel, pp. 404 - 405)
%[text] Compute:
%[text] $\\int\_{\\rho(0)}^{\\rho} \\frac{d\\rho}{\\rho}$
% Define symbolic variables
syms rho rho0 positive; % Note: declare density as positive, to make the math math pragmatic results.
% (Density is POSITIVE -- no negative mass in this plane of existence)

% Define integrand
f = 1/rho;

% Compute the definite integral from rho0 to rho
integralResult = int(f, rho, rho0, rho);

integralResult_simpl = simplify(integralResult);

% Display
disp(integralResult) %[output:5d5d58a8]
disp(integralResult_simpl) %[output:4761d6b2]
%%
%[text] Note: MATLAB uses `log` for the **natural logarithm.**
%[text] `log(x)` $\\rightarrow \\ln x$
%%
%[text] Rewrite using the *logarithm quotient rule*:
%[text] $\\ln a - ln b = \\ln\\!\\left(\\frac{a}{b}\\right)$
%[text] **Result:**
%[text] $\\ln\\! \\left( \\frac{\\rho} {\\rho\_0} \\right)$
%%
%[text] ### Math target: Natural logarithm
%[text] Compute:
%[text] $\\int\_{\\tau = 0}^{\\tau = t} \\frac{V\_p} {(L\_{bottom} - V\_p t)}$
% Symbolic variables (declare positive to allow log combination)
syms Vp L t tau positive

% Define integrand in dummy variable tau
f = Vp/(L - Vp*tau);

% Compute definite integral from tau = 0 to tau = t
I = int(f, tau, 0, t);

% Simplify and display as a single log of a quotient
I_simpl = simplify(I);        % gives -log(L - Vp*t) + log(L)
I_combined = simplify(I_simpl); % still fine; with 'positive' assumptions it becomes log(L/(L - Vp*t))

disp(I_simpl) %[output:575c99f5]
disp(I_combined) %[output:65efd10f]
%%
%[text] **Result (rewritten, as above):**
%[text] $\\ln\\! \\left( \\frac{L\_{bottom}} {L\_{bottom} - V\_p t} \\right)$
%%
%[text] Plot the nondimensional result:
%[text] $\\rho^\* = \\frac{1}{1-t^\*}$
% Symbolic plot of rho* = 1/(1 - t*), avoiding singularity at t* = 1

% Define symbolic variable and expression
syms t*
rho* = 1/(1 - t*); %[output:6d6ba15a]

% Create a figure
figure
hold on
grid on

% Plot on two intervals that exclude t* = 1
fplot(rho*, [-2, 0.9], 'b', 'LineWidth', 1.5)   % left side
fplot(rho*, [1.1, 4], 'b', 'LineWidth', 1.5)    % right side

% Draw vertical asymptote at t* = 1
rho*l = ylim;                                   % get current y-limits
plot([1 1], rho*l, 'k--', 'LineWidth', 1)       % vertical dashed line

% Labels and title
xlabel('t*')
ylabel('rho*')
title('rho* = 1 / (1 - t*)')
xlim([-2 4])
hold off
%%
% Symbolic plot of y = 1/(1 - x), avoiding singularity at x = 1

% Define symbolic variable and expression
syms x
y = 1/(1 - x);

% Create a figure
figure %[output:6ca0362e]
hold on %[output:6ca0362e]
grid on %[output:6ca0362e]

% Plot on two intervals that exclude x = 1
fplot(y, [-2, 0.9], 'b', 'LineWidth', 1.5)   % left side %[output:6ca0362e]
fplot(y, [1.1, 4], 'b', 'LineWidth', 1.5)    % right side %[output:6ca0362e]

% Draw vertical asymptote at x = 1
yl = ylim;                                   % get current y-limits
plot([1 1], yl, 'k--', 'LineWidth', 1)       % vertical dashed line %[output:6ca0362e]

% Labels and title
xlabel('x') %[output:6ca0362e]
ylabel('y') %[output:6ca0362e]
title('y = 1 / (1 - x)') %[output:6ca0362e]
xlim([-2 4]) %[output:6ca0362e]
hold off %[output:6ca0362e]


%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
%[output:5d5d58a8]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\log \\left(\\rho \\right)-\\log \\left(\\rho_0 \\right)"}}
%---
%[output:4761d6b2]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\log \\left(\\rho \\right)-\\log \\left(\\rho_0 \\right)"}}
%---
%[output:575c99f5]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left\\lbrace \\begin{array}{cl}\n\\log \\left(L\\right)-\\log \\left(L-\\mathrm{Vp}\\,t\\right) & \\;\\textrm{if}\\;\\;\\mathrm{Vp}\\,t<L\n\\end{array}\\right."}}
%---
%[output:65efd10f]
%   data: {"dataType":"symbolic","outputData":{"name":"","value":"\\left\\lbrace \\begin{array}{cl}\n\\log \\left(L\\right)-\\log \\left(L-\\mathrm{Vp}\\,t\\right) & \\;\\textrm{if}\\;\\;\\mathrm{Vp}\\,t<L\n\\end{array}\\right."}}
%---
%[output:6d6ba15a]
%   data: {"dataType":"error","outputData":{"errorType":"syntax","isTransient":false,"text":"Incorrect use of '=' operator. Assign a value to a variable using '=' and compare values for equality using '=='."}}
%---
%[output:6ca0362e]
%   data: {"dataType":"image","outputData":{"dataUri":"data:image\/png;base64,iVBORw0KGgoAAAANSUhEUgAAAhYAAAFBCAYAAAArJOYBAAAAAXNSR0IArs4c6QAAIABJREFUeF7tnW9sV9eZ55\/JgBli7NKQhIZkVhhBEahUE1iN8+cFUuZVqooRErK2SFXS0aKZkWP1jZWxtryKnJEbeaUdOZZ2BVWRRiKShUYaXvQF3UZFFFhXBVdqBGKQMDVjnAm1DXac4ISwu+eml\/z88+\/PPb97zr3nz+dKKC0+5znP+X6f5\/GXc88590+eeOKJ\/ys8IAACIAACIAACIGAAgT9BWBhAERMgAAIgAAIgAAIJAggLAgEEQAAEQAAEQMAYAggLY1BiCARAAARAAARAAGFBDIAACIAACIAACBhDAGFhDEoMgQAIgAAIgAAIICyIARAAgQSBrq4uGR4eli1btsjJkydlZGSkKTI9PT3S29srFy9elIGBgbrt+\/r65PDhw3L27NlV7VoZt6ljGg1OnDiRzH10dFTGxsY0etIUBECgFgIIC+ICBEAgQUD9gt25c2fyv7MKi6GhIdm\/f3\/D9qlwePLJJ2v+8m5lXJOUpaLn9u3b0t\/fL5OTkybNYwsEokMAYREd5UwYBFYi0N3dLYODg7Jhw4ZHP8gqLLL8a7\/eL+4845rkMPWjra2NVQuTwGIrWgQQFtFSz8RdQaDyF2z1q4L0l\/LHH38sR48elfHx8RVuV75GqDefa9euyeuvv17zx+mrDPVLVY2h\/qv+ZBEW6djKcKN\/6acrEpVzyzNuVt7ScSuxS1dYPvvssxUiIm3bCKus49IOBGJHAGERewQwfycQSH\/hVS\/HN\/uFZ0JYHDlyRI4dO5bgoPZLZBUWqThQrw7qCZdK0VQpVlTfVsfNSljl2Eow\/OxnP3s0v2oBVw\/\/rGPRDgRA4CsEEBZEAwg4gED6S1q5km4iLHqJvnIVIcuKRbqa0qhtrXlVw607rg5dqY+VfWrtpWi2MqQzJm1BIHYEEBaxRwDzdwKBypWH9F\/TRf8rWvcXvM7+inqvchT4uuPqEla5ObSeH1kEkO64tAeBWBFAWMTKPPN2DoHKTY7vvPOOvPnmm02PfuZ9FVIJgs4v+Kz7K7KsBOiMW9k29b3WEdbKeVWuWtTbQ4GwcC4dcMhjBBAWHpOH62EhUPnq4\/3335dXXnlF1CbDWps205mXJSyy7K9QPpYtLLKePEFYhJVLzKZcBBAW5eLP6CCwAoHKZXv1g2b\/GjcJn87KQZb9FZWvOdT\/rncBlc64uvOtPBmysLCQrADVeh2SRQDpjk17EIgVAYRFrMwzbycRqPwlW30k0rbDOr\/g1f6PF198sem9D\/VOhbT6CkYHg8pXIGqD6a9\/\/etH93VUb+Asej+LzjxoCwK+IYCw8I0x\/A0agcpXG0XfBJlVWKQ+dnZ2NnxNkxJV6x4L28Ki+qhpehy2UmxUrgY18zHooGNyIGAYAYSFYUAxBwJ5EMjyL\/w89svo6\/qV2c2uHC8DM8YEAZ8RQFj4zB6+B4NA9WmHRsczfZu067+4U+z\/8Ic\/8K0Q34ILf51EAGHhJC04FRsCZe6tKALrRl83LWL8RmOkr0GyXApWtq+MDwI+IICw8IElfAQBEAABEAABTxBAWHhCFG6CAAiAAAiAgA8IICx8YAkfQQAEQAAEQMATBBAWnhCFmyAAAiAAAiDgAwIIiyqWnnnmGfnOd76TfGJ5ZmbGGIfr1q2Tp59+Wj766CNZXl42ZhdDegjAgx5eCwun5cGDl2XNmvPS2XlAr3OT1nBhFM6WjcFDy9DRsQ4CCIsqYPbu3ZvcJtjb2yuXL182Fjhf+9rX5Fvf+pZ88MEHcu\/ePWN2MaSHADzo4XX37oQ8fPifrAgLuNDjwlZreLCFbLx2ERYIi6iinyKqR3cqLNate096e38j6rbNq1evys9\/\/nM9QzVaw0VuCI0YgAcjMGKkAgGEBcIiqoSgiOrRPTc3m3RYv\/7H8vd\/\/xHCQg8+L1qTE17Q5JWTCAuEhVcBm9dZimh2BNUrELVigbDIjpmPLckJH1lz22eEBcLC7Qg17B1FNDuglcKivf0N+du\/XceKRXb4vGlJTnhDlTeOIiwQFt4EqwlHKaLZUfz885dlcfF00qGj44AcObIDYZEdPm9akhPeUOWNowgLhIU3wWrCUYpodhQRFtmx8rklOeEze276jrBAWLgZmZa8oohmB3Z5+XuytPRu0mHjxuflb\/7mFVYsssPnTUtywhuqvHEUYYGw8CZYTThKEc2O4qefvimffvoPCIvskHnZkpzwkjannUZYICycDlDTzlFEsyNaKSyeeGKTvP7666xYZIfPm5bkhDdUeeMowgJh4U2wmnCUIpodRfUaRL0OeeyxqeRVCMIiO3Y+tSQnfGLLD18RFggLPyLVkJcU0exApt8JSYVF9p7ZWsJFNpxst4IH2wjHZx9hgbCIKuopotnptvkBMuUFXGTnwmZLeLCJbpy2ERYIi6ginyKanW6ERXasfG5JTvjMnpu+IywQFm5GpiWvKKLZga38AJm6edP0AxemEW3NHjy0hhu96iOAsEBYRJUfFNHsdFd+gGz9+neyd8zYEi4yAmW5GTxYBjhC8wgLhEVUYU8RzUZ39QfIEBbZcPOxFTnhI2tu+4ywQFi4HaGGvaOIZgO0+gNk69a9l62jRiu40ADLYlN4sAhupKaDFxY9PT3S29srbW1tCcXXrl1LzuPXe\/bu3Sujo6NJn8uXLxsLC5LXGJS5DMFDNviqvxOydu35bB01WsGFBlgWm8KDRXAjNR20sOju7pbBwUG5dOmSDAwMSPr\/p6en64oLhEXYmUARzcYvwiIbTiG0IidCYNGtOQQtLIaGhmTfvn1y9OhRGR8fT5Dv6+uTAwcOrPi7SkoQFm4FqGlvKKLZEK3+AJm6JMv0AxemEW3NHjy0hhu96iOAsKjCBmERdrpQRLPxW\/2dENWLK72zYedbK3LCN8bc9zdoYcGrEPcDsGgPKaLZEE+FReV13giLbNj51oqc8I0x9\/0NWlgo+Lu6umR4eFi2bNmSsHH27Nlkv0W9hxUL94M2j4cU0WzoVX+AjBWLbLj52Iqc8JE1t30OWlio\/RSHDx+WkydPysjIyCORoSjp7++XycnJVeykwuL48eMyMTGR\/Hxubk7m5+dzMdnR0SG7d++Wq1evysLCQi5bdG4dAXjIht2tW\/8sDx68LBs2\/Eaeeqon6XTw4MHks+k3btyQc+fOZTPUoBVc5IbQiAF4MAJjLiP379+X5eXlXDZc6hyssEhXKhYXF1ecAEmPn546dSoRG9VPKiwq\/\/7MmTOi\/uR52tvbZdu2bUlRXlpaymOKvjkQgIds4F248LbMzu6RTZt+Jy+99KOk0549e5Jj27Ozs3Lz5s1shhq0+u1vfytf\/\/rXE8FNTuSGs2UD5ETL0BnrODU1Jbdu3TJmr2xDwQuL69evr3j1Ub3vop6wUMdUZ2Zmkh+bWLFQ\/9LbtWuXXLlyRZTY4SkHAXjIhvvvf\/9LUZdkdXb+i2za1J90Mr1icefOHXn48KFs376dnMhGi5VW5IQVWLWMsmKhBVd5jeutWKTC4vTp0w1XLLggqzzubI7M++Rs6Nb6TojpzZvqlaBaAdm8ebPcu3cvm2O0Mo4AOWEc0ugNBrtioZjNs8cCYRFmblBEm\/Na7zshCIvm2PnYgpzwkTW3fQ5aWCjoq6\/0vn37dt2Nm6o9p0LcDti83lFEmyNY7zshCIvm2PnYgpzwkTW3fQ5eWOjCj7DQRcyv9hTR5nzVu87btLCAi+ZcFNECHopAOa4xEBZVfCMswk4AimhzfhEWzTEKqQU5ERKbbswFYYGwcCMSC\/KCItoc6MrrvDdufF5sfCdEeQEXzbkoogU8FIFyXGMgLBAWUUU8RbQ53bW+E9K8l34LuNDHzEYPeLCBatw2ERYIi6gygCLanO5a13k376XfAi70MbPRAx5soBq3TYQFwiKqDKCINqd7YeF0cp33mjXnpbPzQPMOLbaAixaBM9wNHgwDijlBWCAsokoDimhzuhEWzTEKqQU5ERKbbswFYYGwcCMSC\/KCItoc6Lt3J5LrvNete0\/a299o3qHFFty82SJwhruRE4YBxRwrFtUxwHHTsLOCItqc31rXeTfvpd8CYaGPmY0e5IQNVOO2yYoFKxZRZQBFtDHd9a7zthEkCAsbqOrbJCf0MaNHYwQQFgiLqHKEIppdWHR0HJC1a89biw+EhTVotQyTE1pw0TgDAggLhEWGMAmnCUW0MZf1bt1UvUxf6Y2wcCOvyAk3eAjJC4QFwiKkeG46F4poY4iWl78n6h4L9VTfuomwaBpeXjYgJ7ykzWmnERYIC6cD1LRzFNHGiDa6dRNhYToa3bBHTrjBQ0heICwQFiHFc9O5UESzCQv1fRC1YlH5ICyahpeXDcgJL2lz2mmEBcLC6QA17RxFtDGi6eVYCAvTkeeuPXLCXW589QxhgbDwNXZb8psimk1Y1LrOmxWLlkLO+U7khPMUeecgwgJh4V3Q5nGYItoYvfTWTYRFnijzqy854RdfPniLsEBY+BCnxnykiDaGstGtm6xYGAtDpwyRE07REYQzCAuERRCBnHUSFNH6SDW7dRNhkTXK\/GpHTvjFlw\/eIiwQFj7EqTEfKaLZhEWtWzcRFsbC0ClD5IRTdAThDMICYRFEIGedBEW0PlKNbt3Miq9OO7jQQcteW3iwh22slhEWCIuoYp8iWp\/uRrdu2ggSuLCBqr5NeNDHjB6NEUBYICyiyhGKaH26G926aSNI4MIGqvo24UEfM3pEKiy6u7tlcHBQNmzYUBOBs2fPysDAwKqf7d27V0ZHR6W3t1cuX75sLH5IXmNQ5jIED\/XhU98IUasWtS7HygV6nc5wYQNVfZvwoI8ZPSIVFvWmfeLECXn22Wfl6NGjMj4+jrCILEMoovUJb3Trpo0wgQsbqOrbhAd9zOiBsHiEQF9fnxw+fFhOnjwpIyMjNZFhxSLslKGINhcWtS7HshEVcGEDVX2b8KCPGT0QFgkCXV1dMjw8LIuLi6KOzdV7EBZhpwxFtD6\/6a2b69a9J+3tb1gPBLiwDnGmAeAhE0w00kAgms2barXi0KFDyf6JsbExhIVGkITUlCJam81ml2PZiIGFhQVpa2uTzZs3y71792wMgc0MCJATGUCiiRYCUQiLdLVCIdPf3y+Tk5MIC60wCacxRbS5sFCrFWrVwvaDsLCNcDb75EQ2nGiVHYEohEVPT09yyuPUqVN191akkKWvQo4fPy4TExPJX8\/Nzcn8\/Hx2VGu07OjokN27d8vVq1dFFVSechCAh9q4f\/zxf5Y7d75cyXvuue\/L2rXnrRN069YtaW9vl61bt5IT1tGuPwA5USL4fxz6\/v37sry8XL4jhjyIQlgMDQ3Jvn376p4EqcQyFRaVf3fmzBlRf\/I8qoBu27ZNbty4IUtLS3lM0TcHAvBQG7zZ2W\/JhQv\/mPzwpZf+m2za9MGqhnv27EleXczOzsrNmzdzsPBl1wsXLsiDBw\/k1VdfJSdyo9m6AXKidexM9ZyamhIltEN5ohAW6oipUuXNXoMoUlNhoe7AmJmZSXg2sWLR2dkpu3btkitXriQbSHnKQQAeauM+P\/9DuXv3h8kPu7q21Wx08OBBUfgpcXzu3LncBN65c0cePnwo27dvJydyo9m6AXKidexM9WTFwhSSBdlJ91dcv3695oVY1W5wKqQgYkoahvfJtYFPb91sdDkWHyErKWgtD0tOWAY4QvPBr1ikN3CePn266f6KyhULbt4MMxsoorV5zXI5FsKCnAgTAWZlGoHghYXOxk2Ehenwcs8ewqKxsGh0ORbCwr14NuEROWECRWxUIhC8sNClm1chuoj51Z4iWpuvLJdjISz8ivWs3pITWZGiXVYEEBZVSCEssoaOn+0ooqt5y3o5FsLCz5hv5jU50Qwhfq6LAMICYaEbM163p4g2FhaNLsdCWHgd+nWdJyfC5LXMWSEsEBZlxl\/hY1NEV0P++ecvy+Li6eQHHR0H6l6OhbAoPFwLGZCcKATmqAZBWCAsogp4iuhqupeXvydLS+8mP9i48XlRR05rPQiLMFOFnAiT1zJnhbBAWJQZf4WPTRFdDXmWOyxUL4RF4eFayIDkRCEwRzUIwgJhEVXAU0RX053lDgsbQQIXNlDVtwkP+pjRozECCAuERVQ5QhGtLywa3WFhI0jgwgaq+jbhQR8zeiAstGKA46ZacHnXmCK6mrIsd1jYIBoubKCqbxMe9DGjB8JCKwYQFlpwedeYIrqSsqx3WNggGi5soKpvEx70MaMHwkIrBhAWWnB515giWl9YNLrDwgbRcGEDVX2b8KCPGT0QFloxgLDQgsu7xhTRlZRlvcPCBtFwYQNVfZvwoI8ZPRAWWjGAsNCCy7vGFNGVlGW9w8IG0XBhA1V9m\/Cgjxk9EBZaMYCw0ILLu8YU0ZWUZb3DwgbRCwsL0tbWJps3b5Z79+7ZGAKbGRAgJzKARBMtBDhuWgUXwkIrfrxrTBFdSVlZd1goLxAWbqQPOeEGDyF5gbBAWIQUz03nQhGtLSyy3GHBzZtNw8vLBuSEl7Q57TTCAmHhdICado4iuhLRubnZ5C\/WrXtP1KmQRg\/CwnQ0umGPnHCDh5C8QFggLEKK56ZzoYh+BZHuHRYIi6bh5WUDcsJL2px2GmGBsHA6QE07RxH9ClHdo6YIC9PR6IY9csINHkLyAmGBsAgpnpvOhSKKsGgaJJE1ICciI7yA6SIsEBYFhJk7Q1BEv+IiPWqq\/uaJJzY1JYkVi6YQedmAnPCSNqedRlggLJwOUNPOUUS\/QnRp6V1RF2Q99tiUbNz4fFOoERZNIfKyATnhJW1OO42wQFg4HaCmnaOIfoVoeodFlqOmqhfCwnQ0umGPnHCDh5C8QFggLEKK56ZzoYh+BVH6uXSERdOwCboBORE0vaVMLnhh0d3dLYODg7Jhw4YE4Nu3b0t\/f79MTk7WBJybN0uJw8IGpYh+CbXuUVNWLAoL0cIHIicKhzz4AYMWFqmomJ6eTpZxu7q6ZHh4OCG1nrhAWIQd8xTR1cKio+OArF17vnDiudK7cMhrDkhOuMFDSF4ELSyGhoZkx44dK0RET0+PHDlyRI4dOyZjY2OruERYhBTeq+dCEf0SE907LGxEBcLCBqr6NskJfczo0RiBYIVFujpx\/fp1GRgYyBwHCIvMUHnZkCL6JW26R01tkA0XNlDVtwkP+pjRI1Jhkb4GOX36tOzbt0927tyZIMEei7hTgiL6Jf+6R01tRA1c2EBV3yY86GNGj0iFhXrl0dvbK21tbXLy5EkZGRlhjwXZIBTRL4NA96ipjdCBCxuo6tuEB33M6BG5sLh48eKKVyGp4Dh16lQiNqqf9FXI8ePHZWJiIvnx3NyczM\/P54qljo4O2b17t1y9elXUu2WechCAhy9x\/\/3vf5mcDOns\/BfZtKm\/FDLgohTYVw0KD+XzcP\/+fVleXi7fEUMeBLvHop6ASF+RXLp0qebei1RYVOJ75swZUX\/yPO3t7bJt2za5ceOGLC0t5TFF3xwIwIPIJ588Lb\/4xfEExW9+873\/\/5rwvRyItt4VLlrHzmRPeDCJZmu2pqam5NatW611drBXsMKico9F5cpEVmGh7r6YmZkxtmLR2dkpu3btkitXrsji4qKDoRCHS\/Dw5YmQf\/\/3f04If+qpHtmw4TelkA8XpcC+alB4KJ8HVizK5yCzBydOnEjaqjss0ifrqxC1P+Py5cuZx2rWkPeYzRAq5ufw4MZRU8U2XBQT881GgYdmCPFzXQSCXbFQQFSLiHS1Qu1x4IIs3VAJoz1F9Kujplk\/PmaLee6xsIWsnl1yQg8vWjdHIGhhoaZffaX3tWvXVqxgVEPEPRbNg8bnFhTRr06E6AoLPkLmc+TX952cCJPXMmcVvLDQBRdhoYuYX+0poq0fNUVY+BXrWb0lJ7IiRbusCCAsqpBCWGQNHT\/bxV5EW\/n4WMo0wsLPmG\/mdew50Qwffq6PAMICYaEfNR73iL2IVgoL3Y+PISw8DvwGrseeE2GyWu6sEBYIi3IjsODRYy+ieT4+hrAoOFgLGi72nCgI5qiGQVggLKIK+NiLaJ6PjyEswkyV2HMiTFbLnRXCAmFRbgQWPHrsRTT9RojuiRBFE8Ki4GAtaLjYc6IgmKMaBmGBsIgq4GMvonk+PoawCDNVYs+JMFktd1YIC4RFuRFY8OgxF9E8J0JYsSg4UAscLuacKBDmqIZCWCAsogr4mItonhMhCItw0yTmnAiX1XJnhrBAWJQbgQWPHnMRzXMiBGFRcKAWOFzMOVEgzFENhbBAWEQV8DEX0fRESCsbN20ECd8KsYGqvs2Yc0IfLXpkQQBhgbDIEifBtIm5iOY5EWIjABAWNlDVtxlzTuijRY8sCCAsEBZZ4iSYNjEX0bt3J0Tts1iz5rx0dh4ondOYuSgd\/AoH4MElNsLwBWGBsAgjkjPOItYimvdESEZ4tZrFyoUWSAU0hocCQI5sCIQFwiKqkI+1iObduGkjSGLlwgaWeWzCQx706FsLAYQFwiKqzIi1iFZe5b1x4\/OiNnCW\/cTKRdm4V48PD64x4r8\/CAuEhf9RrDGDWIuoaxs3FWWxcqERroU0hYdCYI5qEIQFwiKqgI+1iOa5yttWgMTKhS08W7ULD60iR796CCAsEBZRZUeMRdTFjZusWLiTdjHmhDvoh+mJc8Kiu7tbBgcHZcOGDXL79m3p7++XycnJwtDfu3evjI6OSm9vr1y+fNnYuCSvMShzGYqRB1MbN\/kIWa7Qc7ZzjDnhLBmBOOacsEhxHRoakv379z+CuSiRgbAIJLLrTCPGIlq5cbOj44CsXXu+JZIRFi3B5nynGHPCeVI8d9BZYVGJa5EiA2HheUQ3cT\/GImrqKm+ERZi5EWNOhMmkO7PyQlgouLq6umR4eFi2bNnyCL1r166JKnYmH4SFSTTdsxVjETW1cRNh4V48m\/AoxpwwgRs26iPgtLCo3G+hpvDZZ58l+x\/Gxsakr69PDh8+LKbFBcIi7HSJrYia3LiJsAgzN2LLiTBZdGtWzgmLajGh4Dp58qSMjIysQk69Itm3b58cPXpUxsfHayJ74sQJ2blz54qfNdqvgbBwK0BNexNbETW1cVPxgLAwHY1u2IstJ9xAPWwvnBUWly5dkoGBgYboNxMW6euT69evN7WVDoSwCDvgYyuipjZuIizCzYvYciJcJt2ZmXPCwiQ06erH6dOna6541BoLYWGSAfdsxVZETd64yYqFe\/FswqPYcsIEZthojEDQwqKnp0dee+01eeutt+q+KqmGB2ERdsrEVkRNfiodYRFmbsSWE2Gy6NasghYW1cdUFfTN7sNAWLgVoKa9iamImty4yasQ05Hojr2YcsId1MP2JGhhoTZuqn0W6UmSdM+ForTejZ4Ii7ADPqYianLjpo2oWFhYkLa2Ntm8ebPcu3fPxhDYzIBATDmRAQ6aGEAgaGFRCx\/1ekRd133q1Kma+y5SYXH8+HGZmJhITMzNzcn8\/HwuuDs6OmT37t1y9epVUQWVpxwEYuJhfv6HcvfuD+Xxxz+SzZtfKAfwBqPeunVL2tvbZevWreREiezElBMlwtxw6Pv378vy8rKr7mn7FZ2wSDd01jt1kgqLSiTPnDkj6k+eRxXQbdu2yY0bN2RpaSmPKfrmQCAmHi5ceFtmZ\/fIpk2\/k5de+lEO1Ox0vXDhgjx48EBeffVVcsIOxJmsxpQTmQApodHU1JQooR3Kg7CoYjIVFupDaDMzM8ZWLDo7O2XXrl1y5coVWVxcDCV+vJtHLDx88cWfy9TU2YSfjRv\/Sb7+9X9yjqs7d+7Iw4cPZfv27eREiezEkhMlQtx0aFYsmkLkRoN0P4X6JV557bd6FXLkyBE5duxYcoNn9cMeCzf4s+VFLO+TXd9fofiNhQtbsWzKLjyYQhI7KQJBr1ik136nN3emr0Gmp6frfmMEYRF2csRSRCsvxtq48Xl57LEp54iNhQvngK9yCB5cZ8g\/\/4IWFoqOVFyk1DT7tgjCwr8g1vE4liJq8mIsHXx12sbChQ4mZbSFhzJQD3vM4IWFLn0IC13E\/GofSxE1eTGWLYZj4cIWfqbswoMpJLETxauQVmhGWLSCmj99Yiiipi\/GssVuDFzYws6kXXgwiSa2FAKsWFTFAcIi7MSIoYj6sHFTRVkMXPiQTfDgA0t++YiwQFj4FbE5vY2hiKYbN9WGTbVx09Rj+lshMXBhCnubduDBJrpx2kZYICyiivwYimi6cXPNmvPS2XnAGL+mhQVXehujJpehGHIiF0B01kYAYYGw0A4anzuEXkRt7q9AWPgc+fV9Dz0nwmTN7VkhLBAWbkeoYe9CL6I291cgLAwHoyPmQs8JR2COyg2EBcIiqoAPvYja2l+hggRhEWaqhJ4TYbLm9qwQFggLtyPUsHehF1Fb+ysQFoYD0SFzoeeEQ1BH4wrCAmERTbCriYZcRG3ur0BYhJsmIedEuKy5PTOEBcLC7Qg17F3IRdTm\/gqEheFAdMhcyDnhEMxRuYKwQFhEFfAhF1Hb3wdhj0WYqRJyToTJmPuzQlggLNyPUoMehlxE5+ZmE6RM31+Rwo+wMBiIDpkKOSccgjkqVxAWCIuoAj7UImr7NQivQsJNk1BzIlzG3J8ZwgJh4X6UGvQw1CKaHjNVUHV0HJC1a88bRM2OKW7etIOrrtVQc0IXB9qbQwBhgbAwF00eWAq1iNreX2GDWoSFDVT1bYaaE\/pI0MMUAggLhIWpWPLCTohF1PYxU1vEIixsIatnN8Sc0EOA1qYRQFggLEzHlNP2QiyiReyvsEEqwsIGqvo2Q8wJfRToYRIBhAXCwmQ8OW8rxCK6tPSuLC9\/T0x\/Jt02mSFyYRszG\/bhwQaqcdtEWCAsosqAEIuozWu8bQZHiFzYxMuWbXiwhWy8dhEWCIuooj+0Iurr\/goVdKFx4WsiwYOvzLnrN8ICYeFudFrwLLQi6uMx05TW0LiwEK6FmISHQmASsAebAAAXEklEQVSOahCEBcIiqoAPrYj6eMwUYeFWyoWWE26hG6c3CAuERVSRH1IRrXwNsm7de9Le\/oZVLk1f6R0SF1aBt2wcHiwDHKH5qIRFX1+fHDp0SEZHR2VsbKwm3Xv37k1+3tvbK5cvXzYWEiSvMShzGQqJh6KPmSIscoWes51DyglnQY7MsWiERXd3twwODkpbWxvCIrIgr5xuSEW06NcgpoUF91i4kYgh5YQbiOJFNMLixIkTsnPnTvnss88QFhHHfShFtOjXICpkEBZhJk4oOREmO37OKgphoV6BHDhwQH71q1\/JK6+8grDwM1aNeB1KEVUXYqmLsdRT1EfHEBZGQtA5I6HkhHPARuxQ8MIifQVy6dIlmZ6eZo9FxMGuph5KES36NQgrFuEmTig5ES5D\/s0seGExNDQkO3bskP7+fvnud7+LsPAvRo16HEIRLeM1CMLCaBg6ZSyEnHAKUJyRoIVFT0+PHDlyRI4dO5acAtE5FXL8+HGZmJhIQmRubk7m5+dzhUtHR4fs3r1brl69KmrTGk85CITAw8LCQZmd\/e8JgM89931Zu\/Z8IWAePHhQOjs75caNG3Lu3LncY966dUva29tl69at5ERuNFs3EEJOtD57N3rev39flpeX3XDGgBfBCouuri4ZHh6W69evy8DAQAKVjrCoxPbMmTOi\/uR5VAHdtm1bUpSXlpbymKJvDgRC4OHChbdldnaPPP74R\/JXf\/Vfc6Ch13XPnj3JqarZ2Vm5efOmXucarS9cuCAPHjyQV199lZzIjWbrBkLIidZn70bPqakpUUI7lCdYYaFWK9RdFKoQ1nrOnj37SHBU\/jy9x0IdTZ2ZmUl+ZGLFQv1Lb9euXXLlyhVZXFwMJX68m4fvPHzxxZ\/L1NTZBHd1KdaWLT8qjAPTKxZ37tyRhw8fyvbt28mJwlhcPZDvOVEidMaGZsXCGJTFG9JZseCCrOL5KWJE398nl3EaxBYv3GNhC1k9u77nhN5saV0EAsGuWNQCD2FRREi5PYbvRbSM0yC2GEVY2EJWz67vOaE3W1oXgQDCogplrvQuIuzKG8PnIurzJ9JrMY6wKC8PKkf2OSfcQBAvqhGISlhkoR9hkQUlf9v4XERDeg2iIghh4UYe+ZwTbiCIFwiLJjGAsAg7SXwuoiG9BkFYuJNnPueEOyjiSSUCrFjwKiSqjPC1iFZ+yXT9+h\/L+vXveM8bKxZuUOhrTriBHl7UQgBhgbCIKjN8LaLquyDqVchjj01JZ+dfJ\/\/1\/fGVC99xr\/YfHkJjtPz5ICwQFuVHYYEe+FhEKzdtrllzXjo7DxSImL2hfOTCHhrlWYaH8rAPdWSEBcIi1NiuOS8fi2homzZTYnzkIsRkgYcQWS13TggLhEW5EVjw6D4W0dA2bSIsCg76JsP5mBNuIYg31QggLBAWUWWFb0XUpU2br7\/+evIRMvUhvZ\/\/\/Oe548Y3LnJP2FED8OAoMR67hbBAWHgcvvqu+1ZEXVqtQFjox5sPPXzLCR8wjd1HhAXCIqoc8KmIVm7aVB8ca29\/o1SuEBalwm9tcJ9ywhoIGDaKAMICYWE0oFw35lMRdW3TpmlhwT0WbmSLTznhBmJ40QwBhAXColmMBPVzX4qoWq34+ON35cGDl5M7KzZufL50HhAWpVNgxQFfcsLK5DFqBQGEBcLCSmC5atSXIlq5aVO9AlGvQsp+EBZlM2BnfF9yws7ssWoDAYQFwsJGXDlr05ci6tKmzZRMhIWzYZ3LMV9yItck6VwoAggLhEWhAVf2YD4UUZeOmFbyhbAoO3rtjO9DTtiZOVZtIYCwQFjYii0n7fpQRF1crVBkIiycDOncTvmQE7kniYFCEUBYICwKDbiyB3O9iFauVrhwxJQVi7Ij1v74rueEfQQYwTQCCAuEhemYctqe60W0crXCta+YsmLhdGi37JzrOdHyxOhYGgIIC4RFacFXxsAuF1HXLsSyzQ\/3WNhGOJt9l3Mi2wxo5RoCCAuEhWsxadUfl4to5WqFOmK6du15q1iUbRxhUTYDX47vck64gRBe6CKAsEBY6MaM1+1dLaKxrVaoIEJYuJFKruaEG+jgRSsIICwQFq3Ejbd9XC2isa1WICzcSSFXc8IdhPBEFwGEBcJCN2a8bu9iEXX5JIhNslmxsIludtsu5kR272npIgIIC4SFi3FpzScXi6jLJ0GsEcGrEJvQatl2MSe0JkBj5xAIXlj09fXJ4cOHHwF\/9uxZGRgYqEvE3r17ZXR0VHp7e+Xy5cvGCCN5jUGZy5BrPFR+wdS1eytyAZ2hs2tcZHA5yCbwECStpU4qaGHR09OTCIRTp07JyMiIpP\/\/4sWLdcUFwqLUeLQ+uEtF1MUvmFonoGIAl7goct6ujQUPrjHivz9BC4sTJ05IR0eH9Pf3y+TkZMLW0NCQ7NixY8XfVdKIsPA\/qBvNwKUiWrla4coXTItk3yUuipy3a2PBg2uM+O9P0MKiFj21xAbCwv9AzjoDV4po5fHSxx6bko0bn886hdLamb550xUuSgPUkYHhwREiAnIjKmFR\/WqkFo+sWAQU3TWm4koRXVp6V9SKhXo6Og54cRkWwiLM3HAlJ8JEN85ZRSEsuru7ZXBwUDZs2CC3b9+u+xpEhUAqLI4fPy4TExNJVMzNzcn8\/HyuCFGvZHbv3i1Xr15NLgbiKQcBF3j45JOn5T\/+4\/8kAGzY8Bt56qmecsDQHPXgwYPS2dkpN27ckHPnzmn2Xt3cBS5yTyIAA\/BQPon379+X5eXl8h0x5EEUwqISK7XHYt++fXL06FEZHx9fBWMqLCp\/cObMGVF\/8jzt7e2ybdu2pCgvLS3lMUXfHAi4wMOFC2\/L7Oweefzxj+Qv\/uJ\/yKZNH+SYUXFd9+zZI21tbTI7Oys3b97MPbALXOSeRAAG4KF8EqempuTWrVvlO2LIg+iERbp6cenSpZonQ1JhoVY4ZmZmEphNrFiof+nt2rVLrly5IouLi4bow4wuAmXzoF5\/3L79duK2Ol66ZcuPdKdQWnvTKxZ37tyRhw8fyvbt28mJ0liVZBWK2lQiASLCikW5+OcePauw4B6L3FA7aaDM98k+btisJNH0Hgtu3nQjRcrMCTcQwAvTCAS7YtHV1SXDw8PJv4RUQUyfZhs42bxpOsTcsldmEU1v2FSI+LJhE2HhVvza8KbMnLAxH2yWj0CwwkJBm966efLkyeSCrFRsqJ9V3m1RSQPCovygtOlBWUU0hBs2WbGwGZnl2S4rJ8qbMSPbRiBoYVEpLlIgr127tmIFoxpghIXtkCvXfhlFVL0CWVj4V1H\/VXdWdHb+dfJf3x6EhW+MZfO3jJzI5hmtfEUgeGGhSwzCQhcxv9qXUUQr76zw+YZNhIVfsZ7V2zJyIqtvtPMTAYRFFW8ICz8DOavXRRfRylcga9acl87OA1ldDb4dmzfdoLjonHBj1nhhEwGEBcLCZnw5Z7vIIlp9CsTXVyC2SERY2EJWz26ROaHnGa19RQBhgbDwNXZb8ruoIlr55VLlqI+nQFoCWKMTwkIDLItNi8oJi1PAtGMIICwQFo6FpF13iiqin376pnz66T8kk1EXYam9FTwrEUBYuBERReWEG7PFiyIQQFggLIqIM2fGKKKIfv75y7K4eDqZsy9fLi2DIIRFGaivHrOInHBjpnhRFAIIC4RFUbHmxDi2i2j10VK1UrF27Xkn5u6aEwgLNxixnRNuzBIvikQAYYGwKDLeSh\/LZhGt3lexfv2PZf36d0qfs6sOICzcYMZmTrgxQ7woGgGEBcKi6JgrdTybRZR9FXrUIiz08LLV2mZO2PIZu24jgLBAWLgdoYa9s1VEK0UF+yqykWaLi2yj0ypFAB6IBdMIICwQFqZjyml7Nopo9WZN7qvIFgI2uMg2Mq0qEYAH4sE0AggLhIXpmHLanukiWn0JVsibNU1f6W2aC6cDz2Hn4MFhcjx1DWGBsPA0dFtz22QRrTwBorzx+TsgWdBEWGRByb82JnPCv9njsQ0EEBYICxtx5axNU0W0WlTEcAIEYeFsWOdyzFRO5HKCzkEhgLBAWAQV0M0mY6KIxnqsFGHRLLr8\/LmJnPBz5nhtCwGEBcLCVmw5aTdvEa0WFTFd142wcDKkczuVNydyO4CB4BBAWCAsggvqRhPKU0SVqFhe\/i+PvgES22fQTQsL7rFwI\/Xy5IQbM8AL1xBAWCAsXItJq\/60WkSrRUWMd1UgLKyGZmnGW82J0hxmYOcRQFggLJwPUpMOtlJEERVfMoCwMBmJ7thqJSfc8R5PXEQAYYGwcDEurfmkW0RriYpYL8BCWFgLy1IN6+ZEqc4yuBcIICwQFl4EqikndYooKxUrUUdYmIpCt+zo5IRbnuONqwggLBAWrsamFb+yFtHq0x8x7qmoJgBhYSUkSzeaNSdKdxQHvEEAYYGw8CZYTTiapYhWX36FqDCB\/GobnAqxg6uu1Sw5oWuT9nEjgLBAWESVAc2KaLWoiOmeiqIDAWFRNOK1x2uWE254iRc+IRC8sBgaGpL9+\/c\/4uTatWvJ7vZ6z969e2V0dFR6e3vl8uXLxrgkeY1BmctQIx4qv1KqBonhmu5cYObsjLDICaCh7tQmQ0Bi5hECQQsLJSpefPHFRCiMjY1Jd3e3DA4OyvT0dF1xgbAIOzvqFdFPP33z0cVX6tWHWqlYv\/6dsMEoeXYIi5IJ+OPwCAs3eAjJi2CFRVdXlwwPD8v169dlYGDgEWd9fX1y6NChR2KjmkyERUjhvXou1UW01skPREUxMYCwKAbnZqMgLJohxM91EQhWWNQDoqenR44cOSLHjh1LVjEQFroh43f7yiI6P\/81WVj4V1HiQj1qpSLWOyrKYBVhUQbqzcW2G17hhc8IRCcs1OuRffv2ydGjR2V8fBxh4XP0tuB7KiwmJr4mt2+\/jahoAUNTXRAWppDMZ4cVi3z40Xs1AlEJC509FsePH5eJiYkEsbm5OZmfn88VPx0dHbJ79265evWqqILKUw4CX3zx5\/Jnf\/Z38m\/\/9r1HDnzjG\/+T\/RQl0HHr1i1pb2+XrVu3khMl4J8OSW0qEfw\/Dn3\/\/n1ZXl4u3xFDHkQjLNI9F52dnXVXKxSm6R6LSnzPnDkj6k+eRxXQbdu2yY0bN2RpaSmPKfq2iMAnnzwtFy\/+o6j\/qufxxz+S5577hezc+V6LFumWBwFyIg965vrCgzksW7U0NTUlSmiH8kQhLLKKikphoU6PzMzMJDybWLFQgmbXrl1y5coVWVxcDCV+vJmHOvXx4Yd\/98hftZ\/iqad6EnHBkw2BgwcPiopjJY7PnTuXrVODVuREbgiNGIAHIzDmMsKKRS74iu+sIyoqhQX3WBTPlY0Rq099pKsUn3\/+I7l3756NIYO1afpKb97tuxEq8OAGDyF5EfSKha6oQFiEFNoilXdTqJmpVYpvfON\/yb59v5MPPvgAYaFJN8JCEzBPmiMsPCHKIzeDFhYnTpyQZ599tuGeimquuMfCo+it42r1KoVqlt6iSRFtnV+ERevYudyTnHCZHT99C1ZYqPsq1OuMtra2msycPHlSRkZGVv0MYeFnICuvawmK6ls0KaKt84uwaB07l3uSEy6z46dvwQqLVumwJSzUkbof\/OAH8tOf\/lRu3rzZqnv0a7BKUXnZVeUqRWUXeGg9hEwLC7honQuTPeHBJJrYUgggLKriwJawsGU39jCut0rR3v6GrF17vrAVqRh4MC0s1H0umzdvTk5LmfzgXwxcmJwjtckkmthCWNSIAVtJZsturGGc5bVHLWzgofWIQVi0jp3LPckJl9nx0zdWLOqsWFTevGmC2meeeSbZRGrargnffLNx8eLO5MRH+o0P5f8LL1xLNmj+6Z82vmQGHlpn+9vf\/nZyj8Xdu3eTUzV5n1\/+8pfJisXhw4cf3XKb1yb99REgJ\/QxM91D3ZmU3ptk2nYZ9hAWVainSaZUPI+bCOzc+c1Hjj377OcyNPSh\/OVffuqmswF5dfr06eTWWHWM+4UXXsg9s+9\/\/\/syPT0t77\/\/fm5bGAABnxFQ\/+D8yU9+4vMUVviOsKhBpRIX6g+Puwi8\/\/5PRH3e\/OWX\/7e7TuIZCIAACGRAgBWLDCDRBARAAARAAARAIE4EWLGIk3dmDQIgAAIgAAJWEEBYWIEVoyAAAiAAAiAQJwIIizh5Z9YgAAIgAAIgYAUBhIUVWDEKAiAAAiAAAnEigLCIk3dmDQIgAAIgAAJWEEBYWIH1K6Ppp9u3bNmS\/OXt27elv79fJicnLY8cr\/m+vr7k0qX0qffBuUqE1Jdwd+7cuQI0uLIfQwr3Dz\/8UAYGBuwPxgiiPs742muvyVtvvSXj4+MNESEnCJhWEUBYtIpchn6pqFhcXBR1HXL1\/89ggiaaCChRcejQIRkdHZWxsTGp\/v+1zKW8XL9+nV9wmnjnaT40NCT79++Xs2fPgnseIDP27e7ulsHBwaS1ugW4kbAgJzKCSrOaCCAsLAZGrV9q6l8MR44ckWPHjiW\/+HjMIVBPuKl\/ealHibtaT1pw1c2SIyMj5hzCUk0EqlfxEBb2A6VyFe\/jjz9uKizICfuchDwCwsIiu+pfZDt27Fjx6oN\/CdgDvF4xVEX1wIEDdYupzvKwPe\/jsJzGv\/rmiBLXSmRfunSJFQuL9KeiQgk49ezbt6+psCAnLBISgWmEhUWSa\/1Lmdch9gCvtxrU7HVIuiRf6Rn7K+zxlFpOhSDCwj7W6Qgq1rMIC3KiOE5CHAlhYZFVhIVFcGuYblVYKJ6U4Ev3ZaTiTw3BRlt7HCIs7GFbz3JWYUFOFM9NSCMiLCyyibCwCK5BYVHLSyVSent75dSpU+y7sEQjwsISsA3MZhUW5ETx3IQ0IsLCIpsIC4vgWhYW\/NKzzx0Y28e4eoQ8wgK+iufL1xERFhaZY\/OmRXBrmG5182YtLymi9rkDY\/sYIyyKx5gRRRAWFqOA46YWwa1hupXjpvX6cCzYPncIC\/sYtyIsyInieQltRISFRUarNwGqoYaHhyW9MMvi0NGaTo\/WpbdtNjsRooCq7pP+wpuenq5790W0ABucOMLCIJgZTWV9FUJOZASUZjURQFhYDgyu9LYMcA3zza70rrX3pbrPtWvXEBWWqUNYWAa4hvl6woKcKJ6LkEdEWITMLnMDARAAARAAgYIRQFgUDDjDgQAIgAAIgEDICCAsQmaXuYEACIAACIBAwQggLAoGnOFAAARAAARAIGQEEBYhs8vcQAAEQAAEQKBgBBAWBQPOcCAAAiAAAiAQMgIIi5DZZW4gAAIgAAIgUDACCIuCAWc4EAABEAABEAgZAYRFyOwyNxAAARAAARAoGAGERcGAMxwIgAAIgAAIhIwAwiJkdpkbCIAACIAACBSMAMKiYMAZDgRAAARAAARCRgBhETK7zA0ELCOgPl61c+dOSb8mq4ZLP+jGh9wsg495EHAUAYSFo8TgFgj4gED69d7Ozk45evRo4vLg4KAsLCxIf3+\/TE5O+jANfAQBEDCIAMLCIJiYAoEYEejp6ZHe3t5HIkKJjdHRURkbG4sRDuYMAtEjgLCIPgQAAATyIzA0NCT79+9PDJ09e1YGBgbyG8UCCICAlwggLLykDadBwC0Euru7k1cg6lGvRMbHx91yEG9AAAQKQwBhURjUDAQC4SKQbuJUM2TTZrg8MzMQyIIAwiILSrQBARCoi0B6CkS9ApmenpbDhw+vOCUCdCAAAnEhgLCIi29mCwJGEUhfgVSeAlGrF88++yyvRIwijTEQ8AcBhIU\/XOEpCDiFQHrU9Mknn1xxCoT9Fk7RhDMgUDgCCIvCIWdAEAABEAABEAgXAYRFuNwyMxAAARAAARAoHAGEReGQMyAIgAAIgAAIhIsAwiJcbpkZCIAACIAACBSOwP8DcHmqluK1q0EAAAAASUVORK5CYII=","height":247,"width":410}}
%---
