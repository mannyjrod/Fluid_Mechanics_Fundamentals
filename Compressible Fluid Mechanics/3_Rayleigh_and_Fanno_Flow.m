%[text] # Flow in Wind Tunnels
%[text] AA 504 (Compressible Fluid Mechanics) Autumn 2026, UW
%[text] Assignment: Homework \#3
%[text] Author: Emmanuel Rodriguez
%[text] [emmanueljrodriguez.com](https://emmanueljrodriguez.com/)
%[text] Date: 26OCT2026
%[text] Location: Renton, WA && Suzzallo library, UW, Seattle, WA
%%
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] 
%%
clear % Clears workspace
clc % Clears command window
close all % Closes all figures
%%
%[text] ## Problem 1. Waves in Fluids
%[text] ### Problem Statement
%[text] Based off of the movie "Waves in Fluids" \[1\], write one paragraph on the most surprising aspect of the movie.
%%
%[text] ### Statement
%[text] Waves in fluids are traveling disturbances that transfer energy and momentum through a fluid, even though the fluid particles themselves may move only a short distance as the wave passes. One surprising feature is that a water wave, driven by gravity, and a sound wave which even though is driven by a different mechanism - gas compressibility, still follow many of the same principles. 
%[text] What makes wave motion surprising is that the disturbance can travel far faster and farther than the individual fluid particles it passes through. The video also shows that waves can change shape as they travel: compression waves tend to steepen, while expansion waves spread out. In water, a steep wave may break into a turbulent surge; in a gas, a steep compression can form a remarkably thin shock wave.
%%
%[text] ## Problem 2. Rayleigh Flow
%[text] ### Problem Statement
%[text] Steady flow of air enters a tube of diameter D at an initial Mach number of 0.4.  Assume no friction.  Determine the amount of heat necessary to thermally choke the flow and the exit total pressure.
%%
%[text] ### Analysis
%[text] <u>Assumptions</u>:
%[text] - No friction (Rayleigh flow)
%[text] - Inlet static standard atmospheric conditions:
%[text]     - $P\_{1} = 1\~atm = 101.325\~kPa$
%[text]     - $T\_{1} = 300\~K$
%[text] - Inlet *stagnation* conditions:
%[text]     - At $M\_1 = 0.4$:
%[text]     - $T\_{t1} = T\_1 \\left( 1 + \\frac{\\gamma - 1}{2} M\_1^2 \\right) = 309.6\~K$
%[text]     - $\\\[ p\_{t1} = p\_1 \\left(1+\\frac{\\gamma-1}{2}M\_1^2\\right)^{\\gamma/(\\gamma-1)} \\\] = 113.1\~kPa$ \
%%
%[text] Begin with first principles; **conservation of energy.**
%[text] **Heat added + Work done = change in Energy**
%[text] $q + w = \\Delta E$
%[text] - $w = 0$; there is no (shaft) work being done on flow by any kind of device (turbine, pump, etc.) \
%[text] $q = \\Delta h\_{total}$; total enthalpy
%[text] - $\\Delta h\_{total} = h\_2 + \\frac{u\_2^2}{2} - h\_1 - \\frac{u\_1^2}{2}$
%[text] - total enthalpy is the change in enthalpy measured at two equilibrium end points (station 2 and station 1) \
%[text] $\\frac{q^\*}{c\_p T\_{t1}} = \\frac{T\_t^\* - T\_{t1}}{T\_{t1}} \\quad \\rightarrow \\quad \\frac{q^\*}{h\_{t1}} = \\frac{T\_t^\*}{T\_{t1}} - 1$
%[text] From the Rayleigh flow chart, $T\_t / T\_t^\*$ curve:
%[text] - $\\frac{T\_t}{T\_t^\*} \\cong 0.52$ \
%[text] $\\rightarrow \\frac{q^\*}{h\_{t1}} = \\frac{T\_t^\*}{T\_{t1}} - 1 = 0.92$
%%
%[text] From the energy equation for a perfect gas, for adiabatic flow, we obtain the following temperature ratio - Mach \# relation:
%[text] $\\frac{T\_{t1}}{T\_1} = 1 + \\frac{\\gamma - 1}{2} M^2 \\quad (2.30)$    \[3\]
%[text] - At Mach = 0.4: $\\frac{T\_{t1}}{T\_1} = 1.032$ \
%[text] $\\frac{q^\*}{h\_1} = \\frac{q^\*}{c\_p T\_{t1}} \\frac{T\_{t1}}{T\_1} = (0.92)(1.032) = 0.95$
%[text] Air: $c\_p = 7/29\~\\frac{cal}{g \\cdot K}$
%%
%[text] #### Heat to Thermally Choke the Flow
%[text] $q^\* = h\_{1} \\frac{q^\*}{c\_p T\_{t1}} \\frac{T\_{t1}}{T\_1} = c\_p T\_{1} \\frac{q^\*}{c\_p T\_{t1}} \\frac{T\_{t1}}{T\_1}$
%[text] - Note: $h\_1$ is the *static* enthalpy at the inlet. \
%[text] At $T\_{1} = 300\~K\~(static\~inlet\~temperature) \\rightarrow \\textbf{q\* = 68.74 cal/g}$
%[text] $\\rightarrow$ This is the amount of heat, in thermochemical calories per gram, needed to thermally choke the flow.
%%
%[text] #### Exit Total Pressure
%[text] From the Rayleigh flow chart: 
%[text] - $\\frac{p\_{t1}} {p^\*} \\cong 1.16$ \
%[text] $p\_{t2} = p\_t^\* = \\frac{113.1 kPa} {1.16} = \\textbf{ 97.5\~kPa }$
%[text] $\\rightarrow$ This is the pressure at the choke point.
%[text] Pressure drop from the inlet stagnation pressure:
%[text] $\\% \\frac{\\Delta p\_t}{p\_{t1}} = \\frac{97.5 - 113.1}{113.1} 100\~\\% = -13.79\~\\%$
%[text] $\\rightarrow$ The pressure drop is 13.79% from the inlet stagnation pressure.
%%
%[text] ## Problem 3. Fanno Flow
%[text] ### Problem Statement
%[text] Steady flow of air enters a tube of diameter D at an initial Mach number of 0.4.  Assume an adiabatic wall.  Determine the length for frictional choking, the exit total pressure, and the exit total temperature.  The skin friction coefficient is 0.005.
%%
%[text] ### Analysis
%[text] <u>Assumptions</u>:
%[text] - Adiabatic wall, $q = 0$
%[text] - Skin friction coefficient, $c\_f = 0.005$
%[text] - Inlet static standard atmospheric conditions:
%[text]     - $P\_{1} = 1\~atm = 101.325\~kPa$
%[text]     - $T\_{1} = 300\~K$
%[text] - Inlet *stagnation* conditions:
%[text]     - At $M\_1 = 0.4$:
%[text]     - $T\_{t1} = T\_1 \\left( 1 + \\frac{\\gamma - 1}{2} M\_1^2 \\right) = 309.6\~K$
%[text]     - $\\\[ p\_{t1} = p\_1 \\left(1+\\frac{\\gamma-1}{2}M\_1^2\\right)^{\\gamma/(\\gamma-1)} \\\] = 113.1\~kPa$ \
%%
%[text] From the Fanno Flow chart at $M\_1 = 0.4$:
%[text] - $\\frac{4C\_fL^\*}{D} \\cong 2.2$
%[text] - $\\frac{p\_{t1}}{p\_t^\*} \\cong 1.58$
%[text] - $\\frac{\\rho}{\\rho\*} \\cong 2.62$ \
%%
%[text] #### Length for Frictional Chocking
%[text] $L^\* = \\frac{2.2 D}{4 c\_f} \\approx 110D$
%[text] $\\rightarrow$ Choking occurs after approximately 110 tube diameters.
%%
%[text] #### Exit Total Pressure
%[text] $p\_{t}^\* = p\_{t2} = \\frac{p\_{t1}} {1.58} = \\textbf{ 71.6\~kPa }$
%[text] $\\rightarrow$ The pressure at the choke point is about ~63% of the inlet *stagnation* pressure.
%%
%[text] #### Exit Total Temperature
%[text] $\\rightarrow$ For steady adiabatic flow with no shaft work:
%[text] $h\_t = h + \\frac{u^2}{2} = const.$
%[text] Consequently: $T\_{t2} = T\_{t1} = 309.6\~K$
%[text] $\\rightarrow$ Friction reduces the total pressure, while the total temperature stays constant because no energy enters or leaves the flow as heat or work.
%%
%[text] ## References
%[text] \[1\] YouTube '[14. Waves in Fluids](https://www.youtube.com/watch?v=MNyebpog_i0)'.
%[text] \[2\] Cengel, Y. (2018). *Fluid Mechanics: Fundamentals and Applications* (4th ed.). New York: McGraw-Hill.
%[text] \[3\] Liepmann, H. W., & Roshko, A. (2001). *Elements of gasdynamics*. Dover Publications. (Original work published 1957)

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":39.5}
%---
