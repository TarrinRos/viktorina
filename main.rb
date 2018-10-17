# Lesson29, task2
# ==================================================
# Викторина
# ==================================================

require_relative 'lib/question'
require_relative 'lib/quiz'

# Считывает текущий путь проекта
current_path = File.dirname(__FILE__)
file_path = "#{current_path}/data/questions.xml"

# Счетчик неправильных ответов
wrong_answers_count = 0

puts Quiz.get_data(file_path)

# Просит пользователя ввести ответ на вопрос

# user_input = STDIN.gets.chomp

# Сверяет совпадает ли ответ пользователя с ответом в массиве ответов
# if user_input.downcase == answers[index].downcase
#   puts "Это правильный ответ"
# else
#   puts "Ответ неверный"
#   wrong_answers_count += 1
#   puts "Количество неправильных ответов: #{wrong_answers_count}"
# end