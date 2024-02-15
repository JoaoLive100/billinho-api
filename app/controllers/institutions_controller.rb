class InstitutionsController < ApplicationController
    def index
        @institutions = Institution.all
    end
    
    def show
        @institution = Institution.find(params[:id])
    end
    
    def new
        @institution = Institution.new
    end
    
    def create
        @institution = Institution.new(institution_params)
        if @institution.save
        redirect_to @institution
        else
        render 'new'
        end
    end
    
    private
    def institution_params
        params.require(:institution).permit(:name, :description)
    end
end
