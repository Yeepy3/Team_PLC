classdef Transmitter
    properties
        Address
    end
    
    methods
        function obj = Transmitter(address)
            obj.Address = address;
        end
        
        function sendPacket(obj, data, destinationAddress, network, noiseLevel)
            % 패킷 생성
            header = uint8([0, 0, 0, 0]); % 헤더는 임의로 설정
            addressPart = typecast(uint32(destinationAddress), 'uint8');
            % 패킷 데이터 조정 (앞쪽 4바이트는 주소, 나머지는 실제 데이터)
            packetData = [addressPart, data(1:Packet.DATA_SIZE - Packet.ADDRESS_SIZE)];
            packet = Packet(header, packetData);
            % 패킷을 바이너리로 변환
            bytes = packet.toBytes();
            % 바이너리를 비트 시퀀스로 인코딩
            bits = MessageEncoder.encodeMessage(char(bytes));
            % 비트를 신호로 변환
            signal = SignalGenerator.generateSignal(bits);
            % 신호에 노이즈 추가
            noisySignal = SignalGenerator.addNoise(signal, noiseLevel);
            % 네트워크를 통해 신호 전송
            network.transmit(noisySignal, obj.Address, destinationAddress);
        end
    end
end
