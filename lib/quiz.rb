require 'rexml/document'
class Quiz
  attr_reader :questions

  def self.get_data(file_path)
    abort 'Файл XML с указанным именем не найден' unless File.exist?(file_path)

    file = File.new(file_path)
    doc = REXML::Document.new(file)
    file.close
    question_samples = doc.get_elements("questions/question")
    questions = question_samples.map { |sample| Question.new(sample) }
    self.new(questions)
  end
  def initialize(questions)
    @questions = questions
  end
end