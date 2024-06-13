classdef Packet
    properties
        Header
        Data
    end
    
    properties (Constant)
        PACKET_SIZE = 32; % 총 패킷 크기 (바이트)
        HEADER_SIZE = 4;  % 헤더 크기 (바이트)
        DATA_SIZE = 28;   % 데이터 크기 (바이트)
        ADDRESS_SIZE = 4; % 주소 크기 (바이트)
    end
    
    methods
        function obj = Packet(header, data)
            if length(header) ~= obj.HEADER_SIZE
                error('Header must be %d bytes', obj.HEADER_SIZE);
            end
            if length(data) > obj.DATA_SIZE
                error('Data must be at most %d bytes', obj.DATA_SIZE);
            end
            obj.Header = header;
            obj.Data = [data, zeros(1, obj.DATA_SIZE - length(data))]; % 패딩 추가
        end
        
        function bytes = toBytes(obj)
            bytes = [obj.Header, obj.Data];
        end
        
        function address = getAddress(obj)
            address = typecast(uint8(obj.Data(1:obj.ADDRESS_SIZE)), 'uint32');
        end
    end
    
    methods (Static)
        function packet = fromBytes(bytes)
            if length(bytes) ~= Packet.PACKET_SIZE
                error('Bytes must be %d bytes', Packet.PACKET_SIZE);
            end
            header = bytes(1:Packet.HEADER_SIZE);
            data = bytes(Packet.HEADER_SIZE+1:end);
            packet = Packet(header, data);
        end
    end
end
