require('bundler/setup')
Bundler.require(:default)

require('pry')

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/stores/new') do
  erb(:store_form)
end

post('/stores') do
  name = params.fetch('name')
  street = params[:street]
  city = params[:city]
  state = params[:state]
  phone = params[:phone]
  address = "#{street}\n#{city}, #{state}"
  @store = Store.create({:name => name, :address => address, :phone => phone})
  if @store.save()
    redirect('/stores/'.concat(@store.id().to_s()))
  else
    erb(:errors)
  end
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  erb(:store)
end
