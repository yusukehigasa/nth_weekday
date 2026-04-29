# frozen_string_literal: true

require 'date'

# NthWeekday module - Get specific weekdays (like 3rd Wednesday) from any year/month
module NthWeekday
  # Mapping of weekday symbols to Date's wday values (0-6, Sunday is 0)
  WEEKDAY_MAP = {
      su: 0, # Sunday
      mo: 1, # Monday
      tu: 2, # Tuesday
      we: 3, # Wednesday
      th: 4, # Thursday
      fr: 5, # Friday
      sa: 6  # Saturday
  }.freeze

  class << self
    # Get the nth weekday of a specific month and year
    # @param year [Integer] Year (e.g., 2025)
    # @param month [Integer] Month (1-12)
    # @param weekday [Symbol] Weekday symbol (:mo, :tu, :we, :th, :fr, :sa, :su)
    # @param nth [Integer] The occurrence of the weekday (1-5, or -1 for last occurrence)
    # @param format [String, Symbol, nil] Optional output format. String uses Date#strftime, :unix returns UTC midnight timestamp.
    # @return [Date, String, Integer, nil] Date object, formatted string, UNIX timestamp, or nil when no matching date exists
    # @raise [ArgumentError] If parameters are invalid
    def get(year:, month:, weekday:, nth:, format: nil)
      validate_params(year, month, weekday, nth, format)

      wday = WEEKDAY_MAP[weekday.to_sym]
      raise ArgumentError, 'Invalid weekday symbol' unless wday

      first_day = Date.new(year, month, 1)
      last_day = first_day.next_month.prev_day

      days = (first_day..last_day).select { |date| date.wday == wday }

      date = if nth == -1
               days.last
             else
               days[nth - 1]
             end

      format_date(date, format)
    end

    private

    def validate_params(year, month, _weekday, nth, format)
      raise ArgumentError, "Invalid year: #{year}" unless year.is_a?(Integer) && year.positive?
      raise ArgumentError, "Invalid month: #{month}" unless month.is_a?(Integer) && month.between?(1, 12)
      raise ArgumentError, "Invalid nth: #{nth}" unless nth.is_a?(Integer) && (nth.between?(1, 5) || nth == -1)
      raise ArgumentError, "Invalid format: #{format}" unless valid_format?(format)
    end

    def valid_format?(format)
      format.nil? || format.is_a?(String) || format == :unix
    end

    def format_date(date, format)
      return nil if date.nil?
      return date if format.nil?
      return Time.utc(date.year, date.month, date.day).to_i if format == :unix

      date.strftime(format)
    end
  end
end
