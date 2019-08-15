%% Preconditoning the conjugate gradient matrix

load out.mat;

% Incomplete Cholesky

M_ic = ichol(A);

% Modifified Incomplete Cholesky using options

alpha = max(sum(abs(A),2)./diag(A))-2;
opts.michol='on'; opts.diagcomp=alpha;

M_mic = ichol(A,opts);

% Incomplete LU

M_ilu = ilu(A);

% Jacobi Preconditioner

M_j = diag(A);

% Define b

b = zeros(n,1); b(1) = 1;

% Do CG mthod, with and without preconditioner

tol = 1e-10; maxit = 2000;

[x0,f0,rr0,i0,rv0] = pcg(A,b,tol,maxit);

[x1,f1,rr1,i1,rv1] = pcg(A,b,tol,maxit,M_ic,M_ic');

[x2,f2,rr2,i2,rv2] = pcg(A,b,tol,maxit,M_mic,M_mic');

[x3,f3,rr3,i3,rv3] = pcg(A,b,tol,maxit,M_ilu,M_ilu');

[x4,f4,rr4,i4,rv4] = pcg(A,b,tol,maxit,M_j);

save precg.mat x0 f0 rr0 i0 rv0 x1 f1 rr1 i1 rv1 x2 f2 rr2 i2 rv2 x3 f3 rr3 i3 rv3 x4 f4 rr4 i4 rv4;
