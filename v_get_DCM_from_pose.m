function [ DCM ] = v_get_DCM_from_pose(pose)
%%v_get_DCM_from_pose(pose)
%   Pulls the 3x3 matrix, representing the direct cosine matrix, from the pose
%   Example 1:
%       v_get_DCM_from_pose([1, 0, 0, 1; 0, 1, 0, 2; 0, 0, 1, 3; 0, 0, 0, 1])
%       returns: [1, 0, 0; 0, 1, 0; 0, 0, 1]
%
% J. Wigglesworth 2018

DCM = pose(1:3, 1:3);
end

