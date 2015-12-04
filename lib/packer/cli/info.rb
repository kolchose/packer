require 'packer/cli/command'
require 'cocaine'

module Packer
  module Cli
    class Info < Command
      GEM_REGEX = /\s?gem\s*['"]([\w-]*)['"]/

      def self.syntax
        'packer-bundler info <repo-name>'
      end

      def self.description
        'Gathers information about ruby-version and bundled gems'
      end

      def run
        repo_name = require_argument(0, 'repo-name')

        Packer::Git::Checkout.new(repo_name).run do
          direct_dependencies = Bundler::Definition.build('./Gemfile','./Gemile.lock', nil).dependencies.map(&:name)
          debugger
          p CommandRunner.execute("bundle", "show")
        end
      end
    end
  end
end
