function visits = simulaterun( M,start,beta )
%SIMULATERUN
    n = size(M,1);
    visits = zeros(n,1);
    current = start;
    while current > 0
        visits(current) = visits(current) + 1;
        % toss a coin
        if rand() < (1-beta)  % end
            break
        end
        % get new node to move to
        nextnodes = M(:,current);
        nextnodes = find(nextnodes > 0); % find candidates
        current = nextnodes(ceil(length(nextnodes)*rand()));
    end
end

