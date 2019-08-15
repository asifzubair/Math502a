clear all; close all; clc;

k = [10:0.5:40];
d =1.3;
n = d.^k;
nceil = ceil(n);

inner = zeros(1,size(k,2));
mV = zeros(1,size(k,2));
MM = zeros(1,size(k,2));

i=1;

for elm = nceil
    
    x = rand(elm,1);
    y = rand(elm,1);
    A = magic(elm);
    B = magic(elm);
    
    tic;
    x'*y;
    endTime = toc;
    inner(i)=endTime;
    
    tic;
    A*x;
    endTime = toc;
    mV(i) = endTime;
    
    tic;
    A*B;
    endTime = toc;
    MM(i) = endTime;
   
    i = i+1;
    
end

save out.mat nceil inner mV MM;

