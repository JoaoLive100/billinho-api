class CreateEnrollmentInvoices

    def initialize(enrollment)
        @enrollment = enrollment

        @invoices_number = @enrollment.invoices_number.to_i
        @invoice_value = (@enrollment.total_course_cost.to_f / @invoices_number).round(2)
        @invoices_due_day = @enrollment.invoices_due_day.to_i
        @invoice_status = 0
        @enrollment_id = @enrollment.id
    end

    def perform
        validate!
        invoices_generate
    end

    def invoices_generate
        invoices = []
        due_month = @invoices_due_day <= Date.today.day ? 1 : 0
        @invoices_number.times do |i|
            invoice = Invoice.create({
                invoice_value: @invoice_value,
                due_date: Date.new(Date.today.year, Date.today.month, @invoices_due_day) + i.month + due_month.month,
                status: @invoice_status,
                enrollment_id: @enrollment.id
            })
            unless invoice.save
                raise StandardError, "Invoice not saved: #{invoice.errors.full_messages.join(', ')}"
            end
        end
    end

    private

    def validate!
        raise "Invalid number of invoices" if @invoices_number < 1
        raise "Invalid invoice value" if @invoice_value < 0
        raise "Invalid invoices due day" if @invoices_due_day < 1 || @invoices_due_day > 31
    end

end