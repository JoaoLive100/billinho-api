class EnrollmentsController < ApplicationController
    def index
        @enrollments = Enrollment.all
    end
    
    def show
        @enrollment = Enrollment.find(params[:id])
    end
    
    def new
        @enrollment = Enrollment.new
    end
    
    def create
        @enrollment = Enrollment.new(enrollment_params)
        if @enrollment.save
            redirect_to @enrollment
        else
            render 'new'
        end
    end
    
    private
    def enrollment_params
        params.require(:enrollment).permit(:student_id, :institution_id)
    end
end
