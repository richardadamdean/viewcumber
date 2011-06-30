require 'cucumber'
require 'cucumber/rake/task'
namespace :features do
  Cucumber::Rake::Task.new(:all) do |t|
    t.profile = "default"
  end

  Cucumber::Rake::Task.new(:ok) do |t|
    t.profile = "ok"
  end

  Cucumber::Rake::Task.new(:all) do |t|
    t.profile = "wip"
  end
end