class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy, :review_illustrations]
 
  def all_books
    render json: Book.all
  end

  # GET /books
  def index
    @books = []
    booksFromSearch = Book.search(params[:searchTerm])
    genres      = params[:searchTerm] ? booksFromSearch.distinct.pluck(:genre) : Book.distinct.pluck(:genre)
    page        = (params[:page] || 1).to_i
    per_page    = 4
    total_pages = (genres.count.to_f / per_page).ceil
    total_pages = 1 if total_pages.zero?
    start_genre = (page-1)*per_page
    genres[ start_genre...(start_genre+per_page)].each { |genre| @books.push({genre: genre, books: ( params[:searchTerm] ? booksFromSearch.where(genre: genre) : Book.where(genre: genre) ) }) }
    respond_to do |format|
      format.html { }
      format.json do
        render json: { genres: @books, page: page, totalPages: total_pages }
       
      end
    end
  end
 
   # GEper_pageT /books/1
   def show
    @chapters = @book.chapters
    p @book.cover
    p "PARAMS"
    p "PARAMS"
    p "PARAMS"
    p "PARAMS"
    @favorite = current_user.favorites.exists?(@book.id)
  end
 
  # GET /books/new
  def new
    @book = Book.new
  end
 
  # GET /books/1/edit
  def edit
  end
 
  # POST /books
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
 
    respond_to do |format|
      if @book.save
        format.html { redirect_to @book, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
        @book.cover.attach(book_params[:cover])
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
 
  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def my_books
    if current_user.user_type == "Author"
      @books = Book.where(user_id: current_user.id)
    else 
      redirect_to root_url
    end
  end

  def review_illustrations
    @illustrations = @book.illustrations.where(approved: nil)  
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end
 
    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :genre, :user_id, :cover)
    end
 end
 
