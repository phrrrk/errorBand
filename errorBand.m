function [ xPart, yPart ] = errorBand( xVec, yVec, errorVec, varargin )
%ERRORBAND Creates a plot of yVec over xVec with errorbands errorVec
%   Detailed explanation goes here

stepWidthInterp = 10;
lengthX = length( xVec );
lengthY = length( yVec );

myLinewidth = 3;
myColorMean = [0, 0, 0];
myColorError = [0.6, 0.6, 0.6];
myAlpha = 0.3;
myMethod = 'linear';

if nargin == 4
  myLinewidth = varargin{1};
elseif nargin == 5
  myLinewidth = varargin{1};
  myColorMean = varargin{2};
elseif nargin == 6
  myLinewidth = varargin{1};
  myColorMean = varargin{2};
  myColorError = varargin{3};
elseif nargin == 7
  myLinewidth = varargin{1};
  myColorMean = varargin{2};
  myColorError = varargin{3};
  myAlpha = varargin{4};
elseif nargin == 8
  myLinewidth = varargin{1};
  myColorMean = varargin{2};
  myColorError = varargin{3};
  myAlpha = varargin{4};
  myMethod = varargin{5};
else
  % error
end

xVecInterp = linspace( 1, lengthX, lengthX * stepWidthInterp );
yVecInterp = interp1( 1:lengthY, yVec, xVecInterp );

upperLimit = interp1( 1:length( errorVec ), yVec + errorVec, xVecInterp, myMethod );
lowerLimit = interp1( 1:length( errorVec ), yVec - errorVec, xVecInterp, myMethod );



xPart = [xVecInterp, xVecInterp(end:-1:1), xVecInterp(1)];
yPart = [upperLimit, lowerLimit(end:-1:1), upperLimit(1)];

hold on
patch( xPart, yPart, myColorError, 'Edgecolor', 'none' )
plot( xVecInterp, yVecInterp, 'Color', myColorMean, 'Linewidth', myLinewidth )
alpha(myAlpha)
axis tight

end

