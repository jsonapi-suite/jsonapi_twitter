class ApplicationRecord < ActiveRecord::Base
  include NestedAttributeReassignable
  self.abstract_class = true
end
