# 1. Create the letter sets

@initials = %w(p t k b d g m n f z l h)
@vowels = %w(a e i o u)
@evens = %w(b d g n v z r)
@odds = %w(p t k m f s l)
@finals = %w(p t k b d g m n v s r y)

# 2. Create the syllable sets/lookup tables

# Format: Sinistra even, Sinistra odd, Dextra even, Dextra odd

@phonemes = []

12.times do |a|
  initial = @initials[a]
  final = @finals[a]
  5.times do |b|
    vowel = @vowels[b]
    7.times do |c|
      even = @evens[c]
      odd = @odds[c]
      @phonemes.push ["#{initial}#{vowel}#{even}", "#{initial}#{vowel}#{odd}", "#{even}#{vowel}#{final}", "#{odd}#{vowel}#{final}"]
    end
  end
end

# 3. Blacklist

@blacklist = %w(nig nog dik fuk fok fag gay gey kak kok pis god vag vom kum pig fat)
@duplicates = []

@phonemes.flatten.each do |phoneme|
  if @phonemes.flatten.count(phoneme) > 1
    @duplicates.push phoneme
  end
end

@duplicates.uniq!

puts @duplicates.to_s
puts @duplicates.length

# @phonemes.each do |phoneme|
#   puts phoneme.to_s
# end

# max_length = [@sinistra_even.length, @sinistra_odd.length, @dextra_even.length, @dextra_odd.length].max

# max_length.times do |index|
#   if @blacklist.include? @sinistra_even[index] or @blacklist.include? @sinistra_odd[index] or @blacklist.include? @dextra_even[index] or @blacklist.include? @dextra_odd[index]
#     @sinistra_even.delete_at index
#     @sinistra_odd.delete_at index
#     @dextra_even.delete_at index
#     @dextra_odd.delete_at index
#   end
# end
