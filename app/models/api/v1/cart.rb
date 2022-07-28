class Api::V1::Cart < ApplicationRecord
  belongs_to :user
  has_one :api_v1_item
end
