class Category < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :payments, through: :transactions
  has_one_attached :icon
end
