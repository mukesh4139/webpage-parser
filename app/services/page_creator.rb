class PageCreator
  attr_accessor :page

  def initialize(page)
    @page = page
  end

  def parse
    page.tags << Tag.new(content: html_parser.h1_tags, _type: Tag.h1_type)
    page.tags << Tag.new(content: html_parser.h2_tags, _type: Tag.h2_type)
    page.tags << Tag.new(content: html_parser.h3_tags, _type: Tag.h3_type)
    page.tags << Tag.new(content: html_parser.a_tags, _type: Tag.a_type)
  end

  def html_parser
    @html_parser ||= HtmlParser.new(page.url)
  end
end
