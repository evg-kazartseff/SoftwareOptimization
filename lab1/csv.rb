require 'csv'

print %(
This program provides statistical information on the average cost of
1 sq.m. housing in the period from 2000 to 2015.
Enter the number of statistics you want to receive
    1 maximum
    2 minimum
    3 average value
    4 corrected sample variance
Enter: )
statistic = gets.chomp
case statistic
when '1'
  max = 0
  data = ''
  CSV.foreach('chart.csv', col_sep: ';') do |row|
    if max < row[1].to_f
      max = row[1].to_f
      data = row[0]
    end
  end
  print 'The maximum cost of housing was fixed in ', data,
        ' and amounted to ', max, ' rubles per sq. m.'
when '2'
  min = 9_999_999_999_999_999_999
  data = ''
  CSV.foreach('chart.csv', col_sep: ';') do |row|
    if min > row[1].to_f
      min = row[1].to_f
      data = row[0]
    end
  end
  print 'The minimum cost of housing was fixed in ', data,
        ' and amounted to ', min, ' rubles per sq. m.'
when '3'
  count = 0
  sum = 0
  CSV.foreach('chart.csv', col_sep: ';') do |row|
    sum += row[1].to_f
    count += 1
  end
  average = sum / count
  print 'The average value of 1 sq.m. is ', average, ' rubles'
when '4'
  array = []
  CSV.foreach('chart.csv', col_sep: ';') do |row|
    array << row[1].to_f
  end
  average = array.sum / array.count

  variance = 0
  array.each { |i| variance += (i - average)**2 }
  variance /= (array.count - 1)
  p 'The corrected sample variance is ', variance
else
  print 'Error: Please enter correct data
'
end