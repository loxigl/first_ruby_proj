require 'swagger_helper'

RSpec.describe 'consultation_requests', type: :request do

  path '/consultation_requests' do

    post('create consultation_request') do
      response(200, 'successful') do
        parameter name: 'patient_id', in: :json, type: :string, description: 'id'

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
