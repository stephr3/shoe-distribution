require('spec_helper')

describe(Store) do
  it('validates presence of name') do
    store = Store.new({:name => ''})
    expect(store.save()).to(eq(false))
  end
  it('ensures the length of phone is at most 12 characters') do
    store = Store.new({:name => 'Shiekh', :phone => '1'.*(13)})
    expect(store.save()).to(eq(false))
  end
end
