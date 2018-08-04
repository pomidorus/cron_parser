require_relative '../cron_parser'

describe CronParser do
  describe '#parse' do
    let(:parser) { CronParser.new(string) }
    let(:string) { '1 2 3 4 5 /usr/bin/find' }

    it 'parse the valid string' do
      parser.parse
      expect(parser.minute).to eq(1)
    end
  end
end