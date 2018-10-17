# Lesson29, task2
# ==================================================
# Викторина
# ==================================================

# require_relative 'lib/question'
# require_relative 'lib/answer'

# Считывает текущий путь проекта
current_path = File.dirname(__FILE__)

# Формирует полные пути к файлам вопросов и ответов
questions_path = "#{current_path}/data/questions.xml"
answers_path = "#{current_path}/data/answers.txt"

# Константа времени на ответ


# Если файлы найдены - построчно считывает их в массивы
if File.exists?(questions_path) && File.exists?(answers_path)
  questions = Question.from_file(questions_path)

  answers = File.readlines(answers_path, chomp: true)
else
  puts "Проверьте правильность пути к файлам вопросов и ответов"
end

# Счетчик неправильных ответов
wrong_answers_count = 0

# Проходит по массиву вопросов
# Просит пользователя ввести ответ на вопрос
puts questions.inspect

# user_input = STDIN.gets.chomp

# Сверяет совпадает ли ответ пользователя с ответом в массиве ответов
if user_input.downcase == answers[index].downcase
  puts "Это правильный ответ"
else
  puts "Ответ неверный"
  wrong_answers_count += 1
  puts "Количество неправильных ответов: #{wrong_answers_count}"
end