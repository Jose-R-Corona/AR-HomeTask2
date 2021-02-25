function q = IK_q_join_z(Tbase,d,L)

Td=Tx(d(1))*Ty(d(2))*Tz(d(3))*Tbase

x = Td(1,4)
y = Td(2,4)
z = Td(3,4)

%equations from paper
cos_qz_2 = (x^2 + y^2 - L(1)^2 - L(2)^2) / (2 * L(1) * L(2))
sin_qz_2 = sqrt(1-cos_qz_2^2) %just positive

%calculation virtual join
q1 = atan2(sin_qz_2,cos_qz_2);
q2 = atan2(y,x)-atan2(L(2)*sin_qz_2,(L(1)+L(2)*cos_qz_2));
q3 = -q1-q2;

q = [q1,q2,q3];

end