require 'sorting_strategy'
require 'binary_heap'
class HeapSort
  # Important Characteristics
  # 1. One of the best sorting methods being in-place and with no quadratic worst-case scenarios
  # 2. Involves two basic parts:
  #    - Creating a Heap of the unsorted list
  #    - Then a sorted array is created by repeatedly removing the largest/smallest element
  #      from the heap and inserting it into the array. The heap is reconstructed after each removal.
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = HeapSort.order(array)
  #     puts array # Output:  [1, 2, 3, 4, 5, 6]
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     array = HeapSort.order(array, :desc => true)
  #     puts array # Output: [6, 5, 4, 3, 2, 1]
  #
  # OR
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     heap_sort = HeapSort.new(array)
  #     puts heap.array # Output: [1, 2, 3, 4, 5, 6]
  #
  # Example:
  #     array = [3, 2, 4, 5, 6, 1]
  #     insertion = HeapSort.new(array, :desc => true)
  #     puts insertion.array # Output: [6, 5, 4, 3, 2, 1]
  #
  #
  # ### Get Time Complexity:
  # Example:
  #     best = HeapSort::TIME_COMPLEXITY_BEST
  #     worst = HeapSort::TIME_COMPLEXITY_WORST
  #     average = HeapSort::TIME_COMPLEXITY_AVERAGE

  include SortingStrategy
  include BinaryHeap

  TIME_COMPLEXITY_WORST = "O(n log n)"
  TIME_COMPLEXITY_AVERAGE = "O(n log n)"
  TIME_COMPLEXITY_BEST = "O(n log n)"
  SPACE_COMPLEXITY = "O(n)"

  attr_reader :array, :desc

  def initialize array, desc=false
    unless array.is_a? Enumerable
      raise "Please provide an array or other Enumerable"
    end
    unless (array.all? {|item| item.is_a? Comparable})
      raise "All objects must implement Comparable"
    end
    @array = array
    @desc = !!desc
    # sort as min heap if it wants it as descending order
    # sort as max heap otherwise
    @is_min_heap = @desc
    self.sort
  end

  def self.order array, desc=false
    instance = HeapSort.new array, desc=desc
    instance.array
  end

  protected
  def sort
    heap_sort array
  end

  def is_desc?
    @desc
  end


  def heap_sort array
    build_heap(array)
    n = array.length - 1
    for heapsize in n.downto 1
      swap array, 0, heapsize
      heapify array, 0, heapsize
    end

  end



end