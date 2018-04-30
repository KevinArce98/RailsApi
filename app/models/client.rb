class Client < ApplicationRecord
    has_one :meeting, dependent: :nullify
    has_one :contact, dependent: :destroy
    has_one :ticket, dependent: :destroy 
end
