class InstitutionsController < ApplicationController
    
    # GET /institutions/all (all institutions)
    def all
        @institutions = Institution.all

        render json: {status: 'SUCCESS', message: 'Loaded all institutions', data: @institutions}, status: :ok
    end

    # GET /institutions (all enabled institutions)
    def index
        @institutions = Institution.where(enabled: true)

        render json: {status: 'SUCCESS', message: 'Loaded enabled institutions', data: @institutions}, status: :ok
    end

    # GET /institutions/disabled (all disabled institutions)
    def disabled
        @institutions = Institution.where(enabled: false)

        render json: {status: 'SUCCESS', message: 'Loaded disabled institutions', data: @institutions}, status: :ok
    end
    
    # GET /institutions/:id (institution by id)
    def show
        @institution = Institution.find(params[:id])

        render json: {status: 'SUCCESS', message: 'Loaded institution', data: @institution}, status: :ok
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
        if @institution.update(institution_params)
            render json: {status: 'SUCCESS', message: 'Updated institution', data: @institution}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Institution not updated', data: @institution.errors}, status: :unprocessable_entity
        end
    end

    # DELETE /institutions/:id (delete institution)
    def destroy
        ActiveRecord::Base.transaction do
            @institution = Institution.find(params[:id])
            @institution.update(enabled: false)
            render json: {status: 'SUCCESS', message: 'Deleted institution', data: @institution}, status: :ok
        end
    end

    private
    def institution_params
        params.require(:institution).permit(:name, :cnpj, :kind)
    end
end
