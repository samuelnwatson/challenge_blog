class ArticlesController < ApplicationController
	def index
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article, notice: "Article has been published." 
		else
			#
		end
	end

	def show
		@article = Article.find(params[:id])
	end

private

	def article_params
		params.require(:article).permit(:name, :content)
	end

end
