class CronParser
  attr_reader :string, :minute, :hour, :day_of_month, :month, :day_of_week, :command, :error

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
      minute: parse_minute(splitted_string[0]),
      hour: parse_hour(splitted_string[1]),
      day_of_month: parse_day_of_month(splitted_string[2]),
      month: parse_month(splitted_string[3]),
      day_of_week: parse_day_of_week(splitted_string[4]),
      command: parse_command(splitted_string[5])
    }
  end

  def splitted_string
    @splitted ||= string.split(' ', 6)
  end

  def parse_minute(string)
    raise ArgumentError if !(string =~ /[a-zA-Z]/).nil?
    [string.to_i]
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