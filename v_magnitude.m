function [ result ] = v_magnitude(vector)
%% v_magnitude(vector)
%   Calculates the magnitude of a vector
%   Example 1:
%       v_magnitude([3, 4, 12])
%       returns: 13
%
% J. Wigglesworth 2018

sum = 0;
for i = 1:length(vector)
    sum = sum + vector(i) * vector(i);
end
result = sqrt(sum);
end

