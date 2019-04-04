class HttpUrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    record.errors[attribute] << (options[:message] || "is not a valid HTTP URL") unless url_valid?(value)
  end

  def url_valid?(url)
    url = URI.parse(url) rescue false
    (url.kind_of?(URI::HTTP) || url.kind_of?(URI::HTTPS)) && !url.host.nil?
  end
end
