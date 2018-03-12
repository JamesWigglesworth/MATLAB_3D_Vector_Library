function [d, point] = v_plane_line_intersection(plane_norm, plane_point, line_norm, line_point)
%% [d, point] = v_plane_line_intersection(plane_norm, plane_point, line_norm, line_point)
%   Finds the point where the line and plane intersect
%   Returns the distance along the line and the point of intersection
%   Example 1:
%       [d, point] = v_plane_line_intersection([0, 0, 1], [0, 0, 5], [0, 0, 1], [1, 2, 3])
%       Results:
%           d: 2
%           point: [1, 2, 5]
%
% J. Wigglesworth 2018

d = dot((plane_point-line_point), plane_norm)/(dot(line_norm, plane_norm));
point = d*line_norm+line_point;
end