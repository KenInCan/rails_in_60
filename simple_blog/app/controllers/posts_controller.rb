class PostsController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def show
        @post = Post.find(params[:id])
    end

    def create
        @post = Post.new(post_params)
        respond_to do |f|
            if @post.save
                f.html {redirect_to post_url(@post), notice: "Entry was successfully created." }
            else
                f.html { render :new, status: :unprocessable_entity }
                f.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
