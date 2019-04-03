# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  url        :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Page < ApplicationRecord

  has_many :tags
  has_one :a_tags, -> { where(_type: Tag.a_type) }, class_name: 'Tag'
  has_one :h1_tags, -> { where(_type: Tag.h1_type) }, class_name: 'Tag'
  has_one :h2_tags, -> { where(_type: Tag.h2_type) }, class_name: 'Tag'
  has_one :h3_tags, -> { where(_type: Tag.h3_type) }, class_name: 'Tag'

  before_create :parse

  validates_presence_of :url

  private

  def parse
    PageCreator.new(self).parse
  end
end
