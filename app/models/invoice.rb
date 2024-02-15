class Invoice < ApplicationRecord
  belongs_to :enrollment
  
  enum status: {
    open_invoice: 0,
    late_invoice: 1,
    paid_invoice: 2
  }
end
