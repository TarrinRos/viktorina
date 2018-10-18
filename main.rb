# Lesson29, task2
# ==================================================
# Викторина
# ==================================================

require_relative 'lib/question'
require_relative 'lib/quiz'

# Считывает текущий путь проекта
current_path = File.dirname(__FILE__)
file_path = "#{current_path}/data/questions.xml"

quiz =  Quiz.get_data(file_path)

until quiz.thats_all?
  quiz.ask_next_question

  puts ''
  puts quiz.question

  begin
    # Get amount of time for the answer
    seconds = quiz.question.seconds

    # Gem makes countdown
    Timeout::timeout(seconds) do
      users_choice = STDIN.gets.to_i

      if quiz.question.is_correct?(users_choice - 1)
        puts 'Вы угадали'
        quiz.correct_answers_count += 1
      else
        puts 'Вы не угадали'
        puts "Правильный ответ: #{quiz.question.show_correct_answer}"
      end
    end
  rescue
    puts 'Время истекло'
    puts ''
    next
  end
end
puts '============================================'
puts 'Викторина oкончена.'
puts "Количество правильных ответов: #{quiz.correct_answers_count}."