function [result] = v_rotate(vectors, plane, theta)
%% v_rotate(vectors, plane, theta)
%   Rotates a vector about the axis, rot_axis, by an angle in degrees, theta
%   An array of vectors of length n can also be passed in
%   Example 1:
%       v_rotate([1, 0, 0], [0, 0, 1], 45)
%       returns: [0.7071, 0.7071, 0]
%
% J. Wigglesworth 2018

plane =  v_normalize(plane);
n_vectors = size(vectors, 1);
result = zeros(n_vectors, 3);
for i = 1:n_vectors
    short_vector = vectors(i, :);
    if v_are_equal(v_normalize(short_vector), plane, 14)
        result(i,:) = short_vector;
    else
        term_1 = cosd(theta).*short_vector;
        term_2 = sind(theta) .* cross(plane(1:3), short_vector);
        result(i,:) = v_magnitude(short_vector).*v_normalize(term_1+term_2);
    end
end
end