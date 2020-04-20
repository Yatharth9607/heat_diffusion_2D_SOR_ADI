clear
L = 0.4;
W = 0.3;

T1 = 40;
T2 = 0;
T3 = 10;
T4 = 0;
i = 0;
for r = 100:10:200
    i = i + 1;
    Nx = r*L;
    x = linspace(0,L,Nx);
    Ny = r*W;
    y = linspace(0,W,Ny);
    N = Nx + Ny;
    n(1,i) = N;

    w = 1.3;
    [Ta,na] = ADIf(L,W,Nx,Ny,T1,T2,T3,T4,w);
    f = @() ADIf(L,W,Nx,Ny,T1,T2,T3,T4,w);
    ta(1,i) = timeit(f);

    w = 1.8;
    [Ts,ns] = SORf(L,W,Nx,Ny,T1,T2,T3,T4,w);
    g = @() SORf(L,W,Nx,Ny,T1,T2,T3,T4,w);
    ts(1,i) = timeit(g);
    
    %t(1,i) = (ta(1,i))/ts(1,i);
end
plot(n,ta,n,ts)
legend('ADI method','SOR method')
xlabel('Total number of nodes in the computational domain')
ylabel('Computational time required for the algorithm (sec)')
%figure(2)
%plot(n,t)