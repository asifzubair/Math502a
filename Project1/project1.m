clear all; close all; clc;

k = [20:0.5:40];
d =1.3;
n = d.^k;
nceil = ceil(n);

cpu = zeros(1,size(k,2));
cond_num = zeros(1,size(k,2));
err = zeros(1,size(k,2));
residual = zeros(1,size(k,2));

i=1;

for elm = nceil
    
    x_exact = rand(elm,1);
    A = rand(elm);
    b = A*x_exact;

    tic;
    x_comp = A\b;
    endTime = toc;
    cpu(i) = endTime;
    
    cond_num(i) = cond(A);
    e = x_exact - x_comp;
    err(i) = e'*e;
    res = b - A*x_comp;
    residual(i) = res'*res;
   
    i = i+1;
    
end

save out.mat nceil cpu cond_num err residual;

