# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require_relative '../app/services/enrollment_invoices/create_enrollment_invoices'

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

50.times do
    Enrollment.create({
        total_course_cost: Faker::Number.decimal(l_digits: 4, r_digits: 2),
        invoices_number: rand(1..12),
        invoices_due_day: rand(1..31),
        course_name: Faker::Educator.course_name,
        institution_id: rand(1..50),
        student_id: rand(1..50),
        enabled: true
    })
    # CreateEnrollmentInvoices.perform(Enrollment.last, Enrollment.last.attributes)

    # Create instance of CreateEnrollmentInvoices and perform invoice generation
    # create_enrollment_invoices = CreateEnrollmentInvoices.new(Enrollment.last, Enrollment.last.attributes)
    # create_enrollment_invoices.perform
end

