class MasterMindService
  RED_PEG = 'R'
  WHITE_PEG = 'W'

  COLOR_GENERATOR =
    %w[R G B Y O P]

  def provide_user_feedback(answer, guess)
    user_guess = guess.split('')
    # each time we put a peg in, remove from track_answer. We need to do this first for red and then for white since
    # one that produces red peg should not also produce a white peg
    track_answer_letters = answer.clone
    track_guess_letters = user_guess.clone
    feedback = []

    user_guess.each_with_index do |user_guess_letter, index|
      if user_guess_letter == answer[index]
        feedback << RED_PEG
        track_answer_letters[index] = nil
        track_guess_letters[index] = nil
      end
    end

    track_guess_letters.compact!

    track_guess_letters.each do |user_guess_letter|
      if track_answer_letters.include?(user_guess_letter)
        feedback << WHITE_PEG
        index_to_clear = track_answer_letters.find_index(user_guess_letter)
        track_answer_letters[index_to_clear] = nil
      end
    end

    feedback
  end

  def provide_user_summary(feedback_summary, turn, user_input, user_feedback)
    feedback_summary << {turn: turn, input: user_input, feedback: user_feedback}
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
    4.times do
      code << COLOR_GENERATOR[rand(number_of_colors - 1)]
    end
    code
  end

  def play_again(user_response)
    user_response.upcase.include?('Y')
  end

end
