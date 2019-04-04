require 'rails_helper'

RSpec.describe Tag, type: :model do
  # Association Test
  # ensure a tag record belongs to a single Page model
  it { should belong_to(:page) }

  # Validation Test
  # ensure column _type and content are present before saving
  it { should validate_presence_of(:_type) }
  it { should validate_presence_of(:content) }
end
