require 'httparty'
require 'uri'

class WeatherController < ApplicationController
  before_action :validate_city, only: [:show]

  def index
  end

  def show
    response = WeatherService.new(params[:city]).fetch_weather
    if response.success?
      weather_data = response.parsed_response
      @weather = {
        name: weather_data['name'],
        temp_celsius: kelvin_to_celsius(weather_data['main']['temp']).round(2),
        feels_like_celsius: kelvin_to_celsius(weather_data['main']['feels_like']).round(2),
        temp_min_celsius: kelvin_to_celsius(weather_data['main']['temp_min']).round(2),
        temp_max_celsius: kelvin_to_celsius(weather_data['main']['temp_max']).round(2),
        humidity: weather_data['main']['humidity'],
        wind_speed: weather_data['wind']['speed'],
        description: weather_data['weather'][0]['description']
      }
    else
      redirect_to action: :index, alert: '天気情報の取得に失敗しました。'
    end
  end

  private

  def validate_city
    redirect_to(action: :index, alert: '都市名を入力してください。') if params[:city].blank?
  end

  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end
end

class WeatherService
  include HTTParty
  base_uri 'api.openweathermap.org'

  def initialize(city)
    api_key = ENV.fetch('OPENWEATHERMAP_API_KEY', nil)
    @options = { query: { q: "#{city},jp", appid: api_key, lang: 'ja' } }
  end

  def fetch_weather
    self.class.get('/data/2.5/weather', @options)
  end
end
