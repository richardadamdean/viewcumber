require 'sinatra/base'

require 'gherkin/json_parser'
require 'gherkin/parser/parser'
require 'gherkin/formatter/json_formatter'
require 'json'
require 'haml'
require 'coffee-script'


class Application < Sinatra::Base
  set :app_file, __FILE__
  set :views, File.dirname(__FILE__) + '/views'
  set :public, Proc.new { File.dirname(__FILE__) + '/public' }
  set :static, true

  get '/' do
    haml :index
  end

  get '/javascript.js' do
    coffee :javascript
  end

  get "/features" do
    content_type :json
    Dir.glob('features/**/*.feature').to_json
  end

  get '/features/*' do
    content_type :json
    file = File.read(File.join('features', params['splat']))
    io = StringIO.new
    formatter = Gherkin::Formatter::JSONFormatter.new(io)
    parser = Gherkin::Parser::Parser.new(formatter, false, 'root', true)
    parser.parse(file, 'test.featue', 0)
    #JSON.pretty_generate(JSON.parse(io.string))
    io.string
  end

end