require 'rubygems'
require 'rake/task'
require 'cucumber'
require 'cucumber/rake/task'

desc 'Run Cucumber tests'
task :run_all do |_|
    Cucumber::Rake::Task.new(:search) do |t|
        t.cucumber_opts = "--format pretty  "
    end
    Rake::Task[:search].invoke
end