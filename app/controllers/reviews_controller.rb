class ReviewsController < ApplicationController

  def show
    @review = Review.find(params[:id])
  end

  def new
    @product = Product.find(params[:product_id])
    @review = Review.new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
       flash[:notice] = "Review has been saved!"
       redirect_to product_path(@product)
    else
     render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Your review has been updated!"
      redirect_to product_reviews_path
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to products_path
  end

private
  def review_params
    params.require(:review).permit(:author, :content, :rating)
  end

end
