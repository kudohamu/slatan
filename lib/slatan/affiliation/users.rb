module Slatan
  module Affiliation
    module Users
      @users = {}

      class << self
        def get()
          @users
        end

        def set(users)
          @users = users
        end
      end
    end
  end
end
