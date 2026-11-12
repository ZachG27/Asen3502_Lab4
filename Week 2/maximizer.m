algorithm = 'sqp';
options = optimoptions('fmincon', 'Algorithm', algorithm, 'Display', 'off', ...
    'OptimalityTolerance', 1e-10, 'StepTolerance', 1e-12, 'ConstraintTolerance', 1e-10, ...
    'MaxIterations', 500, 'MaxFunctionEvaluations', 5000);

theta = [1.5, 0.02875, 648000, 4];
P = params();

lower_bound = [0.3,4,0.2,8];
upper_bound = [3,20,10,40];

x0 = [0.5, 12, 4, 20];

function [g,g2] = constraint(x,theta,P)
    [R,g] = uav_range(x,theta,P);
    g2 = [];
end

function R = obj(x,theta,P)
    [R,g] = uav_range(x,theta,P);
    R = -R/10^5;
end

xmin = fmincon(@(x) obj(x,theta,P), x0,[],[],[],[],lower_bound,upper_bound,@(x) constraint(x,theta,P),options)
[R,g] = uav_range(xmin,theta,P)


