class ExternalApiController < ApplicationController

  include HTTParty

  def fetch_one_drug
    base_uri = 'https://api.fda.gov/drug/drugsfda.json'

    response = HTTParty.get(base_uri)
    if response.success?
      response = response.body
      response = JSON.parse(response)
      response = response["results"][0]["products"][0]["brand_name"]
      render json: response, status: :ok
    else

      render json: { error: 'Failed to fetch JSON' }, status: :internal_server_error
    end
  end
end

