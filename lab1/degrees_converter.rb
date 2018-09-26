# # Class Converter
class Converter
  attr_accessor :from
  attr_accessor :to
  attr_accessor :value

  def initialize(from, to, value)
    if from.is_a? String
      @from = from
    else
      p 'Error: from is not string type'
      exit 1
    end
    if to.is_a? String
      @to = to
    else
      p 'Error: to is not string type'
      exit 1
    end
    if value.is_a? Float
      @value = value
    else
      p 'Error: value is not digins'
      exit 1
    end
  end

  def print
    p @value
  end

  def test_inpit_data
    state = %w[s_from s_to s_val]
    num_of_state = 3
    pass = 0
    (0..(num_of_state - 1)).each do |i|
      case state[i]
      when 's_from'
        unless @from.is_a? String
          puts 'Error: from is not string type'
          return 1
        end
        pass = case @from
               when 'C', 'K', 'F'
                 1
               else
                 0
               end
      when 's_to'
        unless @to.is_a? String
          puts 'Error: to is not string type'
          return 1
        end
        pass = case @to
               when 'C', 'K', 'F'
                 1
               else
                 0
               end
      when 's_val'
        if @value.is_a? Float
          pass = 1
        else
          puts 'Error: to is not float type'
          return 1
        end
      else
        puts 'Error state'
        return 1
      end
      if pass.zero?
        puts 'Incorrect arguments'
        return 1
      end
    end
    !pass
  end

  def convert
    state = from + to
    case state
    when 'CK'
      @value += 273.15
    when 'KC'
      @value -= 273.15
    when 'CF'
      @value = (@value * 1.8) + 32
    when 'FC'
      @value = (@value - 32) / 1.8
    when 'KF'
      @value = 1.8 * (@value - 273.15) + 32
    when 'FK'
      @value = (@value - 32) / 1.8 + 273.15
    else
      puts 'Convert error'
    end
  end
end

puts('Enter the number system from which you want to translate (C, K, F):')
from = gets.chomp
puts('Enter the number system in which you want to translate (C, K, F):')
to = gets.chomp
puts('Enter the value to convert:')
val = gets.chomp

val = val.to_f

converter = Converter.new(from, to, val)
exit 1 if converter.test_inpit_data
converter.convert
converter.print
