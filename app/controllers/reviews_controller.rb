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
    @reviews = Review.where(product_id: params[:product_id]).order(created_at: :desc)
  end

  def show
    @user_reviews=Review.where(user_id: session[:user_id]).order(created_at: :desc)
  end

  def destroy
    @review_to_delete=Review.find(params[:id])
    @product=Product.find(@review_to_delete.product_id)
    @review_to_delete.destroy
    puts "FUCCKKKKK #{@product.id}"
    redirect_to '/products/'+@product.id.to_s
  end
  private
    def review_params
      params.require(:review).permit(:rating, :description)
    end
end
