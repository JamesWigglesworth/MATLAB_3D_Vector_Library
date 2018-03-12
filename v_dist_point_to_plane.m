function [distance] = v_dist_point_to_plane(point, plane_norm, plane_point)
%%v_dist_point_to_plane()
%   Calculates the minimum distance between a point and a plane
%   This is distance is signed meaning if the point is in the direction 
%   of the plane normal it is positive if not it is negative
%   Example 1:
%       v_dist_point_to_plane([1, 2, 3], [0, 0, 1], [4, 5, 6])
%       returns 3
%   Example 2:
%       v_dist_point_to_plane([1, 2, 3], [0, 0, -1], [4, 5, 6])
%       returns -3
%
% J. Wigglesworth 2018

plane_norm = v_normalize(plane_norm);

p = dot(v_normalize(plane_norm), plane_point);
complete_plane = [plane_norm, p];
complete_point = [point 1];
distance = dot(complete_plane, complete_point) - p;
end
