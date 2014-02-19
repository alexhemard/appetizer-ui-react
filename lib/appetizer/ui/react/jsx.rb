require "execjs"
require "react/source"
require "appetizer/ui/react/jsx/template"
require "appetizer/ui/assets"

module React
  module JSX
    def self.context
      # lazily loaded during first request and reloaded every time when in dev or test
      unless @context && ::App.production?
        contents =
          # If execjs uses therubyracer, there is no 'global'. Make sure
          # we have it so JSX script can work properly.
          'var global = global || this;' +

          # search for transformer file using sprockets - allows user to override
          # this file in his own application
          File.read(::App.assets.resolve('JSXTransformer.js'))

        @context = ExecJS.compile(contents)
      end

      @context
    end

    def self.transform(code)
      result = context.call('JSXTransformer.transform', code)
      return result['code']
    end
  end
end
