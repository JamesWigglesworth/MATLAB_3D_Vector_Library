function [result] = v_angle(vector_1, vector_2)
%%v_angle(vector_1, vector_2)
%   Calculates the smallest angle between two 3D vectors
%   Example 1:
%       v_angle([1, 0, 0], [0, 0, 1]) 
%       returns 90
%
% J. Wigglesworth 2018

if(size(vector_1, 2) == 2)
    vector_1 = [vector_1, 0];
end
if(size(vector_2, 2) == 2)
    vector_2 = [vector_2, 0];
end

if v_are_equal(vector_1, vector_2)
    result =  0;
else if v_magnitude(vector_1 + vector_2) == 0
        result = 180;
    else
        result = atan2d(v_magnitude(cross(vector_1, vector_2)), dot(vector_1, vector_2));
    end
end
end