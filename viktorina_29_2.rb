# Lesson29, task2
# ==================================================
# Викторина
# ==================================================
current_path = File.dirname(__FILE__)

questions_path = "#{current_path}/data/questions.txt"
answers_path = "#{current_path}/data/answers.txt"

if File.exists?(questions_path) && File.exists?(answers_path)
  questions = File.readlines(questions_path, chomp: true)

  answers = File.readlines(answers_path, chomp: true)
else
  "Check files path"
end

wrong_answers_count = 0

questions.each_with_index do |line, index|
    puts "#{index + 1}. #{line}"

    user_input = STDIN.gets.chomp

    if user_input == answers[index]
      puts 'Это правильный ответ'
    else
      puts 'Ответ неверный'
      wrong_answers_count += 1
    end
end