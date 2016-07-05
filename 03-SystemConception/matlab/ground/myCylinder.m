function [X,Y,Z,C] = myCylinder(varargin)

[cax,args,nargs] = axescheck(varargin{:});
n = 20;
r = [1 1]';
x0 = [0 0]';
c=[]; z0=[];
if nargs > 0, r = args{1}; end
if nargs > 1, c = args{2}; end
if nargs > 2, x0 = args{3}; end
if nargs > 3, z0 = args{4}; end
if nargs > 4, n = args{5}; end

r = r(:); x0=x0(:); % Make sure r and l are vectors.
if length(r) > length(x0)
    m=length(r);
    x0=interp1((0:length(x0)-1)'/(length(x0)-1),x0,(0:m-1)'/(m-1));
elseif length(x0) > length(r)
    m=length(x0);
    r=interp1((0:length(r)-1)'/(length(r)-1),r,(0:m-1)'/(m-1));
else
    m = length(r); 
    if m==1, r = [r;r]; x0=[x0;x0]; m = 2; end
end
if isempty(z0); z0 = (0:m-1)'/(m-1); elseif length(z0)==1; z0=z0*(0:m-1)'/(m-1); end

alpha = atan2(x0(2:end)-x0(1:end-1),z0(2:end)-z0(1:end-1)); alpha(m)=alpha(m-1);
theta = (0:n)/n*2*pi;
sintheta = sin(theta); sintheta(n+1) = 0;

X = x0*ones(1,n+1) + r.*cos(alpha) * cos(theta);
Y = r * sintheta;
Z = z0*ones(1,n+1) - r.*sin(alpha) * cos(theta);
if ~isempty(c)
    C(:,:,1) = c(:,1)*ones(1,n+1); 
    C(:,:,2) = c(:,2)*ones(1,n+1); 
    C(:,:,3) = c(:,3)*ones(1,n+1); 
else 
    C=[];
end