class Friendship < ApplicationRecord
  belongs_to :friender, class_name: 'User', optional: true
  belongs_to :friendee, class_name: 'User', optional: true
end
