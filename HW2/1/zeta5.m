function [handle, cost] = zeta5(u)
% Returns the handle and cost for next 
% state for input u at state zeta5
    switch u
        case 0
            cost = 3;
            handle = str2func('zeta4');
        case 1
            cost = 3;
            handle = str2func('zeta4');
        case 2
            cost = 2;
            handle = str2func('zeta6');   
    end
end