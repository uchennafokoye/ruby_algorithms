require 'test_helper'
require 'selection_sort'

class SelectionSortTest < Minitest::Test

  def setup
    @array = [3, 2, 4, 5, 6, 1]
    @valid_arrays_asc = [
        { input: [1], output: [1] },
        { input: [9, 2, 4, 5, 6, 1], output: [1, 2, 4, 5, 6, 9] },
        { input: [0, 2, 4, 5, 6, 1], output: [0, 1, 2, 4, 5, 6] }
    ]

    @valid_arrays_desc = [
        { input: [1], output: [1] },
        { input: [9, 2, 4, 5, 6, 1], output: [9, 6, 5, 4, 2, 1] },
        { input: [0, 2, 4, 5, 6, 1], output: [6, 5, 4, 2, 1, 0] }
    ]
  end

  def teardown
    # Do nothing
  end

  def test_that_class_implements_sorting_interface
    assert(SelectionSort.ancestors.include?(SortingInterface), msg="Does not implement sorting interface")
  end

  def test_sort_ascending
    actual = SelectionSort.order(@array)
    expected = [1, 2, 3, 4, 5, 6]
    assert_equal expected, actual
  end

  def random_parameterized_test_asc
    test_case = @valid_arrays_asc[rand(0..@valid_arrays_asc.length)]
    actual = SelectionSort.order(test_case[:input])
    assert_equal(test_case[:output], actual)
  end

  def random_parameterized_test_desc
    test_case = @valid_arrays_desc[rand(0..@valid_arrays_desc.length)]
    actual = SelectionSort.new(test_case[:input], :desc => true)
    assert_equal(test_case[:output], actual)
  end

  def test_sort_descending
    actual = SelectionSort.order(@array, :desc => true)
    expected = [6, 5, 4, 3, 2, 1]
    assert_equal expected, actual
  end

  def test_time_complexity_output
    best = SelectionSort::TIME_COMPLEXITY_BEST
    worst =  SelectionSort::TIME_COMPLEXITY_WORST
    average = SelectionSort::TIME_COMPLEXITY_AVERAGE
    assert_equal("O(n^2)", worst)
    assert_equal("O(n^2)", best)
    assert_equal("O(n^2)", average)
  end
end