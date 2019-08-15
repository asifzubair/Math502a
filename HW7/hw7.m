clear all; close all; clc;

k = [2:1:4];
tol = 1e-6;

I1 = zeros(1,size(k,2));
I2 = zeros(1,size(k,2));
I3 = zeros(1,size(k,2));

cpu1 = zeros(1,size(k,2));
cpu2 = zeros(1,size(k,2));
cpu3 = zeros(1,size(k,2));


i=1;

for elm = k
    
    N = 10^elm
    b = rand(N,1);
    
    % Define A as diagonal matrix differently
    
    % Case 1
    
    A = [1:1:N];
    A = A / N;
    A = diag(A);
    
    tic;
    [X,F,R,I]=pcg(A,b,tol,10000,eye(N));
    endTime = toc;
    
    I1(i) = I
    cpu1(i) = endTime
    
    % Case 2 
    
    A = [1:1:N];
    A = 1 ./ A;
    A = diag(A);
    
    tic;
    [X,F,R,I]=pcg(A,b,tol,10000,eye(N));
    endTime = toc;
    
    I2(i)=I
    cpu2(i) = endTime
    
    % Case 3
    
    A = [1:1:N];
    A = 1 ./ A;
    A = (1 + 1/N) - A; 
    A = diag(A);
    
    tic;
    [X,F,R,I]=pcg(A,b,tol,10000,eye(N));
    endTime = toc;
    
    I3(i)=I
    cpu3(i) = endTime
    
    i = i+1;
end

save out.mat I1 I2 I3 cpu1 cpu2 cpu3;
