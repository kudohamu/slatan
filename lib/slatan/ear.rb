require 'active_support/core_ext/object/blank'

module Slatan
  ## class to Event Dispatching for concerns
  module Ear
    @concerns = []

    class << self
      ## register subscriber
      # @param concern subscriber
      # @param options option
      #          cond: <Kernel.#lambda> call hear method of concern if cond.call(msg) is true
      def register(concern, options={})
        @concerns << [concern, options[:cond]]
      end

      ## publish to subscribers
      def hear(msg)
        @concerns.each do |concern, cond|
          if cond.blank? || cond.call(msg)
            concern.hear(msg)
          end
        end
      end
    end
  end
end
