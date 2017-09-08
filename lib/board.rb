class Board

  WIN_COMBINATIONS =
  [ [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2] ]

  attr_accessor :cells

  def initialize(cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    @cells = cells
  end

  def reset!
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display
    puts " #{cell_display(0)} | #{cell_display(1)} | #{cell_display(2)} "
    puts "-----------"
    puts " #{cell_display(3)} | #{cell_display(4)} | #{cell_display(5)} "
    puts "-----------"
    puts " #{cell_display(6)} | #{cell_display(7)} | #{cell_display(8)} "
  end

  def cell_display(cell)
    if cells[cell] == ' '
      "#{cell + 1}".colorize(:light_black)
    elsif cells[cell] == "X"
      "X".colorize(:light_green)
    elsif cells[cell] == "O"
      "O".colorize(:light_red)
    end
  end

  def position(input)
    cells[input.to_i - 1]  
  end

  def converter(player_input)
      player_input.to_i - 1
  end

  def full?
    !cells.include?(" ")
  end

  def turn_count
    9 - cells.select {|cell| cell == " "}.size
  end

  def taken?(player_input)
    # cells[converter(player_input)] != " "
    !(position(player_input) == " ")
  end

  def valid_move?(player_input)
    player_input.to_i >= 1 && player_input.to_i <= 9 && !taken?(player_input)
  end

  def update(input, player)
  	cells[converter(input)] = player.token
  end

  def move(input, token)
    cells[input] = token
  end

  def clone
    Board.new(self.cells.clone)
  end


end
