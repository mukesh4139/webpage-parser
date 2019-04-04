require 'open-uri'

class HtmlParser

  def initialize(url)
    @url = url
  end

  def h1_tags
    nokogiri_object.xpath('//h1').map(&:text) rescue nil
  end

  def h2_tags
    nokogiri_object.xpath('//h2').map(&:text) rescue nil
  end

  def h3_tags
    nokogiri_object.xpath('//h3').map(&:text) rescue nil
  end

  def a_tags
    nokogiri_object.xpath('//a').map { |element| element["href"] } rescue nil
  end

  private

  def html
    @html ||= open(@url)
  rescue SocketError => exception
    puts "Error: #{exception}"
    nil
  end

  def nokogiri_object
    @nokogiri_object ||= Nokogiri::HTML(html) if html
  end
end
