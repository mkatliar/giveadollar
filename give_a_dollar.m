function N = give_a_dollar(n0, m)
    assert(isvector(n0));
    
    N = zeros(numel(n0), m);
    N(:, 1) = n0;
    
    for i = 2 : m
        N(:, i) = redistribute(N(:, i - 1));
    end
end

function n = redistribute(n)
    from = find(n > 0);
    to = give_to(from, numel(n));
    n(from) = n(from) - 1;
    
    for i = to(:)'
        n(i) = n(i) + 1;
    end
end

function to = give_to(from, count)
    to = mod(from + randi(count - 1, size(from)) - 1, count) + 1;
    assert(all(to ~= from));
end