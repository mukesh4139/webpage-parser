module Requests
  module JsonHelpers
    def json
      JSON.parse(response.body)
    end

    def count_of_tags(type)
      tag_obect = json["included"].find {|tag| tag["attributes"]["-type"] == type}
      tag_obect.present? ? tag_obect["attributes"]["content"].size : 0
    end
  end
end
