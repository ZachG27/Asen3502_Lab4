hold on
x = scenario('sample',scenario('nominal'),10000);

figure
histogram(x(:,1))

figure
histogram(x(:,2))

figure
histogram(x(:,3))

figure
histogram(x(:,4))

