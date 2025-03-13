class Node
  attr_accessor :data, :previous

  def initialize(data, previous=nil)
    @data = data
    @previous = previous
  end
end

def knight_moves(start=[0,0], finish=[2,4])
  return Node.new(start) if start == finish

  queue = Array.new 
  queue << Node.new(start)

  directions = [[1,2],[2,1],[2,-1],[1,-2],[-1,-2],[-2,-1],[-2,1],[-1,2]]

  until queue.empty?
    front = queue.shift

    directions.each do |a, b|
      next if front.data[0] + a < 0 || front.data[0] + a > 7 || front.data[1] + b < 0 || front.data[1] + b > 7

      new_node = Node.new([front.data[0] + a, front.data[1] + b])
      new_node.previous = front
      queue << new_node 
      # puts "added #{[front.data[0], front.data[1]]} --> #{new_node.data}"
      
      return new_node if new_node.data == finish
    end
  end
end

# Reverses a linked list to point forwards instead of backwards, so that I can print in order from origin
def reverse_linked_list(head)
  next_node = nil
  curr_node = head

  until curr_node.nil?
    temp = curr_node.previous  
    curr_node.previous = next_node
    next_node = curr_node
    curr_node = temp
  end
  
  return next_node
end

def num_moves(head)
  curr_node = head
  num = 0

  until curr_node.previous.nil?
    curr_node = curr_node.previous
    num += 1
  end

  num
end

def print_path_from_result(result_node)
  curr_node = reverse_linked_list(result_node)
  puts "You made it from in #{num_moves(curr_node)} moves!  Here's your path:"
  until curr_node.nil?
    p curr_node.data
    curr_node = curr_node.previous
  end
end

print_path_from_result(knight_moves([0,0],[0,0]))
print_path_from_result(knight_moves)
print_path_from_result(knight_moves([0,0],[3,3]))
print_path_from_result(knight_moves([3,3],[0,0]))
print_path_from_result(knight_moves([3,3], [4,3]))
print_path_from_result(knight_moves([0,0], [7,7]))
