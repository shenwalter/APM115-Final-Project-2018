clear all; close all;

p1e = 0.2; % College 1's ED acceptance rate
p1r = 0.1; % College 1's RD acceptance rate
y1 = 0.8; % College 1's RD yield

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

disp(['States 1-12: States 1-12: ED Attend 1, ED Attend 2, RD Attend 1, Attend Neither,']);
disp(['RD Attend 2, Original Group, ED Pool 1, ED Pool 2, RD Pool 1, RD Pool 2,']);
disp(['RD Admitted 1, RD Admitted 2']);
disp(['Proportion of states 1-14: ']);
disp(num2str(ciFinal));

disp(['Prop ED Attend 1: ' num2str(ciFinal(1))]);
disp(['Prop ED Attend 2: ' num2str(ciFinal(2))]);
disp(['Prop RD Attend 1: ' num2str(ciFinal(3))]);
disp(['Prop RD Attend 2: ' num2str(ciFinal(5))]);
disp(['Attend Neither: ' num2str(ciFinal(4))]); % out of order

attend1 = ciFinal(1)+ciFinal(3);%Prop Attend 1
attend2 = ciFinal(2)+ciFinal(5);%Prop Attend 2
disp(['Prop Attend 1: ' num2str(attend1)]);
disp(['Prop Attend 2: ' num2str(attend2)]);
