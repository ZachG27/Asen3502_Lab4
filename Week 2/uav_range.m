
function [R,g] = uav_range(x,theta,P)
    S = x(1);
    AR = x(2);
    m_b = x(3);
    V = x(4);
    
    m_pay = theta(:,1);
    C_D_0 = theta(:,2);
    e_b = theta(:,3);
    V_w = theta(:,4);
    
    m_w = P.k_w * S^1.2 * AR^0.9;
    W = P.g * (m_pay + P.m_fix + m_b + m_w);
    q = 0.5 * P.rho * V^2;
    e = 1.78 * (1 - 0.045 * AR^0.68) - 0.64;
    
    D = q * S .* C_D_0 + W.^2 ./ (q * S * pi * e * AR);
    
    r = V / P.V_eta;
    eta = P.eta_max * 2 * r / (1 + r^2);
    
    E = (1 - P.f_res) .* e_b * m_b * eta ./ (D * V);
    R = E * V .* (1 - V_w.^2 / V^2);
    
    m = W / P.g;
    
    g = zeros(size(theta,1),4);
    g(:,1) = P.k_stall * sqrt(2 * W ./ (P.rho * S * P.C_Lmax)) - V;
    g(:,2) = P.RC_min - (eta * P.P_max - D * V) ./ W;
    g(:,3) = sqrt(AR * S) - P.b_max;
    g(:,4) = m - P.m_max;
end
