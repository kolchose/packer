require 'bugsnag'

Bugsnag.configure do |config|
  config.api_key = ENV['BUGSNAG_KEY']
end

at_exit do
  if $!
    Bugsnag.notify($!)
  end
end
