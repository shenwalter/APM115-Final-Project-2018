clear all;close all;
%optimize college

s = 0.3; %prop applying ED 
sigma_y = 0.03; %standard deviation of yield
y_null = 0.5; %avg yield
k = 0.01; %want standard dev of enrollment prop =< k
N = 0.2; %want avg enrollment prop = N

f = [1 -1]; %difference between ED and RD rates
x0 = [0.01,0.01];
A = [0 (1-s)*sigma_y; -1 1]; %sd. condition
b=[k 0]; 
Aeq = [s,(1-s)*y_null]; % avg. has to stay constant
beq = N;
lb = [0,0]; %max/min of rates
ub = [1,1];
x = linprog(f,A,b,Aeq,beq,lb,ub)

(1-s)*sigma_y*x(1) %less than k?
s*x(1)+(1-s)*y_null*x(2) %equal to N?