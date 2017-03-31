class Lab8Controller < ApplicationController
  before_filter :authenticate_user!
  def input
  end

  def output
    n = params[:n].to_i
    if n > 0
      enum = (10**(n - 1)..10**n - 1).lazy.select do |x|
        x.to_s.split('').reduce(0) { |a, e| a + e.to_i**n } == x
      end
      @result = enum.to_a
    else
      @result = []
    end
  end
end
