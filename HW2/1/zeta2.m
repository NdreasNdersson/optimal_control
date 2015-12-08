function [handle, cost] = zeta2(u)
% Returns the handle and cost for next 
% state for input u at state zeta2
    switch u
        case 0
            cost = 9;
            handle = str2func('zeta7');
        case 1
            cost = 1;
            handle = str2func('zeta5');
        case 2
            cost = 4;
            handle = str2func('zeta4');
    end
end