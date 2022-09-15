#!/usr/bin/env ruby
require './display_service'
require './master_mind_service'
class Main
  turn = 1
  master_mind_service = MasterMindService.new
  display_service = DisplayService.new
  # generate answer
  answer = master_mind_service.generate_code
  # print codebreaker instructions and choices
  display_service.code_picker_player_instructions(turn)
  # accept guess
  guess = gets.chomp
  # give feedback on guess
  feedback = master_mind_service.provide_user_feedback(answer, guess)
  # check for win
  if master_mind_service.check_for_win(feedback)
    display_service.
  end
  # increment turn and repeat for 9 turns or until win
  # print past turns with feedback
end
Main.new
