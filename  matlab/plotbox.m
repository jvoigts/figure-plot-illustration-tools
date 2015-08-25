function x=plotbox(a,b,fstr,varargin);

ax=min(a);
ay=min(b);
bx=max(a);
by=max(b);

plot([ax ax],[ay  by],fstr);
plot([bx bx],[ay  by],fstr);
plot([ax bx],[ay  ay],fstr);
plot([ax bx],[by  by],fstr);


if numel(varargin)>0
    ofs= ((bx-ax)+(by-ay)).*.01;
    text(ax+ofs,ay+ofs,varargin{1});
end;