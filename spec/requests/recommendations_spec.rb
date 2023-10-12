require 'swagger_helper'

RSpec.describe 'recommendations', type: :request do

  path '/patients/{patient_id}/recommendations' do
    # You'll want to customize the parameter types...
    parameter name: 'patient_id', in: :path, type: :string, description: 'patient_id'

    get('list recommendations') do
      response(200, 'successful') do
        let(:patient_id) { '123' }

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

  path '/consultation_requests/{consultation_request_id}/recommendations' do
    # You'll want to customize the parameter types...
    parameter name: 'consultation_request_id', in: :path, type: :string, description: 'consultation_request_id'

    get('list recommendations') do
      response(200, 'successful') do
        let(:consultation_request_id) { '123' }

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

    post('create recommendation') do
      response(200, 'successful') do
        let(:consultation_request_id) { '123' }

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
