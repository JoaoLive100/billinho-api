class InstitutionsController < ApplicationController

    # GET /institutions (all institutions)
    def index
        @institutions = Institution.all

        render json: {status: 'SUCCESS', message: 'Loaded institutions', data: @institutions}, status: :ok
    end
    
    # GET /institutions/:id (institution by id)
    def show
        @institution = Institution.find(params[:id])

        render json: {status: 'SUCCESS', message: 'Loaded institution', data: @institution}, status: :ok
    end
    
    # GET /institutions/new (new institution)
    def new
        @institution = Institution.new
    end
    
    # POST /institutions (create institution)
    def create
        @institution = Institution.new(institution_params)
        if @institution.save
            render json: {status: 'SUCCESS', message: 'Saved institution', data: @institution}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Institution not saved', data: @institution.errors}, status: :unprocessable_entity
        end
    end
    
    # PUT /institutions/:id (update institution)
    def update
        @institution = Institution.find(params[:id])
        if @institution.update_attributes(institution_params)
            render json: {status: 'SUCCESS', message: 'Updated institution', data: @institution}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Institution not updated', data: @institution.errors}, status: :unprocessable_entity
        end
    end

    # DELETE /institutions/:id (delete institution)
    def destroy
        @institution = Institution.find(params[:id])
        @institution.destroy

        render json: {status: 'SUCCESS', message: 'Deleted institution', data: @institution}, status: :ok
    end

    private
    def institution_params
        params.require(:institution).permit(:name, :cnpj, :kind)
    end
end
