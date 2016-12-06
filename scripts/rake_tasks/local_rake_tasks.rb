require 'fileutils'

namespace :local do
  desc 'runs tests as a single process locally'
  task :single_run => %w(common:arg_extractor) do |t, args|
    @args_joined = @args_joined.length > 0 ? @args_joined : args.instance_variable_get('@values')[0]

    puts "Arguments passed in (as either to Rake following '--' or as arguments to the task): #{@args_joined}"
    command = "cucumber #{@args_joined}"# 2>&1"
    puts "Command: #{command}"

    success = system("#{command}")

    exit success ? 0 : 1 #non-zero exit code = bad
  end

  desc 'runs tests for manual interaction (do not specify a profile in parameters)'
  task :manual_run => %(common:arg_extractor) do |t, args|
    puts 'Running manual Cucumber tests'
    @args_joined = @args_joined.length > 0 ? @args_joined : args.instance_variable_get('@values')[0]

    puts "Arguments passed in (as either to Rake following '--' or as arguments to the task): #{@args_joined}"
    command = "cucumber -p manual #{@args_joined}"
    puts "Command: #{command}"

    exec command
  end
end