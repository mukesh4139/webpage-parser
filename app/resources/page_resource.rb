class PageResource < JSONAPI::Resource
  attributes :url
  has_many :tags
end
