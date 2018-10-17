class Question
  def self.from_file(questions_path)
    question =  File.readlines(questions_path, chomp: true)
    self.new(question)
  end

  def initialize(question)
    @question = question[0]
  end

  def to_s
    "#{@question}"
  end
end