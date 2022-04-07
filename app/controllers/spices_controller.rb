class SpicesController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def index
        # byebug
        spices = Spice.all
        render json: spices, status: :ok
    end

    def create
        # byebug
        spice = Spice.create(spice_params)
        render json: spice, status: :created
    end

    def show
        # byebug
        spice = find_spice
        render json: spice, status: :ok
    end

    def update
        #byebug
        spice = find_spice
        spice.update(spice_params)
        render json :spice, status: :ok
    end

    def destroy
        # byebug
        spice = find_spice
        # byebug
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spice
        Spice.find(params[:id])
    end

    def render_not_found
        render json: {error: "Spice Not Found"}, status: :not_found
    end

end
