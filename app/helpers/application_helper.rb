module ApplicationHelper

  def nokogiri_escape(string)
    string.gsub('â', '\'')
  end
end
