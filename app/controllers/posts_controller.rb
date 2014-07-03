class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    
    @post = current_user.posts.new(post_params)
    @post.links.new(link_params)
    # @post.post_shares.build(postshares_params )

    if @post.save
          fail
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    @post = Post.find(params[:id])
    @post.destroy #database post
    redirect_to circle_url(@post.circle)
  end
  
  def index
    @posts = Post.all
  end
  
  def post_params
    params.require(:post).permit(:title, :body, :shared_circle_ids => [])
  end
  
  def link_params 
    params.permit(:links => [:title, :url])
              .require(:links).values
              .reject{ |data| data.values.all?(&:blank?)}
  end
    
  def postshares_params
    params.require(:post_shares).permit(:circle_ids => [])
  end
end
