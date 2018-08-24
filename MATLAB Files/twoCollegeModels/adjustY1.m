clear all; close all;

n = 20; % number of intervals
for i = 0:n
p1e = 0.2; % College 1's ED acceptance rate
p1r = 0.1; % College 1's RD acceptance rate
y1 = i*(1/n); % College 1's RD yield

p2e = 0.25; % College 2's ED acceptance rate
p2r = 0.12; % College 2's RD acceptance rate
y2 = 0.7; % College 2's RD yield

a = 1;
r = a*p1e/(p1e+p2e); %prop. applying to College 1 ED proportional to index

% States 1-12: ED Attend 1, ED Attend 2, RD Attend 1, Attend Neither, 
% RD Attend 2, Original Group, ED Pool 1, ED Pool 2, RD Pool 1, RD Pool 2,
% RD Admitted 1, RD Admitted 2

% transition matrix
A = [1 0 0 0 0 0 p1e 0 0 0 0 0
    0 1 0 0 0 0 0 p2e 0 0 0 0
    0 0 1 0 0 0 0 0 0 0 y1 0
    0 0 0 1 0 0 0 0 1-p1r 1-p2r 1-y1 1-y2
    0 0 0 0 1 0 0 0 0 0 0 y2
    0 0 0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 r 0 0 0 0 0 0
    0 0 0 0 0 1-r 0 0 0 0 0 0
    0 0 0 0 0 0 0 1-p2e 0 0 0 0
    0 0 0 0 0 0 1-p1e 0 0 0 0 0
    0 0 0 0 0 0 0 0 p1r 0 0 0
    0 0 0 0 0 0 0 0 0 p2r 0 0];

% initial condition: all start in state 6: starting student pool
ci = [0 0 0 0 0 1 0 0 0 0 0 0]';
ciFinal = (A^4*ci)';

attend1 = ciFinal(1)+ciFinal(3); %Prop Attend 1
attend2 = ciFinal(2)+ciFinal(5); %Prop Attend 2

C1(i+1) = attend1; %avoid 0 indexing
C2(i+1) = attend2;
end

figure;
plot((0:n)/n, C1,'-ro');
hold on;
plot((0:n)/n, C2,'-g*');
xlim([0 1])
ylim([0 1])
legend('Prop Attend College 1','Prop Attend College 2');
xlabel('{Yield Rate y_{1} for College 1}');
ylabel('{Prop. of students p}');
title({'{\bf\fontsize{14} States 1-3 Prop. vs. Yield Rate y_{1} for College 1}'; 'p_{1e}=0.2, p_{1r}=0.1, p_{2e}=0.25, p_{2r}=0.12, y_{2}=0.7'},'FontWeight','Normal');

