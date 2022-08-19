class SpicesController < ApplicationController

    def index
        spices = Spice.all
        render json: spices
    end

    def post
        spices = Spice.create(spices_params)
        render json: spices, status: :created
    end

    def update
        spices = find_spices
        spices.update(spices_params)
        render json: spices
    end

    def destroy
        spices = find_spices
        spices.destroy
        head :no_content
    end

    private

    def spices_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

    def find_spices
        Spices.find(params[:id])
    end

end
