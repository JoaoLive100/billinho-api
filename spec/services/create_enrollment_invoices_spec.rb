require 'rails_helper'
require 'spec_helper'
RSpec.describe CreateEnrollmentInvoices do
    describe ".perform" do
        let(:enrollment) { create(:enrollment) }
        let(:create_enrollment_invoices) { described_class.new(enrollment).perform }

        context "when enrollment invoices number are less than 1" do
            let (:enrollment) { create(:enrollment, invoices_number: 0) }

            it "raises an error" do
                expect { create_enrollment_invoices }.to raise_error("Invalid number of invoices")
            end
        end

        context "when invoice value is less than 0" do
            let(:enrollment) { create(:enrollment, invoices: 0, total_course_cost: 1000) }
            
            it "raises an error" do
                expect { create_enrollment_invoices }.to raise_error("Invalid number of invoices")
            end
        end

        context "when invoice due day is less than 1" do
            let(:enrollment) { create(:enrollment, invoices_number: 1, invoices_due_day: 0) }
            
            it "raises an error" do
                expect { create_enrollment_invoices }.to raise_error("Invalid invoices due day")
            end
        end

        context "when don\'t saves the invoices" do
            before { allow_any_instance_of(Invoice).to receive(:save).and_return(false) }

        end
    end
end