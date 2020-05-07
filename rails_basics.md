1. Rails console
```bash
rails console
```

2. Numeric operations
```
x = 17 + 42
x += 1
```

2. String operations
```
first_name = "Michael"
last_name = "Hartl"
puts "#{first_name} #{last_name}"
puts first_name + " " + last_name
```

3. Printing
```rails
puts "foo" 

# with new line
print "foo\n"
```
!!! Single-quoted strings don't allow interpolation, use double !!!

4. Important operations:
```ruby
###
"foobar".length 
"foobar".reverse 

###
"foobar".empty?
"".empty?

### conditions
s = "foobar"
if s.nil?
  "The variable is nil"
elsif s.empty?
  "The string is empty"
elsif s.include?("foo")
  "The string includes 'foo'"
end

### && (“and”), || (“or”), and ! (“not”) operators
x = "foo"
y = ""

puts "Both strings are empty" if x.empty? && y.empty?
puts "One of the strings is empty" if x.empty? || y.empty?
puts "x is not empty" if !x.empty?

### to string
nil.to_s
nil.empty?
nil.to_s.empty? 

### testing for nil-ness
"foo".nil?
"".nil?
nil.nil?

### unless
string = "foobar"
puts "The string '#{string}' is nonempty." unless string.empty?

### negation
!!nil
!!0
```

5. Functions:
```ruby
def string_message(str = '')
  if str.empty?
    "It's an empty string!"
  else
    "The string is nonempty."
  end
end

puts string_message("foobar")
puts string_message("")
puts string_message()

### 
def string_message(str = '')
  return "It's an empty string!" if str.empty?
  return "The string is nonempty."
end

puts string_message("foobar")
puts string_message("")
puts string_message()
```

6. Arrays and ranges
```ruby
"foo bar     baz".split
"fooxbarxbaz".split('x')

###
a = [42, 8, 17]
a[0]
a[1]
a[2]
a[-1]
a.first
a.second
a.last

a.include?(42)
a.sort
a.sort!   # to mutate the array 
a.reverse
a.shuffle
a.push(6) # to push data to array
a << 6    # to push data to array
a << "foo" << "bar" # to push data to array
a.join    # Join on nothing
a.join(', ') # Join on comma-space

### ranges
(0..9).to_a
('a'..'e').to_a
a = %w[foo bar baz quux] 
a[0..2]

a = (0..9).to_a
a[2..(a.length-1)]  # slicing       
a[2..-1]            # slicing
```

7. Blocks
```ruby
(1..5).each { |i| puts 2 * i }

###
(1..5).each do |i|
  puts 2 * i
end

###
(1..5).each do |number|
   puts 2 * number
   puts '--'
end

###
3.times { puts "Betelgeuse!" }

###
(1..5).map { |i| i**2 }  

###
%w[a b c].map { |char| char.upcase }
%w[a b c].map { |char| char.downcase }
%w[A B C].map(&:downcase)

###
('a'..'z').to_a.shuffle[0..7].join
```

8. Hashes and symbols
```ruby
user = {}    
user["first_name"] = "Michael" 
user["last_name"] = "Hartl"
user["first_name"]      
user
user = { "first_name" => "Michael", "last_name" => "Hartl" }

### hashes with symbols
user = { :name => "Michael Hartl", :email => "michael@example.com" }
user[:name]
user[:email]

### nested hashes
params = {}
params[:user] = { name: "Michael Hartl", email: "mhartl@example.com" }
params[:user][:email]

### iterating through hashes
flash = { success: "It worked!", danger: "It failed." }
flash.each do |key, value|
  puts "Key #{key.inspect} has value #{value.inspect}"
end
```

9. Inspect method
```ruby
puts (1..5).to_a.inspect 
puts :name, :name.inspect
puts "It worked!", "It worked!".inspect
```

10. Constructors
```ruby
s = "foobar"
s.class
s = String.new("foobar") 
```

11. Classes
```ruby
class Word
  def palindrome?(string)
    string == string.reverse
  end
end

Word.new
w.palindrome?("foobar")
w.palindrome?("level")

###
class Word < String             # Word inherits from String.
  # Returns true if the string is its own reverse.
  def palindrome?
    self == self.reverse        # self is the string itself.
  end
end

s = Word.new("level")
s.palindrome?            # Words have the palindrome? method.
s.length 

###
class Word < String             # Word inherits from String.
  # Returns true if the string is its own reverse.
  def palindrome?
    self == reverse        # reverse search for default string in self.
  end
end

s = Word.new("level")
s.palindrome?            # Words have the palindrome? method.
s.length 
```

12. Modifying built-in classes
```ruby
class String
  # Returns true if the string is its own reverse.
  def palindrome?
    self == self.reverse
  end

  def shuffle
    split("").shuffle
  end
end

"deified".palindrome?
"deified".shuffle
"".blank?
"      ".empty?
nil.blank?
```

13. Checking parent classes
```ruby
s = "aba"

s.class
s.class.superclass
s.class.superclass.superclass
s.class.superclass.superclass.superclass
``` 

14. Creating User class: example_user.rb
```ruby
class User
  attr_accessor :name, :email

  def initialize(attributes = {})
    @name  = attributes[:name]
    @email = attributes[:email]
  end

  def formatted_email
    "#{@name} <#{@email}>"
  end
end
```