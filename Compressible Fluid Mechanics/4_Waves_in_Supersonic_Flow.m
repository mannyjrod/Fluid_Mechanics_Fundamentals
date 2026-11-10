%[text] # Waves in Supersonic Flow
%[text] Compressible Fluid Mechanics, AA 504, Autumn 2026, UW
%[text] Assignment: Homework \#4
%[text] Author: Emmanuel Rodriguez
%[text] [emmanueljrodriguez.com](https://emmanueljrodriguez.com/)
%[text] Date: 4NOV2026
%[text] Location: Suzzallo library, UW, Seattle, WA
%%
%[text:tableOfContents]{"heading":"Table of Contents"}
%[text] 
%%
clear % Clears workspace
clc % Clears command window
close all % Closes all figures
%%
%[text] ## Problem 1. Shock Wave Propagation
%[text] ### Problem Statement
%[text] A Mach 3 shock wave propagates to the right along a shock tube and then collides with the closed end of the tube.  The initial pressure of the gas is p1.  Draw the x-t diagram.  What is the pressure on the end of the tube after the wave arrives?  (*Hint:*  The boundary condition of zero speed at the end of the tube can be satisfied by adding a virtual wave of identical strength propagating to the left.)
%%
%[text] ### Analysis
%[text] \[*pending*\]
%[text] 1\. Understand the physical situation
%[text] *Piston-generated wave analogy*
imshow("HW4_Prob1.png") %[text:anchor:TMP_77fd]
%[text] at 
%[text] $t\_0$: Piston pushes right with a speed $u\_p$, impulsively, generating a shock wave.
%[text] $t\_1$: The incident shock outruns the piston, propagates to the right with a speed $u\_s$ - to where it will contact undisturbed gas in State 1, and compresses the gas leaving it in State 2.
%[text] $t\_2$: The shock wave reaches the left wall.
%[text] $t\_3$: The shock reflects to the left with a speed $u\_r$, compresses the gas again where it is brought to rest, leaving it in State 3. The reflected shock is moving towards the once compressed gas from State, which is still moving right with a speed $u\_p = u\_2$.
%%
%[text] 2\. Draw the x-t diagram
imshow("Black-and-White Shock Reflection Diagram.png")
%[text] \[insert the "raw" x-t diagram here, raw meaning no values -- only the shock lines and times.
%[text] continue here. -ERODRIGUEZ2, 9NOV2026 6:39\]
%%
%[text] <u>x-t diagram</u>:

%% Mach 3 Shock Reflection - x-t Diagram
% Incident shock travels right and reflects from a rigid wall.
% Horizontal axis: position x
% Vertical axis: time t
%
% Assumptions:
%   Air, gamma = 1.4
%   Initially stationary gas
%   Incident shock Mach number Ms = 3

clear; clc; close all;

%% 1. Gas and shock properties
gamma = 1.4;
Ms = 3;

a1 = 343;           % Initial speed of sound [m/s]
L = 1.0;            % Tube length [m]

% Incident shock speed (laboratory frame)
Vs = Ms*a1;

% State 2: behind incident shock
p2_p1 = 1 + 2*gamma/(gamma+1)*(Ms^2-1);

rho2_rho1 = ((gamma+1)*Ms^2)/ ...
            ((gamma-1)*Ms^2+2);

u2 = Vs*(1-1/rho2_rho1);

% Speed of sound behind incident shock
a2 = a1*sqrt(p2_p1/rho2_rho1);

%% 2. Reflected shock properties
% Reflected shock must bring the gas to rest: u3 = 0

K = (gamma+1)*u2/(2*a2);

% Solve MR - 1/MR = K
MR = (K + sqrt(K^2+4))/2;

% Reflected shock speed in laboratory frame
Vr = u2 - MR*a2;     % Negative = moving left

% Pressure behind reflected shock
p3_p2 = 1 + 2*gamma/(gamma+1)*(MR^2-1);
p3_p1 = p2_p1*p3_p2;

%% 3. Shock trajectories
% Incident shock begins at x = 0, t = 0
% Reflection occurs at x = L

tR = L/Vs;           % Time shock reaches wall
tEnd = 1.8*tR;       % Plot beyond reflection

tIncident = linspace(0,tR,200);
xIncident = Vs*tIncident;

tReflected = linspace(tR,tEnd,200);
xReflected = L + Vr*(tReflected-tR);

%% 4. Plot x-t diagram
figure('Color','w','Position',[150 100 850 650]);
hold on; box on;

% Incident shock
h1 = plot(xIncident,1e3*tIncident, ...
    'LineWidth',2.8,'Color',[0.90 0.42 0.12]);

% Reflected shock
h2 = plot(xReflected,1e3*tReflected, ...
    'LineWidth',2.8,'Color',[0.10 0.50 0.72]);

% Closed wall
h3 = xline(L,'k--','LineWidth',1.8);

% Reflection point
h4 = plot(L,1e3*tR,'ko', ...
    'MarkerFaceColor','k','MarkerSize',7);

%% 5. Region labels
text(0.75*L,0.35*1e3*tR, ...
    {'State 1','p_1, u_1 = 0'}, ...
    'HorizontalAlignment','center','FontSize',12);

text(0.30*L,0.90*1e3*tR, ...
    {'State 2','p_2 = 10.33p_1'}, ...
    'HorizontalAlignment','center','FontSize',12);

text(0.85*L,1.48*1e3*tR, ...
    {'State 3','p_3 = 51.67p_1','u_3 = 0'}, ...
    'HorizontalAlignment','center','FontSize',12);

% Reflection annotation
text(L-0.03,1e3*tR+0.04, ...
    'Reflection', ...
    'HorizontalAlignment','right', ...
    'FontSize',11,'FontWeight','bold');

%% 6. Format figure
xlabel('Position, x [m]','FontSize',13);
ylabel('Time, t [ms]','FontSize',13);

title('Mach 3 Shock Reflection at a Closed Wall', ...
    'FontSize',15,'FontWeight','bold');

legend([h1 h2 h3], ...
    {'Incident shock','Reflected shock','Closed wall'}, ...
    'Location','northwest');

xlim([0 1.12*L]);
ylim([0 1e3*tEnd]);

grid on;
set(gca,'FontSize',12,'LineWidth',1.1, ...
    'Color','w','GridAlpha',0.15);

%% 7. Print results
fprintf('\n--- Shock Reflection Results ---\n');
fprintf('Incident shock speed: %.2f m/s\n',Vs);
fprintf('Reflected shock speed: %.2f m/s\n',Vr);
fprintf('Reflection time:       %.4f ms\n',1e3*tR);
fprintf('Incident pressure:     %.4f p1\n',p2_p1);
fprintf('Wall pressure:         %.4f p1\n',p3_p1);

%% 8. Optional PDF export
% exportgraphics(gcf,'Mach3_Shock_Reflection.pdf', ...
%     'ContentType','vector');

%%
%[text] ## Problem 3. Acoustic Wave Propagation
%[text] ### Problem Statement
%[text] Suppose that the initial wave in Problem (1) is instead acoustic, of small pressure amplitude .  What is the pressure on the end wall after the wave arrives?  Explain.
%%
%[text] ### Analysis
%[text] \[*pending*\]
%%
%[text] ## Problem 3. Pressure Fields and Fluid Acceleration
%[text] ### Problem Statement
%[text] Based off of the movie "Pressure Fields and Fluid Acceleration" \[3\], write one paragraph aimed at a "bright high school kid" that explains one aspect of physics illustrated in the movie.
%%
%[text] ### Statement
%[text] Imagine water flowing toward the nose of an object (a submarine, or a ship!): most of the flow turns and flows around the sides, but right at the nose, the water comes to a stop. As it slows down, its pressure rises. **Stagnation pressure** is the pressure a moving fluid would reach if it were brought to rest (to a complete stop!) without losses from friction or other irreversible effects.
%[text] In the movie’s nearly frictionless water experiments, it equals the fluid’s **static** (or "ordinary") **pressure** plus its **dynamic pressure**, ($\\frac{1}{2} \\rho u^2$), which represents its kinetic energy per unit volume.
%[text] $p + \\frac{1}{2} \\rho u^2 = p\_{stagnation}$ 
%[text] As water speeds up through a contraction, its static pressure falls, but its stagnation pressure stays approximately constant. A Pitot tube measures stagnation pressure by bringing the fluid to rest at its forward-facing opening; comparing that reading with the static pressure lets us calculate the flow speed.
imshow("pitot_tube.png");
%%
%[text] ## References
%[text] \[1\] Liepmann, H. W., & Roshko, A. (2001). *Elements of gasdynamics*. Dover Publications. (Original work published 1957)
%[text] \[2\] Cengel, Y. (2018). *Fluid Mechanics: Fundamentals and Applications* (4th ed.). New York: McGraw-Hill.
%[text] \[3\] YouTube '[6. Pressure Fields and Fluid Acceleration](https://www.youtube.com/watch?v=LI9Mi1KhFTs)'.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright","rightPanelPercent":39.5}
%---
