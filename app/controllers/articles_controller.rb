require 'rss'
require 'open-uri'


class ArticlesController < ApplicationController
  def index
    @articles = Article.order(id: :desc)
  end

  def show
    @article = Article.find(params[:id])
  end

  def fill
    url = 'https://www.nasa.gov/rss/dyn/earth.rss'
    open(url) do |rss|
      feed = RSS::Parser.parse(rss)
      feed.items.each do |item|
        article = Article.where(title:item.title,body:item.description).first_or_create  
      end
    end
    redirect_to action: "index"
  end
end
