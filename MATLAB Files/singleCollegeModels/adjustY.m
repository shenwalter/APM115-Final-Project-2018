clear all; close all;

n = 20; % number of intervals
for i = 0:n
ped = 0.4; % College's ED acceptance rate
prd = 0.3; % College's RD acceptance rate
y = i*(1/n); % RD yield rate

a = 1;
r = a*(ped-prd); % we make proportion of ppl applying ED proportional to difference in ped and prd
r2 = 1-r;

% States 1-7: Rejected, ED Attend, RD Attend, ED pool, RD pool, RD Admit,
% original pool

% transition matrix
A=[1 0 0 1-ped 1-prd 1-y 0
   0 1 0 ped 0 0 0 
   0 0 1 0 0 y 0
   0 0 0 0 0 0 r
   0 0 0 0 0 0 r2
   0 0 0 0 prd 0 0
   0 0 0 0 0 0 0];

% starting condition: all in state final state
ci = [0 0 0 0 0 0 1]';
ciFinal = (A^3*ci)';

C1(i+1) = ciFinal(1); %avoid 0 indexing
C2(i+1) = ciFinal(2);
Cn(i+1) = ciFinal(3);
end

figure;
plot((0:n)/n, C1,'-ro');
hold on;
plot((0:n)/n, C2,'-g*');
hold on;
plot((0:n)/n, Cn,'-b.');
xlim([0 1])
ylim([0 1])
legend('Not Attend','ED Attend','RD Attend');
xlabel('{Yield Rate y}');
ylabel('{Prop. of students p}');
title({'{\bf\fontsize{14} States 1-3 Prop. vs. Yield Rate y}'; 'p_{ed}=0.4, p_{rd}=0.3'},'FontWeight','Normal');