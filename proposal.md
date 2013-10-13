### Research:

I've looked into what letters correspond to what phonemes by language (or the romanisation of that language). I looked at the ten languages with the highest number of internet users, plus Hindi, because I felt like it:

https://docs.google.com/spreadsheet/ccc?key=0AoF7JCDAQNZCdDZrNmJid0owRnRGUDRCR3NreXZ1cHc&usp=sharing

From this I believe we can select a set of letters and letter pairs which are relatively unambiguous in their pronunciation across a wide range of languages:

    unvoiced stops    p, t, k
    voiced stops      b, d, g
    nasals            m, n
    fricatives        f/v, s/z
    liquids           l/r
    vowels            a, e, i, o, u
    other weird shit  h, y

### Proposal A:

This system uses CVC and VCV for alternating bytes. The disadvantage is that we now have three syllables per two-byte address. The advantage is that we avoid having to avoid bad-sounding consonant clusters altogether.

    onsets:           p t k b d g m n f s h l
    nucleii:          a e i o u
    codas:            p t k b d g m n v z y r

A single byte follows the pattern onset-nucleus-coda and a double-byte word follows the pattern onset-nucleus-coda-nucleus-coda-nucleus. Note the pairs f/v, s/z, and l/r, h/y - this is to avoid ambiguous pronunciations.

Mnemnion, I'm sorry, I have to use the letter e - a VCV group would only have 192 combinations if we only used a, i, o, and u as per your proposal.

#### MORE DETAILS PLEASE

- f/v: In this instance I have simply paired /f/ (the voiceless labiodental fricative) with its voiced counterpart, /v/. I am tempted to drop this altogether, as so many languages have massive trouble with /v/. Japanese speakers tend to turn it into a /b/, rather than an /f/, for instance.
- s/z: I have done the same here - /z/ is simply /s/'s voiced counterpart. Romance languages (English too) tend to turn /s/ into /z/ often, especially in the middle of the word, so I have relegated /s/ to onsets and /z/ to codas.
- h/y: I doubt these two letters will ever be confused with one another but it felt aesthetically *right* to keep /h/ at the start and /j/ in the middle of the word.
- l/r: Me so solly.

#### Moving on:

I generated some addresses of different lengths, selecting syllables randomly. ([code](https://github.com/dclelland/scratch/blob/master/proposal-a-ships.rb))

    ~nid
    ~taruye
    ~gativu-banaza
    ~pokizu-sagegi-buteze-biboza
    ~tetimu-levedu-mayapo-mitaro--degiyi-ninuya-hinuvo-katonu

    ~fey
    ~bitema
    ~fevagu-lirudu
    ~nuzoyo-dipude-novuvi-surata
    ~sagoyu-tukivo-torebe-dutuzo--dimetu-timepo-kataza-dezuma

Sounds kinda polynesian huh? Here's a list of syllables. ([code](https://github.com/dclelland/scratch/blob/master/proposal-a-syllables.rb))

This generates a good screen's worth of text to work with:

    ["pap", "pat", "pak", "pab", "pad", "pag", "pam", "pan", "pav", "paz", "pay", "par", "pep", "pet", "pek", "peb", "ped", "peg", "pem", "pen", "pev", "pez", "pey", "per", "pip", "pit", "pik", "pib", "pid", "pig", "pim", "pin", "piv", "piz", "piy", "pir", "pop", "pot", "pok", "pob", "pod", "pog", "pom", "pon", "pov", "poz", "poy", "por", "pup", "put", "puk", "pub", "pud", "pug", "pum", "pun", "puv", "puz", "puy", "pur", "tap", "tat", "tak", "tab", "tad", "tag", "tam", "tan", "tav", "taz", "tay", "tar", "tep", "tet", "tek", "teb", "ted", "teg", "tem", "ten", "tev", "tez", "tey", "ter", "tip", "tit", "tik", "tib", "tid", "tig", "tim", "tin", "tiv", "tiz", "tiy", "tir", "top", "tot", "tok", "tob", "tod", "tog", "tom", "ton", "tov", "toz", "toy", "tor", "tup", "tut", "tuk", "tub", "tud", "tug", "tum", "tun", "tuv", "tuz", "tuy", "tur", "kap", "kat", "kak", "kab", "kad", "kag", "kam", "kan", "kav", "kaz", "kay", "kar", "kep", "ket", "kek", "keb", "ked", "keg", "kem", "ken", "kev", "kez", "key", "ker", "kip", "kit", "kik", "kib", "kid", "kig", "kim", "kin", "kiv", "kiz", "kiy", "kir", "kop", "kot", "kok", "kob", "kod", "kog", "kom", "kon", "kov", "koz", "koy", "kor", "kup", "kut", "kuk", "kub", "kud", "kug", "kum", "kun", "kuv", "kuz", "kuy", "kur", "bap", "bat", "bak", "bab", "bad", "bag", "bam", "ban", "bav", "baz", "bay", "bar", "bep", "bet", "bek", "beb", "bed", "beg", "bem", "ben", "bev", "bez", "bey", "ber", "bip", "bit", "bik", "bib", "bid", "big", "bim", "bin", "biv", "biz", "biy", "bir", "bop", "bot", "bok", "bob", "bod", "bog", "bom", "bon", "bov", "boz", "boy", "bor", "bup", "but", "buk", "bub", "bud", "bug", "bum", "bun", "buv", "buz", "buy", "bur", "dap", "dat", "dak", "dab", "dad", "dag", "dam", "dan", "dav", "daz", "day", "dar", "dep", "det", "dek", "deb", "ded", "deg", "dem", "den", "dev", "dez", "dey", "der", "dip", "dit", "dik", "dib", "did", "dig", "dim", "din", "div", "diz", "diy", "dir", "dop", "dot", "dok", "dob", "dod", "dog", "dom", "don", "dov", "doz", "doy", "dor", "dup", "dut", "duk", "dub", "dud", "dug", "dum", "dun", "duv", "duz", "duy", "dur", "gap", "gat", "gak", "gab", "gad", "gag", "gam", "gan", "gav", "gaz", "gay", "gar", "gep", "get", "gek", "geb", "ged", "geg", "gem", "gen", "gev", "gez", "gey", "ger", "gip", "git", "gik", "gib", "gid", "gig", "gim", "gin", "giv", "giz", "giy", "gir", "gop", "got", "gok", "gob", "god", "gog", "gom", "gon", "gov", "goz", "goy", "gor", "gup", "gut", "guk", "gub", "gud", "gug", "gum", "gun", "guv", "guz", "guy", "gur", "map", "mat", "mak", "mab", "mad", "mag", "mam", "man", "mav", "maz", "may", "mar", "mep", "met", "mek", "meb", "med", "meg", "mem", "men", "mev", "mez", "mey", "mer", "mip", "mit", "mik", "mib", "mid", "mig", "mim", "min", "miv", "miz", "miy", "mir", "mop", "mot", "mok", "mob", "mod", "mog", "mom", "mon", "mov", "moz", "moy", "mor", "mup", "mut", "muk", "mub", "mud", "mug", "mum", "mun", "muv", "muz", "muy", "mur", "nap", "nat", "nak", "nab", "nad", "nag", "nam", "nan", "nav", "naz", "nay", "nar", "nep", "net", "nek", "neb", "ned", "neg", "nem", "nen", "nev", "nez", "ney", "ner", "nip", "nit", "nik", "nib", "nid", "nig", "nim", "nin", "niv", "niz", "niy", "nir", "nop", "not", "nok", "nob", "nod", "nog", "nom", "non", "nov", "noz", "noy", "nor", "nup", "nut", "nuk", "nub", "nud", "nug", "num", "nun", "nuv", "nuz", "nuy", "nur", "fap", "fat", "fak", "fab", "fad", "fag", "fam", "fan", "fav", "faz", "fay", "far", "fep", "fet", "fek", "feb", "fed", "feg", "fem", "fen", "fev", "fez", "fey", "fer", "fip", "fit", "fik", "fib", "fid", "fig", "fim", "fin", "fiv", "fiz", "fiy", "fir", "fop", "fot", "fok", "fob", "fod", "fog", "fom", "fon", "fov", "foz", "foy", "for", "fup", "fut", "fuk", "fub", "fud", "fug", "fum", "fun", "fuv", "fuz", "fuy", "fur", "sap", "sat", "sak", "sab", "sad", "sag", "sam", "san", "sav", "saz", "say", "sar", "sep", "set", "sek", "seb", "sed", "seg", "sem", "sen", "sev", "sez", "sey", "ser", "sip", "sit", "sik", "sib", "sid", "sig", "sim", "sin", "siv", "siz", "siy", "sir", "sop", "sot", "sok", "sob", "sod", "sog", "som", "son", "sov", "soz", "soy", "sor", "sup", "sut", "suk", "sub", "sud", "sug", "sum", "sun", "suv", "suz", "suy", "sur", "hap", "hat", "hak", "hab", "had", "hag", "ham", "han", "hav", "haz", "hay", "har", "hep", "het", "hek", "heb", "hed", "heg", "hem", "hen", "hev", "hez", "hey", "her", "hip", "hit", "hik", "hib", "hid", "hig", "him", "hin", "hiv", "hiz", "hiy", "hir", "hop", "hot", "hok", "hob", "hod", "hog", "hom", "hon", "hov", "hoz", "hoy", "hor", "hup", "hut", "huk", "hub", "hud", "hug", "hum", "hun", "huv", "huz", "huy", "hur", "lap", "lat", "lak", "lab", "lad", "lag", "lam", "lan", "lav", "laz", "lay", "lar", "lep", "let", "lek", "leb", "led", "leg", "lem", "len", "lev", "lez", "ley", "ler", "lip", "lit", "lik", "lib", "lid", "lig", "lim", "lin", "liv", "liz", "liy", "lir", "lop", "lot", "lok", "lob", "lod", "log", "lom", "lon", "lov", "loz", "loy", "lor", "lup", "lut", "luk", "lub", "lud", "lug", "lum", "lun", "luv", "luz", "luy", "lur"]

    ["apa", "ape", "api", "apo", "apu", "ata", "ate", "ati", "ato", "atu", "aka", "ake", "aki", "ako", "aku", "aba", "abe", "abi", "abo", "abu", "ada", "ade", "adi", "ado", "adu", "aga", "age", "agi", "ago", "agu", "ama", "ame", "ami", "amo", "amu", "ana", "ane", "ani", "ano", "anu", "ava", "ave", "avi", "avo", "avu", "aza", "aze", "azi", "azo", "azu", "aya", "aye", "ayi", "ayo", "ayu", "ara", "are", "ari", "aro", "aru", "epa", "epe", "epi", "epo", "epu", "eta", "ete", "eti", "eto", "etu", "eka", "eke", "eki", "eko", "eku", "eba", "ebe", "ebi", "ebo", "ebu", "eda", "ede", "edi", "edo", "edu", "ega", "ege", "egi", "ego", "egu", "ema", "eme", "emi", "emo", "emu", "ena", "ene", "eni", "eno", "enu", "eva", "eve", "evi", "evo", "evu", "eza", "eze", "ezi", "ezo", "ezu", "eya", "eye", "eyi", "eyo", "eyu", "era", "ere", "eri", "ero", "eru", "ipa", "ipe", "ipi", "ipo", "ipu", "ita", "ite", "iti", "ito", "itu", "ika", "ike", "iki", "iko", "iku", "iba", "ibe", "ibi", "ibo", "ibu", "ida", "ide", "idi", "ido", "idu", "iga", "ige", "igi", "igo", "igu", "ima", "ime", "imi", "imo", "imu", "ina", "ine", "ini", "ino", "inu", "iva", "ive", "ivi", "ivo", "ivu", "iza", "ize", "izi", "izo", "izu", "iya", "iye", "iyi", "iyo", "iyu", "ira", "ire", "iri", "iro", "iru", "opa", "ope", "opi", "opo", "opu", "ota", "ote", "oti", "oto", "otu", "oka", "oke", "oki", "oko", "oku", "oba", "obe", "obi", "obo", "obu", "oda", "ode", "odi", "odo", "odu", "oga", "oge", "ogi", "ogo", "ogu", "oma", "ome", "omi", "omo", "omu", "ona", "one", "oni", "ono", "onu", "ova", "ove", "ovi", "ovo", "ovu", "oza", "oze", "ozi", "ozo", "ozu", "oya", "oye", "oyi", "oyo", "oyu", "ora", "ore", "ori", "oro", "oru", "upa", "upe", "upi", "upo", "upu", "uta", "ute", "uti", "uto", "utu", "uka", "uke", "uki", "uko", "uku", "uba", "ube", "ubi", "ubo", "ubu", "uda", "ude", "udi", "udo", "udu", "uga", "uge", "ugi", "ugo", "ugu", "uma", "ume", "umi", "umo", "umu", "una", "une", "uni", "uno", "unu", "uva", "uve", "uvi", "uvo", "uvu", "uza", "uze", "uzi", "uzo", "uzu", "uya", "uye", "uyi", "uyo", "uyu", "ura", "ure", "uri", "uro", "uru"]

### Proposal B:

Hand-tuned CVCCVC. Need to do directional graph of good consonant combinations. Retain ~zod. Perhaps look at inverting secondary numbers? ~dozzod etc.

### Proposal C:

Complex tuned 1 syllable per 16-bit number system. Work in progress/stillborn.


### Relevant links:

Urbit phonetic base discussion thread:

https://groups.google.com/forum/#!msg/urbit-dev/zW3rgpX_AxQ/a0gLMIc4VRoJ

Mnemnion's proposal:

https://github.com/mnemnion/porch/blob/master/phonemes.md

IPA soundboard:

http://web.uvic.ca/ling/resources/ipa/charts/IPAlab/IPAlab.htm

