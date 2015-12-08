function [handle, cost] = zeta6(u)
% Returns the handle and cost for next 
% state for input u at state zeta6
    switch u
        case 0
            cost = 1;
            handle = str2func('zeta1');
        case 1
            cost = 1;
            handle = str2func('zeta7');
        case 2
            cost = 2;
            handle = str2func('zeta8');
    end
end