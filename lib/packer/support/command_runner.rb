require 'cocaine'
require 'posix-spawn'

class CommandRunner
  def self.execute(cmd, params = "", interpolations = {})
    Cocaine::CommandLine.new(cmd, params).run(interpolations)
  end
end
