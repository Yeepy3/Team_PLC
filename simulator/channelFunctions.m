function [receivedSignal, decodedSignal] = channelFunctions(inputSignal, cableLength, noiseLevel, threshold)
    % 이 함수는 채널 시뮬레이터와 디코딩을 모두 처리합니다.
    % 입력된 신호를 채널 시뮬레이터를 통해 전송하고 디코딩합니다.

    % 채널 시뮬레이터 호출
    receivedSignal = channelSimulator(inputSignal, cableLength, noiseLevel);

    % 디코딩 호출
    decodedSignal = decodeSignal(receivedSignal, threshold);
end

% 아래는 로컬 함수들입니다.

function [receivedSignal] = channelSimulator(inputSignal, cableLength, noiseLevel)
    % 신호 감쇠와 잡음 추가를 모델링하는 함수
    attenuationFactor = 0.99;  % 신호 감쇠율
    noisePower = noiseLevel * 0.01;  % 잡음의 강도

    % 감쇠 적용
    attenuation = exp(-attenuationFactor * cableLength);
    attenuatedSignal = inputSignal * attenuation;

    % 가우시안 잡음 추가
    noise = sqrt(noisePower) * randn(size(inputSignal));
    receivedSignal = attenuatedSignal + noise;
end

function [decodedSignal] = decodeSignal(receivedSignal, threshold)
    % 수신된 신호를 임계값을 사용하여 디코드하는 함수
    decodedSignal = receivedSignal > threshold;
end
