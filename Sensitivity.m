clear
L = 0.4;
W = 0.3;

T1 = 40;
T2 = 0;
T3 = 10;
T4 = 0;

i = 0;
Tas = zeros(4,200);
for r = 50:50:200
    Nx = r*L;
    x = linspace(0,L,Nx);
    Ny = r*W;
    y = linspace(0,W,Ny);
    
    i = i + 1;
    w = 1.3;
    [Ta,~] = ADIf(L,W,Nx,Ny,T1,T2,T3,T4,w);
    Tas(i,1:Ny) = (Ta(1:Ny,(Nx/2))+Ta(1:Ny,((Nx/2)+1)))/2;
    figure(1)
    plot(y,Tas(i,1:Ny))
    xlabel('y (m)')
    ylabel('Temperature values on symmetry axis')
    hold on
end

legend({'r = 50','r = 100','r = 150','r = 200',},'Location','northeast')
hold off

i = 0;
Tss = zeros(4,200);
for r = 50:50:200
    Nx = r*L;
    x = linspace(0,L,Nx);
    Ny = r*W;
    y = linspace(0,W,Ny);
    
    i = i + 1;
    w = 1.8;
    [Ts,~] = SORf(L,W,Nx,Ny,T1,T2,T3,T4,w);
    Tn = analyticf(L,W,Nx,Ny,T1,T2,T3,T4);
    Tss(i,1:Ny) = (Ts(1:Ny,(Nx/2))+Ts(1:Ny,((Nx/2)+1)))/2;
    figure(2)
    plot(y,Tss(i,1:Ny))
    xlabel('y (m)')
    ylabel('Temperature values on symmetry axis')
    hold on
end

legend({'r = 50','r = 100','r = 150','r = 200',},'Location','northeast')
hold off