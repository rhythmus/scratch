@onsets = %w(p t k b d g m n v z h l).sort
@nucleii = %w(a e i o u).sort
@codas = %w(p t k b d g m n f s y r).sort

def odd_bytes
  odd_bytes = []
  @onsets.each do |onset|
    @nucleii.each do |nucleus|
      @codas.each do |coda|
        odd_bytes.push "#{onset}#{nucleus}#{coda}"
      end
    end
  end
  odd_bytes
end

def even_bytes
  even_bytes = []
  @nucleii.each do |nucleusA|
    @onsets.each do |onset|
      @nucleii.each do |nucleusB|
        even_bytes.push "#{nucleusA}#{onset}#{nucleusB}"
      end
    end
  end
  even_bytes
end

puts odd_bytes.to_s
puts even_bytes.to_s