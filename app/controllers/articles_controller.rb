class ArticlesController < ApplicationController
  respond_to :docx

  before_action :set_article, only: %i[edit update show destroy]

  def new
    @article = Article.new
  end

  def show
  end

  def edit
  end

  def index
    @articles = Article.order(updated_at: :desc)
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:success] = "Article was saccessfully created"
      redirect_to @article
    else
      render 'new'
    end
  end

  def update
    if @article.update(article_params)
      flash[:success] = "Article was saccessfully updated"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    flash[:danger] = 'Article was successfully deleted'

    redirect_to articles_path
  end

  def word
    @article = Article.find(params[:id])

    # respond_with(@article, content: '<html><head></head><body><p>Hello</p></body></html>', filename: 'my_file.docx')
    # respond_with(@article, filename: 'my_file.docx')

    respond_to do |format|
      format.docx do
        render docx: 'word', filename: 'my_file.docx'
        # Alternatively, if you don't want to create the .docx.erb template you could
        # render docx: 'my_file.docx', content: '<html><head></head><body><p>Hello</p></body></html>'
      end
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
