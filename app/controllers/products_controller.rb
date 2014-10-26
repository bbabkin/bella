class ProductsController < ApplicationController

layout "admin"

  before_action :confirm_logged_in
  before_action :find_line

  def index
    @products = Product.where(:line_id => @line.id).sorted
    #@products = @line.products.sorted
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new({:line_id => @line.id, :name => "Default"})
    @lines = Line.order('position ASC')
    @product_count = Product.count + 1
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product created successfully."
      redirect_to(:action => 'index', :line_id => @line.id)
    else
      @lines = Line.order('position ASC')
      @product_count = Product.count + 1
      render('new')
    end
  end

  def edit
    @product = Product.find(params[:id])
    @lines = Line.order('position ASC')
    @product_count = Product.count
  end

  def update
    @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
      flash[:notice] = "Product updated successfully."
      redirect_to(:action => 'show', :id => @product.id, :line_id => @line.id)
    else
      @line = Line.order('position ASC')
      @product_count = Product.count
      render('edit')
    end
  end

  def delete
    @product = Product.find(params[:id])
  end

  def destroy
    product = Product.find(params[:id]).destroy
    flash[:notice] = "Product removed successfully."
    redirect_to(:action => 'index', :line_id => @line.id)
  end


  private

    def product_params
      params.require(:product).permit(:line_id, :name, :volume, :price, :description, :permalink, :position, :visible)
    end

    def find_line
      if params[:line_id]
        @line = Line.find(params[:line_id])
      end
    end

end