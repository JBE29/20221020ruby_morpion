require 'pry'

class Board

    attr_accessor :array_cases, :choose_case, :game_state_variable, :game_nil_variable
  
    def initialize
      # Initialiser les 9 BoardCases
      @A1 = BoardCase.new("a1", " ")
      @A2 = BoardCase.new("a2", " ")
      @A3 = BoardCase.new("a3", " ")
      @B1 = BoardCase.new("b1", " ")
      @B2 = BoardCase.new("b2", " ")
      @B3 = BoardCase.new("b3", " ")
      @C1 = BoardCase.new("c1", " ")
      @C2 = BoardCase.new("c2", " ")
      @C3 = BoardCase.new("c3", " ")
  
      @game_state_variable = false
  
      @game_nil_variable = false
  
      @array_cases = [@A1, @A2, @A3, @B1, @B2, @B3, @C1, @C2, @C3]
  
    end
  
    # Fonction qui écrit le symbole de l'utilisateur dans le cas choisi par l'utilisateur actuel
    def write_on_case (case_choose, player_symbol)
      @array_cases.map { |item| item.position == case_choose ? item.content = player_symbol  : item }
    end
  
    # Cette fonction vérifie chaque possibilité de gain et obtient la variable game_state_variable à true si elle en trouve
    def game_state
  
      if @A1.content == "O" && @A2.content == "O" && @A3.content == "O" || @A1.content == "X" && @A2.content == "X" && @A3.content == "X"
       @game_state_variable = true
      end
  
      # On test la 2ème ligne
      if @B1.content == "O" && @B2.content == "O" && @B3.content == "O" || @B1.content == "X" && @B2.content == "X" && @B3.content == "X"
       @game_state_variable = true
      end
  
      # On test la 3ème ligne
      if @C1.content == "O" && @C2.content == "O" && @C3.content == "O" || @C1.content == "X" && @C2.content == "X" && @C3.content == "X"
      @game_state_variable = true
      end
  
      # On test la 1ère colonne
      if @A1.content == "O" && @B1.content == "O" && @C1.content == "O" || @A1.content == "X" && @B1.content == "X" && @C1.content == "X"
       @game_state_variable = true
      end
  
      # On test la 2ème colonne
      if @A2.content == "O" && @B2.content == "O" && @C2.content == "O" || @A2.content == "X" && @B2.content == "X" && @C2.content == "X"
       @game_state_variable = true
      end
  
      # On test la 3eme colonne
      if @A3.content == "O" && @B3.content == "O" && @C3.content == "O" || @A3.content == "X" && @B3.content == "X" && @C3.content == "X"
       @game_state_variable = true
      end
  
      # On test la diagonale gauche
      if @A1.content == "O" && @B2.content == "O" && @C3.content == "O" || @A1.content == "X" && @B2.content == "X" && @C3.content == "X"
       @game_state_variable = true
      end
  
      # On test la diagonale droite
      if @A3.content == "O" && @B2.content == "O" && @C1.content == "O" || @A3.content == "X" && @B2.content == "X" && @C1.content == "X"
       @game_state_variable = true
      end
  
    end
  
    # Méthode qui vérifie si le plateau est plein de "X" et "O" pour arrêter le jeu en tant que jeu nul (pas terminé)
    def game_nil
      @array_cases.each { |item| item.content == /[:SPACE:]/ ? @game_nil_variable = true : @game_nil_variable = false }
    end
  
    def show_board
      # Afficher le plateau vide à l'initialisation et obtenir une variable à chaque tour de joueur
      puts "   1   2  3"
      puts " a #{@A1.content} | #{@A2.content} | #{@A3.content}"
      puts "   _________"
      puts
      puts " b #{@B1.content} | #{@B2.content} | #{@B3.content}"
      puts "   _________"
      puts
      puts " c #{@C1.content} | #{@C2.content} | #{@C3.content}"
  
    end
  end #end of class