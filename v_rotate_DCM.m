function [ new_DCM ] = v_rotate_DCM( DCM, rot_axis, theta)
%% v_rotate_DCM( DCM, rot_axis, theta)
%   Rotates a DCM about rot_axis by angle in degrees, theta
%   rot_axis can be a vector or the following strings: 'X', 'Y', 'Z', 'X''', 'Y''', 'Z'''
%   'X' specifies rotation about the global X axis
%   'X''' specifies rotation about the DCM's X axis
%   Example 1:
%       v_rotate_DCM( eye(3), 'Z', 45)
%       returns: [0.707, -0.707, 0; 0.707, 0.707, 0; 0, 0, 1]
%
% J. Wigglesworth 2018

trans_matrix = eye(3);
try
    switch(rot_axis)
        % If character is used for rotation plane
        case 'X'
            trans_matrix(2,2) = cosd(theta);
            trans_matrix(3,3) = cosd(theta);
            trans_matrix(3,2) = sind(theta);
            trans_matrix(2,3) = -sind(theta);
        case 'Y'
            trans_matrix(1,1) = cosd(theta);
            trans_matrix(3,3) = cosd(theta);
            trans_matrix(1,3) = sind(theta);
            trans_matrix(3,1) = -sind(theta);
        case 'Z'
            trans_matrix(1,1) = cosd(theta);
            trans_matrix(2,2) = cosd(theta);
            trans_matrix(2,1) = sind(theta);
            trans_matrix(1,2) = -sind(theta);
        case 'X'''
            x_vector = [DCM(1,1), DCM(2,1), DCM(3,1)];
            DCM = v_rotate_DCM(DCM, x_vector, theta);
        case 'Y'''
            y_vector = [DCM(1,2), DCM(2,2), DCM(3,2)];
            DCM = v_rotate_DCM(DCM, y_vector, theta);
        case 'Z'''
            z_vector = [DCM(1,3), DCM(2,3), DCM(3,3)];
            DCM = v_rotate_DCM(DCM, z_vector, theta);
        otherwise
            % It will error before it gets here
    end
catch
    % If vector is used for rotation plane
    x_vector = [DCM(1,1), DCM(2,1), DCM(3,1)];
    y_vector = [DCM(1,2), DCM(2,2), DCM(3,2)];
    z_vector = [DCM(1,3), DCM(2,3), DCM(3,3)];
    
    x_vector = v_rotate(x_vector, rot_axis, theta);
    y_vector = v_rotate(y_vector, rot_axis, theta);
    z_vector = v_rotate(z_vector, rot_axis, theta);
    new_DCM = [x_vector; y_vector; z_vector]';
    return
end

new_DCM = DCM * trans_matrix;
end

