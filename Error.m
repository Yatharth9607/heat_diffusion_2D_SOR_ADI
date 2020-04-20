clear
L = 0.4;
W = 0.3;

T1 = 40;
T2 = 0;
T3 = 10;
T4 = 0;

i = 0;
for r = 50:10:200
    Nx = r*L;
    x = linspace(0,L,Nx);
    Ny = r*W;
    y = linspace(0,W,Ny);
    
    i = i + 1;
    w = 1.3;
    [Ta,~] = ADIf(L,W,Nx,Ny,T1,T2,T3,T4,w);
    w = 1.9;
    [Ts,~] = SORf(L,W,Nx,Ny,T1,T2,T3,T4,w);
    Tn = analyticf(L,W,Nx,Ny,T1,T2,T3,T4);
    
    %Error in ADI Solution
    e1 = 0;
    for j2 = 2:(Nx-1)
        for j1 = 2:(Ny-1)
            e1(j1,j2) = (Ta(j1,j2) - Tn(j1,j2))^2;
        end
    end
    e1 = sum(e1,1);
    e1 = sum(e1,2);
    error1(1,i) = log(sqrt(e1)/(Nx*Ny));

    %Error in SOR Solution
    e2 = 0;
    for j2 = 2:(Nx-1)
        for j1 = 2:(Ny-1)
            e2(j1,j2) = (Ts(j1,j2) - Tn(j1,j2))^2;
        end
    end
    e2 = sum(e2,1);
    e2 = sum(e2,2);
    error2(1,i) = log(sqrt(e2)/(Nx*Ny));

    dx(1,i) = 1/(Nx-1);
    dx(1,i) = log(dx(1,i));
    dy(1,i) = 1/(Ny-1);
    dy(1,i) = log(dy(1,i));

end

figure('Name','X-direction')
plot(dx,error1)
hold on
plot(dx,error2)
xlabel('log(dx)')
ylabel('log(error)')
legend({'ADI Method','SOR Method'},'Location','northeast')
hold off

slopeadi = diff(error1)./diff(dx);
slopeadi = sum(slopeadi,2)/(i-1);
disp(slopeadi)

slopesor = diff(error2)./diff(dx);
slopesor = sum(slopesor,2)/(i-1);
disp(slopesor)


figure('Name','Y-direction')
plot(dy,error1)
hold on
plot(dy,error2)
xlabel('log(dy)')
ylabel('log(error)')
legend({'ADI Method','SOR Method'},'Location','northeast')
hold off

slopeadi = diff(error1)./diff(dx);
slopeadi = sum(slopeadi,2)/(i-1);
disp(slopeadi)

slopesor = diff(error2)./diff(dx);
slopesor = sum(slopesor,2)/(i-1);
disp(slopesor)