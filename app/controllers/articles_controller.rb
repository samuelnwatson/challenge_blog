class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article, notice: "Article has been published." 
		else
			flash.now[:alert] = "Article has not been published."
			render "new"
		end
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
		@article = Article.find(params[:id])

		if @article.update(article_params)
			redirect_to @article, notice: "Article has been edited."
		else
			flash.now[:alert] = "Article has not been edited."
			render "edit"
		end
	end

	def destroy
		@article = Article.find(params[:id])
		@article.destroy

		redirect_to articles_path, notice: "Article has been deleted."
	end

	def show
		@article = Article.find(params[:id])
	end

private

	def article_params
		params.require(:article).permit(:name, :content)
	end

end
