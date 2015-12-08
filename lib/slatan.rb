require "slatan/version"
require "slatan/spirit"
require "slatan/heart"
require "slatan/mouth"
require "slatan/ear"
require "utils/string_ex"

module Slatan
  using StringEx
  Spirit.infuse

  @heart = Heart.new
  @mouth = Mouth.new @heart
  @ear   = Ear.new @mouth

  @heart.beat @ear
end
