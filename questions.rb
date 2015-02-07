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

# 3

def check
  person1 = {
    :first => 'syunta',
    :last => 'kitagawa'
  }
  
  person2 = {
    :first => 'foo',
    :last => 'bar'
  }
  
  person3 = {
    first: 'hoge',
    last: 'huga'
  }

  params = {}
  params[:father] = person1
  params[:mother] = person2
  params[:child] = person3

  puts params[:father][:first]
  puts params[:mother][:first]
  puts params[:child][:last]
end
