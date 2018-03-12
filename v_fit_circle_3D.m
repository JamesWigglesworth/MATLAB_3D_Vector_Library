function [center_point_3D, normal, radius, plot_points_3D, points_2D, center_point_2D, plot_points_2D] = v_fit_circle_3D(points)
%%[center_point_3D, normal, radius, plot_points_3D, points_2D, center_point_2D, plot_points_2D] = v_fit_circle_3D(points)
%   Calculates the circle of best fit from XYZ data
%   This is done by first fitting a plane to the data, projecting the points onto the plane,
%   transforming the plane from 3D to 2D, then fitting a 2D circle to the 2D points
%   the returned args, center_point, normal, and radius are the essential return values
%   the other return values are mainly for plotting purposes
%   Example 1:
%   input_points = [0, 0, 0; 1, 2, 3; 1, -2, 3];
%   [center_point_3D, normal, radius, plot_points_3D, points_2D, center_point_2D, plot_points_2D] = v_fit_circle_3(input_points);
%   figure(1)
%   cla
%   hold on
%   grid on
%   set(gca, 'DataAspectRatio', [1 1 1])
%   plot3(plot_points_3D(:,1), plot_points_3D(:,2), plot_points_3D(:,3),'k-')
%   plot3(center_point_3D(1), center_point_3D(2), center_point_3D(3), 'k*')
%   plot3(input_points(:,1), input_points(:,2), input_points(:,3), 'k*')
%   quiver3(center_point_3D(1), center_point_3D(2), center_point_3D(3), normal(1), normal(2), normal(3), 'k')
%   figure(2)
%   cla
%   hold on
%   set(gca, 'DataAspectRatio', [1 1 1])
%   plot(plot_points_2D(:,1), plot_points_2D(:,2), 'k-')
%   plot(center_point_2D(1), center_point_2D(2), 'k*')
%   plot(points_2D(:,1), points_2D(:,2), 'k*')
%   returns:
%       center_point_3D: [0.7, 0, 2.1]
%       normal: [0.9487, 0, -0.3162]
%       radius: 2.2136
%
% J. Wigglesworth 2018

[normal,v,plane_origin] = v_plane_fit(points);
plane_pose = v_make_pose(plane_origin, [v normal]);
points_2D = (plane_pose\[points, ones(size(points,1),1)]')';
Par = v_fit_circle_2D(points_2D(:,1:2));
center_point_2D = [Par(1:2), 0];
radius = Par(3);
center_point_3D = (plane_pose*[center_point_2D, 1]')';

% Reformatting Results
center_point_3D(4) = [];
normal = normal';
points_2D(:,4) = [];

%% Plot Points
theta = 0:1:360;
x = radius*cosd(theta)+center_point_2D(1);
y = radius*sind(theta)+center_point_2D(2);
plot_points_2D = [x', y', zeros(length(x),1), ones(length(x), 1)];
plot_points_3D = (plane_pose*plot_points_2D')';
plot_points_3D = plot_points_3D(:, 1:3);
end

