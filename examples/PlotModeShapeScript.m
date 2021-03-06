%ltx plot modal shape
for imode = PltMode; %ltx mode number
    figure
    U = modeShape(:,imode); %ltx set the modal shape as displacement
    Umax = max(abs(U)); %ltx maximum displacement
    Lmax = max(max(coord)-min(coord)); %ltx maximum dimension of domain
    fct = 0.1*Lmax/Umax; %ltx factor to magnify the displacement 
    %ltx augment nodal coordinates
    deformed = coord + fct*(reshape(U,2,[]))';
    hold on
    opt = struct('LineSpec',':b'); %ltx plotting option
    PlotSBFEMesh(coord, sdConn, opt); %ltx undeformed mesh
    opt = struct('LineSpec','-k'); %ltx plotting option
    PlotSBFEMesh(deformed, sdConn, opt); %ltx modal shape
    title(['MODE SHAPE: ',int2str(imode)]);
end