require_relative 'node'

class LinkedList
  attr_reader :head

  def initialize
    @head = nil
  end

  def add_first(value)
    return @head = Node.new(value, @head)

    # new_node = Node.new(value)
    # # Edge: if list is empty
    # if @head.nil?
    #   @head = new_node
    # else
    #   new_node.next = @head
    #   @head = new_node
    # end
    # return new_node
  end

  def get_first
    # Edge: if list is empty
    return self.head.nil? ? nil : self.head.data
  end

  def length
    # Edge: if @head.nil?
    if @head.nil?
      return 0
    else
    # Edge: if @head.next.nil?
      length = 1
      current = @head
      until current.next.nil?
        length += 1
        current = current.next
      end
      return length
    end
  end

  def add_last(value)
    new_node = Node.new(value) #default next = nil
    # Edge: if @head.nil?
    if @head.nil?
      return @head = new_node
    else
      #Bunny Hop of Linked List
      current = @head
      until current.next.nil?
        current = current.next
      end
      return current.next = new_node
    end
  end

  def get_last
    return bunny_hop.data
  end

  def get_at_index(index)
    # Edge: @head.next.nil?
    # Edge: index is > 0 (out of bounds)
    if @head.nil? || index > length
      return nil
    else
      # Edge: index = 0
      current = @head
      index.times do |i|
        current = current.next
      end
      return current.data
    end
  end

  def bunny_hop
    current = @head
    until current.next.nil?
      current = current.next
    end
    return current
  end

end
