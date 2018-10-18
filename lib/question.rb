class Question
  attr_reader :seconds

  def self.xml_parse(question)
    # Gets question text
    text = question.elements["text"]

    # Gets amount of seconds for answer
    seconds = question.attributes["seconds"]

    # Gets answer_choices list
    answer_choices = question.get_elements("variants/variant").shuffle

    # Sends params to initialize
    self.new(text, seconds, answer_choices)
  end

  def initialize(text, seconds, answer_choices)
    # Gets content of text element
    @text = text.text
    @seconds = seconds.to_i

    # Gets the array of answers choices
    @answer_choices = answer_choices.map {|choice| choice[0]}

    # Gets index of correct choice from the answers choices
    @correct_choice_index = answer_choices.index {|item| item.attributes["correct"]}
  end

  def to_s
    <<~EOM
      У вас #{@seconds} сек на то, чтобы ответить:
      ============================================
      #{@text}

      #{@answer_choices.map.with_index {|choice, index| "#{index + 1}. #{choice}"}.join("\n")}
    EOM
  end

  def is_correct?(users_choice)
    users_choice == @correct_choice_index
  end

  def show_correct_answer
    @answer_choices[@correct_choice_index]
  end
end