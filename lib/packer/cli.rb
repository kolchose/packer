require 'commander'
require 'byebug'

module Packer
  module Cli
    class << self
      include Commander::Methods

      def run
        program :name, 'Packer Bundler'
        program :version, Packer::VERSION
        program :description, 'Automagically update bundled gems or ruby versions'

        command :info, &Info.command
        command :"update", &Update.command

        run!
      end
    end
  end
end

require 'packer/cli/info'
require 'packer/cli/update'
