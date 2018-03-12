function [ uL1, uL2, alpha, beta ] = v_closest_points_between_two_lines( u1, v1, u2, v2)
%%[uL1, uL2, alpha, beta] = v_closest_points_between_two_lines( u1, v1, u2, v2)
%   Finds the two points that lie on the lines that are the closest to eachother.
%   If the lines intersect then the two points will be equal.
%   This is useful when there are two 3D lines that are supposed to intersect but may have some error
%   Example 1:
%       [uL2, uR2, alpha, beta] = v_closest_points_between_two_lines([0, 0, 0], [1, 0, 0], [1, 2, 3], [0, 1, 0])
%       uL2: [1, 0, 0]
%       uR2: [1, 0, 3]
%       alpha: 1
%       beta: -2
%
% J. Wigglesworth 2018

A1 = -v1(1)^2-v1(2)^2-v1(3)^2;
B1 = v2(1)*v1(1)+v2(2)*v1(2)+v2(3)*v1(3);
C1 = u2(1)*v1(1)+u2(2)*v1(2)+u2(3)*v1(3);
D1 = -u1(1)*v1(1)-u1(2)*v1(2)-u1(3)*v1(3);

A2 = -v1(1)*v2(1)-v1(2)*v2(2)-v1(3)*v2(3);
B2 = v2(1)^2+v2(2)^2+v2(3)^2;
C2 = u2(1)*v2(1)+u2(2)*v2(2)+u2(3)*v2(3);
D2 = -u1(1)*v2(1)-u1(2)*v2(2)-u1(3)*v2(3);

A = [A1 B1; A2 B2];
b = [-C1-D1; -C2-D2];
res = A\b;
alpha = res(1);
beta = res(2);

uL1 = u1 + alpha * v1;
uL2 = u2 + beta * v2;
end