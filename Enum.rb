def test_solve_for_x
    s = ''
    5.times do
      s+='x'
    end
    assert_equal 'xxxxx', s
  end
 
  def test_count_numbers_greater_than_17
    numbers = [9, 18, 12, 17, 1, 3, 99]
    tally = 0
    numbers.each do |number|
      tally+=1 if number>17  
    end
    assert_equal 2, tally
  end
  
  def test_count_words_that_are_uppercase
    words = ["trousers", "SOCKS", "sweater", "Cap", "SHOE", "TIE"]
    tally = 0
    words.each do |word|
    tally+=1 if word == word.upcase
    end
    assert_equal 3, tally
  end
  
  def test_count_round_prices
    tally = 0
    prices = [1.0, 3.9, 5.99, 18.5, 20.0]
    # Your code goes here
    prices.each do |price|
      tally+=1 if (price==price.round)
    end
    assert_equal 2, tally
  end
  
  def test_count_four_letter_words
    tally = 0
    words = ["bake", "bark", "corn", "apple", "wart", "bird", "umbrella", "fart"]
    tally = words.count{|word| word.length==4}
    assert_equal 6, tally
  end

 def test_7_factorial
    # Example: "Five factorial", written 5!, is
    # 1 * 2 * 3 * 4 * 5
    product = 1
    numbers = [1, 2, 3, 4, 5, 6, 7]
    numbers.each do |number|
      product*=number
    end
    assert_equal 5040, product
  end
  
  def test_max_value
    skip
    max_num = 0
    numbers = [2, 16, 6, 50, 12]
    max_num = numbers.max
    # write code here
    assert_equal 50, max_num
  end
  
  


