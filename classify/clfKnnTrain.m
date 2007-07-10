% Train a k nearest neighbor classifier (memorization).
%
% USAGE
%  clf = clfKnnTrain( clf, X, Y )
%
% INPUTS
%  clf     - model to be trained
%  X       - nxp data array
%  Y       - nx1 array of labels
%
% OUTPUTS
%  clf     - a trained k-nearest neighbor classifier.
%
% EXAMPLE
%
% See also CLFKNN, CLFKNNFWD

% Piotr's Image&Video Toolbox      Version NEW
% Written and maintained by Piotr Dollar    pdollar-at-cs.ucsd.edu
% Please email me if you find bugs, or have suggestions or questions!

function clf = clfKnnTrain( clf, X, Y )

if( ~strcmp(clf.type,'knn')); error( ['incorrect type: ' clf.type] ); end;
if( size(X,2)~= clf.p ); error( 'Incorrect data dimension' ); end;

%%% error check
n=size(X,1);  Y=double(Y);
[Y,er] = checkNumArgs( Y, [n 1], 0, 0 ); error(er);

%%% training is memorization
clf.Xtrain = X;
clf.Ytrain = Y;