class CronParser
  attr_reader :string, :minute, :hour, :day_of_month, :month, :day_of_week, :command, :error

  MINUTE_ID = 0
  HOUR_ID = 1
  DAY_OF_MONTH_ID = 2
  MONTH_ID = 3
  DAY_OF_WEEK_ID = 4
  COMMAND_ID = 5

  def initialize(string)
    @string = string
    @error = false
  end

  def parse
    begin
      @minute = parsed_data[:minute]
      @hour = parsed_data[:hour]
      @day_of_month = parsed_data[:day_of_month]
      @month = parsed_data[:month]
      @day_of_week = parsed_data[:day_of_week]
      @command = parsed_data[:command]
    rescue ArgumentError
      @error = true
      @error_message = 'Input string is invalid'
    end
  end

  private

  def parsed_data
    @data ||= {
      minute: parse_minute(splitted_string[MINUTE_ID]),
      hour: parse_hour(splitted_string[HOUR_ID]),
      day_of_month: parse_day_of_month(splitted_string[DAY_OF_MONTH_ID]),
      month: parse_month(splitted_string[MONTH_ID]),
      day_of_week: parse_day_of_week(splitted_string[DAY_OF_WEEK_ID]),
      command: parse_command(splitted_string[COMMAND_ID])
    }
  end

  def splitted_string
    @splitted ||= string.split(' ', 6)
  end

  def parse_minute(string)
    raise ArgumentError if !(string =~ /[a-zA-Z]/).nil?
    return expand_minute_division(string) if string.include? '/'

    [string.to_i]
  end

  def expand_minute_division(string)
    split = string.split('/')

    raise ArgumentError if split[0] != '*'
    # another check & validations

    divider = split[1].to_i
    minutes = []

    (0..59).each do |minute|
      minutes << minute if (minute % divider == 0)
    end

    minutes
  end

  def parse_hour(string)
    raise ArgumentError if !(string =~ /[a-zA-Z]/).nil?
    [string.to_i]
  end

  def parse_day_of_month(string)
    raise ArgumentError if !(string =~ /[a-zA-Z]/).nil?
    [string.to_i]
  end

  def parse_month(string)
    raise ArgumentError if !(string =~ /[a-zA-Z]/).nil?
    [string.to_i]
  end

  def parse_day_of_week(string)
    raise ArgumentError if !(string =~ /[a-zA-Z]/).nil?
    [string.to_i]
  end

  def parse_command(string)
    string
  end
end