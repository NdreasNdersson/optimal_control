function [handle, cost] = zeta1(u)
% Returns the handle and cost for next 
% state for input u at state zeta1
    switch u
        case 0
            cost = 1;
            handle = str2func('zeta2');
        case 1
            cost = 1;
            handle = str2func('zeta2');
        case 2
            cost = 2;
            handle = str2func('zeta3');
    end
end