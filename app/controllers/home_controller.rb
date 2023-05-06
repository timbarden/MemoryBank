class HomeController < ApplicationController
  def index
    @homepage = true
    @entries = Entry.search(params[:search])
    if @entries
      @pagy, @entries = pagy(Entry.search(params[:search]), items: 10)
    end
  end
end