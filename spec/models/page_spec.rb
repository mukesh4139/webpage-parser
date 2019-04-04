require 'rails_helper'

RSpec.describe Page, type: :model do
  # Association Test
  # ensure Page model has 1:m relationship with the Tag model
  it { should have_many(:tags).dependent(:destroy) }

  # Validation Test
  # ensure column url are present before saving
  it { should validate_presence_of(:url) }

  # Format Validations
  # Invalidity
  it "invalidates invalid url" do
    page = Page.new(url: "google")
    page.valid?
    expect(page.errors.messages[:url]).to match(["is not a valid HTTP URL"])
  end

  # Validity
  it "validates valid url" do
    page = Page.new(url: "https://wikipedia.org")
    expect(page).to be_valid
  end
end
