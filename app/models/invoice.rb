class Invoice < ApplicationRecord
  belongs_to :enrollment
  
  enum status: {
    open_invoice: 0,
    late_invoice: 1,
    paid_invoice: 2
  }

  # validates :invoice_value, presence: true, numericality: { greater_than: 0 }
  validates :due_date, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :enabled, inclusion: { in: [true, false] }
end
