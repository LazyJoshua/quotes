class Company < ApplicationRecord
  validates_presence_of :name
  has_many :users, dependent: :destroy
  has_many :quotes, dependent: :destroy
end
