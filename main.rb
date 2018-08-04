require './cron_parser.rb'
require './parser_printer.rb'

if ARGV.length == 0
  puts %q(
    Something goes wrong
  )
else
  parser = CronParser.new(ARGV[0])
  parser.parse

  printer = ParserPrinter.new(parser)
  printer.print

  # parser = CronParser.new(ARGV[0], ParserPrinter.new)
  # parser.parse
  # parser.print
end