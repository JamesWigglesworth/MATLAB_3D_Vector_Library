function [guess_angle] = v_signed_angle(vector_A, vector_B, plane)
%%v_signed_angle(vector_1, vector_2, plane)
%   Calculates the angle between two 3D vectors
%   If facing the front of the plane counter-clockwise is positive
%   The cross product of vector_1 and vector_2 must equal the positive or negative of the plane
%   Example 1:
%       v_singed_angle([1, 0, 0], [0, 0, 1], [0, 1, 0]) 
%       returns -90
%   Example 2:
%       v_singed_angle([1, 0, 0], [0, 0, -1], [0, 1, 0]) 
%       returns 90
%
% J. Wigglesworth 2018

cross_product = v_normalize(cross(vector_A, vector_B));
if ~(v_are_equal(cross_product, plane, 10) || v_are_equal(-cross_product, plane, 10))
    error('Error: input vectors do not lie in plane')
end

guess_angle = v_angle(vector_A, vector_B);
guess_vector = round(v_rotate(vector_A, plane, guess_angle), 3);
test_vector = round(vector_B, 3);

if ~v_are_equal(guess_vector, test_vector)
    guess_angle = -guess_angle;
end
end