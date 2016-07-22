require('spec_helper')

describe(Store) do
  it('validates presence of name') do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end
  it('ensures the length of phone is at most 13 characters') do
    store = Store.new({:name => 'Shiekh', :phone => '1'.*(14)})
    expect(store.save()).to(eq(false))
  end
  it('converts the name to title case') do
    store = Store.create({:name => 'johnny sole'})
    expect(store.name()).to(eq('Johnny Sole'))
  end
end
