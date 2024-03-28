class Enrollment < ApplicationRecord
  belongs_to :institution
  belongs_to :student
  has_many :invoices
  
  # validates :total_course_cost, presence: true, numericality: { greater_than: 0 }
  # validates :invoices_number, presence: true, numericality: { greater_than: 0 }
  # validates :invoices_due_day, presence: true, numericality: { greater_than: 0, less_than: 32 }
  validates :course_name, presence: true
  validates :enabled, inclusion: { in: [true, false] }
end
