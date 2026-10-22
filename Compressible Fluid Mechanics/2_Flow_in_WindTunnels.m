%[text] # Flow in Wind Tunnels
%[text] AA 504 (Compressible Fluid Mechanics) Autumn 2026, UW
%[text] Assignment: Homework \#2
%[text] Author: Emmanuel Rodriguez
%[text] [emmanueljrodriguez.com](https://emmanueljrodriguez.com/)
%[text] Date: 21OCT2026
%[text] Location: Renton, WA && Suzzallo library, UW, Seattle, WA
%%
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] 
%%
clear % Clears workspace
clc % Clears command window
close all % Closes all figures
%%
%[text] ## Problem 1. Stagnation Pressure on a Model in a Supersonic Tunnel
%[text] ### Problem Statement
%[text] Determine the stagnation pressure on a wind tunnel model in a “blow down” supersonic tunnel.  The test section Mach number is 4 and the stagnation pressure upstream of the choked throat is 20 atm.   The stagnation temperature is 300K.

%%
%[text] ### Analysis
%[text] The normal-shock relations for a perfect gas are used:
%[text] $\\\[ M\_2^2= \\frac{1+\\frac{\\gamma-1}{2}M\_1^2} {\\gamma M\_1^2-\\frac{\\gamma-1}{2}}, \\\]$    (2.45) \[3\]
%[text] and
%[text] $\\\[ \\frac{p\_2}{p\_1} =1+\\frac{2\\gamma}{\\gamma+1}(M\_1^2-1) \\\]$     (2.48a) \[3\]
%[text] from the analysis performed in Problem 2, we have $p\_1 = 0.1317 atm$ the static pressure ahead of the shock
%[text] $\\rightarrow \\textbf{p\_2 = 18.5(0.1317\~atm)} = 2.4365\~atm$
%%
%[text] Using (2.45) to solve for the Mach speed immediately following the shock:
%[text] $\\rightarrow \\textbf{M\_2 = 0.4350}$
%%
%[text] Now we bring the post-shock air to rest on the model:
%[text] - Since we're assuming isentropic flow - the flow is adiabatic and in (local thermodynamic) equilibrium, we use (2.31) to find the stagnation pressure on the model. \
%[text] $\\\[ \\frac{p\_{02}}{p\_2} = \\left(1+\\frac{\\gamma-1}{2}M\_1^2\\right)^{\\gamma/(\\gamma-1)} \\\] = 1.1388$
%[text] $\\rightarrow \\textbf{p\_{02} = 1.1388(2.4365\~atm) = 2.775\~atm}$
%[text] - Only ~13.9% (2.775/20) of the reservoir stagnation pressure remains after the shock. \
%[text] Note: Stagnation temperature tracks total energy, while stagnation pressure depends on both energy and entropy. -- A shock conserves total energy but generates entropy, which is why the two behave differently.
%%
%[text] ## Problem 2. Static Pressure and Temperature
%[text] ### Problem Statement
%[text] What are the static pressure and temperature in an empty test section of the tunnel in problem 1?
%%
%[text] ### Analysis
%[text] Begin with first principles; **conservation of energy.**
%[text] **Heat added + Work done = change in Energy**
%[text] $q + w = \\Delta E$
%[text] - $q = 0$; Isentropic flow -- constant entropy, adiabatic (no heat transfer) and reversible
%[text] - $w = 0$; there is no work being done on the test section (CV) by any kind of device (turbine, pump, etc.) \
%[text] $0 = \\Delta h\_{total}$; total enthalpy
%[text] - $\\Delta h\_{total} = h\_0 + \\frac{u\_0^2}{2} - h\_1 - \\frac{u\_1^2}{2}$
%[text] - total enthalpy is the change in enthalpy measured at two equilibrium end points (station 0 \[the reservoir\] and station 1) \
%%
%[text] #### Specific Heat Relation
%[text] For a thermally perfect gas (satisfies the ideal gas law: $p = \\rho R T$) and if it is also calorically perfect, $c\_p = const.$, then $h = c\_p T$. \[3\]
%%
%[text] #### Stagnation Properties
%[text] The velocity of the flow is essentially zero at the reservoir, we have:
%[text] $h\_0 = h\_{stagnation} = c\_p T\_0 = c\_p T\_1 + \\frac{u\_1^2}{2}$
%[text] - $T\_1 = T\_{static}$; the static temperature. \
%%
%[text] #### Perfect Gas Isentropic Relations
%[text] Speed of sound: $a^2 = \\gamma R T$
%[text] Mach number: $M = \\frac{u}{a} \\quad \\rightarrow u = Ma = M \\sqrt{\\gamma R T}$
%[text] Specific gas constant: $R = c\_p - c\_v$
%[text] Heat capacity ratio: $\\gamma = \\frac{c\_p}{c\_v}$
%[text] - $c\_p = \\frac{\\gamma R}{\\gamma - 1}$ \
%[text] These isentropic relation (and a whole bunch of algebra!) gives:
%[text] $\\frac{T\_0}{T} = 1 + \\frac{\\gamma - 1}{2} M^2 \\quad (2.30)$    \[3\]
%[text] At $T\_0 = 300 K$:
%[text] $\\textbf{ T = T\_{static} = 71.43 K}$
%[text] The nozzle converts enthalpy into kinetic energy, which lowers the static temperature.
%%
%[text] Similarly, from the isentropic relations, we know:
%[text] $\\\[ \\frac{p\_{01}}{p\_1} = \\left(1+\\frac{\\gamma-1}{2}M\_1^2\\right)^{\\gamma/(\\gamma-1)} \\\]$    (2.31) \[3\]
%[text] $p\_1$ is the static pressure in the empty test section of the tunnel.
%[text] $\\rightarrow \\textbf{p\_1 = 0.1317 atm}$
%%
%[text] ## Problem 3. \[pending...\]
%[text] ### Problem Statement
%[text] 
%%
%[text] ### Analysis
%[text] 
%%
%[text] ## References
%[text] \[1\] YouTube '[17. Rarefied Gas Dynamics](https://www.youtube.com/watch?v=T46Wb2d_dV8)'.
%[text] \[2\] Cengel, Y. (2018). *Fluid Mechanics: Fundamentals and Applications* (4th ed.). New York: McGraw-Hill.
%[text] \[3\] Liepmann, H. W., & Roshko, A. (2001). *Elements of gasdynamics*. Dover Publications. (Original work published 1957)

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":39.5}
%---
