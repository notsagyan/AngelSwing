class ApplicationController < ActionController::API
    def encode_token(payload)
        JWT.encode(payload, 'hellomars1211') 
    end

    def decoded_token
        header = request.headers['Authorization']
        if header
            token = header.split(" ")[1]
            begin
                JWT.decode(token, 'hellomars1211')
            rescue JWT::DecodeError
                nil
            end
        end
    end
end
