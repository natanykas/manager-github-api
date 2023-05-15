module Api
    module V1
        module Githubs
            class Base
                GITHUB_URL = "https://api.github.com/".freeze
                TOKEN = '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'.freeze

                def self.api
                    Faraday.new(url: GITHUB_URL) do |builder|
                        builder.response(:logger) if Rails.env.development?
                
                        builder.adapter(Faraday.default_adapter)
                
                        builder.headers['Content-Type'] = 'application/json'

                        builder.request :authorization, 'Bearer', TOKEN
                    end
                end
            end
        end
    end
end