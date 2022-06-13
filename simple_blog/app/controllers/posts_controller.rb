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

    def edit
        @post = Post.find(params[:id])
    end

    def update
        respond_to do |f|
            if @post.update(post_params)
                f.html {redirect_to @post, notice: "Entry was successfully updated."}
            else
                f.html { render :new, status: :unprocessable_entity }
                f.json { render json: @post.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        respond_to do |f|
            f.html {redirect_to @post, notice: "Entry was successfully deleted." }
            f.json { head :no_content }
        end
    end


    private
    def post_params
        params.require(:post).permit(:title, :body)
    end
end
