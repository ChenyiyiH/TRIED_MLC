%%  正常运行时，单相系统参数表
clc;
clear all;

%%  系统参数
% 可调参数
%n = 2;                                         %    //电容倍数
f = 50;                                         %Hz  //输出频率（调制波频率）  注：不是角频率！！
m = 0.95;                                       %    //调制比
f_switch = 250;                                 %Hz  //IGCT开关频率
Td = 15e-7;                                     %    //PWM死区保护
% 设计点参数
Source_Amp = 10000;                             %V   //电源电压
fn = 50;                                        %Hz  //基频
P0 = 8e6;                                       %V*A //单个变压器额定容量
L_ori = 0.02;                                   %    //变压器原边漏抗
L_sec = 0.06;                                   %    //变压器副边漏抗
Up_out = 3.81e3;                                %V   //额定输出相电压
Ul_out = 6.6e3;                                 %V   //额定输出线电压
Ul_in = 1900;                                   %V   //输入侧线电压
U_dcN = 2500;                                   %V   //直流额定电压
N = 2;                                          %    //级联数
sigma_min = 0.05;                               %    //直流电压波动范围最小值
st = 1e-6;                                      %    //采样时间
% 负载
L = 0.002;                                      %H   //负载电感
R = 1.5;                                        %Ω   //负载电阻
% L_1 = 1E-05;
L_1 = eps;                                      %H   //输入滤波电感
% IGCT参数
rt = 0.294e-3;
vt = 1.12;
rto = 0.8e-3;
vto = 1.56;
Eon = 3;
Eoff = 32;
%%  直流支撑电容计算
%T_dis = 1/f_switch;                                                        %s   //电容放电周期
% C = P0 * T_dis / (3 * sqrt(2) * N * sigma_min * U_dcN * Ul_in);           %F   //计算电容
% C = C*n;
% C_uf = C*(10^6);                                                          %uF  //计算电容
% C = 1/(4 * f_switch) * (P0 * 1.2)/(U_dcN * U_dcN * sigma_min);
% C = C*n;
C = 0.0234;                                                                 %F   //ABB电容
% C =0.0384*n;

%% 结温计算
Ts2 = 0.5e-3;                                   %     //均值采样时间

