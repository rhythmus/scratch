@onsets = %w(p t k b d g m n f s h l)
@nucleii = %w(a e i o u)
@codas = %w(p t k b d g m n v z y r)

def oddbytes
  oddbytes = []
  @onsets.each do |onset|
    @nucleii.each do |nucleus|
      @codas.each do |coda|
        oddbytes.push "#{onset}#{nucleus}#{coda}"
      end
    end
  end
  oddbytes
end

def evenbytes
  evenbytes = []
  @nucleii.each do |nucleusA|
    @codas.each do |coda|
      @nucleii.each do |nucleusB|
        evenbytes.push "#{nucleusA}#{coda}#{nucleusB}"
      end
    end
  end
  evenbytes
end

puts oddbytes.to_s
puts evenbytes.to_s
