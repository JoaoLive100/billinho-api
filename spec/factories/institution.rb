FactoryBot.define do
    factory :institution do
        name { 'Institution' }
        cnpj { '12345678901234' }
        kind { 0 }
        enabled { true }
    end
end