require 'packer/cli/command'

module Packer
  module Cli
    class Update < Command
      def self.syntax
        'packer-bundler update <repo-name> <gem-name> <gem-version>'
      end

      def self.description
        'Updates Gemfile and Gemfile.lock according to new gem name and gem version'
      end

      def run
        repo_name = require_argument(0, 'repo-name')

        Packer::Git::Checkout.new(repo_name).run do
        end
      end
    end
  end
end
