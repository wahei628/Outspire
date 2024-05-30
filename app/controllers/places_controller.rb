class PlacesController < ApplicationController
  def search
    @type = params[:type]
  end
end
