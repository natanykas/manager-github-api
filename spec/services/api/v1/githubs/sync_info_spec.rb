require 'rails_helper'

RSpec.describe Api::V1::Githubs::SyncInfo do
    context 'when there are some users' do
        let(:github_info) do
            {
                "bdd_course" => 1,
                "manager-github-api" => 1,
                "resource-allocation-api" => 1,
                "Shopping-Guarapari" => 1,
                "team-manager-api" => 1
            }
        end

        it 'sync github info' do
            user = create(:user)
            create(:repository, user_id: user.id, name: 'bdd_course')
            create(:repository, user_id: user.id, name: 'manager-github-api')
            create(:repository, user_id: user.id, name: 'Shopping-Guarapari')
            create(:repository, user_id: user.id, name: 'team-manager-api')

            allow(Api::V1::Githubs::FetchInfo).to receive(:find).and_return(github_info)

            service = described_class.execute

            expect(service.first.repositories.first.star).to eq(1)
        end
    end

    context 'when there is no user' do
        it 'no sync github info' do
            service = described_class.execute

            expect(service).to be_empty
        end
    end
end