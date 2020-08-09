class PostsController < ApplicationController

	before_action :find_post,
	 only: [:show, :edit, :update, :destroy]


	def index
		if params[:category].blank?
			@posts = Post.all.order("created_at DESC")
		  else
			@postIds = CategoryPost.where(category_id: params[:category]).pluck(:post_id)
			@posts = Post.where(id: @postIds).order("created_at DESC")
		  end
	end

	def new 
		@post = Post.new
	end

	def show
	end

	def create
		@post = Post.new(post_params)
				
		@cats = params[:post]
		@ids = @cats[:category_id]

		if @post.save 

			@ids.each do |item|
				catpost = CategoryPost.new(category_id: item, post_id: @post.id)
				catpost.save
			end
			
			redirect_to @post, notice: 'The Post was created!'
		else 
			render 'new'
		end
	end

	def edit
	end

	def update
		if @post.update(post_params)
			redirect_to @post, notice: 'Update Successful'
		else 
			render 'edit'
		end
	end

	def destroy
		@post.destroy

		redirect_to root_path, notice: 'Post Destroyed'
	end

    private
	
	def post_params
		params.require(:post).permit(:title, :content, :category_id)
	end

	def find_post
		@post = Post.find(params[:id])
	end
end
