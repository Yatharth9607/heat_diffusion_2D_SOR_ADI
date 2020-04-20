function [T,n] = analyticf(alpha,Nx,Ny,T31)

T = zeros(Ny,Nx);

for i = 1:Nx
    x = (i-1)/(Nx-1);
    for j = 1:Ny
        y = (j-1)/(Ny-1);
        TA = 0;
        TB = 0;
        for m = 1:300
            A = ((1-cos(m*pi))*(sin(m*pi*x))*(sinh(m*pi*(1-y)/alpha))/((m*pi)*(sinh(m*pi/alpha))));
            B = ((1-cos(m*pi))*(sin(m*pi*x))*(sinh(m*pi*(y)/alpha))/((m*pi)*(sinh(m*pi/alpha))));
            TA = TA + A;
            TB = TB + B;
        end
        T(j,i) = 2*TA + 2*(T31)*TB;
    end
end
end