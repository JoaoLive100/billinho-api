class EnrollmentsController < ApplicationController

    # GET /enrollments/student_enrollments/:student_id (enrollments by student id)
    def student_enrollments
        @enrollments = Enrollment.where(student_id: params[:student_id])

        render json: {status: 'SUCCESS', message: 'Loaded student enrollments', data: @enrollments}, status: :ok
    end

    # GET /enrollments/institution_enrollments/:institution_id (enrollments by institution id)
    def institution_enrollments
        @enrollments = Enrollment.where(institution_id: params[:institution_id])

        render json: {status: 'SUCCESS', message: 'Loaded institution enrollments', data: @enrollments}, status: :ok
    end

    # GET /enrollments/all (all enrollments)
    def all
        @enrollments = Enrollment.all

        render json: {status: 'SUCCESS', message: 'Loaded all enrollments', data: @enrollments}, status: :ok
    end

    # GET /enrollments (all enabled enrollments)
    def index
        @enrollments = Enrollment.where(enabled: true)

        render json: {status: 'SUCCESS', message: 'Loaded all enabled enrollments', data: @enrollments}, status: :ok
    end
    
    # GET /enrollments (all disabled enrollments)
    def disabled
        @enrollments = Enrollment.where(enabled: false)

        render json: {status: 'SUCCESS', message: 'Loaded disabled enrollments', data: @enrollments}, status: :ok
    end
    
    # GET /enrollments/:id (enrollment by id)
    def show
        @enrollment = Enrollment.find(params[:id])

        render json: {status: 'SUCCESS', message: 'Loaded enrollment', data: @enrollment}, status: :ok
    end
    
    # POST /enrollments (create enrollment)
    def create
        ActiveRecord::Base.transaction do
            @enrollment = Enrollment.new(enrollment_params)

            if @enrollment.save

                @invoices = CreateEnrollmentInvoices.new(@enrollment)
                @invoices.perform
                
                render json: {status: 'SUCCESS', message: 'Saved enrollment', data: @enrollment}, status: :ok
            else
                render json: {status: 'ERROR', message: 'Enrollment not saved', data: @enrollment.errors}, status: :unprocessable_entity
            end
        end
    end

    # PUT /enrollments/:id (update enrollment)
    def update
        @enrollment = Enrollment.find(params[:id])
        if @enrollment.update(enrollment_params)
            render json: {status: 'SUCCESS', message: 'Updated enrollment', data: @enrollment}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Enrollment not updated', data: @enrollment.errors}, status: :unprocessable_entity
        end
    end

    # DELETE /enrollments/:id (delete enrollment)
    def destroy
        ActiveRecord::Base.transaction do
            @enrollment = Enrollment.find(params[:id])
            @enrollment.update(enabled: false)
            render json: {status: 'SUCCESS', message: 'Deleted enrollment', data: @enrollment}, status: :ok
        end
    end
    
    private
    def enrollment_params
        params.require(:enrollment).permit(:total_course_cost, :invoices_number, :invoices_due_day, :course_name, :institution_id, :student_id)
    end
end
