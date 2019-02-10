%GETNEXTCLIQUES Find a pair of cliques ready for message passing
%   [i, j] = GETNEXTCLIQUES(P, messages) finds ready cliques in a given
%   clique tree, P, and a matrix of current messages. Returns indices i and j
%   such that clique i is ready to transmit a message to clique j.
%
%   We are doing clique tree message passing, so
%   do not return (i,j) if clique i has already passed a message to clique j.
%
%	 messages is a n x n matrix of passed messages, where messages(i,j)
% 	 represents the message going from clique i to clique j. 
%   This matrix is initialized in CliqueTreeCalibrate as such:
%      MESSAGES = repmat(struct('var', [], 'card', [], 'val', []), N, N);
%
%   If more than one message is ready to be transmitted, return 
%   the pair (i,j) that is numerically smallest. If you use an outer
%   for loop over i and an inner for loop over j, breaking when you find a 
%   ready pair of cliques, you will get the right answer.
%
%   If no such cliques exist, returns i = j = 0.
%
%   See also CLIQUETREECALIBRATE
%
% Copyright (C) Daphne Koller, Stanford University, 2012

% P = GetNextC.INPUT1;
%messages = GetNextC.INPUT2;
function [i, j] = GetNextCliques(P, messages)

% initialization
% you should set them to the correct values in your code

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for i = 1:length(messages)
    for j = 1:length(messages)
        if P.edges(i,j) == 1
            if isempty(messages(i,j).var)
                flag = 0;
                edges = P.edges(i,:);
                for r = 1:length(edges)
                    if edges(r) == 1 && r ~= j
                        if isempty(messages(r, i).var)
                            flag = 1;
                        end
                    end
                end
                if flag == 0
                    return;
                end
            end
        end
    end
end

i = 0;
j = 0;

return;
