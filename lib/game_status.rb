# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

def won?(board)
  result = WIN_COMBINATIONS.select do |win|
    board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]] && position_taken?(board, win[0])
  end 
  if result == []
    nil
  else
    result.flatten
  end
end

def full?(board)
  if board.find{|i| i == " "}
    false
  else
    true
end
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    true
  else
    false
  end  
end

def over?(board)
  if !!won?(board) == true || draw?(board) == true || full?(board) == true
    true
  else 
    false
  end
end

def winner(board)
  if !!won?(board) == true
    board[won?(board)[0]]
end
end