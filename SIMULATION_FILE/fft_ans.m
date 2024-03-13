%% Function :fft_ans ===========================================
% 输出信号快速傅里叶计算
function [THDout]=fft_ans(signal)

    %% 1.配置FFT参数
    [FFTdata] = power_fftscope(signal);                 %输入信号转换为FFT数据
    FFTdata.input =1 ;                                  %输入信号数量
    FFTdata.signal = 1;                                 %选择信号数据
    FFTdata.startTime = 0.05;                           %FFT计算起点
    FFTdata.cycles = 1;                                 %FFT计算周期
    FFTdata.fundamental = 50;                           %FFT选择基波
    FFTdata.maxFrequency = 1000;                        %FFT计算最大频率
    FFTdata.THDbase = 'fund';                           %FFT选择状态：基波
    FFTdata.freqAxis = 'hertz';                         %FFT频率显示表格：Hertz式
    
    % power_fftscope(FFTdata)
    %% 2.计算FFT
    [FFTdataed] = power_fftscope(FFTdata);              %FFT计算结果
    %DCout = FFTdataed.DCcomponent;
    THDout = FFTdataed.THD;                             %FFT结果结构体
end
%% end @fft_ans