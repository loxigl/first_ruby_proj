require 'swagger_helper'

RSpec.describe 'external_api', type: :request do

  path '/drug' do

    get('fetch_one_drug external_api') do
      response(200, 'successful') do

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end
  end
end
