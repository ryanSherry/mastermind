class MasterMindService
  RED_PEG = 'R'
  WHITE_PEG = 'W'

  COLOR_GENERATOR =
    %w[R G B Y O P]

  def provide_user_feedback(answer, guess)
    user_guess = guess.split('')
    p answer
    feedback = []
    #evaluate guess
    # check position
    # check contains
    user_guess.each_with_index do |user_guess_letter, index|
      if user_guess_letter == answer[index]
        feedback << RED_PEG
      elsif answer.include? user_guess_letter
        feedback << WHITE_PEG
      end
    end
    feedback
  end

  def check_for_win(feedback)
    feedback.count(RED_PEG) == 4
  end

  def increment_turn(turn)
    turn + 1
  end

  def generate_code
    code = []
    number_of_colors = COLOR_GENERATOR.length
    p number_of_colors
    4.times do
      code << COLOR_GENERATOR[rand(number_of_colors - 1)]
    end
    p code
    code
  end

end
