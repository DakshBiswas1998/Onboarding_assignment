require 'rubygems'
require 'cucumber'
require 'rake/task'
require 'cucumber/rake/task'

desc 'Run Cucumber tests'
task :run_all, :tag do |_|
    Cucumber::Rake::Task.new(:search) do |t|
        t.cucumber_opts = "--format pretty  "
    end
    Rake::Task[:search].invoke
end