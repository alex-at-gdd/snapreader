class SearchController < ApplicationController

  def show
    @result = Scraper.new(params[:news_source_slug])
    @articles = @result.get_items
    unless @articles
      flash[:error] = 'Your URL was bad and you should feel bad'
      redirect_to root_path
    end
  end

end