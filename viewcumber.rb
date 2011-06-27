require "bundler/setup"
require 'sinatra'
require 'sinatra/ratpack'
require 'gherkin'

require File.dirname(__FILE__) + '/sinatra/partials'
require File.dirname(__FILE__) + '/lib/gherkin_support'

helpers do 
  
  def show_tree(tree, parents=nil)
    tree.collect do |file_name, children|
      current_path = "#{parents}/#{file_name}"
      file = menu_item file_name, current_path
      tree = content_tag(:ul, show_tree(children, current_path)) if children
      content_tag :li, file + tree
    end.join ''
  end

end

before do
  @scenario_tree = scenario_tree
end

get '/' do
  erb :home
end

get '/features/*' do
  file_path = File.join(project_path, 'features', params['splat'])
  @file = File.read file_path
  @feature = GherkinSupport.feature file_path
  erb :feature
end

## TODO move these elsewhere

def project_path
  "#{Dir.home}/viewcumber/"
end

def scenario_tree
  features = Dir.glob("#{project_path}features/**/*.feature")
  features.each {|file| file.sub! "#{project_path}features/", ''}

  features.inject({}) do |acc, feature_path|
    tree = acc
    feature_path.sub("#{project_path}features/", '').split('/').each do |n|
      tree[n] ||= {} 
      tree = tree[n]
    end
   acc
  end
end

def menu_item(file_name, path)
  if file_name.match /.feature$/
    link_to file_name, "features#{path}"
  else
    content_tag :div, file_name
  end
end