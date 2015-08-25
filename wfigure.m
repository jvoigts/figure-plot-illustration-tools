function h=wfigure(varargin)
% makes figure and sets background white

if numel(varargin)==1
    nr=varargin{1};
    h=figure(nr);
else
    h=gcf;
end;

set(h,'Color',[1 1 1]);