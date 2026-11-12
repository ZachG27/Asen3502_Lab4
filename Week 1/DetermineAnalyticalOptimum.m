% Finding the minimum of f
x0 = [.2;.1]; %Alpha and deltae initial guesses
alpha = x0(1); deltae = x0(2);
opts = optimset('TolX', 1e-12, 'TolFun', 1e-16);
[xmin, fmin] = fminsearch(@(x0)trimFunc(x0(1), x0(2)), x0, opts);
alphaMin = xmin(1);
deltaeMin = xmin(2);
plot_contours(1, @(x0)trimFunc(x0(1), x0(2)))