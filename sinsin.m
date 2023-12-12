% sin-sin 2D grid generator
% Ayaaz Yasin - December 2021
%
%       [X,Y] = sinsin(xlim, ylim, nx, ny, varargin)
%
% Inputs:
%       xlim ........ (2,1) vector of [xmin, xmax]
%       ylim ........ (2,1) vector of [ymin, ymax]
%       nx .......... number of grid-points in x
%       ny .......... number of grid-points in y
%       plt ......... set = 1 for plot (optional, default 0)
%
% Outputs:
%       X ........... matrix of x-points
%       Y ........... matrix of y-points

function [X,Y] = sinsin(xlim, ylim, nx, ny, varargin)
if nargin == 5; plt = varargin{1}; end
if nargin == 4; plt = 0; end            % sets plt=0, if no input is given

% for x-domain
xmin = xlim(1); xmax = xlim(2);         % limits of x-domain
xbar = linspace(-pi,pi,nx);             % generate uniform sin-function
X = (sin(xbar)+1)/2;                    % normalize
X = xmin + (xmax-xmin).*X;              % extend to desired limits

% for y-domain
ymin = ylim(1); ymax = ylim(2);         % limits of y-domain
ybar = linspace(-pi,pi,ny);             % generate uniform sin-function
Y = (sin(ybar)+1)/2;                    % normalize
Y = ymin + (ymax-ymin).*Y;              % extend to desired limits


% generate matrices
[X,Y] = meshgrid(X,Y);

% visualization
if plt == 1                             % plot only if plt==1
    figure;
    pcolor(X,Y,zeros(size(X)));
    axis equal; colormap('white');
    xlabel('x'); ylabel('y');
end

end