class Enrollment < ApplicationRecord
  belongs_to :institution
  belongs_to :student
  has_many :invoices
  
  validates :total_course_cost, presence: true, numericality: { greater_than: 0 }
  validates :invoices_number, presence: true, numericality: { greater_than: 0 }
  validates :invoices_due_day, presence: true, numericality: { greater_than: 0, less_than: 32 }
  validates :course_name, presence: true
  validates :enabled, inclusion: { in: [true, false] }

  # validate :invoices_total_matches_enrollment_total
  # validate :number_of_invoices_matches_invoices_number

  # private

  # def invoices_total_matches_enrollment_total
  #   total_invoices_value = invoices.sum(:invoice_value)
  #   unless total_invoices_value == total_course_cost
  #     errors.add(:invoices, "The total value of all invoices must match the total course cost")
  #   end
  # end

  # def number_of_invoices_matches_invoices_number
  #   unless invoices.count == invoices_number
  #     errors.add(:invoices, "The number of invoices must match the invoices number")
  #   end
  # end
end
