%Tri-diagonal matrix solver
function [s] = TRI(i1,i2,p,q,r,s)

    %fwd substitution
    for i = (i1+1):i2
        q(1,i) = q(1,i) - r(1,i-1)*(p(1,i)/q(1,i-1));
        s(1,i) = s(1,i) - s(1,i-1)*(p(1,i)/q(1,i-1));
    end

    %bwd substitution
    s(1,i2) = s(1,i2)/q(1,i2);
    for i = (i2-1):-1:i1
        s(1,i) = (s(1,i) - (r(1,i)*s(1,i+1)))/(q(1,i));
    end
end