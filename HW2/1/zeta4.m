function [handle, cost] = zeta4(u)
% Returns the handle and cost for next 
% state for input u at state zeta4
    switch u
        case 0
            cost = 0;
            handle = str2func('zeta7');
        case 1
            cost = 5;
            handle = str2func('zeta8');
        case 2
            cost = 1;
            handle = str2func('zeta6');
    end
end