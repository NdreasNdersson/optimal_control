% Clean up the workspace and command window
clearvars
clc
format compact
% Iterate with every state as init to find the minimum
% cost from each and every state.
for i = 1:8
    % Initialize some variables and vectors
    alpha = 0.9;
    V = ones(1, 8)*999;
    V(i) = 0;
    P = cell(1,8);
    u_opt = cell(1,8);
    % Iterate through every state
    for state_index = i:8
        % Store current state handle
        curr_pos = index2handle(state_index);
        % Try all input signals
        for u = 0:2
            % Get the handle and cost to next state
            [handle, cost] = curr_pos(u);
            index = handle2index(handle);
            % Add current cost and previous opt. cost
            k = length(u_opt{state_index});
            cost = cost * alpha^k + V(state_index);
            % If the cost is lower than earlier paths, add it,
            % or if it equal to earlier paths and no control
            % signal is saved (for example init state has self loop)
            if cost < V(index) ||...
                    (cost == V(index) && isempty(u_opt{index}))
                % Store cost
                V(index) = cost;
                % Store prev. state
                P{index} = curr_pos;
                % Store opt. input signal seq.
                u_opt{index} = [u_opt{state_index}, u];
            end
        end
    end
    % Print out current value function
    disp(['########## ', 'V(', func2str(index2handle(i)), ')', ' ##########'])
    % Print out opt. feedback
    u_opt = u_opt{8};
    u_opt = u_opt(1)
    % Print out the restult of the value function
    V = V(8)
end