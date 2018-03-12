function [d] = v_dist_point_to_line(point, line_point_A, line_point_B)
%%v_dist_point_to_line(point, line_point_A, line_point_B)
%   Calculates the minimum distance between a point and a line
%   Example 1:
%       v_dist_point_to_line([1, 0, 2], [0, 0, 0], [0, 0, 1])
%       returns 1
%
% J. Wigglesworth 2018

term1 = point - line_point_A;
term2 = point - line_point_B;
term3 = line_point_B - line_point_A;
d = v_magnitude(cross(term1, term2)) / v_magnitude(term3);
end

