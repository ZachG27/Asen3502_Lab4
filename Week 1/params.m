function p = params()
    p.rho = 1.225; % kg / m^3
    p.V = 30; % m / s
    p.q = 0.5 * p.rho * p.V^2;
    p.S = 16.2; % m^2
    p.W = 11346; % N
    
    p.C_L_0 = 0.247;
    p.C_L_p0 = 0.6;
    p.C_L_a = 6;
    p.C_L_d = 0.43;
    
    p.C_M_0 = 0.1;
    p.C_M_a = -1.3;
    p.C_M_d = -1.28;
    
    p.alpha_p = 0.05; % rad