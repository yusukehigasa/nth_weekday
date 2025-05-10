# frozen_string_literal: true

# nth_weekday の使用例

require 'nth_weekday'

## 基本的な使用方法

# 2025年5月の第2月曜日を取得
monday = NthWeekday.get(year: 2025, month: 5, weekday: :mo, nth: 2)
puts "2025年5月の第2月曜日: #{monday.strftime('%Y-%m-%d')}"

# 2025年12月の最終金曜日を取得
last_friday = NthWeekday.get(year: 2025, month: 12, weekday: :fr, nth: -1)
puts "2025年12月の最終金曜日: #{last_friday.strftime('%Y-%m-%d')}"

## 応用例: 年間の特定曜日を一覧表示

puts "\n2025年の全ての第3水曜日:"
(1..12).each do |month|
  date = NthWeekday.get(year: 2025, month: month, weekday: :we, nth: 3)
  puts "2025年#{month}月の第3水曜日: #{date.strftime('%Y-%m-%d')}"
end
