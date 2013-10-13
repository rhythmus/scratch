onsets = %w(p t k b d g m n v z h l).sort
nucleii = %w(a e i o u).sort
codas = %w(p t k b d g m n f s y r).sort

dextra_set = []
onsets.each do |onset|
  nucleii.each do |nucleus|
    codas.each do |coda|
      dextra_set.push "#{onset}#{nucleus}#{coda}"
    end
  end
end

sinistra_set = []
nucleii.each do |nucleusA|
  onsets.each do |onset|
    nucleii.each do |nucleusB|
      sinistra_set.push "#{nucleusA}#{onset}#{nucleusB}"
    end
  end
end

blacklist = %w(nig nog dik fuk fok fag kok kak pis god)

dextra_set.reject! do |syllable|
  blacklist.include? syllable
end

# checks if the final two chars of any in blacklist match the inital two chars of any in the syllable
blacklist.collect { |word| word.slice! 0 }
sinistra_set.reject! do |syllable|
  blacklist.include? syllable.chop
end

dextra = []
index = dextra_set.index('zod')
256.times do
  dextra.push dextra_set[index]
  index = (index + 1931) % 256 # gödel publishes the incompleteness theorems
end

sinistra = []
index = sinistra_set.index('ozo')
256.times do
  sinistra.push sinistra_set[index]
  index = (index + 1997) % 256 # skynet becomes self-aware
end

puts dextra.to_s
puts sinistra.to_s
