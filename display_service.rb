class DisplayService
  COLORS =
    {
      RED: 'R',
      GREEN: 'G',
      BLUE: 'B',
      YELLOW: 'Y',
      ORANGE: 'O',
      PURPLE: 'P'
    }

  CODE_PICKER_INSTRUCTIONS = 'Please guess what the code is by entering 4 colors like this... RGBY: '
  CHOICES_TEXT = 'The colors to pick from are:'
  FEEDBACK_TEXT = 'Feedback: '
  WIN = 'You Win!!!'
  LOSE = 'You lose'
  PLAY_AGAIN = 'Would you like to play again?'

  def color_reminder
    COLORS.each do |k,v|
      puts "#{k} = #{v}"
      end
  end

  def turn(number)
    printf "Turn #{number} out of 9 - "
  end

  def code_picker_player_instructions(number)
    puts CHOICES_TEXT
    linebreak
    color_reminder
    linebreak
    turn(number)
    printf CODE_PICKER_INSTRUCTIONS
  end

  def display_feedback(feedback)
    p FEEDBACK_TEXT
    p feedback
  end

  def win_message
    puts WIN
    puts play_again
  end

  def lose_message
    puts LOSE
    puts play_again
  end

  private def linebreak
    puts ' '
  end

  private def play_again
    puts PLAY_AGAIN
  end

end
