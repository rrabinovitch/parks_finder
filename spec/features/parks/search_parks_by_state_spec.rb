require 'rails_helper'

RSpec.describe "User can search for parks by state" do
  it "When I select 'Tennessee' from the form,
    I see the total of parks found,
    And for each park I see:
      - full name of the park
      - description
      - direction info
      - standard hours for operation" do

    visit '/'
    select "Tennessee", from: :state
    click_on "Find Parks"
    expect(current_path).to eq(parks_path)
    expect(page).to have_content("16 Results")
    expect(page).to have_css(".park", count: 16)

    within(first(".park")) do
      expect(page).to have_css(".name")
      expect(page).to have_css(".description")
      expect(page).to have_css(".directions")
      expect(page).to have_css(".hours")
    end
  end
end
