class StudentsController < ApplicationController

    # GET /students/all (all students)
    def all
        @students = Student.all

        render json: {status: 'SUCCESS', message: 'Loaded all students', data: @students}, status: :ok
    end

    # GET /students (all enabled students)
    def index
        @students = Student.where(enabled: true)

        render json: {status: 'SUCCESS', message: 'Loaded enabled students', data: @students}, status: :ok
    end
    
    # GET /students/disabled (all disabled students)
    def disabled
        @students = Student.where(enabled: false)

        render json: {status: 'SUCCESS', message: 'Loaded disabled students', data: @students}, status: :ok
    end

    # GET /students/:id (student by id)
    def show
        @student = Student.find(params[:id])

        render json: {status: 'SUCCESS', message: 'Loaded student', data: @student}, status: :ok
    end
    
    # POST /students (create student)
    def create
        @student = Student.new(student_params)
        if @student.save
            render json: {status: 'SUCCESS', message: 'Saved student', data: @student}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Student not saved', data: @student.errors}, status: :unprocessable_entity
        end
    end

    # PUT /students/:id (update student)
    def update
        @student = Student.find(params[:id])
        if @student.update(student_params)
            render json: {status: 'SUCCESS', message: 'Updated student', data: @student}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Student not updated', data: @student.errors}, status: :unprocessable_entity
        end
    end

    # DELETE /students/:id (delete student)
    def destroy
        ActiveRecord::Base.transaction do
            @student = Student.find(params[:id])
            @student.update(enabled: false)
            render json: {status: 'SUCCESS', message: 'Deleted student', data: @student}, status: :ok
        end
    end
    
    private
    def student_params
        params.require(:student).permit(:name, :cpf, :birth_date, :phone, :gender, :payment_method)
    end
end
