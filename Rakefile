#!/usr/bin/env rake
require "bundler/gem_tasks"
require 'rake/testtask'

task :default => [:test]

Rake::TestTask.new do |t|
  t.libs.push "lib"
  t.test_files = FileList['spec/**/*_spec.rb']
  t.verbose = true
end

desc 'Open a pry session preloaded with this library'
task :console do
  require 'pry'
  require './lib/alchemy_api.rb'
  ARGV.clear
  Pry.start
end
