%cbgnltx
%\leftadjust {\bf Matlab script: A rectanglur body 
% modelled with 3 S-elements: uniaxial tension}  
%cendltx

%ltx {\bf Mesh}
%ltx nodal coordinates. One node per row \texttt{[x y]}
coord = [0 0; 0  1; 0 3; 1 0; 1 1; 2 0; 2 1; 2 3];
%cbgnltx
% Input S-element connectivity as a cell array (One S-element per cell). 
% In a cell, the connectivity of line elements is given by
% one element per row \texttt{[Node-1 Node-2]}.
%cendltx
sdConn = { [2 5; 5 7; 7 8; 8 3; 3 2]; %ltx S-element 1 \label{Exmpl_Uniaxial3SD_Sln_sdConn}
           [1 4; 4 5; 5 2; 2 1];      %ltx S-element 2
           [4 6; 6 7; 7 5; 5 4]};     %ltx S-element 3
%ltx coordinates of scaling centres of S-elements.
sdSC = [ 1 2; 0.5 0.5; 1.5 0.5]; %ltx one S-element per row

%ltx {\bf Materials}
%ltx \texttt{E}: Young's modulus; \texttt{p}: Poisson's ratio
ElasMtrx = @(E, p) E/(1-p^2)*[1 p 0;p 1 0;0 0 (1-p)/2];
mat.D = ElasMtrx(10E6, 0.25); %ltx  \texttt{E} in KPa
mat.den = 2; %ltx mass density in $\unit{Mg/m^{3}}$\label{Exmpl_Uniaxial3SD_Sln_endMaterial}

%ltx {\bf Boundary conditions} \label{Exmpl_Uniaxial3SD_Sln_BC}
%ltx nodal forces. One force component per row: \texttt{[Node Dir F]} 
BC_Frc = [3  2  1E3; 8  2  1E3];  %ltx forces in KN
%ltx assemblage external forces 
ndn = 2; %ltx 2 DOFs per node
NDof = ndn*size(coord,1); %ltx number of DOFs
F = zeros(NDof,1); %ltx initialising right-hand side of equation $[K]\{u\} = \{F\}$
F = AddNodalForces(BC_Frc, F); %ltx add prescribed nodal forces
%ltx displacement constrains. One constrain per row: \texttt{[Node Dir Disp]}
BC_Disp = [1 2 0; 4 1 0; 4 2 0; 6 2 0];
