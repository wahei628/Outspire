class PlacesController < ApplicationController
  def search
    @type = params[:type]
    @api_key = ENV['GOOGLE_API_KEY']
    Rails.logger.info "Google API key: #{@api_key}"
  end
end
