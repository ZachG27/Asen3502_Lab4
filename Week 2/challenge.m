algorithm = 'sqp';
options = optimoptions('fmincon', 'Algorithm', algorithm, 'Display', 'off', ...
    'OptimalityTolerance', 1e-10, 'StepTolerance', 1e-12, 'ConstraintTolerance', 1e-10, ...
    'MaxIterations', 500, 'MaxFunctionEvaluations', 5000);

sc = scenario('challenge');
theta = scenario('sample', sc, 100000);

P = params();

lower_bound = [0.3,4,0.2,8];
upper_bound = [3,20,10,40];

x0 = [0.5, 12, 4, 20];

function [g,g2] = constraint(x,theta,P)
[R,g] = uav_range(x,theta,P);
g = max(g,[],1)';
g2 = [];
end

function f = obj(x,theta,P)
[R,g] = uav_range(x,theta,P);
f = -mean(R)/1e5;
end


xmin = fmincon(@(x) obj(x,theta,P), x0,[],[],[],[],lower_bound,upper_bound,@(x) constraint(x,theta,P),options)
uav_range(xmin,theta,P)

evaluate(xmin,'zach.galdston@colorado.edu')
