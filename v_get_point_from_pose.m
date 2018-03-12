function [ point ] = v_get_point_from_pose( pose )
%%v_get_point_from_pose(pose)
%   Pulls the point from the pose
%   Example 1:
%       v_get_point_from_pose([1, 0, 0, 1; 0, 1, 0, 2; 0, 0, 1, 3; 0, 0, 0, 1])
%       returns: [1, 2, 3]
%
% J. Wigglesworth 2018
    
point = pose(1:3, 4)';
end

