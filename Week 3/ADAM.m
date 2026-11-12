function [position, path] = ADAM(g,initial_guess,tol,max_iterations,l_init)
%%g=gradiant, xinit is intial guess, tol is Es tolerance, max interations
%%is lowk whatever, linit=alpha/step size type thing

%initialize constants
gamma1=.3;
gamma2=.99;
epsi=10^-8;

%initialize variables
x(1,:)=initial_guess';
v(1,:)=zeros(1,2);
s(1,:)=zeros(1,2);
vhat(1,:)=zeros(1,2);
shat(1,:)=zeros(1,2);
k=1;

while true
v(k+1,:)=gamma1*v(k,:)+(1-gamma1)*g(x(k,:)')';
s(k+1,:)=gamma2*s(k,:)+(1-gamma2)*g(x(k,:)')'.^2;
vhat(k+1,:)=v(k+1,:)/(1-gamma1^(k));
shat(k+1,:)=s(k+1,:)/(1-gamma2^(k));
x(k+1,:)=x(k,:)-l_init./(epsi+sqrt(shat(k+1,:))).*vhat(k+1,:);

    if norm(x(k+1,:)-x(k,:)) < tol || k >= max_iterations
        position = x(k+1,:)';
        path = x(:,:)';
    return

    end
    k=k+1;
end
end
