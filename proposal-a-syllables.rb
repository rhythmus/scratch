@onsets = %w(p t k b d g m n v z h l).sort
@nucleii = %w(a e i o u).sort
@codas = %w(p t k b d g m n f s y r).sort

def dextra_set
  dextra_set = []
  @onsets.each do |onset|
    @nucleii.each do |nucleus|
      @codas.each do |coda|
        dextra_set.push "#{onset}#{nucleus}#{coda}"
      end
    end
  end
  dextra_set
end

def sinistra_set
  sinistra_set = []
  @nucleii.each do |nucleusA|
    @onsets.each do |onset|
      @nucleii.each do |nucleusB|
        sinistra_set.push "#{nucleusA}#{onset}#{nucleusB}"
      end
    end
  end
  sinistra_set
end

def dextra
  dextra = []
  index = dextra_set.index('zod')
  256.times do
    dextra.push dextra_set[index]
    index = (index + 13) % 256
  end
  dextra
end

def sinistra
  sinistra = []
  index = sinistra_set.index('ozo')
  256.times do
    sinistra.push sinistra_set[index]
    index = (index + 13) % 256
  end
  sinistra
end

puts dextra.to_s
puts sinistra.to_s
