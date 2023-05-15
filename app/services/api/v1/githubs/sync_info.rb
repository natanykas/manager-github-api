
module Api
    module V1
        module Githubs
            class SyncInfo
                def self.execute(*args)
                    new(*args).execute
                end

                def execute
                    users = User.all
                    users.each do |user|
                        Api::V1::Githubs::FetcherInfo.call(user.name)
                    end
                end
            end
        end
    end
end