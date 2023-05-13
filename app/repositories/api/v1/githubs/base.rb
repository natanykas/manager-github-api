module Api
    module V1
        module Githubs
            class Base
                GITHUB_URL = "https://api.github.com/".freeze 

                def self.api
                    Faraday.new(url: GITHUB_URL) do |builder|
                        builder.response(:logger) if Rails.env.development?
                
                        builder.adapter(Faraday.default_adapter)
                
                        builder.headers['Content-Type'] = 'application/json'
                    end
                end
            end
        end
    end
end