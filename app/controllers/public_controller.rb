class PublicController < ApplicationController

  layout 'public'

  before_action :setup_navigation

  def index
    # intro text
  end

  def show
    @product = Product.where(:permalink => params[:permalink], :visible => true).first
    if @product.nil?
      redirect_to(:action => 'index')
    else
      # display the page content using show.html.erb
    end

    @line = Line.where(:permalink => params[:permalink], :visible => true).first
    if @line.nil?
      redirect_to(:action => 'index')
    else
      # display the page content using show.html.erb
    end

  end

  private

    def setup_navigation
      @lines = Line.visible.sorted
    end

end
