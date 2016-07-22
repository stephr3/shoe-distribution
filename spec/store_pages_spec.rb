require('spec_helper')

describe('Add a store path', {:type => :feature}) do
  it('allows users to add a new store to the database') do
    visit('/')
    click_link('Add a New Store')
    fill_in('name', :with => 'Johnny Sole')
    fill_in('street', :with => '815 SW Alder St')
    fill_in('city', :with => 'Portland')
    fill_in('state', :with => 'OR')
    fill_in('phone', :with => '(503)225-1241')
    click_button('Add Store')
    expect(page).to have_content('Johnny Sole')
  end

  it('allows users to view a list of stores') do
    Store.create({:name => 'Shiekh'})
    visit('/stores')
    expect(page).to have_content('Shiekh')
  end
end

describe('Update a store path', {:type => :feature}) do
  it('allows users to update store information') do
    Store.create({:name => 'Shiekh'})
    visit('/stores')
    click_link('Shiekh')
    click_link('Update Store Information')
    fill_in('name', :with => 'Shiekh Shoes')
    click_button('Update')
    expect(page).to have_content('Shiekh Shoes')
  end
end
