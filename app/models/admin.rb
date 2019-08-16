class Admin < ApplicationRecord
  has_secure_password
  serialize :days_availability, Array
  has_one :setting
end
