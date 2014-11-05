class LinesController < ApplicationController
	before_filter :populate_lines

	layout "public"

	def index
		@products = @line.products.sorted
	end

	def show
		@line = Line.find(params[:id])
		@products = @line.products.sorted
	end

	private

	def populate_lines
		@lines = Line.all
	end		

end