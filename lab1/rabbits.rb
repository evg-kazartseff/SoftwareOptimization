def NumberOfRabbitsPair(month)
  if month == 1
    return 1
  end
  if month == 2
    return 1
  end
  NumberOfRabbitsPair(month - 1) + NumberOfRabbitsPair(month - 2)
end

p 'Enter month: '
String month = gets.chomp
pair = NumberOfRabbitsPair(month.to_f)
p pair