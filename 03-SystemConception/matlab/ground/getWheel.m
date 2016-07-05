function w=getWheel()

x=-.5:0.003:0.5;
y=-.5:0.003:0.5;
[X,Y]=meshgrid(x,y);
Z=zeros(size(X));
for i=1:length(x)
    for j=1:length(y)
        z=wheel(x(i),y(j));
        Z(i,j)=z;
    end
end
w.X = X; w.Y=Y; w.Z=Z;