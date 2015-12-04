require 'commander'
require 'highline'

module Packer
  module Cli
    class Command
      class << self
        def syntax(syntax)
          fail NotImplError
        end

        def description(description)
          fail NotImplError
        end

        def command
          Proc.new do |spec|
            spec.syntax = syntax
            spec.description = description
            spec.action do |args, options|
              new(args, options).run
            end
          end
        end
      end

      def initialize(arguments, options)
        @arguments = arguments
        @options = options
      end

      def require_argument(position, name)
        @arguments[position] || say("<#{name}> is mandatory.") && exit
      end
    end
  end
end
