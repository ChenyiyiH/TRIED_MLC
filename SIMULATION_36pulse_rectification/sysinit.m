%%  正常运行时，单相系统参数表
clc;
clear all;
run("Device_Parameter.m");
%%  系统参数
% 可调参数
%n = 2;                                      %    //电容倍数
f = 50;                                     %Hz  //输出频率（调制波频率）  注：不是角频率！！
m = 0.71;                                   %    //调制比
% 设计点参数
Un = 10000;
fn = 50;
P0 = 20e6/3;                                   %V*A //变换器额定容量
% P0 = 440e3/3;
Up_out = 3.81e3;                             %V   //额定输出相电压
Ul_out = 6600;                              %V   //额定输出线电压
Ul_in = 1900;                                %V   //输入侧线电压
U_dcN = 2500;                                %V   //直流额定电压
Udc = 2500;
Ip_out = 1750;
N = 2;                                       %    //级联数
f_switch = 500;                              %Hz  //IGBT开关频率
%amp_modulation = 1000 * m;                  %    //调制波幅值
T_dis = 1/f_switch;                         %s   //电容放电周期
TC = 1/f_switch;
Ts = 1e-6;
Ts2 = 0.5E-3;
sigma_min = 0.05;                            %    //直流电压波动范围最小值
st = 5e-7;                                   %    //采样时间
% L = 0.002;
% R = 1.5;
%2100A 5电平负载
% L = 0.002;
% R = 1.515;
%1750A 5电平负载
L = 0.004;
R = 1.2;
% load_L = 2.2 / (2 * pi * f);               %H   //负载电感 Z=wL=2.2
% L_1 = 1E-05;
L_1 = eps;
% R_M = 660/454*0.0213;
% L_M=660/454*0.006;
Z_R = Ul_in/(sqrt(3)*Ip_out);
Z_L = Ul_in/(sqrt(3)*Ip_out * 2*pi*fn);
R_M = 0.03;
L_M = 0.2;
% L = Z_L*L_M;
% R = Z_R*R_M;
% L = 0.004;
% R = 0.056;
k=Ul_out/sqrt(3)/fn;
theta = (atan((L*2*pi*f)/R));
CONT = 2;
z = sqrt(R^2+(f*L)^2);
%% 
DIODE = DIODE_344520;
IGCT = IGCT_654522_6;
%%  直流支撑电容计算
C = P0 * T_dis / (3 * sqrt(2) * N * sigma_min * U_dcN * Ul_in);         %F   //计算电容
% C = C*n;
C_uf = C*(10^6);                                                        %uF  //计算电容
C = 1/(4 * f_switch) * (P0 * 1.2)/(U_dcN * U_dcN * sigma_min);
% C = C*n;
% C = 0.0234;
% C =0.0384*1;
C = 0.03;

%% SAMPLE TIME
Ts_c = 0.00005;

%% 结温计算
% Ts=2e-3;
% Ts2 = 0.5e-3;
% TC=1/850;                                                                   %npcSINGLE载波周期
% TC=1/2500;
% IN = 2800;                                                                %正是逆变，负是整流.1575A,9MVA;1400A,8MVA;1312A,7.5MVA
% f = 50;                                                                     %基波频率
% m=1;                                                                        %调制比
% PM = 1;                                                                   %0 module1,1=module2
udc = 2500;
Td = 15e-7;
rt = 0.294e-3;
vt = 1.12;
rto = 0.8e-3;
vto = 1.56;
Eon = 3;
Eoff = 32;
fm = 500;
swi = 1;
swv = 1;
cap = 4;              %/MVA
R_t = 7.5e-3;%散热器热阻
% R_t = 5e-3;
temp_init = 40;
%% 滤波器，电缆与电机参数
L1s = 30.7e-9;          %定子绕组头eta匝漏感
eta = 1;
Rs = 1.18e-3;           %定子绕组头u匝对地电阻
u = 1;
Csf_effective = 15e-9;  %每相定子线圈第一个线圈对机壳电容
Rs1 = 5.7e-3;           %定子电阻
L1s1 = 0.159e-3;        %定子漏感
Rsw = 50;               %定子线圈之间电阻
Csw = 30.7e-9;          %定子线圈之间电容
Lm = 3.992e-3;          %励磁电感
Rcore = 60;             %定子线圈损耗的等效电阻
L1r = 0.221e-3;         %转子漏感
Rr = 5.41e-3;           %转子归算后电阻
Cg = 40e-9;             %中点对地电容

Lc = 1.18e-6;           %电缆单位长度电感
Rc = 18e-3;             %电缆单位长度电阻
Cc = 0.0328e-9;         %电缆单位长度电容

%%
% tr=1e-6*10;
% fc = 1/(2*tr);
% omega_c = 2*pi*fc;
% ksi = 0.707;
% 
% L_r = 12e-6;
L_f = 3e-6;
% 
% C_r = (TC/(2*pi))^2/L_r;
C_f = 0.625e-6;
% % C_f=1/(omega_c^2*L_f);
% R_f = 2*ksi*sqrt(L_f/C_f);
R_f = 1.5;


% NUM = [R_f/L_f 1/(L_f*C_f)];
% DEN=[1 R_f/L_f 1/(L_f*C_f)];
% SYS = tf(NUM,DEN);
% bode(SYS);

%% 异步电机标幺参数(pu)
AM.Pn = 440e4;				                %额定功率
AM.Vn_ll = 6600;				                %额定线电压
AM.fn = 110;				                %额定频率
AM.Speed = 1100;				                %额定转速
AM.p = 6;					                %极对数
AM.SpeedtoFre = AM.Speed*AM.p/60;
AM.Rs = 0.0213;				                %定子电阻
AM.Rr = 0.006;				                %转子电阻
AM.L1 = 0.2177;				                %全漏感
AM.L1s = AM.L1/2;				            %定子电感
AM.L1r = AM.L1/2;				            %转子电感
AM.Lm = 2.3;				                %互感
AM.J_in = 0.095;				            %惯性系数
AM.eta_f = 0.054;				            %摩擦因子
AM.Nominal = [AM.Pn AM.Vn_ll  AM.fn];		%额定参数
AM.Stator = [AM.Rs  AM.L1s];			    %定子参数
AM.Rotor = [AM.Rr AM.L1r];			        %转子参数
AM.Intrinsic = [AM.J_in AM.eta_f AM.p];		%固有参数