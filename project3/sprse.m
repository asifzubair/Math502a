%% Sparse Matrix - 2D Laplacian with Dritchlet boundary conditions

k=8;
%k=[3:1:kmax];
n=2.^(k);
N=2.^(2*k);
cpu = [];

for i = n
    
    T = 2*diag(ones(i,1)) + -1*diag(ones(i-1,1),1) + -1*diag(ones(i-1,1),-1);
    S = kron(T,-eye(i)) + kron(-eye(i),T);
    
    x = rand(i*i,1);
    b = S*x;
    
    tic;
    x_comp = S\b;
    endTime = toc;
    cpu = [cpu,endTime];
    
end

%i100 = 100
%T100 = 2*diag(ones(i100,1)) + -1*diag(ones(i100-1,1),1) + -1*diag(ones(i100-1,1),-1);
%S100 = kron(T100,-eye(i100)) + kron(-eye(i100),T100);
    
save -v7.3 out2.mat S cpu;

