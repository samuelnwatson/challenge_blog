class ArticlesController < ApplicationController
	def index
		@articles = Article.all
	end

	def show
		@article = Article.find(params[:id])
		@comment = @article.comments.build
	end

private

	def article_params
		params.require(:article).permit(:name, :content)
	end

end
