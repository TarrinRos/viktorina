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

quiz.start