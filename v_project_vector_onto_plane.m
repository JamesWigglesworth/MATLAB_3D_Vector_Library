function [new_vector] = v_project_vector_onto_plane(vectors, plane_norm)
%% v_project_vector_onto_plane(vectors, plane)
%   projects the vector onto the plane
%   multiple vectors can be passed in
%   Example 1:
%       v_project_vector_onto_plane([1, 1, 0], [1, 0, 0])
%       returns: [0, 1, 0]
%
% J. Wigglesworth 2018

num = size(vectors,1);
new_vector = zeros(num, 3);
for i = 1:num
    vector = vectors(i,:);
    term1 = dot(vector, plane_norm);
    term2 = v_magnitude(plane_norm)^2;
    new_vector(i,:) = vector - term1/term2 * plane_norm;
end
end