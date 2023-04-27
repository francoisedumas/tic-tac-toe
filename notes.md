              Tic-Tac-Toe

Choose a cell numbered from 1 to 9 as below and play

              1 | 2  | 3
            --------------
              4 | 5  | 6
            --------------
              7 | 8  | 9

-    -    -    -    -    -    -    -    -    -

COMPUTER has put a O in cell 6


                |    |
            --------------
                |    | O
            --------------
                |    |

HUMAN has put a X in cell 7


                |    |
            --------------
                |    | O
            --------------
              X |    |

COMPUTER has put a O in cell 5


                |    |
            --------------
                | O  | O
            --------------
              X |    |

HUMAN has put a X in cell 1


              X |    |
            --------------
                | O  | O
            --------------
              X |    |

COMPUTER has put a O in cell 9


              X |    |
            --------------
                | O  | O
            --------------
              X |    | O

HUMAN has put a X in cell 8


              X |    |
            --------------
                | O  | O
            --------------
              X | X  | O

COMPUTER has put a O in cell 4


              X |    |
            --------------
              O | O  | O
            --------------
              X | X  | O

COMPUTER has won

Simplified version proposed by ChatGPT

```
class TicTacToe
  attr_reader :board

  WINNING_COMBINATIONS = [
    [0, 1, 2], [3, 4, 5], [6, 7, 8],
    [0, 3, 6], [1, 4, 7], [2, 5, 8],
    [0, 4, 8], [2, 4, 6]
  ]

  def initialize
    @board = (1..9).to_a
  end

  def play(position, player)
    raise "Position not valid" unless (1..9).include?(position)
    raise "It's not your turn" unless player_turn?(player)
    raise "Position not available" unless @board[position-1].is_a?(Integer)
    @board[position-1] = player
    @board
  end

  def player_turn?(player)
    player == "X" ? @board.count("X") == @board.count("O") : @board.count("O") < @board.count("X")
  end

  def winner?
    WINNING_COMBINATIONS.each do |combo|
      if @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return "Player #{@board[combo[0]]} wins"
      end
    end
    "No winner yet"
  end
end
```
