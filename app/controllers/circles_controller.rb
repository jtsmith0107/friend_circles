class CirclesController < ApplicationController
  def show
    @circle = Circle.find(params[:id])
  end
  
  def new
    @circle = Circle.new
  end
  
  def create
    @circle = current_user.circles.new(circle_params)
    fail
    if @circle.save
      redirect_to user_url(current_user.id)
    else
      flash.now[:errors] = @circle.errors.full_messages
      render "new"
    end    
  end
  
  def update
    @circle = Circle.find(params[:id])
    if @circle.update_attributes(circle_params)
      redirect_to circle_url(@circle)
    else
      flash[:errors] = @circle.errors.full_messages
      redirect_to circle_url(@circle) 
    end
  end
  
  def edit
    @circle = Circle.find(params[:id])
  end
  
  private
  
  def circle_params
    params.require(:circle).permit(:circle_type, circle_member_ids: [])
  end
 
end