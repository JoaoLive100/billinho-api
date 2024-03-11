class InvoicesController < ApplicationController

    # GET /invoices/student_invoices/:student_id (invoices by student id)
    def enrollment_invoices
        @invoices = Invoice.where(enrollment_id: params[:enrollment_id])

        render json: {status: 'SUCCESS', message: 'Loaded enrollment invoices', data: @invoices}, status: :ok
    end

    # GET /invoices/institution_invoices/:institution_id (invoices by institution id)
    def institution_invoices
        @invoices = Invoice.where(institution_id: params[:institution_id])

        render json: {status: 'SUCCESS', message: 'Loaded institution invoices', data: @invoices}, status: :ok
    end

    # GET /invoices/enrollment_invoices/:enrollment_id (invoices by enrollment id)
    def enrollment_invoices
        @invoices = Invoice.where(enrollment_id: params[:enrollment_id])

        render json: {status: 'SUCCESS', message: 'Loaded enrollment invoices', data: @invoices}, status: :ok
    end
    
    # GET /invoices/all (all invoices)
    def all
        @invoices = Invoice.all

        render json: {status: 'SUCCESS', message: 'Loaded all invoices', data: @invoices}, status: :ok
    end

    # GET /invoices (all enabled invoices)
    def index
        @invoices = Invoice.where(enabled: true)

        render json: {status: 'SUCCESS', message: 'Loaded all enabled invoices', data: @invoices}, status: :ok
    end

    # GET /invoices (all disabled invoices)
    def disabled
        @invoices = Invoice.where(enabled: false)

        render json: {status: 'SUCCESS', message: 'Loaded disabled invoices', data: @invoices}, status: :ok
    end
    
    # GET /invoices/:id (invoice by id)
    def show
        @invoice = Invoice.find(params[:id])

        render json: {status: 'SUCCESS', message: 'Loaded invoice', data: @invoice}, status: :ok
    end
    
    # POST /invoices (create invoice)
    def create
        @invoice = Invoice.new(invoice_params)
        if @invoice.save
            render json: {status: 'SUCCESS', message: 'Saved invoice', data: @invoice}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Invoice not saved', data: @invoice.errors}, status: :unprocessable_entity
        end
    end

    # PUT /invoices/:id (update invoice)
    def update
        @invoice = Invoice.find(params[:id])
        if @invoice.update_attributes(invoice_params)
            render json: {status: 'SUCCESS', message: 'Updated invoice', data: @invoice}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Invoice not updated', data: @invoice.errors}, status: :unprocessable_entity
        end
    end

    # DELETE /invoices/:id (delete invoice)
    def destroy
        ActiveRecord::Base.transaction do
            @invoice = Invoice.find(params[:id])
            @invoice.destroy
            render json: {status: 'SUCCESS', message: 'Deleted invoice', data: @invoice}, status: :ok
        end
    end
    
    private
    def invoice_params
        params.require(:invoice).permit(:invoice_value, :due_date, :status, :enrollment_id)
    end
end
