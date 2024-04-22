class Api::V1::ContentController < ApplicationController
    def create
        id = decoded_token[0]["user_id"]
        user = User.find_by(id: id)
        if user
            new_content = user.content.create!(content_params)
            render json: new_content, status: :created
        else
            render json: {
                "message": "Cannot find the specified user."
            }, status: :bad_request
        end
    end

    def list
        contents = Content.all
        render json: contents
    end

    def update
        id = decoded_token[0]["user_id"]
        user = User.find_by(id: id)
        if user
            content = Content.find_by(params[:id])
            is_updated = content.update(content_params)
            if is_updated
                render json: Content.find_by(params[:id]), status: :ok
            end
        end
    end

    def delete
        id = decoded_token[0]["user_id"]
        user = User.find_by(id: id)
        if user
            content = Content.find_by(params[:id])
            is_deleted = content.delete
            if is_deleted
                render json: {"message":"Content deleted successfully"}, status: :ok
            end
        end
    end

    private
    def content_params
        params.permit(:title, :body)
    end
end
