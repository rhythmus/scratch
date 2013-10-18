
# Rules of combination
# Pick any starting letter
# Pick any letter that goes with that letter
# If you have two vowels, or two consonants in a row, you must pick a vowel or a consonant
# W and Y are considered vowels
# In fact, could probably have the general structure (c)(v)(c)(v)(c)/(v)(c)(v)(c)(v) or whatever where each c or v is one or two of its type
# Odd numbers go VCV
# Even numbers go CVC

@corpus = { "a" => %w(i w y p b t d k g m n f v s a l r c x),
            "e" => %w(a i w y p b t d k g m n f v s z l r c q x),
            "i" => %w(a e o p b t d k g m n f v s z l r c x),
            "o" => %w(u w y p b t d k g m n f v s z l r c x),
            "u" => %w(p b t d k g m n f v s z l r c x),
            "w" => %w(a e i y n s r h),
            "y" => %w(a e i o w m n s),
            "p" => %w(a e i o u y t k m s l r h),
            "b" => %w(a e i o u y d g m s l r c h),
            "t" => %w(a e i o u w y p k m s l r c h),
            "d" => %w(a e i o u y b g m s l r c h),
            "k" => %w(a e i o u y p t n s l r c h),
            "g" => %w(a e i o u y b d n s l r c h),
            "m" => %w(a e i o u y p b f s l r),
            "n" => %w(a e i o u y t d k g f v s z l r c),
            "f" => %w(a e i o u y m n l r),
            "v" => %w(a e i o u y),
            "s" => %w(a e i o u w y p t k m n l r c h),
            "z" => %w(a e i o u),
            "l" => %w(a e i o u y p b t d k g m n f v s r c),
            "r" => %w(a e i o u y p b t d k g m n f v s l c),
            "c" => %w(a e i o u y t k s l r h),
            "h" => %w(a e i o u y),
            "j" => %w(a e i o u),
            "q" => %w(u),
            "x" => %w(a e i o u y p t c) }

@vowels = %w(a e i o u y w)
@initials = %w()

def word
  word = ""
  char = @corpus.keys[rand(@corpus.length)]
  word << char
  8.times do
    char = @corpus[char][rand(@corpus[char].length)]
    word << char
  end
  word
end

puts word << " " << word << " " << word << " " << word
puts word << " " << word << " " << word << " " << word
puts word << " " << word << " " << word << " " << word
puts word << " " << word << " " << word << " " << word
