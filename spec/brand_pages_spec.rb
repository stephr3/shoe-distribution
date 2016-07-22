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
  it('allows the user to add brands to a store') do
    Brand.create({:name => 'Nike'})
    visit('/stores/new')
    fill_in('name', :with => 'Shiekh')
    check('Nike')
    click_button('Add Store')
    expect(page).to have_content('Nike')
  end

  it('allows the user to view all brands that a store carries') do
    store = Store.create({:name => 'Shiekh'})
    store.brands().create({:name => 'Nike'})
    visit('/stores')
    click_link('Shiekh')
    expect(page).to have_content('Nike')
  end
end

describe('Deal with brands when updating a store path', {:type => :feature}) do
  it('allows the user to add a brand when updating store information') do
    Store.create(:name => 'Shiekh')
    Brand.create(:name => 'Nike')
    visit('/stores')
    click_link('Shiekh')
    click_link('Update Store Information')
    check('Nike')
    click_button('Update')
    expect(page).to have_content('Nike')
  end
  it('allows the user to remove a brand when updating store information') do
    store = Store.create(:name => 'Shiekh')
    store.brands().create(:name => 'Nike')
    visit('/stores')
    click_link('Shiekh')
    click_link('Update Store Information')
    check('Nike')
    click_button('Update')
    expect(page).to have_no_content('Nike')
  end
end
