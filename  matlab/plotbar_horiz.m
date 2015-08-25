function varargout=plotbar_horiz(x_all,y_all,color,varargin)

% x        x coordinates
% y_hi     upper limit of shaded region
% y_lo     lower "

w=0;
width=.09;

for i=1:size(y_all,2)
    
    y_hilo= y_all(:,i);
    x=x_all(i);
    
    shadedstripes=0;
    stripes=0;
    if numel(color)==3
        if strcmp(color(2:3),'--');
            stripes=1;
        end
    end;
    
    if numel(varargin)>0
        if strcmp(varargin{1},'--');
            stripes=1;
        end;
        if strcmp(varargin{1},'-');
            shadedstripes=1;
        end;
    end
    
    c=color;
    if isa(color,'char')
        
        secondarycolor=[];
        split=strfind(color,'&'); % for 2 color bars
        if numel(split==1)
            secondarycolor=colorreplace(color(split+1:end)); % process main color to [r g b]
            color=color(1:split-1); % use 1st as main color
        end;
        
        
        
        color=colorreplace(color); % process main color to [r g b]
    else
          secondarycolor=[];
       
    end;
    
    
    extrasymbol='';
    if numel(varargin)==1
        width=varargin{1};
        
    elseif numel(varargin)==2
        width=varargin{1};
        extrasymbol=varargin{2};
    end;
    
    
    r=1*width/range(y_hilo);
    
    
    if size(y_hilo,1)==1 % just plot
        if stripes
            plot(y_hilo.*[1 1],x+([-1 1].*width),'k--','color',color,'LineWidth',3);
        else
            plot(y_hilo.*[1 1],x+([-1 1].*width),'k','color',color,'LineWidth',3);
        end
        
        if numel(extrasymbol)>0
            plot(y_hilo,x,extrasymbol);
        end;
    else
        
        if size(y_hilo,1)==2
            %plot .25,.75 quartiles
            
            
            px=[x+([1 1 1 1].*width)+([-1 0 0 -1].*w*width),x+([-1 -1 -1 -1].*width)+([1 0 0 1].*w*width)];
            py=[y_hilo(1)+([0 1].*w),y_hilo(2)+([-1 0].*w) ,y_hilo(2)+([0 -1].*w),y_hilo(1)+([1 0].*w)];
            
            if stripes
                patch(py,px,1,'FaceColor',color,'EdgeColor',color);
            else
                patch(py,px,1,'FaceColor',color,'EdgeColor','none');
            end;
            
            if numel(extrasymbol)>0
                plot(mean(y_hilo),x,extrasymbol,'color',color);
            end;
            
            
        end;
        
        if size(y_hilo,1)==3 % also draw mean
            
            %r=1*/range(y_hilo)/width;
            % px=[x+([-1 -1].*width),x+([1 1].*width)];
            % py=[y_hilo([1 3])', flipud(y_hilo([1 3]))'];
            
            px=[x+([1 1 1 1].*width)+([-1 0 0 -1].*w*width),x+([-1 -1 -1 -1].*width)+([1 0 0 1].*w*width)];
            py=[y_hilo(1)+([0 1].*w.*range(y_hilo)),y_hilo(3)+([-1 0].*w.*range(y_hilo)) ,y_hilo(3)+([0 -1].*w.*range(y_hilo)),y_hilo(1)+([1 0].*w.*range(y_hilo))];
            
            
            
            if stripes
                patch(py,px,1,'FaceColor','none','EdgeColor',color);
            else
                patch(py,px,1,'FaceColor',color,'EdgeColor','none');
            end;
            
            
            
            if numel(extrasymbol)>0
                plot(mean(y_hilo),x,extrasymbol,'color',[0 0 0]);
                plot(y_hilo(2).*[1 1],x+([-1 -.7].*width),'k','color',color,'LineWidth',2);
                plot(y_hilo(2).*[1 1],x+([1 .7].*width),'k','color',color,'LineWidth',2);
                
            else
                plot(y_hilo(2).*[1 1],x+([-1 1].*width),'k','color',color,'LineWidth',2);
                
            end;
            
        end;
        
        if numel(secondarycolor)>0 % draw a secondary color
            plot(y_hilo([1 end]),x.*[1 1],'k','color',secondarycolor,'LineWidth',2);
            
            
        end;
        
        
    end;
    
end;

alpha(.6); % make patch transparent

function color=colorreplace(color)
 color=strrep(color,'-','');
        % make colors nicer
        switch color
            case 'r'
                color=[1 0 0];
            case 'rr'
                color=[1 .3 .2];
            case 'g'
                color=[.2 .6 0];
            case 'gg'
                color=[.4 .9 .3];
            case 'b'
                color=[0 0 1];
            case 'bb'
                color=[.2 .3 1];
            case 'k'
                color=[0 0 0];
            case 'kk'
                color=[0.5 0.5 0.5];
            case 'kk'
                color=[0.5 0.5 0.5];
            case 'c'
                color=[0 .5 .5];
            case 'p'
                color=[1 .5 .3];
            case 'y'
                color=[1 .95 .0];
            otherwise
                color=[0 0 1];
        end;