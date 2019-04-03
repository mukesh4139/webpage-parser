require 'open-uri'

class HtmlParser
  attr_reader :nokogiri_object

  def initialize(url)
    html = open(url)
    @nokogiri_object = Nokogiri::HTML(html)
  end

  def h1_tags
    nokogiri_object.xpath('//h1').map(&:text)
  end

  def h2_tags
    nokogiri_object.xpath('//h2').map(&:text)
  end

  def h3_tags
    nokogiri_object.xpath('//h3').map(&:text)
  end

  def a_tags
    nokogiri_object.xpath('//a').map { |element| element["href"] }
  end
end
