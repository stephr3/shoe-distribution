class Brand < ActiveRecord::Base
  validates(:name, :presence => true)
  before_save(:titlecase_name)

private

  define_method(:titlecase_name) do
    self.name=(name().titlecase())
  end
end
