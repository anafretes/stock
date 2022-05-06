def stock_picker(prices)
  # init our main values, buy_sell indicates
  # in its itema the optimal buy and sell dates, respectively
  # profit is our goal, amirite
  buy_sell = [0, 0]
  profit = 0

  # setting edge case boundaries:
  # first in case you have a max price at the start of your array
  if prices.max == prices.first
    step = (prices.length) -1
    start = 1
  else
    step = prices.length
    start = 0
  end
  # then something more rudimentary in case of a min price at the end
  step = prices.min == prices.last ? step -1 : step

  # first loop goes (step - 1) bc why would you buy on the last day. no profit
  # next loop just tries to do some selling somehow
  (start..(step-1)).each do |i|
    (start..step).each do |j|
      # look at how much profit we stand to make
      diff = prices[j] - prices[i]
      break if diff.nil? # just in case our loops go long

      # sell at the best profit but you can't go back in time, now can you
      if ( diff > profit  &&  i < j )
        # assigning our results
        profit = diff
        buy_sell[0] = i
        buy_sell[1] = j
      end
    end
  end
  # stonks
  buy_sell
end


p stock_picker([17,3,6,9,15,8,6,1,10])
