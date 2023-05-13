require 'rails_helper'

RSpec.describe Api::V1::Githubs::FetchInfo do
    describe '.find' do
        context 'when finds repositories' do
          it 'returns a parsed Person' do
            repo_info = described_class.find('natanykas')
    
            expect(repo_info).to be_a(Hash)
          end
        end
    
        context 'when not finds repositories' do
          it 'returns nil' do
            repo_info = described_class.find('test1234')

            expect(repo_info).to be_empty
          end
        end
    end
end