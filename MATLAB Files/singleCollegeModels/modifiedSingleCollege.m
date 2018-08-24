%demonstration of modified Markov Model (with p1 being proportional to ped-prd)

clear all; close all;

ped = 0.4; % College's ED acceptance rate
prd = 0.3; % College's RD acceptance rate
y = 0.35; % RD yield rate

a = 1;
r = a*(ped-prd); % we make proportion of ppl applying ED proportional to difference in ped and prd
r2 = 1-r;

% States 1-7: Not Attend, ED Attend, RD Attend, ED pool, RD pool, RD Admit,
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
EDprop = ciFinal(2)/(ciFinal(2)+ciFinal(3));

disp(['States 1-7: Not Attend, ED Attend, RD Attend, ED pool, RD pool, RD Admit, original pool']);
disp(['Proportion of states 1-7: ']);
disp(num2str(ciFinal));
disp(['Proportion of original group getting rejected: ' num2str(ciFinal(1))]);
disp(['Proportion of original group attending via ED: ' num2str(ciFinal(2))]);
disp(['Proportion of original group attending via RD: ' num2str(ciFinal(3))]);
disp(['Proportion of attending getting in via ED: ' num2str(EDprop)]);
