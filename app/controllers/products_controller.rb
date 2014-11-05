class ProductsController < ApplicationController

layout "public"

  before_action :confirm_logged_in
  before_action :find_line

  def index
    #@products = Product.where(:line_id => @line.id).sorted
    @products = @line.products.sorted
  end

  def show
    @product = Product.find(params[:id])
  end

  private

    def find_line
      if params[:line_id]
        @line = Line.find(params[:line_id])
      end
    end

end