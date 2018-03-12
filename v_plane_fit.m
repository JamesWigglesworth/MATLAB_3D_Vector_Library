function [normal, basis, point] = v_plane_fit(points)
%% [normal, basis, point] = v_plane_fit(points)
%   Calculates a plane of best fit for a set of 3D dimensional points
%   Returns the normal of the plane, a point that lies in the plane and 
%   a possible set of xy vectors that could lie in the plane
%   Note: the normal and basis need to be transposed to work with the other functions
%   Code written by Adrien Leygue
%   Example 1:
%     input_points = [0, 0, 0; 1, 2, 3; 1, -2, 3]
%     [normal, basis, point] = v_plane_fit(input_points)
%     figure(1)
%     cla
%     hold on
%     grid on
%     set(gca, 'DataAspectRatio', [1 1 1])
%     plot3(point(1), point(2), point(3),'k*')
%     quiver3(point(1), point(2), point(3), normal(1), normal(2), normal(3), 'b')
%     quiver3(point(1), point(2), point(3), basis(1,1), basis(2,1), basis(3,1), 'r')
%     quiver3(point(1), point(2), point(3), basis(1,2), basis(2,2), basis(3,2), 'g')
%     plot3(input_points(:,1), input_points(:,2), input_points(:,3),'k*')
%     returns:
%         normal: [0.9487; 0; -0.3162]
%         basis: [0.3162, 0; 0 1; 0.9487 0]
%         point: [0.6667 0, 2]
%
% J. Wigglesworth 2018

%Computes the plane that fits best (lest square of the normal distance
%to the plane) a set of sample points.
%INPUTS:
%
%X: a N by 3 matrix where each line is a sample point
%
%OUTPUTS:
%
%n : a unit (column) vector normal to the plane
%V : a 3 by 2 matrix. The columns of V form an orthonormal basis of the
%plane
%p : a point belonging to the plane
%
%NB: this code actually works in any dimension (2,3,4,...)
%Author: Adrien Leygue
%Date: August 30 2013

%the mean of the samples belongs to the plane
point = mean(points,1);

%The samples are reduced:
R = bsxfun(@minus,points,point);
%Computation of the principal directions if the samples cloud
[basis,D] = eig(R'*R);
%Extract the output from the eigenvectors
normal = basis(:,1);
basis = basis(:,2:end);
end