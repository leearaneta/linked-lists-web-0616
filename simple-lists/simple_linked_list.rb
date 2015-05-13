class Element

  attr_reader :datum, :next, :previous

  def initialize(datum, next_elem)
    @datum = datum
    @next_elem = next_elem
    next_elem.previous = self if next_elem
  end

  def previous=(node)
    @previous = node
    node.next = self unless node == nil || node.next == self
  end

  def next=(elem)
    @next = elem
    elem.previous = self unless elem == nil
  end

  def self.to_a(elem)
    temp = []
    current = elem
    while current
      temp << current.datum
      current = current.next
    end
    temp
  end

  def to_a
    temp = []
    current = self
    while current
      temp << current.datum
      current = current.next
    end
    temp
  end

  def reverse
    current = Element.new(self.datum, nil)
    if self.next
      next_element = Element.new(self.next.datum, self.next.next)
    end
    while next_element
      next_next_element = next_element.next
      new_next_element = Element.new(next_element.datum, current)
      current = new_next_element
      next_element = next_next_element
    end
    current
  end

  def self.from_a(array)
    return nil if array.size == 0
    current = nil
    next_elem = nil
    root = nil
    array.each do |value|
      if current
        next_elem = Element.new(value, nil)
        current.next = next_elem
        current = next_elem
      else
        current = Element.new(value, nil)
        root = current
      end
    end
    root
  end
end
