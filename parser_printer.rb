require 'terminal-table'

class ParserPrinter
  attr_reader :cron_parser, :table

  def initialize(cron_parser)
    @cron_parser = cron_parser
    @table = Terminal::Table.new(rows: table_rows)
  end

  def print
    table
  end

  private

  def table_rows
    rows = []

    rows << minute_row
    rows << hour_row
    rows << day_of_month_row
    rows << month_row
    rows << day_of_week_row
    rows << command_row

    rows
  end

  def command_row
    ['Command', cron_parser.command]
  end

  def day_of_week_row
    ['Day of week', cron_parser.day_of_week.join(' ')]
  end

  def month_row
    ['Month', cron_parser.month.join(' ')]
  end

  def day_of_month_row
    ['Day of month', cron_parser.day_of_month.join(' ')]
  end

  def hour_row
    ['Hour', cron_parser.hour.join(' ')]
  end

  def minute_row
    ['Minute', cron_parser.minute.join(' ')]
  end
end