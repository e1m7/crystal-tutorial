
puts "Hello World"
print "Hello World"

# Комментарий

value = 10
_value = 10
value123 = 10

PI = 3.14
COMPANY = "Apple"

a, b = 1, 2
bool1 = true
bool2 = false
bool3 = 10 > 5

puts sizeof(Int8)
puts sizeof(Int16)
puts sizeof(Int32)
puts sizeof(Int64)
puts sizeof(Float32)
puts sizeof(Float64)

# Точность Float примерно 13 знаков после запятой

char1 = 'a'
char2 = 'b'
string1 = "Hello World"
string2 = "Hello \"World\""
string3 = "Hello\nWorld"

a = 10
b = 20
puts "#{a} + #{b} = #{a + b}"
puts "#{a} - #{b} = #{a - b}"
puts "#{a} * #{b} = #{a * b}"
puts "#{a} / #{b} = #{a / b}"

string4 = "Ночевала тучка золотая
На груди утеса-великана
Рано утром в путь она пустилась
Но остался влажный след в утесе"

# Работа со строками

string5 = "Hello World"
puts string5.size
puts string5 * 5

st1 = "Hello"
st2 = "Hallo"
puts st1 == st2
puts st1.compare(st2)

st3 = "Amsterdam"
puts st3[0]
puts st3[1]
puts st3[2]
puts st3[st3.size-1]

st3 = "All you need is love"
st4 = "you"
st5 = "kill"
puts st3.index(st4)
puts st3.index(st5)
puts st3.include?("love")
puts st3.include?("many")
puts st3.count('e')
puts st4.empty?

st6 = "Amsterdam from Holland"
puts st6[1..5]
puts st6[1...5]
puts st6[1..]
puts st6[..10]

# Проход по строке и превращение строки в массив

st7 = "London"
st7.each_char do |elem|
  puts elem
end

st7 = "London"
array7 = st7.chars
puts array7

st7 = "London"
array7 = st7.split("")
puts array7

# Поиск и замена в строке

st8 = "I love Mary, only Mary and never other girls. Mary!"
puts st8.sub(7..10, "Marina")
puts st8

st8 = "I love Mary, only Mary and never other girls. Mary!"
puts st8.gsub("Mary", "Marina")
puts st8

st8 = "I love Mary, only Mary and never other girls. Mary!"
puts st8.insert(11, " Ivanova's")

# Работа с массивами

arr1 = [1, 2, 3, 4, 5, 6, 7, 8]
arr2 = [1, 2, 3, "hello", 5.1, 6.2, 7.3, "chao"]
arr3 = [1,2,3,4.5] of Int32 | Float32

arr4 = [] of Int32
arr4 << 1
arr4 << 2
arr4 << 3
puts arr4

arr4 = Array(Int32).new
arr4 << 1
arr4 << 2
arr4 << 3
puts arr4

# Тип массива может быть составной

arr2 = [1, 2, 3, "hello", 5.1, 6.2, 7.3, "chao"]
puts typeof(arr2)

# Массив можно создать на основе строки

names = "Morina,Polina,Tommy,Jimmy"
names_arr = names.split(',')
puts names_arr
names_arr[0] = "Marina"
puts names_arr
puts names_arr[1..2]
puts names_arr[-1]

# Важные операции с массивом: добавить, удалить элемент

arr10 = [1,2,3,4,5,6,7,8]
puts arr10
puts arr10.pop
puts arr10
arr10.push(10)
puts arr10

arr10 = [1,2,3,4,5,6,7,8]
arr10.shift
puts arr10

arr10 = [1,2,3,4,5,6,7,8]
puts arr10.includes?(7)
arr10.delete(7)
puts arr10

arr10 = [1,2,3,4,5,6,7,8]
arr10.delete_at(0,2)
puts arr10

arr10 = [1,2,3,4,5,6,7,8]
arr10.insert(5,100)
puts arr10

# 1) pop            = удалить последний с конца массива
# 2) push(v)        = добавить новый v в конец массива
# 3) shift(v)       = добавить новый v в начало массива
# 4) delete(v)      = удалить определенное значение v из массива
# 5) delete_at(n,m) = удалить с n-ой позиции m элементов
# 6) insert(n,m)    = вставить в n-ую позицию значение m

arr11 = [1,2,3]
arr11.push(6,-3,-2,0,10,100)
arr11.sort
puts arr11

arr12 = [1,2,3,1,2,3,4,5,6,6,6,6]
puts arr12
puts arr12.uniq

# Операции над массивами

array1 = [1,2,3,4,5,6,7,8]
puts array1
array1.map! { |x| x*x }
puts array1

array1 = [3,-2,1,5,-4]
array1.sort!
puts array1

array2 = [1,2,3]
puts array2.permutations

array3 = ["тупой", "толстый", "дурак"]
puts array3.permutations

# 1) map!
# 2) sort
# 3) permutaions
# 4) uniq

# Обработка массивов

array4 = [1,2,3,4,5,6,7,8]
array4.each do |elem|
  puts elem
end

array4 = [1,2,3,4,5,6,7,8]
array4.each do |elem|
  puts("Очередной элемент = #{elem}")
end

# Циклы

# 1) с предусловием while 
# 2) с постусловием loop
# 3) досрочный выход break
# 4) следующая итерация next

i = 0
while i < 10
	puts("Обрабатываем i = #{i}")
	i = i + 1
end

i = 0
loop do
  puts("Обрабатываем i = #{i}")
  i = i + 1
  break if i > 10
end

# Условные операторы

# Операторы сранения: >, >=, <, <=, ==, !=
# Операторы логические: and %%, or ||, not !

age = 12
if (age >= 5 && age <= 6)
  puts "Вы должны идти в детский сад"
elsif (age >= 7 && age <= 13)
  puts "Вы должны идти в младшую школу"
elsif (age >= 14 && age <= 18)
  puts "Вы должны идти в старшую школу"
else
  puts "Вам не надо никуда идти"
end

age = 17
if (age >= 16) 
  puts "Доступ на фильм разрешен"
else
  puts "Доступ на фильм запрещен"
end

puts "Доступ на фильм разрешен" if age >= 16
puts "Доступ на фильм запрещен" if age < 16

# Как работают && и || с разными значениями

puts "true && true = " + (true && true).to_s
puts "true && false = " + (true && false).to_s
puts "false && true = " + (false && true).to_s
puts "false && false = " + (false && false).to_s

puts "true || true = " + (true || true).to_s
puts "true || false = " + (true || false).to_s
puts "false || true = " + (false || true).to_s
puts "false || false = " + (false || false).to_s

# Задача fizz-bazz: даны числа 0-100
# Вывести на экран "fizz", если число делится на 3
# Вывести на экран "bazz", если число делится на 5
# Вывести на экран "fizzbazz", если число делится на 3 и на 5
# Вывести на экран "-", если число не попадает под правила

i = 0
while i <= 100
	if (i % 3 == 0 && i % 5 == 0) 
		puts("#{i} fizzbazz(15)")
  elsif (i % 3 == 0)
    puts("#{i} fizz(3)")
  elsif (i % 5 == 0)
    puts("#{i} bazz(5)")
  else
    puts("#{i} -")
	end
	i = i + 1
end

# Оператор выбора

puts "Ваш язык: "
lang = gets

case lang
when "Russian", "russian"
  puts "Добрый день!"
  exit
when "Spain", "spain"
  puts "Hola!"
  exit
else
  puts "Hello"
end

# Тернарный оператор

age = 55
man = age >= 50 ? "Старый" : "Молодой"
puts man

a = 10
b = 20
c = a > b ? 100 : 200
puts("a = #{a} b = #{b} c = #{c}")

print("Введите два числа")
n1 = get.not_nil!
n2 = get.not_nil!
puts("#{n1} + #{n2} = #{n1.to_i + n2.to_i}")

# 1) +
# 2) -
# 3) *
# 4) /
# 5) Mart.sqrt
# 6) Mart.cbrt
# 7) Mart.max
# 8) Mart.min
# 9) Mart.log