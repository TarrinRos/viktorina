require 'timeout'
require 'rexml/document'

class Quiz
  attr_reader :questions, :question
  attr_accessor :correct_answers_count

  def self.get_data(file_path)
    abort 'Файл XML с указанным именем не найден' unless File.exist?(file_path)

    file = File.new(file_path)
    doc = REXML::Document.new(file)
    file.close
    # Array of the elements
    question_samples = doc.get_elements("questions/question")

    # Array of the Question instances
    questions = question_samples.map {|sample| Question.xml_parse(sample)}
    self.new(questions)
  end

  def initialize(questions)
    @questions = questions
    @correct_answers_count = 0
    @index = 0
  end

  # Method for stop the quiz
  def thats_all?
    @questions.size <= @index
  end

  def ask_next_question
    @question = @questions[@index]
    @index += 1
  end

  def show_countdown
    @question.seconds.downto(0) do |sec|
      print "#{sec}\r"
      sleep(1)
    end
  end
end