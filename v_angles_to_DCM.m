function [ DCM ] = v_angles_to_DCM( angles, sequence )
%%v_angles_to_DCM(angles, sequence)
%   Converts three euler angles to a direct cosine matrix
%   The sequence variable is a string that dictates the order of rotations
%   where X means rotation about the original X axis
%   and X' means rotation about the transformed X axis
%   sequence is defaulted to 'ZY''Z'' only because it's the sequence my robotic arm used.
%   Example 1:
%       v_angles_to_DCM([30, 0, 0], 'XYZ')
%       returns [1,     0,     0;
%                0, 0.707, 0.707;
%                0, -0.707, 0.707]
%
% J. Wigglesworth 2018

try
    sequence;
catch
    %The default is the sequence used for my Stabli robot: ZY'Z'
    sequence = ['Z', 'Y''', 'Z'''];
end

DCM = eye(3);
for i = 1:3
    DCM = v_rotate_DCM(DCM, sequence(i), angles(i));
end
DCM = DCM';
end

