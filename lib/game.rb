require 'pry'

class Game

    attr_accessor :players, :board
  
    def initialize
      @players = []
      @board = Board.new
      @already_choosen =[]
    end
  
    # Fonction qui demande le nom des 2 joueurs
    def ask_name
      puts "Nom du player 1 ?"
      print "> "
      @players << Player.new(gets.chomp.to_s, "X")
  
      puts "Nom du player 2 ?"
      print "> "
      @players << Player.new(gets.chomp.to_s, "O")
    end
    
    
    # Fonction qui fait jouer les joueurs un par un
    def select_player()
      while @board.game_state_variable == false
        @players.each { |item| choose_case(item) }
      end
    end
  
    # Selon le cas, l'utilisateur veut jouer et retourner le symbole dans la case sélectionné
    def choose_case (player)
      # Si un joueur gagne
        puts
        puts "A toi de jouer #{player.name} avec le symbole '#{player.symbol}' choisis une case et ne te trompe pas !"
     #   puts "Voici les positions disponibles : #{@array_cases[]}"
        print "> "
        choice = gets.chomp
        while @already_choosen.include?(choice)
            puts "Cet emplacement est déjà pris. Choisir un espace libre :"
            print "> "
            sleep(2)
            choice = gets.chomp   
        end
        @already_choosen << choice
        @board.write_on_case(choice, player.symbol)
        system("clear")
        puts "     #{@players[0].name} joue avec les X"
        puts "     #{@players[1].name} joue avec les O"
        puts
        puts
        @board.show_board
        puts 
        @board.game_state
        if @board.game_state_variable == true
            puts "Bravo #{player.name}!! Tu as gagné !!"
          # Si le jeu est nul
          elsif @already_choosen == @array_cases #  board.game_nil_variable == true
            puts "la partie est finie, match nul!!"
          # Quand le jeu tourne
          else
      end
    end
  
    # Demande si l'utilisateur veut rejouer
    def ask_new_game
      puts "Taper 'quit' pour quitter, ou n'import quel caractère pour rejouer "
      print "> "
      new_game = gets.chomp.to_s
  
      if new_game != "quit"
        # appeler le 'self perform' pour jouer encore
        perform
      end
    end
  
    def perform
        initialize()
      ask_name
      system("clear")
      puts "Le nom du joueur 1 est #{@players[0].name} et son symbole est #{@players[0].symbol}"
      puts "Le nom du joueur 2 est #{@players[1].name} et son symbole est #{@players[1].symbol}"
      puts
      puts
      # Affiche le plateau de jeu vide avant de jouer
      @board.show_board
      select_player()
      ask_new_game
    end
  end