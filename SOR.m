clear
L = 0.4;
W = 0.3;
alpha = L/W;
r = 200;
Nx = r*L;
x = linspace(0,1,Nx);
Ny = r*W;
y = linspace(0,1,Ny);
T1 = 40;
T2 = 0;
T3 = 10;
T4 = 0;
T11 = T1/T1;
T21 = T2/T1;
T31 = T3/T1;
T41 = T4/T1;
w = 1.8;

[T,n] = SORf(alpha,Nx,Ny,T11,T21,T31,T41,w);
contourf(x*L,y*W,T*T1)
xlabel('x(m)')
ylabel('y(m)')
c = colorbar;
c.Label.String = 'Temperature (\circ C)';
disp(n)