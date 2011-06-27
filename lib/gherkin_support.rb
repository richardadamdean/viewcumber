require 'gherkin/json_parser'
require 'gherkin/parser/parser'
require 'gherkin/formatter/json_formatter'
require 'json'


class GherkinSupport



  def self.feature(file)
    s = File.read(file)

    io = StringIO.new
    formatter = Gherkin::Formatter::JSONFormatter.new(io)
    parser = Gherkin::Parser::Parser.new(formatter, false, 'root', true)
    parser.parse(s, 'test.featue', 0)

    #JSON.pretty_generate(
    JSON.parse(io.string)
  end

end