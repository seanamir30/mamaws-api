class Api::V1::Cart < ApplicationRecord
  belongs_to :user
  belongs_to :api_v1_item
end
