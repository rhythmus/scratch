# 1. Create the letter sets

@initials = %w(p t k b d g m n f z l h)
@vowels = %w(a e i o u)
@evens = %w(b d g n v z r)
@odds = %w(p t k m f s l)
@finals = %w(p t k b d g m n v s r y)

# 2. Create the syllable sets/lookup tables

@sinistra_even = []
@sinistra_odd = []

@dextra_even = []
@dextra_odd = []

@initials.each do |initial|
  @vowels.each do |vowel|
    @evens.each do |even|
      @sinistra_even.push "#{initial}#{vowel}#{even}"
    end
    @odds.each do |odd|
      @sinistra_odd.push "#{initial}#{vowel}#{odd}"
    end
  end
end

@finals.each do |final|
  @vowels.each do |vowel|
    @evens.each do |even|
      @dextra_even.push "#{even}#{vowel}#{final}"
    end
    @odds.each do |odd|
      @dextra_odd.push "#{odd}#{vowel}#{final}"
    end
  end
end

# 3. Blacklist

@blacklist = %w(nig nog dik fuk fok fag gay gey kak kok pis god vag vom kum pig fat)

max_length = [@sinistra_even.length, @sinistra_odd.length, @dextra_even.length, @dextra_odd.length].max

max_length.times do |index|
  if @blacklist.include? @sinistra_even[index] or @blacklist.include? @sinistra_odd[index] or @blacklist.include? @dextra_even[index] or @blacklist.include? @dextra_odd[index]
    @sinistra_even.delete_at index
    @sinistra_odd.delete_at index
    @dextra_even.delete_at index
    @dextra_odd.delete_at index
  end
end

# 4. Randomise our selection - all arrays should be randomised in the same way

srand(1997) # skynet becomes self-aware

min_length = [@sinistra_even.length, @sinistra_odd.length, @dextra_even.length, @dextra_odd.length].min
zod_index = @dextra_even.index "zod"

# slice = (0..min_length).to_a.shuffle!
# slice.delete zod_index
# slice.insert 0, zod_index

# sinistra_even_new = []
# sinistra_odd_new = []
# dextra_even_new = []
# dextra_odd_new = []

# 256.times do |index|
#   sinistra_even_new.push @sinistra_even[slice[index]]
#   sinistra_odd_new.push @sinistra_odd[slice[index]]
#   dextra_even_new.push @dextra_even[slice[index]]
#   dextra_odd_new.push @dextra_odd[slice[index]]
# end

# @sinistra_even = sinistra_even_new
# @sinistra_odd = sinistra_odd_new
# @dextra_even = dextra_even_new
# @dextra_odd = dextra_odd_new

# 5. Check everything's okay

# puts @sinistra_even.to_s
# puts @sinistra_odd.to_s
# puts @dextra_even.to_s
# puts @dextra_odd.to_s

# FUNCTION DEFINITIONS

def eight_bit_word(value)
  value %= 256
  if value.even?
    "#{@dextra_even[value]}"
  else
    "#{@dextra_odd[value]}"
  end
end

def sixteen_bit_word(value)
  value %= 65536
  little_end = value % 256
  big_end = (value - little_end) / 256
  if value.even?
    "#{@sinistra_even[little_end]}#{@dextra_even[big_end]}"
  else
    "#{@sinistra_odd[little_end]}#{@dextra_odd[big_end]}"
  end
end

# EXAMPLES

srand

def random_word
  sixteen_bit_word(rand(65536))
end

cruiser = "~#{random_word}"
destroyer = "~#{random_word}-#{random_word}"
yacht = "~#{random_word}-#{random_word}-#{random_word}-#{random_word}"
submarine = "~#{random_word}-#{random_word}-#{random_word}-#{random_word}--#{random_word}-#{random_word}-#{random_word}-#{random_word}"

puts cruiser
puts destroyer
puts yacht
puts submarine

# 513.times do |index|
#   if index < 256
#     puts eight_bit_word(index)
#   else
#     puts sixteen_bit_word(index)
#   end
# end
