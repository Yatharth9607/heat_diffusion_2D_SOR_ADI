clear
L = 0.4;
W = 0.3;

T1 = 40;
T2 = 0;
T3 = 10;
T4 = 0;

for r = 100:100:200
    Nx = r*L;
    x = linspace(0,L,Nx);
    Ny = r*W;
    y = linspace(0,W,Ny);
%}
    i = 0;
    for w = 1.0:0.01:1.33
        i = i + 1;
        rela(1,i) = w;
        [~,na(1,i)] = ADIf(L,W,Nx,Ny,T1,T2,T3,T4,w);
    end
    plot(na,rela)
    hold on

    xlabel('Number of Iterations')
    ylabel('Relaxation factor')
%{
    j = 0;
    for w = 1.0:0.01:1.99
        j = j + 1;
        rels(1,j) = w;
        [~,ns(1,j)] = SORf(L,W,Nx,Ny,T1,T2,T3,T4,w);
    end
    plot(ns,rels)
    hold on

    xlabel('Number of Iterations')
    ylabel('Relaxation factor')
%}
end
hold off
legend('Nx = 40, Ny = 30','Nx = 80, Ny = 60')