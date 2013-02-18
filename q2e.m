G = load('graph.txt');
len = size(G,1);


% First calculate out-degrees
deg = zeros(100);

for i = 1:len
    deg(G(i,1)) = deg(G(i,1))+1;
end

% convert graph to matrix
M = zeros(100,100);


for i = 1:len
    source = G(i,1);
    target = G(i,2);
    m_ji = 0;
    if deg(source) > 0
        m_ji = 1/deg(source);
    end
    M(target,source) = m_ji;
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
for r = R
    [E,t] = montecarlo(M,beta,r,PR);
    T = [T;r t];
end
save('results_q2.mat','pwr_T','T','E');
