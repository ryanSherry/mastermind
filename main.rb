#!/usr/bin/env ruby
require './display_service'
require './master_mind_service'
class Main
  LOSE = 9

  def play_game(master_mind_service, display_service, turn, play_again, answer)
    if play_again
      display_service.code_picker_player_instructions(turn)
      guess = gets.chomp.upcase
      feedback = master_mind_service.provide_user_feedback(answer, guess)
      display_service.display_feedback(feedback)

      if master_mind_service.check_for_win(feedback)
        display_service.win_message
        play_again = gets.chomp.upcase
        play_game(master_mind_service, display_service, 1, master_mind_service.play_again(play_again),
                  master_mind_service.generate_code) unless !play_again
      elsif turn == LOSE
        display_service.lose_message
        play_again = gets.chomp.upcase
        play_game(master_mind_service, display_service, 1,
                  master_mind_service.play_again(play_again), master_mind_service.generate_code) unless !play_again
      else
        play_game(master_mind_service, display_service, turn + 1, true, answer)
      end
    end
  end
end

master_mind_service = MasterMindService.new
display_service = DisplayService.new
Main.new.play_game(master_mind_service, display_service, 1, true, master_mind_service.generate_code)
display_service.goodbye
