require 'rss'
require 'open-uri'

namespace :fill_articles do
    task :update => :environment do
        url = 'https://www.nasa.gov/rss/dyn/earth.rss'
        open(url) do |rss|
          feed = RSS::Parser.parse(rss)
          feed.items.each do |item|
            article = Article.where(title:item.title,body:item.description).first_or_create  
          end
        end
        puts "Updated success!"
    end
  end