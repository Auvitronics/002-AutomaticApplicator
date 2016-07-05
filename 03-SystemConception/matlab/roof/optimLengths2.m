global a b

a=0.3048*(5^2+4^2)^0.5; % length in meters of diagonal along the XY plane on the specified workspace
b=0.3048*3; % length in meters along the Z direction of the specified workspace
fun = @(x)(x(1)+x(2));

%% Case 1
x0=[0.9,1.8];
AA=[1, -1/(2^.5)]; bb=0;
x = fmincon(fun,x0,AA,bb,[],[],[],[],@case1Con);
display(num2str(x));

%% Case 2a 
% good initial value couldn't be found because this case is not
% applicable for the given values of a and b
x0=[0.9*.97,.97];
AA=[1, -1;-1, 1/(2^.5);0,1]; bb=[0;0;a/2];
x = fmincon(fun,x0,AA,bb,[],[],[],[],@case2aCon);
display(num2str(x));

%% Case2b
x0=[0.9,1];
AA=[1, -1;-1, 1/(2^.5);0,-1]; bb=[0;0;-a/2];
x = fmincon(fun,x0,AA,bb,[],[],[],[],@case2bCon);
display(num2str(x));

%% Case2c
x0=[0.9,1];
AA=[1, -1;-1, 1/(2^.5);-1,1]; bb=[0;0;a/2];
x = fmincon(fun,x0,AA,bb,[],[],[],[],@case2cCon);
display(num2str(x));

