clear all; close all; clc;

n = [1:1:20];

cond_num = zeros(1,size(n,2));
err = zeros(1,size(k,2));
residual = zeros(1,size(k,2));
err_est = zeros(1,size(n,2));

i=1;

for elm = n
    
    x_exact = rand(elm,1);
    z=linspace(0,1,z);
    A = vander(z);
    b = A*x_exact;

    x_comp = A\b;
    
    cond_num(i) = cond(A);
    e = x_exact - x_comp;
    err(i) = norm(e);
    res = b - A*x_comp;
    residual(i) = norm(res);
    err_est(i) = (cond_num(i)*residual(i)*norm(x_exact)/(norm(b));
   
    i = i+1;
    
end

save out.mat n cond_num err residuali err_est;

