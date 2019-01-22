class ChaptersController < ApplicationController
  before_action :set_book, only: [:new, :create, :index, :edit]
  before_action :set_chapter, only: [ :show, :edit, :update, :destroy]
  before_action :set_chapters, only: [:index]

  # GET /chapters
  # GET /chapters.json
  def index
    respond_to do |format|
      format.html do
      end
      format.json do
        render json: { chapters: @chapters }
      end
    end
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
  end

  # GET /chapters/new
  def new
    @chapter = Chapter.new
    @illustrations = Illustration.where(book_id: @book.id)
  end

  # GET /chapters/1/edit
  def edit
    @chapter = Chapter.find(params[:id])
    @illustrations = Illustration.where(book_id: @chapter.book_id, approved: true).order({created_at: :desc})
  end

  # POST /chapters
  # POST /chapters.json

  def create
    @chapter = Chapter.new(chapter_params)
    @chapter.book = @book
    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @book, notice: 'Chapter was successfully created.' }
        format.json { render :show, status: :created, location: @chapter }
      else
        format.html { render :new }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chapters/1
  # PATCH/PUT /chapters/1.json
  def update
    respond_to do |format| 
      if @chapter.update(chapter_params)
        format.html { redirect_to book_chapters_path, notice: 'Chapter was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter.destroy
    respond_to do |format|
      format.html { redirect_to book_path, notice: 'Chapter was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  private
    def set_book
      @book = Book.find(params[:book_id])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    def set_chapters
      @chapters  = @book.chapters.order(id: :asc) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chapter_params
      params.require(:chapter).permit(:name, :content, :book_id)
    end
end
