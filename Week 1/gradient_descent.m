function [position, path] = gradient_descent(g,initial_guess,tol,max_iterations,l_init)
    x = initial_guess;
    rho = 0.5;
    mu = 1e-4;
    p = params();

    f = @(x) trim_function(x(1),x(2),p);
    
    k = 1;
    path = zeros(max_iterations+1, length(x));
    path(1,:) = x';
    while norm(g(x)) > tol && k <= max_iterations
        p = -g(x);
        alpha = l_init;

        phi = f(x + alpha*p);
        phi_prime = g(x)' * p;

        
        while phi > f(x) + mu * alpha * phi_prime
            alpha = rho * alpha;
            phi = f(x+alpha*p);
        end

        x = x + alpha * p;
        path(k+1,:) = x';
        k = k+1;

    end
    position = x;
    path = path(1:k,:);
end