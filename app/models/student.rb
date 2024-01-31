class Student < ApplicationRecord
    belongs_to :institution
    has_many :enrollments
    
    enum gender: {
        male: 0,
        female: 1
    }
    enum payment_method: {
        credit_card: 0,
        payment_slip: 1
    }

    validates :name, presence: true
    validates :cpf, presence: true, uniqueness: true
    validates :birth_date, presence: true
    validates :phone, presence: true
    validates :gender, presence: true
    validates :payment_method, presence: true

end
