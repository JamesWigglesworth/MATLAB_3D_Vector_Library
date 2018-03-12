function [ pose ] = v_make_pose( position, orientation, sequence)
%% v_make_pose(position, orientation, sequence)
%   Generates a pose which is a 4x4 matrix with the form [R, P; 0, 1]
%   Where R is a 3x3 orientation rotation matrix
%   P is a 3x1 position vector
%   Both arguments can be defaulted
%   position defaults to [0, 0, 0]
%   orientation defaults to a 3x3 identity matrix
%   orientation can also be in the form of 3 euler angles using the sequence argument
%   Example 1:
%       v_make_pose()
%       returns: [1, 0, 0, 0; 0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 1]
%   Example 2:
%       v_make_pose([1, 2, 3])
%       returns: [1, 0, 0, 1; 0, 1, 0, 2; 0, 0, 1, 3; 0, 0, 0, 1]
%   Example 3:
%       v_make_pose([1, 2, 3], [90, 0, 0])
%       returns: [1, 0, 0, 1; 0, 0, 1, 2; 0, -1, 0, 3; 0, 0, 0, 1]
%   Example 4:
%       v_make_pose([1, 2, 3], [1, 0, 0; 0, 0, 1; 0, -1, 0])
%       returns: [1, 0, 0, 1; 0, 0, 1, 2; 0, -1, 0, 3; 0, 0, 0, 1]
%
% J. Wigglesworth 2018

pose = eye(4);
try
    position;
catch
    position = [0 0 0]; % Defaults to the origin
end
try
    orientation;
catch
    orientation = eye(3); % Defaults to align with coordinate system
end
try
    sequence;
catch
    sequence = 'XYZ';
end

orientation_size = size(orientation);
if (orientation_size(1) == 3 && orientation_size(2) == 3)
    pose(1:3, 1:3) = orientation;
else
    if (orientation_size(1) == 1 && orientation_size(2) == 3)
        pose(1:3, 1:3) = v_angles_to_DCM(orientation, sequence);
    else
        error('orientaion is not formatted correctly')
    end
end

pose(1:3, 4) = position';
end