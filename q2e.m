G = load('graph.txt');
len = size(G,1);


% First calculate out-degrees
deg = zeros(100,1);
% convert graph to matrix
M = zeros(100,100);


for i = 1:len
    source = G(i,1);
    target = G(i,2);
    deg(source,1) = deg(source,1)+1;
    M(target,source) = M(target,source)+1;
end


for source = 1:100
    M(:,source) = M(:,source)/deg(source,1);
end


% Now that M has been loaded, run the two algorithms
% power iteration

K = 40; 
beta = 0.8;
tic;
PR = poweriter(M,beta,K);
pwr_T = toc;
n = size(M,1);

% monte carlo
R = [1 3 5];
T = [];
errors = [];
for r = R
    [E,t] = montecarlo(M,beta,r,PR);
    E = [ones(4,1)*r,E];
    errors=[errors;E];
    T = [T;r t];
end
save('results_q2.mat','pwr_T','T','E');
