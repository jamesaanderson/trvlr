class DestinationsController < ApplicationController
  def new
  end

  def create
    redirect_to destination_path(params[:name])
  end

  def show
    @destination = Destination.new(params[:id])
  end
end
