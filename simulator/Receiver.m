classdef Receiver
    properties
        Address
        hasReceivedMessage
        receivedMessage
    end
    
    methods
        function obj = Receiver(address)
            obj.Address = address;
            obj.hasReceivedMessage = false;
            obj.receivedMessage = '';
        end
        
        function receiveMessage(obj, signal)
            % 신호를 비트 시퀀스로 변환
            bits = SignalGenerator.decodeSignal(signal);
            % 비트 시퀀스를 바이너리로 변환
            bytes = uint8(MessageEncoder.decodeMessage(bits));
            % 패킷 생성
            packet = Packet.fromBytes(bytes);
            % 패킷의 주소 확인
            if packet.getAddress() == obj.Address
                obj.hasReceivedMessage = true;
                obj.receivedMessage = char(packet.Data(5:end));
                disp(['Receiver ', num2str(obj.Address), ' received message: ', obj.receivedMessage]);
            else
                disp(['Receiver ', num2str(obj.Address), ' received a packet but the address did not match.']);
            end
        end
    end
end
