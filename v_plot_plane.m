function [] = v_plot_plane(plane_norm, plane_V, plane_point, dim, face_color, edge_color)
%% v_plot_plane(plane_norm, plane_V, plane_point, dim, face_color, edge_color)
%   This will plot a rectangular plane from the outputs of v_plane_fit
%   dim is 1x2 that determines the size of the rectangle
%   face_color and edge_color control the plane's color
%   Example 1:
%       input_points = [0, 0, 0; 1, 2, 3; 1, -2, 3]
%       [plane_norm, plane_V, plane_point] = v_plane_fit(input_points)
%       figure(1)
%       cla
%       hold on
%       v_plot_plane(plane_norm', plane_V', plane_point, [3 3])
%       plot3(input_points(:,1), input_points(:,2), input_points(:,3),'k*')
%
% J. Wigglesworth 2018

try
    face_color;
catch
    face_color = [0.7 0 0];
end
try
    edge_color;
catch
    edge_color = 'red';
end

trans_mat = v_make_pose(plane_point', [plane_V(1,:)', plane_V(2,:)', plane_norm']);
P_c = [-dim(1) -dim(2) 0 1; -dim(1) dim(2) 0 1; dim(1) dim(2) 0 1; dim(1) -dim(2) 0 1];
P_c = trans_mat*P_c';
P_c = P_c(1:3,:)';

patch('Faces', (1:4),'Vertices',P_c,'FaceColor', face_color,'EdgeColor', edge_color,'FaceAlpha',0.2);

end

