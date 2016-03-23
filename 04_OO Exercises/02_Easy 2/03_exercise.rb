## QUESTION 3
module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end

puts Orange.ancestors
puts HotSauce.ancestors

# Orange class lookup
# Orange
# Taste
# Object
# Kernel
# BasicObject
#
# HotSauce class lookup
# HotSauce
# Taste
# Object
# Kernel
# BasicObject
