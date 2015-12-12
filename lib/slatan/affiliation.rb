require 'slatan/affiliation/self'
require 'slatan/affiliation/team'
require 'slatan/affiliation/channels'
require 'slatan/affiliation/sub_teams'
require 'slatan/affiliation/users'

module Slatan
  module Affiliation
    include Self
    include Team
    include Channels
    include SubTeams
    include Users
  end
end
