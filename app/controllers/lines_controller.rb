class LinesController < ApplicationController

	layout "admin"

	before_action :confirm_logged_in

	def index
		@lines = Line.all
	end

	def show
		@line = Line.find(params[:id])
	end

	def new
		@line = Line.new({:name => "Default"})
		@line_count = Line.count + 1
	end

	def create
    # Instantiate a new object using form parameters
    @line = Line.new(line_params)
    # Save the object
    if @line.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Product line created successfully."
      redirect_to(:action => 'index')
    else
      # If save fails, redisplay the form so user can fix problems
      @line_count = Line.count + 1
      render('new')
    end
  end

  def edit
  	@line = Line.find(params[:id])
  	@line_count = Line.count
  end

  def update
    # Find an existing object using form parameters
    @line = Line.find(params[:id])
    # Update the object
    if @line.update_attributes(line_params)
      # If update succeeds, redirect to the index action
      flash[:notice] = "Product Line updated successfully."
      redirect_to(:action => 'show', :id => @line.id)
    else
      # If update fails, redisplay the form so user can fix problems
      @line_count = Line.count
      render('edit')
    end
  end

  def delete
  	@line = Line.find(params[:id])
  end

  def destroy
  	line = Line.find(params[:id]).destroy
  	flash[:notice] = "Product Line '#{line.name}' has been removed successfully."
  	redirect_to(:action => 'index')
  end


  private

  def line_params
      # same as using "params[:line]", except that it:
      # - raises an error if :line is not present
      # - allows listed attributes to be mass-assigned
      params.require(:line).permit(:name, :position, :visible, :created_at)
    end

end