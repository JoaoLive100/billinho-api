class Student < ApplicationRecord
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
    validates :gender, presence: true, inclusion: { in: genders.keys }
    validates :payment_method, presence: true, inclusion: { in: payment_methods.keys }
    validates :enabled, inclusion: { in: [true, false] }
end
