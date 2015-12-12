module Slatan
  module Mouth
    module Files
      @category = 'files'

      class << self
        ## @see https://api.slack.com/methods/files.upload
        def upload(options={})
          send('upload', options)
        end

        private
        def send(method, msg)
          Mouth.send(@category, method, msg)
        end
      end
    end
  end
end
