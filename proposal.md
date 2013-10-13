### Research:

I've looked into what letters correspond to what phonemes by language (or the romanisation of that language). I looked at the ten languages with the highest number of internet users, plus Hindi, because I felt like it. ([googdoc](https://docs.google.com/spreadsheet/ccc?key=0AoF7JCDAQNZCdDZrNmJid0owRnRGUDRCR3NreXZ1cHc&usp=sharing))

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

    CVC:
    ["bab", "bad", "bag", "bak", "bam", "ban", "bap", "bar", "bat", "bav", "bay", "baz", "beb", "bed", "beg", "bek", "bem", "ben", "bep", "ber", "bet", "bev", "bey", "bez", "bib", "bid", "big", "bik", "bim", "bin", "bip", "bir", "bit", "biv", "biy", "biz", "bob", "bod", "bog", "bok", "bom", "bon", "bop", "bor", "bot", "bov", "boy", "boz", "bub", "bud", "bug", "buk", "bum", "bun", "bup", "bur", "but", "buv", "buy", "buz", "dab", "dad", "dag", "dak", "dam", "dan", "dap", "dar", "dat", "dav", "day", "daz", "deb", "ded", "deg", "dek", "dem", "den", "dep", "der", "det", "dev", "dey", "dez", "dib", "did", "dig", "dik", "dim", "din", "dip", "dir", "dit", "div", "diy", "diz", "dob", "dod", "dog", "dok", "dom", "don", "dop", "dor", "dot", "dov", "doy", "doz", "dub", "dud", "dug", "duk", "dum", "dun", "dup", "dur", "dut", "duv", "duy", "duz", "fab", "fad", "fag", "fak", "fam", "fan", "fap", "far", "fat", "fav", "fay", "faz", "feb", "fed", "feg", "fek", "fem", "fen", "fep", "fer", "fet", "fev", "fey", "fez", "fib", "fid", "fig", "fik", "fim", "fin", "fip", "fir", "fit", "fiv", "fiy", "fiz", "fob", "fod", "fog", "fok", "fom", "fon", "fop", "for", "fot", "fov", "foy", "foz", "fub", "fud", "fug", "fuk", "fum", "fun", "fup", "fur", "fut", "fuv", "fuy", "fuz", "gab", "gad", "gag", "gak", "gam", "gan", "gap", "gar", "gat", "gav", "gay", "gaz", "geb", "ged", "geg", "gek", "gem", "gen", "gep", "ger", "get", "gev", "gey", "gez", "gib", "gid", "gig", "gik", "gim", "gin", "gip", "gir", "git", "giv", "giy", "giz", "gob", "god", "gog", "gok", "gom", "gon", "gop", "gor", "got", "gov", "goy", "goz", "gub", "gud", "gug", "guk", "gum", "gun", "gup", "gur", "gut", "guv", "guy", "guz", "hab", "had", "hag", "hak", "ham", "han", "hap", "har", "hat", "hav", "hay", "haz", "heb", "hed", "heg", "hek", "hem", "hen", "hep", "her", "het", "hev", "hey", "hez", "hib", "hid", "hig", "hik", "him", "hin", "hip", "hir", "hit", "hiv", "hiy", "hiz", "hob", "hod", "hog", "hok", "hom", "hon", "hop", "hor", "hot", "hov", "hoy", "hoz", "hub", "hud", "hug", "huk", "hum", "hun", "hup", "hur", "hut", "huv", "huy", "huz", "kab", "kad", "kag", "kak", "kam", "kan", "kap", "kar", "kat", "kav", "kay", "kaz", "keb", "ked", "keg", "kek", "kem", "ken", "kep", "ker", "ket", "kev", "key", "kez", "kib", "kid", "kig", "kik", "kim", "kin", "kip", "kir", "kit", "kiv", "kiy", "kiz", "kob", "kod", "kog", "kok", "kom", "kon", "kop", "kor", "kot", "kov", "koy", "koz", "kub", "kud", "kug", "kuk", "kum", "kun", "kup", "kur", "kut", "kuv", "kuy", "kuz", "lab", "lad", "lag", "lak", "lam", "lan", "lap", "lar", "lat", "lav", "lay", "laz", "leb", "led", "leg", "lek", "lem", "len", "lep", "ler", "let", "lev", "ley", "lez", "lib", "lid", "lig", "lik", "lim", "lin", "lip", "lir", "lit", "liv", "liy", "liz", "lob", "lod", "log", "lok", "lom", "lon", "lop", "lor", "lot", "lov", "loy", "loz", "lub", "lud", "lug", "luk", "lum", "lun", "lup", "lur", "lut", "luv", "luy", "luz", "mab", "mad", "mag", "mak", "mam", "man", "map", "mar", "mat", "mav", "may", "maz", "meb", "med", "meg", "mek", "mem", "men", "mep", "mer", "met", "mev", "mey", "mez", "mib", "mid", "mig", "mik", "mim", "min", "mip", "mir", "mit", "miv", "miy", "miz", "mob", "mod", "mog", "mok", "mom", "mon", "mop", "mor", "mot", "mov", "moy", "moz", "mub", "mud", "mug", "muk", "mum", "mun", "mup", "mur", "mut", "muv", "muy", "muz", "nab", "nad", "nag", "nak", "nam", "nan", "nap", "nar", "nat", "nav", "nay", "naz", "neb", "ned", "neg", "nek", "nem", "nen", "nep", "ner", "net", "nev", "ney", "nez", "nib", "nid", "nig", "nik", "nim", "nin", "nip", "nir", "nit", "niv", "niy", "niz", "nob", "nod", "nog", "nok", "nom", "non", "nop", "nor", "not", "nov", "noy", "noz", "nub", "nud", "nug", "nuk", "num", "nun", "nup", "nur", "nut", "nuv", "nuy", "nuz", "pab", "pad", "pag", "pak", "pam", "pan", "pap", "par", "pat", "pav", "pay", "paz", "peb", "ped", "peg", "pek", "pem", "pen", "pep", "per", "pet", "pev", "pey", "pez", "pib", "pid", "pig", "pik", "pim", "pin", "pip", "pir", "pit", "piv", "piy", "piz", "pob", "pod", "pog", "pok", "pom", "pon", "pop", "por", "pot", "pov", "poy", "poz", "pub", "pud", "pug", "puk", "pum", "pun", "pup", "pur", "put", "puv", "puy", "puz", "sab", "sad", "sag", "sak", "sam", "san", "sap", "sar", "sat", "sav", "say", "saz", "seb", "sed", "seg", "sek", "sem", "sen", "sep", "ser", "set", "sev", "sey", "sez", "sib", "sid", "sig", "sik", "sim", "sin", "sip", "sir", "sit", "siv", "siy", "siz", "sob", "sod", "sog", "sok", "som", "son", "sop", "sor", "sot", "sov", "soy", "soz", "sub", "sud", "sug", "suk", "sum", "sun", "sup", "sur", "sut", "suv", "suy", "suz", "tab", "tad", "tag", "tak", "tam", "tan", "tap", "tar", "tat", "tav", "tay", "taz", "teb", "ted", "teg", "tek", "tem", "ten", "tep", "ter", "tet", "tev", "tey", "tez", "tib", "tid", "tig", "tik", "tim", "tin", "tip", "tir", "tit", "tiv", "tiy", "tiz", "tob", "tod", "tog", "tok", "tom", "ton", "top", "tor", "tot", "tov", "toy", "toz", "tub", "tud", "tug", "tuk", "tum", "tun", "tup", "tur", "tut", "tuv", "tuy", "tuz"]
    
    VCV:
    ["aba", "abe", "abi", "abo", "abu", "ada", "ade", "adi", "ado", "adu", "aga", "age", "agi", "ago", "agu", "aka", "ake", "aki", "ako", "aku", "ama", "ame", "ami", "amo", "amu", "ana", "ane", "ani", "ano", "anu", "apa", "ape", "api", "apo", "apu", "ara", "are", "ari", "aro", "aru", "ata", "ate", "ati", "ato", "atu", "ava", "ave", "avi", "avo", "avu", "aya", "aye", "ayi", "ayo", "ayu", "aza", "aze", "azi", "azo", "azu", "eba", "ebe", "ebi", "ebo", "ebu", "eda", "ede", "edi", "edo", "edu", "ega", "ege", "egi", "ego", "egu", "eka", "eke", "eki", "eko", "eku", "ema", "eme", "emi", "emo", "emu", "ena", "ene", "eni", "eno", "enu", "epa", "epe", "epi", "epo", "epu", "era", "ere", "eri", "ero", "eru", "eta", "ete", "eti", "eto", "etu", "eva", "eve", "evi", "evo", "evu", "eya", "eye", "eyi", "eyo", "eyu", "eza", "eze", "ezi", "ezo", "ezu", "iba", "ibe", "ibi", "ibo", "ibu", "ida", "ide", "idi", "ido", "idu", "iga", "ige", "igi", "igo", "igu", "ika", "ike", "iki", "iko", "iku", "ima", "ime", "imi", "imo", "imu", "ina", "ine", "ini", "ino", "inu", "ipa", "ipe", "ipi", "ipo", "ipu", "ira", "ire", "iri", "iro", "iru", "ita", "ite", "iti", "ito", "itu", "iva", "ive", "ivi", "ivo", "ivu", "iya", "iye", "iyi", "iyo", "iyu", "iza", "ize", "izi", "izo", "izu", "oba", "obe", "obi", "obo", "obu", "oda", "ode", "odi", "odo", "odu", "oga", "oge", "ogi", "ogo", "ogu", "oka", "oke", "oki", "oko", "oku", "oma", "ome", "omi", "omo", "omu", "ona", "one", "oni", "ono", "onu", "opa", "ope", "opi", "opo", "opu", "ora", "ore", "ori", "oro", "oru", "ota", "ote", "oti", "oto", "otu", "ova", "ove", "ovi", "ovo", "ovu", "oya", "oye", "oyi", "oyo", "oyu", "oza", "oze", "ozi", "ozo", "ozu", "uba", "ube", "ubi", "ubo", "ubu", "uda", "ude", "udi", "udo", "udu", "uga", "uge", "ugi", "ugo", "ugu", "uka", "uke", "uki", "uko", "uku", "uma", "ume", "umi", "umo", "umu", "una", "une", "uni", "uno", "unu", "upa", "upe", "upi", "upo", "upu", "ura", "ure", "uri", "uro", "uru", "uta", "ute", "uti", "uto", "utu", "uva", "uve", "uvi", "uvo", "uvu", "uya", "uye", "uyi", "uyo", "uyu", "uza", "uze", "uzi", "uzo", "uzu"]

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

