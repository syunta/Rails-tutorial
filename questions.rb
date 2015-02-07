# 1

def string_shuffle(s)
  s.split('').shuffle.join
end

#2

class String
  def shuffle
    self.split('').shuffle.join
  end
end
