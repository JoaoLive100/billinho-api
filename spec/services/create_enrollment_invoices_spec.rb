require 'rails_helper'
require 'spec_helper'
RSpec.describe CreateEnrollmentInvoices do
    describe ".perform" do
        let(:enrollment) { create(:enrollment) }
        let(:subject) { described_class.new(enrollment) }

        context "when enrollment is valid" do
            context "when due_day is less or equal to today" do
                before do
                    travel_to Date.new(2024, 3, 5)
                end

                let (:enrollment) { create(:enrollment, invoices_due_day: 1) }

                it "creates invoices with due date in the next month" do
                    expect { subject.perform }.to change { Invoice.count }.by(12)
                    expect(Invoice.where(enrollment_id: enrollment.id).first.due_date).to eq(Date.new(2024, 4, 1))
                end
            end

            context "when due_day is greater than today" do
                before do
                    travel_to Date.new(2024, 3, 1)
                end

                let(:enrollment) { create(:enrollment, invoices_due_day: 5) }

                it "creates invoices with due date in the current month" do
                    expect { subject.perform }.to change { Invoice.count }.by(12)
                    expect(Invoice.where(enrollment_id: enrollment.id).first.due_date).to eq(Date.new(2024, 3, 5))
                end
            end

            context "when due_day is the last day of the month" do
                before do
                    travel_to Date.new(2024, 4, 1)
                end

                let(:enrollment) { create(:enrollment, invoices_due_day: 31) }

                it "creates invoices with due date in the next month" do
                    expect { subject.perform }.to change { Invoice.count }.by(12)
                    expect(Invoice.where(enrollment_id: enrollment.id).first.due_date).to eq(Date.new(2024, 4, 30))
                end
            end
        end

        context "when enrollment is invalid" do
            context "when invoices_number is invalid" do
                let(:enrollment) { create(:enrollment, invoices_number: 0) }

                it "raises an error" do
                    expect { subject.perform }.to raise_error("Invalid number of invoices")
                end
            end

            context "when invoice_value is invalid" do
                let(:enrollment) { create(:enrollment, total_course_cost: 0) }

                it "raises an error" do
                    expect { subject.perform }.to raise_error("Invalid invoice value")
                end
            end

            context "when invoices_due_day is invalid" do
                context "when invoices_due_day is less than 1" do
                    let(:enrollment) { create(:enrollment, invoices_due_day: 0) }

                    it "raises an error" do
                        expect { subject.perform }.to raise_error("Invalid invoices due day")
                    end
                end

                context "when invoices_due_day is greater than 31" do
                    let(:enrollment) { create(:enrollment, invoices_due_day: 32) }

                    it "raises an error" do
                        expect { subject.perform }.to raise_error("Invalid invoices due day")
                    end
                end
            end

            context "when invoice is not saved" do
                let(:enrollment) { create(:enrollment) }

                before do
                    allow_any_instance_of(Invoice).to receive(:save).and_return(false)
                end

                it "raises an error" do
                    expect { subject.perform }.to raise_error("Invoice not saved")
                end
            end

            context "when invoice is saved" do
                let(:enrollment) { create(:enrollment) }

                before do
                    allow_any_instance_of(Invoice).to receive(:save).and_return(true)
                end

                it "does not raise an error" do
                    expect { subject.perform }.not_to raise_error
                end
            end
        end
    end
end