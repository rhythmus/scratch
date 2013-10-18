# Should just do a thing which is guaranteed to generate unique quadgrams




@initials = %w(p t k b d g m n f z l h)
@finals = %w(p t k b d g m n v s r y)

@vowels = %w(a e i o u)
@evens = %w(b d g n v z r)
@odds = %w(p t k m f s l)

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



@phonemes = [["doz", "dos", "zod", "sod"],
            ["paz", "pas", "zap", "sap"],
            ["peb", "pep", "bep", "pep"],
            ["ped", "pet", "dep", "tep"],
            ["peg", "pek", "gep", "kep"],
            ["pen", "pem", "nep", "mep"],
            ["pev", "pef", "vep", "fep"],
            ["pez", "pes", "zep", "sep"],
            ["per", "pel", "rep", "lep"],
            ["pib", "pip", "bip", "pip"],
            ["pid", "pit", "dip", "tip"],
            ["pin", "pim", "nip", "mip"],
            ["piv", "pif", "vip", "fip"],
            ["pir", "pil", "rip", "lip"],
            ["pob", "pop", "bop", "pop"],
            ["pod", "pot", "dop", "top"],
            ["pog", "pok", "gop", "kop"],
            ["pon", "pom", "nop", "mop"],
            ["pov", "pof", "vop", "fop"],
            ["por", "pol", "rop", "lop"],
            ["pub", "pup", "bup", "pup"],
            ["pud", "put", "dup", "tup"],
            ["pug", "puk", "gup", "kup"],
            ["pun", "pum", "nup", "mup"],
            ["puv", "puf", "vup", "fup"],
            ["puz", "pus", "zup", "sup"],
            ["pur", "pul", "rup", "lup"],
            ["tab", "tap", "bat", "pat"],
            ["tad", "tat", "dat", "tat"],
            ["tag", "tak", "gat", "kat"],
            ["tan", "tam", "nat", "mat"],
            ["taz", "tas", "zat", "sat"],
            ["tar", "tal", "rat", "lat"],
            ["teb", "tep", "bet", "pet"],
            ["ted", "tet", "det", "tet"],
            ["teg", "tek", "get", "ket"],
            ["ten", "tem", "net", "met"],
            ["tev", "tef", "vet", "fet"],
            ["tez", "tes", "zet", "set"],
            ["ter", "tel", "ret", "let"],
            ["tib", "tip", "bit", "pit"],
            ["tin", "tim", "nit", "mit"],
            ["tiv", "tif", "vit", "fit"],
            ["tir", "til", "rit", "lit"],
            ["tob", "top", "bot", "pot"],
            ["tod", "tot", "dot", "tot"],
            ["tog", "tok", "got", "kot"],
            ["ton", "tom", "not", "mot"],
            ["toz", "tos", "zot", "sot"],
            ["tor", "tol", "rot", "lot"],
            ["tub", "tup", "but", "put"],
            ["tug", "tuk", "gut", "kut"],
            ["tun", "tum", "nut", "mut"],
            ["tuv", "tuf", "vut", "fut"],
            ["tuz", "tus", "zut", "sut"],
            ["tur", "tul", "rut", "lut"],
            ["kab", "kap", "bak", "pak"],
            ["kad", "kat", "dak", "tak"],
            ["kan", "kam", "nak", "mak"],
            ["kav", "kaf", "vak", "fak"],
            ["kaz", "kas", "zak", "sak"],
            ["kar", "kal", "rak", "lak"],
            ["keb", "kep", "bek", "pek"],
            ["ked", "ket", "dek", "tek"],
            ["keg", "kek", "gek", "kek"],
            ["ken", "kem", "nek", "mek"],
            ["kev", "kef", "vek", "fek"],
            ["kez", "kes", "zek", "sek"],
            ["ker", "kel", "rek", "lek"],
            ["kib", "kip", "bik", "pik"],
            ["kin", "kim", "nik", "mik"],
            ["kiv", "kif", "vik", "fik"],
            ["kiz", "kis", "zik", "sik"],
            ["kir", "kil", "rik", "lik"],
            ["kod", "kot", "dok", "tok"],
            ["kon", "kom", "nok", "mok"],
            ["kov", "kof", "vok", "fok"],
            ["koz", "kos", "zok", "sok"],
            ["kor", "kol", "rok", "lok"],
            ["kub", "kup", "buk", "puk"],
            ["kug", "kuk", "guk", "kuk"],
            ["kur", "kul", "ruk", "luk"],
            ["bad", "bat", "dab", "tab"],
            ["bag", "bak", "gab", "kab"],
            ["bav", "baf", "vab", "fab"],
            ["baz", "bas", "zab", "sab"],
            ["bar", "bal", "rab", "lab"],
            ["bed", "bet", "deb", "teb"],
            ["beg", "bek", "geb", "keb"],
            ["ben", "bem", "neb", "meb"],
            ["bev", "bef", "veb", "feb"],
            ["bez", "bes", "zeb", "seb"],
            ["ber", "bel", "reb", "leb"],
            ["bid", "bit", "dib", "tib"],
            ["big", "bik", "gib", "kib"],
            ["bin", "bim", "nib", "mib"],
            ["biv", "bif", "vib", "fib"],
            ["biz", "bis", "zib", "sib"],
            ["bir", "bil", "rib", "lib"],
            ["bod", "bot", "dob", "tob"],
            ["bog", "bok", "gob", "kob"],
            ["bon", "bom", "nob", "mob"],
            ["bov", "bof", "vob", "fob"],
            ["bor", "bol", "rob", "lob"],
            ["bub", "bup", "bub", "pub"],
            ["bud", "but", "dub", "tub"],
            ["buv", "buf", "vub", "fub"],
            ["buz", "bus", "zub", "sub"],
            ["bur", "bul", "rub", "lub"],
            ["dav", "daf", "vad", "fad"],
            ["daz", "das", "zad", "sad"],
            ["dar", "dal", "rad", "lad"],
            ["deb", "dep", "bed", "ped"],
            ["ded", "det", "ded", "ted"],
            ["deg", "dek", "ged", "ked"],
            ["den", "dem", "ned", "med"],
            ["dev", "def", "ved", "fed"],
            ["dez", "des", "zed", "sed"],
            ["der", "del", "red", "led"],
            ["div", "dif", "vid", "fid"],
            ["diz", "dis", "zid", "sid"],
            ["dob", "dop", "bod", "pod"],
            ["dod", "dot", "dod", "tod"],
            ["don", "dom", "nod", "mod"],
            ["dov", "dof", "vod", "fod"],
            ["dor", "dol", "rod", "lod"],
            ["dub", "dup", "bud", "pud"],
            ["dug", "duk", "gud", "kud"],
            ["duv", "duf", "vud", "fud"],
            ["dur", "dul", "rud", "lud"],
            ["gab", "gap", "bag", "pag"],
            ["gad", "gat", "dag", "tag"],
            ["gan", "gam", "nag", "mag"],
            ["gaz", "gas", "zag", "sag"],
            ["gar", "gal", "rag", "lag"],
            ["ged", "get", "deg", "teg"],
            ["geg", "gek", "geg", "keg"],
            ["gen", "gem", "neg", "meg"],
            ["gez", "ges", "zeg", "seg"],
            ["gid", "git", "dig", "tig"],
            ["giv", "gif", "vig", "fig"],
            ["giz", "gis", "zig", "sig"],
            ["gir", "gil", "rig", "lig"],
            ["gob", "gop", "bog", "pog"],
            ["gon", "gom", "nog", "mog"],
            ["gov", "gof", "vog", "fog"],
            ["gub", "gup", "bug", "pug"],
            ["gud", "gut", "dug", "tug"],
            ["gun", "gum", "nug", "mug"],
            ["guv", "guf", "vug", "fug"],
            ["mab", "map", "bam", "pam"],
            ["mad", "mat", "dam", "tam"],
            ["mag", "mak", "gam", "kam"],
            ["man", "mam", "nam", "mam"],
            ["mav", "maf", "vam", "fam"],
            ["maz", "mas", "zam", "sam"],
            ["mar", "mal", "ram", "lam"],
            ["meb", "mep", "bem", "pem"],
            ["med", "met", "dem", "tem"],
            ["meg", "mek", "gem", "kem"],
            ["mev", "mef", "vem", "fem"],
            ["mez", "mes", "zem", "sem"],
            ["mer", "mel", "rem", "lem"],
            ["mib", "mip", "bim", "pim"],
            ["mig", "mik", "gim", "kim"],
            ["miv", "mif", "vim", "fim"],
            ["miz", "mis", "zim", "sim"],
            ["mir", "mil", "rim", "lim"],
            ["mob", "mop", "bom", "pom"],
            ["mod", "mot", "dom", "tom"],
            ["moz", "mos", "zom", "som"],
            ["mor", "mol", "rom", "lom"],
            ["mub", "mup", "bum", "pum"],
            ["muv", "muf", "vum", "fum"],
            ["mur", "mul", "rum", "lum"],
            ["nab", "nap", "ban", "pan"],
            ["nad", "nat", "dan", "tan"],
            ["nag", "nak", "gan", "kan"],
            ["nav", "naf", "van", "fan"],
            ["naz", "nas", "zan", "san"],
            ["neb", "nep", "ben", "pen"],
            ["ned", "net", "den", "ten"],
            ["nen", "nem", "nen", "men"],
            ["nev", "nef", "ven", "fen"],
            ["nez", "nes", "zen", "sen"],
            ["ner", "nel", "ren", "len"],
            ["nid", "nit", "din", "tin"],
            ["niv", "nif", "vin", "fin"],
            ["niz", "nis", "zin", "sin"],
            ["nob", "nop", "bon", "pon"],
            ["nod", "not", "don", "ton"],
            ["nog", "nok", "gon", "kon"],
            ["nov", "nof", "von", "fon"],
            ["nor", "nol", "ron", "lon"],
            ["nub", "nup", "bun", "pun"],
            ["nud", "nut", "dun", "tun"],
            ["nuv", "nuf", "vun", "fun"],
            ["fag", "fak", "gav", "kav"],
            ["fan", "fam", "nav", "mav"],
            ["feb", "fep", "bev", "pev"],
            ["feg", "fek", "gev", "kev"],
            ["fez", "fes", "zev", "sev"],
            ["fer", "fel", "rev", "lev"],
            ["fib", "fip", "biv", "piv"],
            ["fid", "fit", "div", "tiv"],
            ["fob", "fop", "bov", "pov"],
            ["fod", "fot", "dov", "tov"],
            ["fog", "fok", "gov", "kov"],
            ["fub", "fup", "buv", "puv"],
            ["fuz", "fus", "zuv", "suv"],
            ["fur", "ful", "ruv", "luv"],
            ["zad", "zat", "das", "tas"],
            ["zav", "zaf", "vas", "fas"],
            ["zeg", "zek", "ges", "kes"],
            ["ziv", "zif", "vis", "fis"],
            ["zob", "zop", "bos", "pos"],
            ["zov", "zof", "vos", "fos"],
            ["zor", "zol", "ros", "los"],
            ["zud", "zut", "dus", "tus"],
            ["zug", "zuk", "gus", "kus"],
            ["zun", "zum", "nus", "mus"],
            ["zur", "zul", "rus", "lus"],
            ["lab", "lap", "bar", "par"],
            ["lad", "lat", "dar", "tar"],
            ["lag", "lak", "gar", "kar"],
            ["lan", "lam", "nar", "mar"],
            ["lav", "laf", "var", "far"],
            ["laz", "las", "zar", "sar"],
            ["leb", "lep", "ber", "per"],
            ["leg", "lek", "ger", "ker"],
            ["len", "lem", "ner", "mer"],
            ["lez", "les", "zer", "ser"],
            ["lib", "lip", "bir", "pir"],
            ["lid", "lit", "dir", "tir"],
            ["lig", "lik", "gir", "kir"],
            ["lin", "lim", "nir", "mir"],
            ["liv", "lif", "vir", "fir"],
            ["liz", "lis", "zir", "sir"],
            ["lob", "lop", "bor", "por"],
            ["lod", "lot", "dor", "tor"],
            ["log", "lok", "gor", "kor"],
            ["lov", "lof", "vor", "for"],
            ["lub", "lup", "bur", "pur"],
            ["lug", "luk", "gur", "kur"],
            ["lun", "lum", "nur", "mur"],
            ["hab", "hap", "bay", "pay"],
            ["had", "hat", "day", "tay"],
            ["han", "ham", "nay", "may"],
            ["hav", "haf", "vay", "fay"],
            ["haz", "has", "zay", "say"],
            ["har", "hal", "ray", "lay"],
            ["heb", "hep", "bey", "pey"],
            ["hed", "het", "dey", "tey"],
            ["hen", "hem", "ney", "mey"],
            ["hev", "hef", "vey", "fey"],
            ["hez", "hes", "zey", "sey"],
            ["her", "hel", "rey", "ley"],
            ["hib", "hip", "biy", "piy"],
            ["hid", "hit", "diy", "tiy"],
            ["hig", "hik", "giy", "kiy"],
            ["hin", "him", "niy", "miy"],
            ["hiv", "hif", "viy", "fiy"],
            ["hiz", "his", "ziy", "siy"],
            ["hir", "hil", "riy", "liy"],
            ["hob", "hop", "boy", "poy"],
            ["hod", "hot", "doy", "toy"],
            ["hog", "hok", "goy", "koy"],
            ["hon", "hom", "noy", "moy"],
            ["hov", "hof", "voy", "foy"],
            ["hoz", "hos", "zoy", "soy"],
            ["hor", "hol", "roy", "loy"],
            ["hub", "hup", "buy", "puy"],
            ["hud", "hut", "duy", "tuy"],
            ["hug", "huk", "guy", "kuy"],
            ["hun", "hum", "nuy", "muy"],
            ["huv", "huf", "vuy", "fuy"],
            ["huz", "hus", "zuy", "suy"]]

def eight_bit_word(value)
  value %= 256
  if value.even?
    "#{@phonemes[value][2]}"
  else
    "#{@phonemes[value][3]}"
  end
end

def sixteen_bit_word(value)
  value %= 65536
  little_end = value % 256
  big_end = (value - little_end) / 256
  if value.even?
    "#{@phonemes[little_end][0]}#{@phonemes[big_end][2]}"
  else
    "#{@phonemes[little_end][1]}#{@phonemes[big_end][3]}"
  end
end

def random_word
  sixteen_bit_word(rand(65536))
end

def cruiser
  "~#{random_word}"
end

def destroyer
  "~#{random_word}-#{random_word}"
end

def yacht
  "~#{random_word}-#{random_word}-#{random_word}-#{random_word}"
end

def submarine
  "~#{random_word}-#{random_word}-#{random_word}-#{random_word}--#{random_word}-#{random_word}-#{random_word}-#{random_word}"
end


@duplicates = []

@phonemes.flatten.each do |phoneme|
  if @phonemes.flatten.count(phoneme) > 1
    @duplicates.push phoneme
  end
end

@duplicates.uniq!.sort!

puts @duplicates.to_s
puts @duplicates.length


16.times do
  puts submarine
end