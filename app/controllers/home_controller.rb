class HomeController < ApplicationController
  def index
    @homepage = true
    @entries = Entry.search(params[:search])
  end
end