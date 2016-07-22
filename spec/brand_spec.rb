require('spec_helper')

describe(Brand) do
  it('validates presence of name') do
    brand = Brand.new({:name => ''})
    expect(brand.save()).to(eq(false))
  end
  it('converts the name to title case') do
    brand = Brand.create({:name => 'new balance'})
    expect(brand.name()).to(eq('New Balance'))
  end
end
