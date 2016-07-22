require('spec_helper')

describe('Add a brand path', {:type => :feature}) do
  it('allows users to add a new brand to the database') do
    visit('/stores/new')
    fill_in('brand_name', :with => 'Nike')
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end
end
