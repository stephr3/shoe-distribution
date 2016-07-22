require('bundler/setup')
Bundler.require(:default)

require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores/new') do
  @brands = Brand.all()
  erb(:store_form)
end

post('/stores') do
  name = params.fetch('name')
  street = params[:street]
  city = params[:city]
  state = params[:state]
  phone = params[:phone]
  address = "#{street}\n#{city}, #{state}"
  brand_ids = params[:brand_ids]
  @store = Store.create({:name => name, :address => address, :phone => phone, :brand_ids => brand_ids})
  if @store.save()
    redirect('/stores/'.concat(@store.id().to_s()))
  else
    erb(:store_errors)
  end
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  erb(:store)
end

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

get('/stores/:id/edit') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = Brand.all() - @store.brands()
  erb(:store_edit)
end

patch('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  name = params.fetch('name')
  address = params[:address]
  phone = params[:phone]
  new_brand_ids = params[:brand_ids]
  remove_brand_ids = params[:remove_brand_ids]
  if remove_brand_ids
    remove_brand_ids.each() do |id|
      @store.brands().destroy(Brand.find(id))
    end
  end
  all_brand_ids = []
  @store.brands.each() do |brand|
    all_brand_ids.push(brand.id())
  end
  if new_brand_ids
    new_brand_ids.each() do |id|
      all_brand_ids.push(id)
    end
  end
  @store.update({:name => name, :address => address, :phone => phone, :brand_ids => all_brand_ids})
  if @store.save()
    redirect('/stores/'.concat(@store.id().to_s()))
  else
    erb(:store_errors)
  end
end

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @store.destroy()
  redirect('/stores')
end

post('/brands') do
  name = params.fetch('brand_name')
  @brand = Brand.create({:name => name})
  if @brand.save()
    redirect back
  else
    erb(:brand_errors)
  end
end

get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end
