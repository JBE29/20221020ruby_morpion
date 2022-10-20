require 'bundler'
Bundler.require

$:.unshift File.expand_path("/home/jbe29/dossierlinux/20221020ruby_morpion/lib")
require 'player'
require 'boardcase'
require 'game'
require 'board'
require 'show'


Game.new.perform
#Game.new.ask_name
#Board.new.show_board