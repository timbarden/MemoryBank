class HomeController < ApplicationController
  def index
      @entries = Entry.search(params[:search])
  end
end