L = 0.4;
W = 0.3;
Nx = 100;
x = linspace(0,L,Nx);
Ny = 100;
y = linspace(0,W,Ny);
T1 = 40;
T2 = 0;
T3 = 10;
T4 = 0;
w = 1.2;
error1 = zeros(Nx,Ny);
error2 = zeros(Nx,Ny);
dx = zeros(1,4);

%Analytical Method
Tn = analyticf(L,W,Nx,Ny,T1,T2,T3,T4);

%ADI Method
Ta = ADIf(L,W,Nx,Ny,T1,T2,T3,T4,w);

%Error in ADI Solution
e1 = 0;
for j = 2:(Ny-1)
    for i = 2:(Nx-1)
        e1 = (Ta(i,j) - Tn(i,j))^2;
    end
end
e1 = sum(e1,1);
e1 = sum(e1,2);
e1 = e1/(Nx*Ny);

%Point SOR Method
Ts = SORf(L,W,Nx,Ny,T1,T2,T3,T4,w);

%Error in SOR Solution
e2 = 0;
for j = 2:(Ny-1)
    for i = 2:(Nx-1)
        e2 = (Ts(i,j) - Tn(i,j))^2;
    end
end
e2 = sum(e2,1);
e2 = sum(e2,2);
e2 = e2/(Nx*Ny);

dx(1,(N-4)) = 1/(N-1);
dx(1,(N-4)) = log(dx(1,(N-4)));

plot(dx,e1)
hold on
plot(dx,e2)
title('Error in computational methods')
xlabel('log(dx)')
ylabel('log(error)')
legend({'FTCS','Crank-Nicolson'},'Location','northeast')