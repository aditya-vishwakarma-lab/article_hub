class ArticlesController < ApplicationController
  load_and_authorize_resource
  # before_action :authenticate_author!, if: :author_signed_in?
  # before_action :authenticate_reader!, if: :reader_signed_in?
  before_action :set_article, only: %i[ show edit update destroy ]
  # GET /articles or /articles.json
  def index
    # binding.pry
    @articles = Article.published
  end

  def search
    @articles = Article.published.where("title like ?", "%#{params[:query]}%")
    authors = Author.where("email like ?", "%#{params[:query]}%")
    authors.each do |author|
      puts "author mail is #{author.email}"
      @articles += author.articles
    end
    render 'articles/index'
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = current_author.articles.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @article = current_author.articles.new(article_params)

    respond_to do |format|
      if @article.save
        publish_article
        format.html { redirect_to article_url(@article), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        publish_article
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end


    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :body, :publish_time)
    end

    def publish_article
      # Avoids queing job if the publish time has passed already
      if (@article.publish_time).nil?
        PublishArticleJob.perform_now(@article, @article.publish_time)
      elsif DateTime.current < @article.publish_time
        PublishArticleJob.set(wait_until: @article.publish_time).perform_later(@article, @article.publish_time)
      end
    end
end
