class Meeting < ApplicationRecord
  belongs_to :client, optional: true
  has_and_belongs_to_many :users
end
