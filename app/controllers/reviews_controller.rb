class ReviewsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    my_params = review_params
    my_params[:user_id] = session[:user_id]
    if Review.where(user_id: session[:user_id]).where(product_id:params[:product_id]).count == 0
      @review = @product.reviews.create(my_params)
      redirect_to product_path(@product)
    else
      raise ActionController::RoutingError.new('You already reviewed this product')
    end
  end

  def index
    @reviews = @Review.where(product_id: params[:product_id]).order(created_at: :desc)
  end
  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end
end
