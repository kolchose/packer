require 'test_helper'
require 'packer/support/command_runner'

class CommandRunnerTest < Minitest::Test
  describe '#execute_command' do
    it 'executes commands in a given directory' do
      expected_output = nil
      output = nil

      Dir.mktmpdir do |tmp_dir|
        Dir.chdir(tmp_dir) do |dir|
          expected_output = tmp_dir
          output = CommandRunner.execute('pwd')
        end
      end

      # Cocaine::CommandLine.new.run executes the command in a /private directory on OSX
      assert output.include?(expected_output)
    end
  end
end
