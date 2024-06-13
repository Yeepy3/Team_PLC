function BER = calculateBER(originalSignal, decodedSignal)
    % 입력: originalSignal - 원본 신호
    % 입력: decodedSignal - 디코딩된 신호
    % 출력: BER - 비트 오류율

    % 신호 길이 확인
    N = length(originalSignal);

    % 오류 개수 계산
    errorCount = sum(originalSignal ~= decodedSignal);

    % 비트 오류율 계산
    BER = errorCount / N;
end
