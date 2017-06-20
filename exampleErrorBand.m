% example for errorBand

nDataPoints = 100;
nDataSets   = 30;
myX = linspace( 0, 10, nDataPoints );
myY = zeros( nDataSets, nDataPoints );
for i = 1 : nDataSets
  myY(i,:) = (sin( myX.^2 )./(randn(1,1)*0.2+2) + sin( myX.*(randn(1,1)*0.1+0.5) ).^2) + randn(1,nDataPoints)*0.2+1;
end

myMean = mean( myY );
mySD   = std( myY );

figure
errorBand( myX, myMean, mySD );

figure
errorBand( myX, myMean, mySD, 2 );

figure
errorBand( myX, myMean, mySD, 2, [0,0,1] );

figure
errorBand( myX, myMean, mySD, 2, [0,0,1], [1,0,0] );

figure
errorBand( myX, myMean, mySD, 2, [0,0,1], [1,0,0], 0.5 );

figure
errorBand( myX, myMean, mySD, 2, [0,0,1], [1,0,0], 0.5, 'spline' );
