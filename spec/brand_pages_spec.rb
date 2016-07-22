require('spec_helper')

describe('Add a brand path', {:type => :feature}) do
  it('allows users to add a new brand to the database') do
    visit('/stores/new')
    fill_in('brand_name', :with => 'Nike')
    click_button('Add Brand')
    expect(page).to have_content('Nike')
  end
end

describe('Add a brand to a store path', {:type => :feature}) do
  it('allows the users to add brands to a store') do
    Brand.create({:name => 'Nike'})
    visit('/stores/new')
    fill_in('name', :with => 'Shiekh')
    check('Nike')
    click_button('Add Store')
    expect(page).to have_content('Nike')
  end
end
