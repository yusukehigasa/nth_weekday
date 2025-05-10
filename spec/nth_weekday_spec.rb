require 'spec_helper'

RSpec.describe NthWeekday do
  describe '.get' do
    context 'with valid parameters' do
      it 'returns the correct date for the 3rd Wednesday of April 2025' do
        result = NthWeekday.get(year: 2025, month: 4, weekday: :we, nth: 3)
        expect(result).to eq(Date.new(2025, 4, 16))
      end

      it 'returns the correct date for the last Friday of December 2025' do
        result = NthWeekday.get(year: 2025, month: 12, weekday: :fr, nth: -1)
        expect(result).to eq(Date.new(2025, 12, 26))
      end

      it 'returns the correct date for the 1st Monday of January 2025' do
        result = NthWeekday.get(year: 2025, month: 1, weekday: :mo, nth: 1)
        expect(result).to eq(Date.new(2025, 1, 6))
      end

      it 'returns the correct date for the 2nd Thursday of February 2025' do
        result = NthWeekday.get(year: 2025, month: 2, weekday: :th, nth: 2)
        expect(result).to eq(Date.new(2025, 2, 13))
      end

      it 'returns the correct date for the last Sunday of March 2025' do
        result = NthWeekday.get(year: 2025, month: 3, weekday: :su, nth: -1)
        expect(result).to eq(Date.new(2025, 3, 30))
      end
      
      it 'returns nil when the nth occurrence does not exist in the month' do
        # February 2025 doesn't have a 5th Saturday
        result = NthWeekday.get(year: 2025, month: 2, weekday: :sa, nth: 5)
        expect(result).to be_nil
      end
    end

    context 'with invalid parameters' do
      it 'raises an error for invalid year' do
        expect { NthWeekday.get(year: -2025, month: 4, weekday: :we, nth: 3) }
          .to raise_error(ArgumentError, "Invalid year: -2025")
      end

      it 'raises an error for invalid month' do
        expect { NthWeekday.get(year: 2025, month: 13, weekday: :we, nth: 3) }
          .to raise_error(ArgumentError, "Invalid month: 13")
      end

      it 'raises an error for invalid weekday' do
        expect { NthWeekday.get(year: 2025, month: 4, weekday: :invalid, nth: 3) }
          .to raise_error(ArgumentError, "Invalid weekday symbol")
      end

      it 'raises an error for invalid nth value' do
        expect { NthWeekday.get(year: 2025, month: 4, weekday: :we, nth: 6) }
          .to raise_error(ArgumentError, "Invalid nth: 6")
      end

      it 'raises an error for negative nth other than -1' do
        expect { NthWeekday.get(year: 2025, month: 4, weekday: :we, nth: -2) }
          .to raise_error(ArgumentError, "Invalid nth: -2")
      end
    end
  end
end
