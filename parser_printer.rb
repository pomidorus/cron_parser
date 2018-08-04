class ParserPrinter
  attr_reader :cron_parser

  def initialize(cron_parser)
    @cron_parser = cron_parser
  end

  def print
    puts 'ok'
  end
end