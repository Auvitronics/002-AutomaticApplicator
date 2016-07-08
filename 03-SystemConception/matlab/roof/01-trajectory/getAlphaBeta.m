function out = getAlphaBeta(z)

alpha=atan2(z(2),z(1));
beta=atan2(z(3)*cos(alpha),z(1));

out=[alpha, beta];