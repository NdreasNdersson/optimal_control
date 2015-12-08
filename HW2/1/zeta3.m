function [handle, cost] = zeta3(u)
% Returns the handle and cost for next 
% state for input u at state zeta3
    switch u
        case 0
            cost = 1.5;
            handle = str2func('zeta4');
        case 1
            cost = 1.5;
            handle = str2func('zeta6');
        case 2
            cost = 4;
            handle = str2func('zeta5');
    end
end