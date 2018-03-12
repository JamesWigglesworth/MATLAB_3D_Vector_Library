function [result] = v_normalize(vector)
%% v_normalize(vector)
%   returns a vector in the same direction but with a magnitude of 1
%   Example 1:
%       v_normalize([1, 1, 0])
%       returns: [0.7071, 0.7071, 0]
%
% J. Wigglesworth 2018

result = vector ./ v_magnitude(vector);
end