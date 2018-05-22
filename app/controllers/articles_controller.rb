class ArticlesController<ApplicationController
  before_action  :authenticate_user! , except: [:show,:index]
  before_action :set_article, except: [:new,:index,:create]
  #GET /articles
  def index
    # se traduce en SELECT * FROM  articles, de sql
    @articles = Article.all
  end

  #GET /articles/:id
  def show
    @article.update_visits_count
    @comment = Comment.new 
  end

  #GET  /articles/new
  def new
    @article  = Article.new
  end

  def edit

  end

  #POST  /articles
  def create
    # se traduce en INSERT INTO de sql
    #@article  = Article.new(title: params[:article][:title],body: params[:article][:body])
    #@article  = Article.new(params[:article]) no funciona por strong params

      @article  = current_user.articles.new(article_params) #este funciona con la definicion de strong params
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

    @article.destroy  # elimina el objeto dela base de datos
    redirect_to articles_path
  end
  #PUT /articles/:id
  def update
    # se traduce en UPDATE  de sql
    # @article.update_attributes({title: 'ej; Titulo actualizado'})

    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end
  def validate_user
    redirect_to new_user_session_path , notice: "Tienes que iniciar sesion antes"
  end
  def article_params
    params.require(:article).permit(:title,:body)
  end
end
