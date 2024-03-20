%% 并行计算simulink模型

%% 并行池设置
% if exist('myPool', 'var')
%     delete(gcp); % 删除已存在的并行工作进程池
% end
%
% 设置新的并行工作进程数量
% numWorkers = 12;
% myPool = parpool(numWorkers);                                                           %并行池工作进程部署
% disp(['当前并行工作进程数量为：' num2str(length(myPool))]);
%% 模型基本情况设置
level = ['5','7','9'];                                                                                   %仿真模型设置
frequency_modulate_start = 250;                                                                          %调制频率起始点
frequency_modulate_end = 1000;                                                                           %调制频率结束点
frequency_modulate_interval = 50;                                                                        %调制频率间隔                       
step = (frequency_modulate_end - frequency_modulate_start) / frequency_modulate_interval + 1;            %调制频率步长
f_m = frequency_modulate_start : frequency_modulate_interval : frequency_modulate_end;                   %输出频率输入量

%% 部署并行模型仿真
tstart = datetime();
for ii = 3:3
    RUNLEVEL = level(ii);                                                               %确定当前运行模型
    version =strcat('chbjt',RUNLEVEL);
    model_version = strcat('model_sim_CHBjt',RUNLEVEL);                                 %设置模型版本
    L_1 = eps;                                                                          %模型内参数                                     
    % in  = repmat(Simulink.SimulationInput,length(f_m));                               %模型输入
    for i = 1:step
        in(i) = Simulink.SimulationInput(model_version);
        in(i) = in(i).setVariable('f_m',f_m(i));
    end
    out = parsim(in, 'ShowProgress','on','ShowSimulationManager', ...           %模型仿真
        'off','TransferBaseWorkspaceVariables','on');
end


% close_system(model_version);
% fname = strcat(version,'.mat');
% save(fname,"chbjt");
% sprintf('saving file: %s' , fname)
tend = datetime();
display("Elapsed time:");
telapsed = tend-tstart;
telapsed

save("simresjt7.mat");                                                                     %保存数据

%% 绘图
% for i = 1 : 1 : 3
%     figure(i);
%     for j = 1 : 1 :step1
%         for k = 1 : 1 : step2
%             y(k) = out(i,j,k).THD.signals.values(end)*100;
%         end
%         line(j) = plot(m,y);
%         legend_str{j} = [num2str(in(j,k).Variables(1,2).Value),'Hz'];
%         hold on
%     end
%     legend(legend_str,'Location','northeast');
% end
% 
% % plot(voltage_load.time,voltage_load.signals.values(:,1));
% 
% ChooseRes_m = 17; %m=0.95 [0.15	0.2	0.25	0.3	0.35	0.4	0.45	0.5	0.55	0.6	0.65	0.7	0.75	0.8	0.85	0.9	0.95	1	1.05]
% ChooseRes_f = 6;%f=50 [25	30	35	40	45	50	55	60	65	70	75]
% % for i = 1 : 1 : 3
% %     figure();
% %     plot(out(i,5,10).voltage_dc(1).time,out(i,ChooseRes_f,ChooseRes_m).voltage_dc(1).signals(1).values(:,1));
% %     legend_str{i} = ['f=',num2str(in(ChooseRes_f,ChooseRes_m).Variables(1,2).Value),'Hz, ','m=',num2str(in(ChooseRes_f,ChooseRes_m).Variables(1,1).Value)];
% %     legend(legend_str,'Location','northeast');
% % end

