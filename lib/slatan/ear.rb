module Slatan
  ## class to Event Dispatching for concerns
  module Ear
    @concerns = []

    class << self
      ## register subscriber
      def register(concern)
        @concerns << concern
      end

      ## publish to subscribers
      def hear(msg)
        @concerns.each do |concern|
          concern.hear(msg)
        end
      end
    end
  end
end
