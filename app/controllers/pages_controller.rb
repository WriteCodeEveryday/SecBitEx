class PagesController < ApplicationController
	def show
		render "pages/#{params[:id]}"
	end
end