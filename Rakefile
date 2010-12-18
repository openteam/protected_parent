require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "protected_parent"
  gem.homepage = "http://github.com/openteam/protected_parent"
  gem.license = "MIT"
  gem.summary = %Q{Protect a parent record from deletion when it has specified child records}
  gem.description = %Q{Stops the deletion of an ActiveRecord object when members of a specified child association exist.}
  gem.email = "lda@openteam.ru"
  gem.authors = ["Tim Harvey", "Dmitry Lihachev"]
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  #  gem.add_runtime_dependency 'jabber4r', '> 0.1'
  gem.add_development_dependency 'rspec', '> 1.2.3'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/test_*.rb'
  test.verbose = true
end

#require 'spec/rake/spectask'

#desc 'Default: run specs.'
#task :default => :spec

#desc 'Run the specs'
#Spec::Rake::SpecTask.new(:spec) do |t|
#  t.spec_opts = ['--colour --format progress --loadby mtime --reverse']
#  t.spec_files = FileList['spec/**/*_spec.rb']
#end

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "protected_parent #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
