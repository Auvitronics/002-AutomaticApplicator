function [XX,YY,ZZ]=transformSurface(X,Y,Z,T)

m=size(X,1); n=size(X,2);
p=[X(:), Y(:), Z(:), ones(m*n,1)]';
p=T*p;
XX=reshape(p(1,:)',[m n]);
YY=reshape(p(2,:)',[m n]);
ZZ=reshape(p(3,:)',[m n]);
