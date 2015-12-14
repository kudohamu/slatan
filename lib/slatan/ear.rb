require 'active_support/core_ext/object/blank'

module Slatan
  ## class to Event Dispatching for concerns
  module Ear
    @concerns = []

    class << self
      ## register subscriber
      # @param concern subscriber
      # @param block<option> condition for dispatching event
      def register(concern, &block)
        @concerns << [concern, block]
      end

      ## publish to subscribers
      def hear(msg)
        @concerns.each do |concern, block|
          if block.blank? || block.call(msg)
            concern.hear(msg)
          end
        end
      end
    end
  end
end
