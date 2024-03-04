class CreateEnrollmentInvoices

    def initialize(enrollment_params)
        @invoices_number = enrollment_params[:invoices_number]
        @invoice_value = (enrollment_params[:total_course_cost] / @invoices_number).round(2)
        @invoices_due_day = enrollment_params[:invoices_due_day]
        @invoice_status = 0
        @enrollment_id = enrollment_params[:id]
    end

    def perform
        validate!
        invoices_generate
    end

    def invoices_generate
        invoices = []
        @invoices_number.times do |i|
            invoices << Invoice.create(
                invoice_value: @invoice_value,
                due_date: Date.new(Date.today.year, Date.today.month, @invoices_due_day) + i.month,
                status: @invoice_status,
                enrollment_id: @enrollment_id
            )
        end
    end

    private

    def validate!
        raise "Invalid number of invoices" if @invoices_number < 1
        raise "Invalid invoice value" if @invoice_value < 0
        raise "Invalid invoices due day" if @invoices_due_day < 1 || @invoices_due_day > 31
    end

end