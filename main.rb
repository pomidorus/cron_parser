require './cron_parser.rb'
require './parser_printer.rb'

if ARGV.length == 0
  puts %q(
    Something goes wrong.
    Please add params, like described in README
  )
else
  parser = CronParser.new(ARGV[0])
  parser.parse

  printer = ParserPrinter.new(parser)
  puts printer.print

  # Example of different flow implementation, when parser is responsible for parsing & printing
  #
  # parser = CronParser.new(ARGV[0], ParserPrinter.new)
  # parser.parse
  # parser.print
end
