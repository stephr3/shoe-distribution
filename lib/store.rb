class Store < ActiveRecord::Base
  validates(:name, :presence => true)
  validates(:phone, :length => { :maximum => 13 })
  before_save(:titlecase_name)

private

  define_method(:titlecase_name) do
    self.name=(name().titlecase())
  end
end
