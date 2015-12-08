require "slatan/version"

module Slatan
  using StringEx
  Spirit.infuse

  @heart = Slatan::Heart.new
  @mouth = Slatan::Mouth.new @heart
  @ear   = Slatan::Ear.new @mouth

  @heart.beat @ear
end
