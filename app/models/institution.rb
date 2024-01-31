class Institution < ApplicationRecord
    has_many :students

    enum kind: {
        university: 0,
        school: 1,
        nursery: 2
    }

    validates :name, presence: true
    validates :cnpj, presence: true, uniqueness: true
    validates :kind, presence: true
end
