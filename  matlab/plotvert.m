function n=plotvert(x,fstr,c,varargin)
%  x:   position
% fstr: format string ('--' or '-', etc)
% c: either [r g b]:  color or [g] brightness
% plots a vertical grey line across the entire ylim distance
%
assert(strcmp(class(fstr),'char'),'fstr has to be a char pls');
assert((numel(c)==1) || (numel(c)==3),'c has to be either 3 or 1 element vector');

if numel(c) ==1
    r=c; g=c; b=c;
else
    c=max(min(c,1),0);
    r=c(1);g=c(2);b=c(3);
end;

if size(x,1)>1
    x=x';
end;

y=get(gca,'ylim');
for t=x
    if numel(varargin)==2
        plot([1 1].*t,y,fstr,'color',[r g b],varargin{1},varargin{2});
    else
        plot([1 1].*t,y,fstr,'color',[r g b]);
    end;
end;
