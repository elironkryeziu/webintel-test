class SearchController < ApplicationController
  def index
    if params[:search].blank?  
      redirect_to(root_path, alert: "Empty field!") and return  
    else  
      @parameter = params[:search].downcase  
      @results = Article.all.where("lower(title) LIKE ?","%" + @parameter + "%")
    end 
  end
end
