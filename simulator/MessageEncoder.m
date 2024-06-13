classdef MessageEncoder
    methods (Static)
        function bits = encodeMessage(message)
            % Convert message to binary representation
            bits = [];
            for i = 1:length(message)
                charBits = dec2bin(message(i), 8); % Convert each character to 8-bit binary
                bits = [bits, charBits]; % Concatenate bits
            end
            bits = bits - '0'; % Convert char array to numeric array
        end
        
        function message = decodeMessage(bits)
            % Convert binary representation to message
            numChars = length(bits) / 8;
            message = char(zeros(1, numChars));
            for i = 1:numChars
                charBits = bits((i-1)*8 + 1:i*8);
                charBitsStr = char(charBits + '0'); % Convert numeric array to char array
                charDec = bin2dec(charBitsStr); % Convert binary string to decimal
                message(i) = char(charDec);
            end
        end
    end
end
