function [ E, T ] = montecarlo( M,beta,R,PR )
%MONTECARLO
    T = 0;
    tic;
    n = size(M,1);
    visits = zeros(n,1);
    % for each node, simulate a run
    for r = 1:R % simulate run R times
        for i = 1:n
            visits = visits + simulaterun(M,i,beta);
        end        
    end
    PRmc = visits * (1-beta)/(n*R);
    T = toc;
    % calculate pagerank error
    E = [];
    [PRactual,idx] = sort(PRmc,1,'descend');
    Ks = [10 30 50 n];
    for k = Ks
        %top-k
        kidx = idx(1:k);
        E = [E;k sum(abs(PR(kidx) - PRactual(kidx)))/k];
    end
end

