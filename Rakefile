require 'bundler/gem_tasks'
require 'rspec/core/rake_task'
require 'open-uri'
require 'coveralls/rake/task'
require 'rubocop/rake_task'

task :default => ['spec:unit', :quality]

def yellow(str)
  "\e[33m#{str}\e[m"
end

cwd = File.expand_path('spec/integration/vm')

desc 'Run unit and integration tests'
task :spec => ['spec:unit', 'spec:integration']

namespace :spec do
  RSpec::Core::RakeTask.new('unit') do |task|
    task.pattern = './spec/unit{,/*/**}/*_spec.rb'
  end

  RSpec::Core::RakeTask.new('integration') do |task|
    task.pattern = './spec/integration{,/*/**}/*_spec.rb'
  end

  namespace :integration do
    integration_dir = 'spec/integration'

    desc 'Clean'
    task :clean => ['destroy_vm'] do
    end

    desc 'Prepare'
    task :prepare => ['start_vm'] do
    end

    task :start_vm do
      puts yellow('Starting VM...')
      Dir.chdir(cwd) do
        system 'vagrant reload --provision | grep "not created" && vagrant up'
      end
    end

    task :destroy_vm do
      puts yellow('Destroying VM...')
      Dir.chdir(cwd) do
        system 'vagrant', 'destroy', '-f'
      end
    end
  end
end


RuboCop::RakeTask.new(:rubocop) do |task|
  task.patterns = %w(lib/**/*.rb spec/unit/**/*.rb)
end

task :quality => :rubocop do
  Coveralls::RakeTask.new
end

