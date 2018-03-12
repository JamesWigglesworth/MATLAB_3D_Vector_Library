function [] = v_plot_pose(pose, vector_size)
%% v_plot_pose(pose, vector_size)
%   plots a 3D pose onto the current figure
%   the lengths of the pose's vectors are set with vector_size
%   pose defaults to be on the origin aligned with the major axes (aka an identiy matrix)
%   vector_size defaults to 1
%   no return value
%   X axis = red
%   Y axis = green
%   Z axis = blue
%   hold must be set to 'on' for the figure
%   Example 1:
%       figure(1)
%       cla
%       hold on
%       grid on
%       set(gca, 'DataAspectRatio', [1 1 1])
%       v_plot_pose()
%       v_plot_pose(v_make_pose([1, 2, 3], [0, 0, 30]), 2)
%
% J. Wigglesworth 2018

try
    pose;
catch
    pose = v_make_pose();
end
try
    vector_size;
catch
    vector_size = 1;
end

x_vector = vector_size*pose(1:3, 1)';
y_vector = vector_size*pose(1:3, 2)';
z_vector = vector_size*pose(1:3, 3)';
origin = pose(1:3, 4)';

head_size = vector_size * 2;

pp = [origin, x_vector];
quiver3(pp(1), pp(2), pp(3), pp(4), pp(5), pp(6), 'r', 'MaxHeadSize', head_size)
pp = [origin, y_vector];
quiver3(pp(1), pp(2), pp(3), pp(4), pp(5), pp(6), 'g', 'MaxHeadSize', head_size)
pp = [origin, z_vector];
quiver3(pp(1), pp(2), pp(3), pp(4), pp(5), pp(6), 'b', 'MaxHeadSize', head_size)
plot3(origin(1), origin(2), origin(3), 'k.')

end

