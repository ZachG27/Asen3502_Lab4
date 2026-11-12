function G = trim_gradient(alpha, delta_e, p)

%define our partials
par_a=@(alpha,delta_e) (((p.q*p.S*p.C_L_a)/(p.W))+((p.C_L_p0*p.q*p.S*exp(-(alpha/p.alpha_p)^2)*(-2*alpha/p.alpha_p^2))/p.W))*((2/p.W)*(p.q*p.S*(p.C_L_0+p.C_L_a*alpha+p.C_L_d*delta_e+p.C_L_p0*exp(-(alpha/p.alpha_p)^2))-p.W))+2*(p.C_M_0+p.C_M_a*alpha+p.C_M_d*delta_e)*p.C_M_a;
par_del_e=@(alpha,delta_e) ((p.q*p.S*p.C_L_d)/p.W) * ((2/p.W)*(p.q*p.S*(p.C_L_0+p.C_L_a*alpha+p.C_L_d*delta_e+p.C_L_p0*exp(-(alpha/p.alpha_p)^2))-p.W))+2*(p.C_M_0 + p.C_M_a*alpha + p.C_M_d*delta_e)*p.C_M_d;

%define G
G=[par_a(alpha,delta_e);par_del_e(alpha,delta_e)];
end