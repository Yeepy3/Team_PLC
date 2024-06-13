% 이 스크립트는 channelFunctions 함수를 사용하여 신호 전송 및 수신을 시뮬레이션합니다.

% 입력 신호 생성 (0과 1)
inputSignal = randi([0 1], 1, 1000);  % 0과 1로 구성된 랜덤 신호 생성
cableLength = 100;  % 케이블 길이 (예시)
noiseLevel = 5;  % 잡음 수준 (예시)
threshold = 0.5;  % 임계값 설정

% channelFunctions 함수 호출
[receivedSignal, decodedSignal] = channelFunctions(inputSignal, cableLength, noiseLevel, threshold);

% 결과 플로팅
figure;
subplot(3,1,1);
plot(1:1000, inputSignal, 'b-');
title('Original Signal');
ylim([-0.1 5.1]);

subplot(3,1,2);
plot(1:1000, receivedSignal, 'r-');
title('Received Signal');

subplot(3,1,3);
plot(1:1000, decodedSignal, 'g-');
title('Decoded Signal');
ylim([-0.1 5.1]);
% 이 스크립트는 channelFunctions 함수를 사용하여 신호 전송 및 수신을 시뮬레이션합니다.



% 비트 오류율 계산
BER = calculateBER(inputSignal, decodedSignal);

% 결과 표시
fprintf('비트 오류율 (BER): %f\n', BER);



