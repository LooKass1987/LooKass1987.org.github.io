namespace :ncsc do

  task :require do
    Rake::Task['environment'].invoke
  end

  task :locale do
    I18n.locale = I18n.default_locale
  end

  desc 'Document status inspection.'
  task :inspection => ['ncsc:require', 'ncsc:locale'] do
    puts "\n"
    puts 'NCSC inspection:'
    done = Certificate.inspection
    puts "  #{done} certificates status change."
    done = Attestat.inspection
    puts "  #{done} attestats status change."
  end

  desc 'Dispatch feedback messages.'
  task :feedback => ['ncsc:require', 'ncsc:locale'] do
    puts "\n"
    puts 'NCSC feedback:'
    done = Certificate.feedback
    puts "  #{done} certificate stages message sent."
    done = Attestat.feedback
    puts "  #{done} attestat stages message sent."
  end

end
