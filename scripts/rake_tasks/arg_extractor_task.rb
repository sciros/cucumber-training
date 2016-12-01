namespace :common do
  task :arg_extractor do
    args = []
    found_delimiter = false
    ARGV.each do |arg|
      if found_delimiter
        args << arg
      end
      if arg == '--'
        found_delimiter = true
      end
    end

    @args_joined = args.join(' ')
  end
end
