function cmap=red_blue_colormap(varargin);
% creates red vs blue colormap, 
%with optoional variable amount of white in between
if nargin==0
    gstd=1;
else
    gstd=varargin{1};
end

N=500;
x=linspace(0,1,N);
g=normpdf(x-.5,0,gstd);
g=g-g(1);
g=g./max(g);

r=(x<.5).*(g); r(end/2:end)=1;
b=fliplr(r);

cmap = [r; g; b]';