Y1 = power.signals.values;
X1 = power.time;
Y2 = T2_tem.signals.values;
X2 = T2_tem.time;
Y3 = threshold.signals.values;
X3 = threshold.time;
%% 
% 创建 figure
figure('WindowState','maximized','Color',[1 1 1]);

% 创建 axes
axes1 = axes;
hold(axes1,'on');
colororder([0.85 0.325 0.098]);

% 激活坐标区的 left 侧
yyaxis(axes1,'left');
% 创建 plot
plot1=plot(X1,Y1,'DisplayName','三相输出功率','LineWidth',2,'LineStyle','-.',...
    'Color',[0.250980392156863 0.411764705882353 0.87843137254902]);
datatip(plot1,'DataIndex',2834761);
% 创建 yline
% yline(140,'DisplayName','IGCT结温限制','LineStyle','--',...
%     'Color',[0.929411764705882 0.117647058823529 0.141176470588235],...
%     'LineWidth',2);

% 创建 ylabel
ylabel('三相输出功率/W');
ylim(axes1,[0 45000000]);
% 设置其余坐标区属性
set(axes1,'YColor',[0.250980392156863 0.411764705882353 0.87843137254902]);
% 激活坐标区的 right 侧
yyaxis(axes1,'right');
% 创建 plot
plot(X2,Y2,'DisplayName','IGCT结温',...
    'Color',[0.282352941176471 0.674509803921569 0.258823529411765]);
plot(X3,Y3,'DisplayName','IGCT结温限制','LineStyle','--',...
    'Color',[0.929411764705882 0.117647058823529 0.141176470588235],...
    'LineWidth',2);
% 创建 ylabel
ylabel('温度/℃');
% 取消以下行的注释以保留坐标区的 Y 范围
ylim(axes1,[40 145]);

% 设置其余坐标区属性
set(axes1,'YColor',[0.282352941176471 0.674509803921569 0.258823529411765]);
% 创建 xlabel
xlabel('时间/s');

% 创建 title
title('七电平开关频率250Hz三相输出功率与IGCT结温','FontWeight','bold');

% 取消以下行的注释以保留坐标区的 X 范围
xlim(axes1,[0 4.5]);
box(axes1,'on');
hold(axes1,'off');
% 设置其余坐标区属性
set(axes1,'FontSize',24,'FontWeight','bold','LineWidth',1.5);
% 创建 legend
legend1 = legend(axes1,'show');
set(legend1,...
    'Position',[0.75824652984997 0.13963964298543 0.126041663701956 0.117463614117827]);