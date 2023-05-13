require 'rails_helper'

RSpec.describe '/api/v1/github_info', type: :request do
    describe 'GET /' do
        context 'requisition is a success' do
            it 'return github info' do
                get '/api/v1/github_info/natanykas'
                    
                expect(response).to have_http_status(:success)
            end
        end

        context 'requisition is not found' do
            it 'return error message' do
                get '/api/v1/github_info/test1234'
                
                expect(response).to have_http_status(:unprocessable_entity)
            end
        end
    end
end