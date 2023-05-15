# frozen_string_literal: true

require 'json'

module Api
  module V1
    module Githubs
      class FetchInfo < Base
        class << self
          def find(username)
            response = api.get(path(username))

            build(response.body)
          end

          private

          def path(username)
            "users/#{username}/repos"
          end

          def build(body)
            parsed_json = JSON.parse(body)

            repo_info_hash = {}
            parsed_json.each do |repository_information|
              repo_info_hash[repository_information['name']] = repository_information['stargazers_count']
            end

            repo_info_hash
          end
        end
      end
    end
  end
end
