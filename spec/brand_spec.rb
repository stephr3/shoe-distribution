require('spec_helper')

describe(Brand) do
  it('validates presence of name') do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end
  it('belongs to a store') do
    store = Store.create({:name => 'Shiekh'})
    brand = store.brands().new({:name => 'Nike'})
    expect(store.brands()).to(eq([brand]))
  end
  describe('Brand#titlecase_name') do
    it('converts the name to title case') do
      brand = Brand.create({:name => 'new balance'})
      expect(brand.name()).to(eq('New Balance'))
    end
  end
end
