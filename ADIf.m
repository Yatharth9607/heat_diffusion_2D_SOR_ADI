function [T,n] = ADIf(alpha,Nx,Ny,T11,T21,T31,T41,w)

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

%ADI iterations
n = 0;
while e > 10^-5
    Tb = Ta;
    
    %x-sweep    
    for j = 2:(Ny-1)
        
        %Matrix formation
        for i = 2:(Nx)
            px(1,i) = w;
            qx(1,i) = -2*(1+(b^2));
            rx(1,i) = w;
            sx(1,i) = (-2*(1+(b^2))*(1-w)*Ta(i,j)) - (w*(b^2)*(Ta(i,j+1) + Ta(i,j-1)));
        end

        sx(1,2) = sx(1,2) - (w)*Ta(1,j);
        sx(1,Nx-1) = sx(1,Nx-1) - (w)*Ta(Nx,j);

        Ta(:,j) = TRI(2,Nx-1,px,qx,rx,sx);
        
        %Re-assigning boundary values
        Ta(:,1) = T11;
        Ta(:,Ny) = T31;

        Ta(1,:) = T21;
        Ta(Nx,:) = T41;
    end


    %y-sweep
    for i = 2:(Nx-1)
        
        %Matrix formation
        for j = 2:(Ny)
            py(1,j) = w*(b^2);
            qy(1,j) = -2*(1+(b^2));
            ry(1,j) = w*(b^2);
            sy(1,j) = (-2*(1+(b^2))*(1-w)*Ta(i,j)) - (w*(Ta(i+1,j) + Ta(i-1,j)));
        end

        sy(1,2) = sy(1,2) - (w)*(b^2)*Ta(i,1);
        sy(1,Ny-1) = sy(1,Ny-1) - (w)*(b^2)*Ta(i,Ny);

        Ta(i,:) = TRI(2,Ny-1,py,qy,ry,sy);

        %Re-assigning boundary values
        Ta(:,1) = T11;
        Ta(:,Ny) = T31;

        Ta(1,:) = T21;
        Ta(Nx,:) = T41;
    end

    e1 = abs(Ta - Tb);
    e2 = sum(e1,1);
    e2 = sum(e2,2);
    e3 = sum(Tb,1);
    e3 = sum(e3,2);
    e = e2/e3;
    n = n + 1;
end
T = Ta';
end