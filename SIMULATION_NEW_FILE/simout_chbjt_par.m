%% 并行计算simulink模型

%% 并行池设置
if exist('myPool', 'var')
    delete(gcp); % 删除已存在的并行工作进程池
end

% 设置新的并行工作进程数量
numWorkers = 6;
myPool = parpool(numWorkers);                                                           %并行池工作进程部署
disp(['当前并行工作进程数量为：' num2str(length(myPool))]);
%% 模型基本情况设置
level = ['5','7','9'];                                                                                   %仿真模型设置
frequency_modulate_start = 250;                                                                          %调制频率起始点
frequency_modulate_end = 1000;                                                                           %调制频率结束点
frequency_modulate_interval = 50;                                                                        %调制频率间隔                       
step = (frequency_modulate_end - frequency_modulate_start) / frequency_modulate_interval + 1;            %调制频率步长
f_out = frequency_modulate_start : frequency_modulate_interval : frequency_modulate_end;                 %输出频率输入量

%% 部署并行模型仿真
tstart = datetime();
for ii = 1:3
    RUNLEVEL = level(ii);                                                               %确定当前运行模型
    version =strcat('chbjt',RUNLEVEL);
    model_version = strcat('Par_model_sim_CHBjt',RUNLEVEL);                                 %设置模型版本
    L_1 = eps;                                                                          %模型内参数                                     
    % in  = repmat(Simulink.SimulationInput,length(f_m));                               %模型输入
    for i = 1:step
        in(i) = Simulink.SimulationInput(model_version);
        in(i) = in(i).setVariable('f_m',f_out(i));
    end
    out = parsim(in, 'ShowProgress','on','ShowSimulationManager', ...                   %模型仿真
        'off','TransferBaseWorkspaceVariables','on');
end


close_system(model_version);
fname = strcat(version,"chbjt",'.mat');                                                 %保存数据
save(fname);
sprintf('saving file: %s' , fname)
tend = datetime();                                                              
display("Elapsed time:");
telapsed = tend-tstart;
telapsed
