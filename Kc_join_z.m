function K_c_z = Kc_join_z(Tbase,d,q,theta,L,Ttool,K_theta)
J_q = Jacobian_q_join_z(Tbase,d,q,theta,L,Ttool);
J_theta = Jacobian_theta_join_z(Tbase,d,q,theta,L,Ttool);

%Cartesian  stiffnessmatrix
K_c0 = inv(J_theta * inv(K_theta) * J_theta');
%Cartesian stiffness matrix of the single chain
K_cqz = inv(J_q' * inv(K_c0) * J_q) * J_q' * inv(K_c0);
%Cartesian stiffness matrices of the serial chains z
K_c_z = K_c0 - (K_c0 * J_q * K_cqz);

end