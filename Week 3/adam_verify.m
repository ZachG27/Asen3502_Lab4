% ADAM verification
x0 = [0.2; 0.1];
tol = 1e-6;
max_iterations = 1000;
l_init = 0.02;

g = @(x) trim_gradient(x(1),x(2),params);

[position, path] = ADAM(g,x0,tol,max_iterations,l_init);

disp(position)
fprintf('Iterations: %d\n',size(path,2)-1);