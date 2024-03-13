load("simres.mat");
%%
for i = 1 : 1 : 3
    figure(i);
    for j = 1 : 1 :step1
        for k = 1 : 1 : step2
            y(k) = out(i,j,k).THD.signals.values(end)*100;
        end
        line(j) = plot(m,y);
        legend_str{j} = [num2str(in(j,k).Variables(1,2).Value),'Hz'];
        hold on
    end
    legend(legend_str,'Location','northeast');
end

                                                                                % plot(voltage_load.time,voltage_load.signals.values(:,1));

ChooseRes_m = 17;                                                               %m=0.95 [0.15	0.2	0.25	0.3	0.35	0.4	0.45	0.5	0.55	0.6	0.65	0.7	0.75	0.8	0.85	0.9	0.95	1	1.05]
ChooseRes_f = 6;                                                                %f=50 [25	30	35	40	45	50	55	60	65	70	75]
% for i = 1 : 1 : 3
%     figure();
%     plot(out(i,5,10).voltage_dc(1).time,out(i,ChooseRes_f,ChooseRes_m).voltage_dc(1).signals(1).values(:,1));
%     legend_str{i} = ['f=',num2str(in(ChooseRes_f,ChooseRes_m).Variables(1,2).Value),'Hz, ','m=',num2str(in(ChooseRes_f,ChooseRes_m).Variables(1,1).Value)];
%     legend(legend_str,'Location','northeast');
% end

for i = 1 : 1 : 3
    figure();
    plot(out(i,5,10).current_grid(1).time,out(i,ChooseRes_f,ChooseRes_m).current_grid(1).signals(1).values(:,1));
    legend_str{i} = ['f=',num2str(in(ChooseRes_f,ChooseRes_m).Variables(1,2).Value),'Hz, ','m=',num2str(in(ChooseRes_f,ChooseRes_m).Variables(1,1).Value)];
    legend(legend_str,'Location','northeast');
end

for i = 1 : 1 : 3
    figure();
    plot(out(i,5,10).current_load(1).time,out(i,ChooseRes_f,ChooseRes_m).current_load(1).signals(1).values(:,1));
    legend_str{i} = ['f=',num2str(in(ChooseRes_f,ChooseRes_m).Variables(1,2).Value),'Hz, ','m=',num2str(in(ChooseRes_f,ChooseRes_m).Variables(1,1).Value)];
    legend(legend_str,'Location','northeast');
end

for i = 1 : 1 : 3
    figure();
    plot(out(i,5,10).voltage_load(1).time,out(i,ChooseRes_f,ChooseRes_m).voltage_load(1).signals(1).values(:,1));
    legend_str{i} = ['f=',num2str(in(ChooseRes_f,ChooseRes_m).Variables(1,2).Value),'Hz, ','m=',num2str(in(ChooseRes_f,ChooseRes_m).Variables(1,1).Value)];
    legend(legend_str,'Location','northeast');
end