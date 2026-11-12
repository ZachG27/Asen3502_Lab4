function [position, path] = augmented_lagrange(g, initial_guess, tol, max_iterations, f)
alpha_max = deg2rad(10);
delta_max = deg2rad(-5); 

lamda = [0;0];
mu = 10;

x = initial_guess;

c = @(x) [x(1) - alpha_max; x(2) - delta_max];
phik = f(x);
path = x;
for k = 1:max_iterations
    for i = 1:2
        if (lamda(i) + mu*c(i)) > 0
            %Active contraint
            phik = phik + f(x) + lamda(i)*c(i) + (mu/2)*c(i)^2;
        else
            %Inactive contraints
            phik = phik + f(x) - lamda(i)^2/(2*mu);
        end
    end
%Here is where I will call ADAM to minimize phik, update x, check
%convergence and repeat until it converges
lamda = lamda + mu*g(x);
mu = 4*mu;

end
end