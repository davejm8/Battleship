# We run our runner file by typing ruby runner.rb in our runner file is
# only the neccesary components for the game to function. And we do that
# because ruby reads line by line and the less lines in the runner file
# the smoother the program will be. 
# When we run ruby runner.rb and press return our user will see the
# opening portion of our file wich will say "welcom to passive-agressive
# battleship" and will be given a prompt of how to play the game. 
# The opponents board will be generated at random and the player will be 
# able to select the coordinates to place their own ships.
# If player enters in invalid coordinates they will be prompted to try
# again, invalid coordinate would be anything not consecutive, anything
# not eqaul to the length, and not overlapping. Also, the coordinates
# have to be part of the coordinates shown on the board.
# Upon following instructions to play the players will be given a visual 
# of their board with their ships revealed and the opponents(Chad) board without
# the ships revealed. The player can now fire by typing in the coordinate that
# they wish to fire upon. A message will be returned reporting if the shot was 
# a hit, miss, or has sunk ship. The computer will then fire back on a random
# coordinate. Both the computer board and player board will be rendered 
# with the new information and the player will be asked to fire again. This will continue 
# until both of the ships of either computer or player's are sunk. If the player loses
# both ships they will receive a message that they have lost. If the computer loses
# both ships the player will receive a message that they have won. 

require './lib/board'
require './lib/ship'
require './lib/cell'
require './lib/game'

game = Game.new
game.game_start