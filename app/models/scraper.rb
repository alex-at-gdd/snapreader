require 'nokogiri'
require 'open-uri'

class Scraper

  def initialize(news_source)
    @news_source = news_source
  end

  def get_items
    if @data = data(NEWS_SOURCES[@news_source]['source'])
      @data.css(NEWS_SOURCES[@news_source]['title_class'])
    else
      nil
    end
  end

  private
    def data(source)
      begin
        Nokogiri::HTML(open(source))
        # do more stuff
      rescue Exception => ex
        #better error handling here
        puts ("Failed at #{Time.now}" + "Error: #{ex}" + "URL: " + source)
      end
    end
end