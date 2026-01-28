%[text] # Kinematics: Reference Frames, Flow Fields, and Reynolds Transport Theorem (RTT)
%[text] %[text:anchor:TMP_3624] AA 507 (Incompressible Fluid Mechanics) Winter 2026, UW
%[text] Assignment: Homework 2
%[text] (Ref file: HW2.pdf)
%[text] Author: Emmanuel Rodriguez
%[text] [emmanueljrodriguez.com](https://emmanueljrodriguez.com/)
%[text] Date: 24JAN2026
%[text]  \- 29JAN2026
%[text] Location: Renton, Seattle, WA
%%
%[text:tableOfContents]{"heading":"Table of Contents"}
%%
clear % Clears workspace
clc % Clears command window
close all % Closes all figures
%%
%[text] ## Problem 2. Passive scalar transport from Reynolds Transport Theorem
%[text] - \[A passive scalar is a scalar quantity that is transported by advection (the transfer of a substance, or matter, by bulk motion of a fluid) and diffusion in a flow but does not influence the velocity field or fluid dynamics.\] \
%[text] #### 1. Time rate of change of dye mass
%[text] ### Fundamentals
%[text] <u>Conservation of Mass Principle</u>
%[text] $m\_{in} - m\_{out} = \\Delta\_{CV}$
%[text] *The net mass transfer to or from a control volume during a time interval* $\\Delta t$ *is equal to the net change in the total mass within the control volume during* $\\Delta t$. \[1\]
%[text] #### **General Conservation of Mass**
imshow('element for cons of mass.png')
%[text] $\\frac{d}{dt}\\int\_{\\text{CV}} \\rho \\, dV + \\int\_{\\text{CS}} \\rho \\, (\\vec{V} \\cdot \\vec{n})\\, dA = 0$
%[text] "... *the time rate of change of mass within the control volume plus the net mass flow rate through the control surface is equal to zero."*
%%
%[text] <u>Total Dye Mass</u>:
%[text] Since:
%[text] $c = \\frac{M\_{dye}} {M\_{mixture}}$
%[text] then,
%[text] $M\_{dye} = c M\_{mixture}$
%[text] or, generally:
%[text] $M\_{dye}(t) = \\int\_{V} \\rho(x,t) c(x,t)\\, dV$
%%
%[text] <u>Time Rate of Change of Dye Mass</u>:
%[text] The dye is conserved, so expanding on the *general conservation of mass* expression above, gives:
%[text] $\\frac{d}{dt} \\int\_{\\text{V}} \\rho c \\, dV + \\int\_{\\partial V} (\\rho c \\vec{u} + \\mathbf{j}) \\cdot \\vec{n}\\, dA = 0$
%[text] - \[Why is the second integral integrating over volume, and not a surface?\] \
%[text] \[Continue here... -ERODRIGUEZ2, 27JAN2026 21:52\]
%%
%[text] ### Applications
%[text] #### 
%%
%[text] ## References
%[text] \[1\] Cengel, Y. (2018). *Fluid Mechanics: Fundamentals and Applications* (4th ed.). New York: McGraw-Hill.

%[appendix]{"version":"1.0"}
%---
%[metadata:view]
%   data: {"layout":"onright"}
%---
