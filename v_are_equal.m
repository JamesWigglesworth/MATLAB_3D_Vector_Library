function [ equal_state ] = v_are_equal( vector_1, vector_2, decimal_places )
%%v_are_equal(vector_1, vector_2, decimal_places)
%   Returns true if vectors are equal size and all elements are equal with the specified number of decimal_places
%   decimal_places is defaulted to 14
%   Example 1: 
%       v_are_equal([1, 2, 3], [1, 2, 3])
%       returns true
%   Example 2: 
%       v_are_equal([1, 2, 4], [1, 2, 3])
%       returns false
%   Example 2: 
%       v_are_equal([1, 2, 3], [1.000000001, 2, 3], 5)
%       returns true
%
% J. Wigglesworth 2018

try
    decimal_places;
catch
    decimal_places = 14;
end
equal_state = false;

v1_size = size(vector_1);
v2_size = size(vector_2);
if ~isequal(v1_size, v2_size)
    return
end
scale = 10^decimal_places;
v1_rounded = round(vector_1*scale)/ scale;
v2_rounded = round(vector_2*scale)/ scale;

for i = 1:v1_size(1)
    for j = 1:v1_size(2)
        if v1_rounded(i, j) ~= v2_rounded(i, j)
            return
        end
    end
end
equal_state = true;
end

