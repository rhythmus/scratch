# Define characters

onsets = %w(p t k b d g m n v z h l).sort
nucleii = %w(a e i o u).sort
codas = %w(p t k b d g m n f s y r).sort

# Generate all combinations

@dextra_set = []
onsets.each do |onset|
  nucleii.each do |nucleus|
    codas.each do |coda|
      @dextra_set.push "#{onset}#{nucleus}#{coda}"
    end
  end
end

@sinistra_set = []
nucleii.each do |nucleusA|
  onsets.each do |onset|
    nucleii.each do |nucleusB|
      @sinistra_set.push "#{nucleusA}#{onset}#{nucleusB}"
    end
  end
end

# Define blacklist

blacklist = %w(nig dik fuk fok fag kak pis god vag vom)

# Remove blacklisted syllables from right hand list

@dextra_set.reject! do |syllable|
  blacklist.include? syllable
end

# Removes syllables from the left hand list where they match the inital two chars of any in the blacklist

blacklist.collect { |word| word.slice! 0 }
@sinistra_set.reject! do |syllable|
  blacklist.include? syllable.chop
end

# Deterministically pick 256 random syllables from each list

srand(1931 * 1997)

@dextra_set.shuffle!
@sinistra_set.shuffle!

# Move ~zod and ~ozo to the start

@dextra_set.delete "zod"
@dextra_set.insert 0, "zod"
@sinistra_set.delete "ozo"
@sinistra_set.insert 0, "ozo"

@dextra = @dextra_set[0..255]
@sinistra = @sinistra_set[0..255]

# Print syllable sets

# puts @dextra.to_s
# puts @sinistra.to_s

def random_word
  "#{@dextra.sample}#{@sinistra.sample}"
end

srand

carrier = "~#{@dextra.sample}"
cruiser = "~#{random_word}"
destroyer = "~#{random_word}-#{random_word}"
yacht = "~#{random_word}-#{random_word}-#{random_word}-#{random_word}"
submarine = "~#{random_word}-#{random_word}-#{random_word}-#{random_word}--#{random_word}-#{random_word}-#{random_word}-#{random_word}"

# Print sample ships

puts carrier
puts cruiser
puts destroyer
puts yacht
puts submarine


