require 'packer/support/command_runner'

module Packer
  module Git
    class Checkout
      def initialize(path)
        @repo = path
      end

      def run(&block)
        Dir.mktmpdir(@repo.gsub(/\//, '_')) do |dir|
          Dir.chdir(dir) do
            CommandRunner.execute("git", "init")

            CommandRunner.execute("git", "remote add origin :ssh_to_repo", ssh_to_repo: "git@github.com:#{@repo}.git")
            CommandRunner.execute("git", "config core.sparseCheckout true")
            CommandRunner.execute("touch", ".git/info/sparse-checkout")
            CommandRunner.execute("echo", ".ruby-version >> .git/info/sparse-checkout")
            CommandRunner.execute("echo", ".rbenv-version >> .git/info/sparse-checkout")
            CommandRunner.execute("echo", ".rvm-version >> .git/info/sparse-checkout")
            CommandRunner.execute("echo", "Gemfile >> .git/info/sparse-checkout")
            CommandRunner.execute("echo", "Gemfile.lock >> .git/info/sparse-checkout")
            CommandRunner.execute("git", "pull origin master --depth 1")

            block.call
          end
        end
      end
    end
  end
end
