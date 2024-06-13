classdef Network
    properties
        Receivers
    end
    
    methods
        function obj = Network()
            obj.Receivers = containers.Map('KeyType', 'double', 'ValueType', 'any');
        end
        
        function addReceiver(obj, receiver)
            obj.Receivers(receiver.Address) = receiver;
        end
        
        function transmit(obj, signal, sourceAddress, destinationAddress)
            if isKey(obj.Receivers, destinationAddress)
                receiver = obj.Receivers(destinationAddress);
                receiver.receiveMessage(signal);
            else
                disp(['No receiver found with address: ', num2str(destinationAddress)]);
            end
        end
        
        function status = checkReceiver(obj, address)
            if isKey(obj.Receivers, address)
                receiver = obj.Receivers(address);
                if receiver.hasReceivedMessage
                    status = ['Receiver ', num2str(address), ' has received the message: ', receiver.receivedMessage];
                else
                    status = ['Receiver ', num2str(address), ' has not received any message.'];
                end
            else
                status = ['No receiver found with address: ', num2str(address)];
            end
        end
    end
end
