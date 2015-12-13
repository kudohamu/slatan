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

        ## return id of user name
        # @param name: user name
        def get_id(name)
          @users.each do |user|
            return user[:id] if user[:name] == name
          end
          nil
        end

        ## return name of user id
        # @param id: user id
        def get_name(id)
          @users.each do |user|
            return user[:name] if user[:id] == id
          end
          nil
        end

        ## check bot or human
        # @return bool true: bot, false: human
        def is_bot?(ident)
          key = if is_id?(ident) then :id else :name end
          @users.each do |user|
            if user[key] == ident
              return user[:is_bot]
            end
          end

          return false
        end

        ## check id or name
        # @return bool true: id, false: name
        def is_id?(key)
          key =~ /^[A-Z0-9]+$/
        end
      end
    end
  end
end
