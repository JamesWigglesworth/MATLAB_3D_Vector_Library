function [ result ] = v_dist_point_to_point(point_1, point_2)
%% v_dist_point_to_point(point_1, point_2)
%   Calculates the distance between two points
%   Example 1:
%       v_distance_point_to_point([1, 2, 3], [4, 6, 15])
%       returns 13 
%
% J. Wigglesworth 2018

result = v_magnitude(point_1-point_2);
end

