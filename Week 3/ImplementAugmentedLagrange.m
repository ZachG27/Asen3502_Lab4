P = default_params;

% Initial conditions
initial_guess = [0.15; -0.1];

% Optimization parameters
max_iterations = 1000;
tol = 1e-6;

% Objective function
f = @(x) trimFunc(x(1), x(2));

% Gradient of objective function
g = @(x) trim_gradient(x(1), x(2), P);

% Augmented Lagrangian optimization
[position, path] = augmented_lagrange(g, initial_guess, tol, max_iterations, f);