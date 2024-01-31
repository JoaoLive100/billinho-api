class Enrollment < ApplicationRecord
  belongs_to :student
  has_many :invoices

  has_many :invoices
end
