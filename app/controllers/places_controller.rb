class PlacesController < ApplicationController
  def search
    @type = params[:type]
    @api_key = ENV.fetch('GOOGLE_API_KEY', nil)
    Rails.logger.info "Google API key: #{@api_key}"
  end
end
