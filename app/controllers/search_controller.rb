class SearchController < ApplicationController

  def show
    @result = Scraper.new('hn')
    @articles = @result.get_class_items
    unless @articles
      flash[:error] = 'Your URL was bad and you should feel bad'
      redirect_to root_path
    end
  end

end