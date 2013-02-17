function PR = poweriter( M, beta, K)
%PAGERANK
    n = size(M,1);
    
    % initialize r
    r = ones(n,1)*1/n;
    teleport = r*(1-beta); % constant teleport term
    
    % Power iteration
    for i = 1:K
       r = teleport + beta*M*r;  
    end
    PR = r;
end

