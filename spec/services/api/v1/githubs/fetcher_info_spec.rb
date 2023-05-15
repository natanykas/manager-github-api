# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::Githubs::FetcherInfo do
  context 'when github returns result' do
    let(:github_info) do
      {
        'bdd_course' => 0,
        'manager-github-api' => 0,
        'resource-allocation-api' => 0,
        'Shopping-Guarapari' => 1,
        'team-manager-api' => 1
      }
    end
    let(:username) { 'natanykas' }

    it 'is success' do
      allow(Api::V1::Githubs::FetchInfo).to receive(:find).and_return(github_info)

      service = described_class.call(username)

      expect(service).to be_success
    end
  end

  context 'when github raise error' do
    let(:github_info) do
      {}
    end
    let(:username) { 'test1234' }

    it 'is a error message' do
      allow(Api::V1::Githubs::FetchInfo).to receive(:find).and_return(github_info)

      service = described_class.call(username)

      expect(service).not_to be_success
      expect(service.error_message).to eq('No repository found to this username')
    end
  end
end
