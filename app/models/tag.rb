# == Schema Information
#
# Table name: tags
#
#  id         :integer          not null, primary key
#  _type      :integer
#  content    :text
#  page_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Tag < ApplicationRecord
  # To make content behave as an array
  serialize :content, Array

  enum _type: { a: 0, h1: 1, h2: 2, h3: 3 }

  validates_presence_of :_type, :content

  class << self
    def a_type
      Tag._types.fetch('a')
    end

    def h1_type
      Tag._types.fetch('h1')
    end

    def h2_type
      Tag._types.fetch('h2')
    end

    def h3_type
      Tag._types.fetch('h3')
    end
  end
end
