class Enrollment < ApplicationRecord
  belongs_to :institutions
  belongs_to :students
  has_many :invoices
  
end
