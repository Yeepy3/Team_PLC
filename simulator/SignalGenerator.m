classdef SignalGenerator
    methods (Static)
        function signal = generateSignal(bits)
            % Convert bits to signal
            highVoltage = 5; % Voltage level for bit 1
            lowVoltage = -5; % Voltage level for bit 0
            signal = bits * highVoltage + ~bits * lowVoltage;
        end
        
        function noisySignal = addNoise(signal, noiseLevel)
            % Add Gaussian noise to the signal
            noise = noiseLevel * randn(size(signal));
            noisySignal = signal + noise;
        end
        
        function bits = decodeSignal(signal)
            % Convert signal to bits
            highVoltage = 5; % Voltage level for bit 1
            bits = signal > highVoltage / 2; % Thresholding to recover bits
        end
    end
end
