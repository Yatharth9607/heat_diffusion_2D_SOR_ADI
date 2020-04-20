function [T,n] = SORf(alpha,Nx,Ny,T11,T21,T31,T41,w)

Ta = zeros(Nx,Ny);
e = 1;
dx = 1/(Nx-1);
dy = 1/(Ny-1);
b = alpha*dx/dy;

%assigning boundary values
Ta(:,1) = T11;
Ta(:,Ny) = T31;

Ta(1,:) = T21;
Ta(Nx,:) = T41;

Tb = Ta;

%SOR iterations
n = 0;
while e > (10^-5)
    Ta = Tb;
    for i = 2:Nx-1
        for j = 2:Ny-1
            Tb(i,j) = ((Tb(i+1,j)) + (Tb(i-1,j)) + (b^2)*(Tb(i,j+1)) + (b^2)*(Tb(i,j-1)))/(2*(1+(b^2)));
            Tb(i,j) = ((1-w)*(Ta(i,j)) + w*(Tb(i,j)));
        end
    end
    e1 = abs(Tb - Ta);
    e2 = sum(e1,1);
    e2 = sum(e2,2);
    e3 = sum(Ta,1);
    e3 = sum(e3,2);
    e = e2/e3;
    n = n + 1;
end
T = Ta';
end