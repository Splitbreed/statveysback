class Business < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :service, presence: true
end
