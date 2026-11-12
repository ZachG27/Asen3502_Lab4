function [f] = trim_function(alpha, delta,p)

    C_L = p.C_L_0 + p.C_L_a .* alpha + p.C_L_d .* delta + p.C_L_p0.*exp(-(alpha./p.alpha_p).^2);
    C_M = p.C_M_0 + p.C_M_a .* alpha + p.C_M_d .* delta;
    
    f = ((p.q.*p.S.*C_L - p.W) ./ p.W).^2 + C_M.^2;
end




