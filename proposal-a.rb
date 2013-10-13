def onset
  %w(p t k b d g m n h f s l).sample
end

def coda
  %w(p t k b d g m n y v z r).sample
end

def nucleii
  %w(a e i o u).sample
end

def cvc
  "#{onset}#{nucleii}#{coda}"
end

def vcv
  "#{nucleii}#{coda}#{nucleii}"
end

def word
  "#{cvc}#{vcv}"
end

def carrier
  "~#{cvc}"
end

def cruiser
  "~#{word}"
end

def destroyer
  "~#{word}-#{word}"
end

def yacht
  "~#{word}-#{word}-#{word}-#{word}"
end

def submarine
  "~#{word}-#{word}-#{word}-#{word}--#{word}-#{word}-#{word}-#{word}"
end

puts carrier
puts cruiser
puts destroyer
puts yacht
puts submarine
