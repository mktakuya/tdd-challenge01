

class Stack
  def initialize
    @list = []
  end

  def size
    @list.size
  end

  def empty?
    size == 0
  end

  def push(*args)
    @list.push(*args)

    @list
  end

  def pop
    @list.delete_at(-1)
  end
end
