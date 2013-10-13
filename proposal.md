## Research:

I've looked into what letters correspond to what phonemes by language (or the romanisation of that language). I looked at the ten languages with the highest number of internet users, plus Hindi, because I felt like it. ([googdoc](https://docs.google.com/spreadsheet/ccc?key=0AoF7JCDAQNZCdDZrNmJid0owRnRGUDRCR3NreXZ1cHc&usp=sharing))

From this I believe we can select a set of letters and letter pairs which are relatively unambiguous in their pronunciation across a wide range of languages:

    unvoiced stops    p, t, k
    voiced stops      b, d, g
    nasals            m, n
    fricatives        f/v, s/z
    liquids           l/r
    vowels            a, e, i, o, u
    other weird shit  h, y

## Proposal A:

This system uses CVC and VCV for alternating bytes. The disadvantage is that we now have three syllables per two-byte address. The advantage is that we avoid having to avoid bad-sounding consonant clusters altogether.

    onsets:           p t k b d g m n v z h l
    nucleii:          a e i o u
    codas:            p t k b d g m n f s y r

A single byte follows the pattern onset-nucleus-coda and a double-byte word follows the pattern onset-nucleus-coda-nucleus-onset-nucleus. Note the pairs f/v, s/z, and l/r, h/y - this is to avoid ambiguous pronunciations.

Mnemnion, I'm sorry, I have to use the letter e - a VCV group would only have 192 combinations if we only used a, i, o, and u as per your proposal.

#### MORE DETAILS PLEASE

- f/v: In this instance I have simply paired /f/ (the voiceless labiodental fricative) with its voiced counterpart, /v/. I am tempted to drop this altogether, as so many languages have massive trouble with /v/. Japanese speakers tend to turn it into a /b/, rather than an /f/, for instance.
- s/z: I have done the same here - /z/ is simply /s/'s voiced counterpart. Romance languages (English too) tend to turn /s/ into /z/ often, so I have relegated /z/ to onsets and /s/ to codas.
- h/y: I doubt these two letters will ever be confused with one another but it felt aesthetically *right* to keep /h/ at the start and /j/ in the middle of the word.
- l/r: Me so solly.

#### Moving on:

I generated some addresses of different lengths, selecting syllables randomly. ([code](https://github.com/dclelland/scratch/blob/master/proposal-a-ships.rb))

    ~zek
    ~honape
    ~kinami-bebuva
    ~nogodi-nasomi-toregu-hosopu
    ~kifeno-viyiza-vaguli-pefoti--zibagi-gemede-tiyiko-bakizi

    ~gif
    ~darebo
    ~lomuni-legoho
    ~vifeti-vabili-mafuze-papili
    ~lepehe-zesime-zapupe-vusonu--zugubi-misilu-viniko-gapote

Sounds kinda Polynesian huh?

Here's a list of combinations: ([code](https://github.com/dclelland/scratch/blob/master/proposal-a-syllables.rb))

    Dextra (720 combinations):
    ["bab", "bad", "baf", "bag", "bak", "bam", "ban", "bap", "bar", "bas", "bat", "bay", "beb", "bed", "bef", "beg",
     "bek", "bem", "ben", "bep", "ber", "bes", "bet", "bey", "bib", "bid", "bif", "big", "bik", "bim", "bin", "bip",
     "bir", "bis", "bit", "biy", "bob", "bod", "bof", "bog", "bok", "bom", "bon", "bop", "bor", "bos", "bot", "boy",
     "bub", "bud", "buf", "bug", "buk", "bum", "bun", "bup", "bur", "bus", "but", "buy", "dab", "dad", "daf", "dag",
     "dak", "dam", "dan", "dap", "dar", "das", "dat", "day", "deb", "ded", "def", "deg", "dek", "dem", "den", "dep",
     "der", "des", "det", "dey", "dib", "did", "dif", "dig", "dik", "dim", "din", "dip", "dir", "dis", "dit", "diy",
     "dob", "dod", "dof", "dog", "dok", "dom", "don", "dop", "dor", "dos", "dot", "doy", "dub", "dud", "duf", "dug",
     "duk", "dum", "dun", "dup", "dur", "dus", "dut", "duy", "gab", "gad", "gaf", "gag", "gak", "gam", "gan", "gap",
     "gar", "gas", "gat", "gay", "geb", "ged", "gef", "geg", "gek", "gem", "gen", "gep", "ger", "ges", "get", "gey",
     "gib", "gid", "gif", "gig", "gik", "gim", "gin", "gip", "gir", "gis", "git", "giy", "gob", "god", "gof", "gog",
     "gok", "gom", "gon", "gop", "gor", "gos", "got", "goy", "gub", "gud", "guf", "gug", "guk", "gum", "gun", "gup",
     "gur", "gus", "gut", "guy", "hab", "had", "haf", "hag", "hak", "ham", "han", "hap", "har", "has", "hat", "hay",
     "heb", "hed", "hef", "heg", "hek", "hem", "hen", "hep", "her", "hes", "het", "hey", "hib", "hid", "hif", "hig",
     "hik", "him", "hin", "hip", "hir", "his", "hit", "hiy", "hob", "hod", "hof", "hog", "hok", "hom", "hon", "hop",
     "hor", "hos", "hot", "hoy", "hub", "hud", "huf", "hug", "huk", "hum", "hun", "hup", "hur", "hus", "hut", "huy",
     "kab", "kad", "kaf", "kag", "kak", "kam", "kan", "kap", "kar", "kas", "kat", "kay", "keb", "ked", "kef", "keg",
     "kek", "kem", "ken", "kep", "ker", "kes", "ket", "key", "kib", "kid", "kif", "kig", "kik", "kim", "kin", "kip",
     "kir", "kis", "kit", "kiy", "kob", "kod", "kof", "kog", "kok", "kom", "kon", "kop", "kor", "kos", "kot", "koy",
     "kub", "kud", "kuf", "kug", "kuk", "kum", "kun", "kup", "kur", "kus", "kut", "kuy", "lab", "lad", "laf", "lag",
     "lak", "lam", "lan", "lap", "lar", "las", "lat", "lay", "leb", "led", "lef", "leg", "lek", "lem", "len", "lep",
     "ler", "les", "let", "ley", "lib", "lid", "lif", "lig", "lik", "lim", "lin", "lip", "lir", "lis", "lit", "liy",
     "lob", "lod", "lof", "log", "lok", "lom", "lon", "lop", "lor", "los", "lot", "loy", "lub", "lud", "luf", "lug",
     "luk", "lum", "lun", "lup", "lur", "lus", "lut", "luy", "mab", "mad", "maf", "mag", "mak", "mam", "man", "map",
     "mar", "mas", "mat", "may", "meb", "med", "mef", "meg", "mek", "mem", "men", "mep", "mer", "mes", "met", "mey",
     "mib", "mid", "mif", "mig", "mik", "mim", "min", "mip", "mir", "mis", "mit", "miy", "mob", "mod", "mof", "mog",
     "mok", "mom", "mon", "mop", "mor", "mos", "mot", "moy", "mub", "mud", "muf", "mug", "muk", "mum", "mun", "mup",
     "mur", "mus", "mut", "muy", "nab", "nad", "naf", "nag", "nak", "nam", "nan", "nap", "nar", "nas", "nat", "nay",
     "neb", "ned", "nef", "neg", "nek", "nem", "nen", "nep", "ner", "nes", "net", "ney", "nib", "nid", "nif", "nig",
     "nik", "nim", "nin", "nip", "nir", "nis", "nit", "niy", "nob", "nod", "nof", "nog", "nok", "nom", "non", "nop",
     "nor", "nos", "not", "noy", "nub", "nud", "nuf", "nug", "nuk", "num", "nun", "nup", "nur", "nus", "nut", "nuy",
     "pab", "pad", "paf", "pag", "pak", "pam", "pan", "pap", "par", "pas", "pat", "pay", "peb", "ped", "pef", "peg",
     "pek", "pem", "pen", "pep", "per", "pes", "pet", "pey", "pib", "pid", "pif", "pig", "pik", "pim", "pin", "pip",
     "pir", "pis", "pit", "piy", "pob", "pod", "pof", "pog", "pok", "pom", "pon", "pop", "por", "pos", "pot", "poy",
     "pub", "pud", "puf", "pug", "puk", "pum", "pun", "pup", "pur", "pus", "put", "puy", "tab", "tad", "taf", "tag",
     "tak", "tam", "tan", "tap", "tar", "tas", "tat", "tay", "teb", "ted", "tef", "teg", "tek", "tem", "ten", "tep",
     "ter", "tes", "tet", "tey", "tib", "tid", "tif", "tig", "tik", "tim", "tin", "tip", "tir", "tis", "tit", "tiy",
     "tob", "tod", "tof", "tog", "tok", "tom", "ton", "top", "tor", "tos", "tot", "toy", "tub", "tud", "tuf", "tug",
     "tuk", "tum", "tun", "tup", "tur", "tus", "tut", "tuy", "vab", "vad", "vaf", "vag", "vak", "vam", "van", "vap",
     "var", "vas", "vat", "vay", "veb", "ved", "vef", "veg", "vek", "vem", "ven", "vep", "ver", "ves", "vet", "vey",
     "vib", "vid", "vif", "vig", "vik", "vim", "vin", "vip", "vir", "vis", "vit", "viy", "vob", "vod", "vof", "vog",
     "vok", "vom", "von", "vop", "vor", "vos", "vot", "voy", "vub", "vud", "vuf", "vug", "vuk", "vum", "vun", "vup",
     "vur", "vus", "vut", "vuy", "zab", "zad", "zaf", "zag", "zak", "zam", "zan", "zap", "zar", "zas", "zat", "zay",
     "zeb", "zed", "zef", "zeg", "zek", "zem", "zen", "zep", "zer", "zes", "zet", "zey", "zib", "zid", "zif", "zig",
     "zik", "zim", "zin", "zip", "zir", "zis", "zit", "ziy", "zob", "zod", "zof", "zog", "zok", "zom", "zon", "zop",
     "zor", "zos", "zot", "zoy", "zub", "zud", "zuf", "zug", "zuk", "zum", "zun", "zup", "zur", "zus", "zut", "zuy"]

    Sinistra (300 combinations):
    ["aba", "abe", "abi", "abo", "abu", "ada", "ade", "adi", "ado", "adu", "aga", "age", "agi", "ago", "agu", "aha",
     "ahe", "ahi", "aho", "ahu", "aka", "ake", "aki", "ako", "aku", "ala", "ale", "ali", "alo", "alu", "ama", "ame",
     "ami", "amo", "amu", "ana", "ane", "ani", "ano", "anu", "apa", "ape", "api", "apo", "apu", "ata", "ate", "ati",
     "ato", "atu", "ava", "ave", "avi", "avo", "avu", "aza", "aze", "azi", "azo", "azu", "eba", "ebe", "ebi", "ebo",
     "ebu", "eda", "ede", "edi", "edo", "edu", "ega", "ege", "egi", "ego", "egu", "eha", "ehe", "ehi", "eho", "ehu",
     "eka", "eke", "eki", "eko", "eku", "ela", "ele", "eli", "elo", "elu", "ema", "eme", "emi", "emo", "emu", "ena",
     "ene", "eni", "eno", "enu", "epa", "epe", "epi", "epo", "epu", "eta", "ete", "eti", "eto", "etu", "eva", "eve",
     "evi", "evo", "evu", "eza", "eze", "ezi", "ezo", "ezu", "iba", "ibe", "ibi", "ibo", "ibu", "ida", "ide", "idi",
     "ido", "idu", "iga", "ige", "igi", "igo", "igu", "iha", "ihe", "ihi", "iho", "ihu", "ika", "ike", "iki", "iko",
     "iku", "ila", "ile", "ili", "ilo", "ilu", "ima", "ime", "imi", "imo", "imu", "ina", "ine", "ini", "ino", "inu",
     "ipa", "ipe", "ipi", "ipo", "ipu", "ita", "ite", "iti", "ito", "itu", "iva", "ive", "ivi", "ivo", "ivu", "iza",
     "ize", "izi", "izo", "izu", "oba", "obe", "obi", "obo", "obu", "oda", "ode", "odi", "odo", "odu", "oga", "oge",
     "ogi", "ogo", "ogu", "oha", "ohe", "ohi", "oho", "ohu", "oka", "oke", "oki", "oko", "oku", "ola", "ole", "oli",
     "olo", "olu", "oma", "ome", "omi", "omo", "omu", "ona", "one", "oni", "ono", "onu", "opa", "ope", "opi", "opo",
     "opu", "ota", "ote", "oti", "oto", "otu", "ova", "ove", "ovi", "ovo", "ovu", "oza", "oze", "ozi", "ozo", "ozu",
     "uba", "ube", "ubi", "ubo", "ubu", "uda", "ude", "udi", "udo", "udu", "uga", "uge", "ugi", "ugo", "ugu", "uha",
     "uhe", "uhi", "uho", "uhu", "uka", "uke", "uki", "uko", "uku", "ula", "ule", "uli", "ulo", "ulu", "uma", "ume",
     "umi", "umo", "umu", "una", "une", "uni", "uno", "unu", "upa", "upe", "upi", "upo", "upu", "uta", "ute", "uti",
     "uto", "utu", "uva", "uve", "uvi", "uvo", "uvu", "uza", "uze", "uzi", "uzo", "uzu"]

#### Pruning/blacklist

There's no bulletproof way to do this with 2^16 potential three-syllable words, but the broadcasting standards authority in my country recently put out a [list of words people find most offensive](http://bsa.govt.nz/images/assets/Research/Acceptibility_of_Words_2013_WEB.pdf) (page 9), so I thought that was a good starting point.

#### Selection

Need to find a way of mapping a number from 0~255 to a number 0~720, and 0~300, starting with ~zod and ending with ~odo

## Proposal B:

Hand-tuned CVCCVC. Need to do directional graph of good consonant combinations. Retain ~zod. Perhaps look at inverting secondary numbers? ~dozzod etc.

## Proposal C:

Complex tuned 1 syllable per 16-bit number system. Work in progress/stillborn.


## Relevant links:

Urbit phonetic base discussion thread:

https://groups.google.com/forum/#!msg/urbit-dev/zW3rgpX_AxQ/a0gLMIc4VRoJ

Mnemnion's proposal:

https://github.com/mnemnion/porch/blob/master/phonemes.md

IPA soundboard:

http://web.uvic.ca/ling/resources/ipa/charts/IPAlab/IPAlab.htm

