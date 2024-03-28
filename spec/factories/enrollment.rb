FactoryBot.define do
    factory :enrollment do
        total_course_cost { 12000 }
        invoices_number { 12 }
        invoices_due_day { 5 }
        course_name { 'Computer Science' }
        institution
        student
        enabled { true }
    end
end