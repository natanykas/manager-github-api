class GithubInfoJob
    include Sidekiq::Worker
  
    def perform
        ::Api::V1::Githubs::SyncInfo.execute
    end
  end