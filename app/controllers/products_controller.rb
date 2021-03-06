class ProductsController < ApplicationController

  def index
    @products = Product.all
    @recent_products = Product.recent_products
    @american_products = Product.american_products
    @popular_product = Product.most_reviews
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Your product has been saved!"
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Your product has been updated!"
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

private

  def product_params
    params.require(:product).permit(:name, :cost, :country)
  end

end
