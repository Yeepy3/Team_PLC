% main.m

% 네트워크 생성
network = Network();

% 수신기 생성 및 네트워크에 추가
receiver1 = Receiver(101);
receiver2 = Receiver(102);
network.addReceiver(receiver1);
network.addReceiver(receiver2);

% 송신기 생성
transmitter = Transmitter(201);

% 패킷 데이터 생성 (예: 'Hello, Receiver 101!')
data1 = uint8(['Hello, Receiver 101!' zeros(1, 28 - length('Hello, Receiver 101!'))]);
data2 = uint8(['Hello, Receiver 102!' zeros(1, 28 - length('Hello, Receiver 102!'))]);

% 메시지 전송 (노이즈 레벨 0.5)
noiseLevel = 0.5;
transmitter.sendPacket(data1, 101, network, noiseLevel);
transmitter.sendPacket(data2, 102, network, noiseLevel);
transmitter.sendPacket(uint8(['This will not be delivered' zeros(1, 28 - length('This will not be delivered'))]), 103, network, noiseLevel);

% 수신기 상태 확인
disp(network.checkReceiver(101));
disp(network.checkReceiver(102));
disp(network.checkReceiver(103));
