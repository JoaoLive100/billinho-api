FactoryBot.define do
    factory :student do
        name { 'Student' }
        cpf { '12345678901' }
        birth_date { '2000-01-01' }
        phone { '123456789' }
        gender { 0 }
        payment_method { 0 }
        enabled { true }
    end
end