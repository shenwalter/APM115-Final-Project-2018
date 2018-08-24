%demonstration of original Markov Model with data from Cornell University,
%school year 2017-18 (gathered from Cornell's Common Data Set)

clear all; close all;

r = 0.11; % prop applying ED
r2 = 1 - r; % prop applying RD
ped = 0.25; % College's ED acceptance rate
prd = 0.11; % College's RD acceptance rate
y = 0.43; % RD yield rate

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

% starting condition: all in final state
ci = [0 0 0 0 0 0 1]';
ciFinal = (A^3*ci)';
EDprop = ciFinal(2)/(ciFinal(2)+ciFinal(3));

disp(['States 1-7: Rejected, ED Attend, RD Attend, ED pool, RD pool, RD Admit, original pool']);
disp(['Proportion of states 1-7: ']);
disp(num2str(ciFinal));
disp(['Proportion of original group getting rejected: ' num2str(ciFinal(1))]);
disp(['Proportion of original group attending via ED: ' num2str(ciFinal(2))]);
disp(['Proportion of original group attending via RD: ' num2str(ciFinal(3))]);
disp(['Proportion of attending getting in via ED: ' num2str(EDprop)]);