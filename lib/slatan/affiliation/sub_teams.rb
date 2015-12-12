module Slatan
  module Affiliation
    module SubTeams
      @sub_teams = {}

      class << self
        def get()
          @sub_teams
        end

        def set(sub_teams)
          @sub_teams = sub_teams
        end
      end
    end
  end
end
