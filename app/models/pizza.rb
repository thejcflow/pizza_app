class Pizza < ApplicationRecord
  validates :pizza_type, presence: true
  validates :cheese, presence: true
  validates :sauce, presence: true
  validates :crust, presence: true
  validates :size, presence: true
end
