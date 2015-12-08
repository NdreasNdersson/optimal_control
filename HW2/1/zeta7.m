function [handle, cost] = zeta7(u)
% Returns the handle and cost for next 
% state for input u at state zeta7
    switch u
        case 0
            cost = 1.5;
            handle = str2func('zeta8');
        case 1
            cost = 1.5;
            handle = str2func('zeta8');
        case 2
            cost = 1.5;
            handle = str2func('zeta8');
    end
end