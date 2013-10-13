@onsets = %w(p t k b d g m n v z h l)
@nucleii = %w(a e i o u)
@codas = %w(p t k b d g m n f s y r)

def random_cvc
  "#{@onsets.sample}#{@nucleii.sample}#{@codas.sample}"
end

def random_vcv
  "#{@nucleii.sample}#{@onsets.sample}#{@nucleii.sample}"
end

def random_word
  "#{random_cvc}#{random_vcv}"
end

carrier = "~#{random_cvc}"
cruiser = "~#{random_word}"
destroyer = "~#{random_word}-#{random_word}"
yacht = "~#{random_word}-#{random_word}-#{random_word}-#{random_word}"
submarine = "~#{random_word}-#{random_word}-#{random_word}-#{random_word}--#{random_word}-#{random_word}-#{random_word}-#{random_word}"

puts carrier
puts cruiser
puts destroyer
puts yacht
puts submarine
