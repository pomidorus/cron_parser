require_relative '../cron_parser'

describe CronParser do
  describe '#parse' do
    let(:parser) { CronParser.new(string) }

    context 'when string is invalid' do
      let(:string) { 'a 2 3 4 5 /usr/bin/find' }

      it 'returns error' do
        parser.parse
        expect(parser.error).to eq(true)
      end
    end

    context 'when string is valid' do
      let(:string) { '1 2 3 4 5 /usr/bin/find' }

      it 'parse the correct minute' do
        parser.parse
        expect(parser.minute).to eq([1])
      end

      it 'parse the correct hour' do
        parser.parse
        expect(parser.hour).to eq([2])
      end

      it 'parse the correct day of month' do
        parser.parse
        expect(parser.day_of_month).to eq([3])
      end

      it 'parse the correct month' do
        parser.parse
        expect(parser.month).to eq([4])
      end

      it 'parse the correct day of week' do
        parser.parse
        expect(parser.day_of_week).to eq([5])
      end

      it 'parse the correct command' do
        parser.parse
        expect(parser.command).to eq('/usr/bin/find')
      end
    end

    context 'when string is valid & complex' do
      let(:string) { '*/15 0 1,15 * 1-5 /hello' }

      it 'parse the correct minute' do
        parser.parse
        expect(parser.minute).to eq([0, 15, 30, 45])
      end

      it 'parse the correct hour' do
        parser.parse
        expect(parser.hour).to eq([0])
      end

      it 'parse the correct day of month' do
        parser.parse
        expect(parser.day_of_month).to eq([1, 15])
      end

      it 'parse the correct month' do
        parser.parse
        expect(parser.month).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
      end

      it 'parse the correct day of week' do
        parser.parse
        expect(parser.day_of_week).to eq([1, 2, 3, 4, 5])
      end

      it 'parse the correct command' do
        parser.parse
        expect(parser.command).to eq('/hello')
      end
    end

    context 'when string contains */' do
      let(:string) { '*/15 2 3 4 5 /usr/bin/find' }

      it 'parse the correct minute' do
        parser.parse
        expect(parser.minute).to eq([0, 15, 30, 45])
      end
    end

    context 'when string contains ,' do
      let(:string) { '1 2 1,15 4 5 /usr/bin/find' }

      it 'parse the correct day_of_month' do
        parser.parse
        expect(parser.day_of_month).to eq([1, 15])
      end
    end

    context 'when string contains , with invalid number' do
      let(:string) { '1 2 1,15,46 4 5 /usr/bin/find' }

      it 'parse the correct day_of_month' do
        parser.parse
        expect(parser.day_of_month).to eq([1, 15])
      end
    end

    context 'when string contains *' do
      let(:string) { '1 2 3 * 5 /usr/bin/find' }

      it 'parse the correct month' do
        parser.parse
        expect(parser.month).to eq([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12])
      end
    end

    context 'when string contains -' do
      let(:string) { '1 2 3 4 1-5 /usr/bin/find' }

      it 'parse the correct day of week' do
        parser.parse
        expect(parser.day_of_week).to eq([1, 2, 3, 4, 5])
      end
    end

    context 'when string contains - with invalid number' do
      let(:string) { '1 2 3 4 1-8 /usr/bin/find' }

      it 'parse the correct day of week' do
        parser.parse
        expect(parser.day_of_week).to eq([1, 2, 3, 4, 5, 6, 7])
      end
    end
  end
end