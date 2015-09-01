class PostsController < ApplicationController

	before_action :authenticate_user!, except: [:index, :show]

	def index
		@posts=Post.all.order('created_at DESC')
	end

	def new
		 @post=Post.new
	end

	def create
		@post=Post.new(post_params)
		if @post.save
			redirect_to @post
		else
			render('new')
		end
	end

	def edit
		@post=Post.find(params[:id])
	end

	def update
		@post=Post.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to @post
		else
			render('edit')
		end
	end

	def show
		@post=Post.find(params[:id])
	end

	# def delete
	# 	@post=Post.find(params[:id])
	# end

	def destroy
		Post.find(params[:id]).destroy
		redirect_to root_path
	end

private

def post_params
	params.require(:post).permit(:title, :body)
end

end
