class Admin < ApplicationRecord
  has_secure_password
  serialize :days_availability, Array
end
