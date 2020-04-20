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
T31 = T3/T1;

T = analyticf(alpha,Nx,Ny,T31);
contourf(x*L,y*W,T1*T)
xlabel('x(m)')
ylabel('y(m)')
c = colorbar;
c.Label.String = 'Temperature (\circ C)';