puts('Enter polindrom:')
class String
  def polindrom?
    self == reverse
  end
end
String pol = gets.chomp

if pol.polindrom?
  p 'its polindrom'
else
  p 'its not polindrome'
end