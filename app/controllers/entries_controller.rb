class EntriesController < ApplicationController
  before_action :set_entry, only: %i[ show edit update destroy ]
  before_action :destroy_unused_tags, only: %i[ update destroy ]
  before_action :set_breadcrumbs

  # GET /entries
  def index
    if params[:tag].nil?
      @entries = Entry.all.order("updated_at DESC")
    else
      @entries = Entry.tagged_with(params[:tag])
    end
    if !@entries.nil?
      @pagy, @entries = pagy(@entries.order("updated_at DESC"), items: 10)
    end
    @tagcloud = true
    add_breadcrumb("Entries", entries_path)
  end

  # GET /entries/1
  def show
    @entry = Entry.find(params[:id])
    add_breadcrumb("Entries", entries_path)
    add_breadcrumb(@entry.question, entry_path(@entry))
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
    add_breadcrumb("Entries", entries_path)
    add_breadcrumb(@entry.question, edit_entry_path(@entry))
  end

  # POST /entries
  def create
    @entry = Entry.new(entry_params.except(:tags).merge(user: current_user))
    # params from the form
    rebuild_taggings(@entry, params[:entry][:tags])

    respond_to do |format|
      if @entry.save
        format.html { redirect_to entry_url(@entry), notice: "Entry was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  def update
    rebuild_taggings(@entry, params[:entry][:tags])
    respond_to do |format|
      if @entry.update(entry_params.except(:tags).merge(user: current_user))
        format.html { redirect_to entry_url(@entry), notice: "Entry was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  def destroy
    @entry.destroy

    respond_to do |format|
      format.html { redirect_to entries_url, notice: "Entry was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    def destroy_unused_tags
      @entry.taggings.all.find_each do |t|
        if Tagging.where(tag_id: t.tag_id).count == 1
          Tag.destroy(t.tag_id)
        end
      end
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
      params.require(:entry).permit(:question, :content, :tags)
    end
end
