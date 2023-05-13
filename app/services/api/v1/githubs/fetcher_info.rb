module Api
  module V1
    module Githubs
      class FetcherInfo
        attr_accessor :username, :github_info, :error_message, :user

        def initialize(username)
          self.username = username
        end

        def self.call(*args)
          new(*args).call
        end

        def call
          fetch_github_info && create_or_generate_user && sync_info

          self
        end

        def success?
          error_message.blank?
        end

        private
        def fetch_github_info
          self.github_info = Githubs::FetchInfo.find(username)

          if github_info.empty?
            self.error_message = 'No repository found to this username'
            return false
          end
        end

        def sync_info
          github_info.each do |key, value|
            Repository.find_or_create_by(user_id: user.id, name: key, star: value)
          end
        end

        def create_or_generate_user
          self.user = User.find_or_create_by(name: username)
        end
      end
    end
  end
end
