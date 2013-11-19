$:.unshift File.dirname(__FILE__) + 'lib'
$:.unshift './lib', './spec'

require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new
task :default => :spec

=begin#------------------------------------------------------------------------------- 
desc "Ejecutar tests"
task :spec do
        sh "rspec -I. spec/racional_spec.rb --format documentation"
end
#------------------------------------------------------------------------------- 
desc "Ejecutar test con formato html"
task :thtml do
        sh "rspec -I. spec/racional_spec.rb --format html > resultados.html"
end
=end
