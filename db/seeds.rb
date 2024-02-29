# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
50.times do
    Institution.create({
        name: Faker::Educator.university,
        cnpj: Faker::Company.brazilian_company_number,
        kind: rand(0..2),
        enabled: true
    })
end

50.times do
    Student.create({
        name: Faker::Name.name,
        cpf: Faker::IDNumber.brazilian_citizen_number,
        birth_date: Faker::Date.birthday(min_age: 18, max_age: 65),
        phone: Faker::PhoneNumber.cell_phone,
        gender: rand(0..1),
        payment_method: rand(0..1),
        enabled: true
    })
end