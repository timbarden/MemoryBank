class HomeController < ApplicationController

  def index
    @homepage = true
    @entries = Entry.search(params[:search])
    if @entries
      # TODO: potentially bad practice using pagy_array in these circumstances
      # https://ddnexus.github.io/pagy/docs/extras/array/
      @pagy, @entries = pagy_array(Entry.search(params[:search]), items: 10)
    end
  end

end