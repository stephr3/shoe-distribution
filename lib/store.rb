class Store < ActiveRecord::Base
  validates(:name, :presence => true)
  validates(:phone, :length => { :maximum => 12 })
end
