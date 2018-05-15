class ArticlesController<ApplicationController
  #GET /articles
  def index
    # se traduce en SELECT * FROM  articles, de sql
    @articles = Article.all
  end

  #GET /articles/:id
  def show
    @article = Article.find(params[:id])
  end

  #GET  /articles/new
  def new
    @article  = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  #POST  /articles
  def create
    # se traduce en INSERT INTO de sql
    #@article  = Article.new(title: params[:article][:title],body: params[:article][:body])
    #@article  = Article.new(params[:article]) no funciona por strong params
    @article  = Article.new(article_params) #este funciona con la definicion de strong params
    # @article  = Article.new(title: params[:article][:title],body: params[:article][:body])
    # la linea anterior reemplaza al Article.new y nos ahorra el @article.save
    if @article.save then
      redirect_to @article
    else
      render :new
    end
  end
  #DELETE /articles/:id
  def destroy
    # se traduce en DELETE FROM articles, de sql
    @article = Article.find(params[:id])
    @article.destroy  # elimina el objeto dela base de datos
    redirect_to articles_path
  end
  #PUT /articles/:id
  def update
    # se traduce en UPDATE  de sql
    # @article.update_attributes({title: 'ej; Titulo actualizado'})
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private
  def article_params
    params.require(:article).permit(:title,:body)
  end
end
