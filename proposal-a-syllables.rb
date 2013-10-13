@onsets = %w(p t k b d g m n f s h l).sort
@nucleii = %w(a e i o u).sort
@codas = %w(p t k b d g m n v z y r).sort

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
    @codas.each do |coda|
      @nucleii.each do |nucleusB|
        even_bytes.push "#{nucleusA}#{coda}#{nucleusB}"
      end
    end
  end
  even_bytes
end

def selected_odd_bytes
  # start with zod
end

def selected_even_bytes
  # start with odo
end
