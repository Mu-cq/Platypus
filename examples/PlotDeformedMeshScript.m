%ltx {\bf Plot deformed mesh}
figure
Umax = max(abs(U)); %ltx maximum displacement
Lmax = max(max(coord)-min(coord)); %ltx maximum dimension of domain
fct = 0.1*Lmax/Umax; %ltx factor to magnify the displacement 
%ltx augment nodal coordinates
deformed = coord + fct*(reshape(U,2,[]))'; 
hold on
%ltx plot undeformed mesh
opt = struct('LineSpec',':b'); %ltx plotting option
PlotSBFEMesh(coord, sdConn, opt);
%ltx plot deformed mesh
opt = struct('LineSpec','-k'); %ltx plotting option
PlotSBFEMesh(deformed, sdConn, opt);
title('DEFORMED MESH');
