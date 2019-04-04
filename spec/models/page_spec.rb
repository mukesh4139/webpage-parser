require 'rails_helper'

RSpec.describe Page, type: :model do

  # Association Test
  # ensure Page model has 1:m relationship with the Tag model
  it { should have_many(:tags).dependent(:destroy) }

  # Validation Test
  # ensure column url are present before saving
  it { should validate_presence_of(:url) }
end
