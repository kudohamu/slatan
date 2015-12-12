module Slatan
  module Affiliation
    module Team
      @team = {}

      class << self
        def get()
          @team
        end

        def set(team)
          @team = team
        end
      end
    end
  end
end
