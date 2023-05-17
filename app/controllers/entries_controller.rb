class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy ]

  # GET /entries or /entries.json
  def index
    if params[:tag].nil?
      @entries = Entry.all.order("updated_at DESC")
    else
      @entries = Entry.tagged_with(params[:tag])
    end
    if !@entries.nil?
      @pagy, @entries = pagy(@entries.order("updated_at DESC"), items: 10)
    end
  end

  # GET /entries/1 or /entries/1.json
  def show
    @entry = Entry.find(params[:id])
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries or /entries.json
  def create
    @entry = Entry.new(entry_params.except(:tags).merge(user: current_user))
    # params from the form
    rebuild_taggings(@entry, params[:entry][:tags])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to entry_url(@entry), notice: "Entry was successfully created." }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1 or /entries/1.json
  def update
    rebuild_taggings(@entry, params[:entry][:tags])
    respond_to do |format|
      if @entry.update(entry_params.except(:tags).merge(user: current_user))
        format.html { redirect_to entry_url(@entry), notice: "Entry was successfully updated." }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1 or /entries/1.json
  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def rebuild_taggings(entry, tags)
      entry.taggings.destroy_all
      tags = tags.strip.split(',')
      tags.each do |tag|
        entry.tags << Tag.find_or_create_by(name: tag)
      end
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:question, :answer, :tags)
    end
end
