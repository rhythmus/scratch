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

Mnemnion, I'm sorry, I have to use the letter e - a VCV group would only have 192 combinations if we only used a, i, o, and u.

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

I generate the full set of combinations, trim some that are potentially offensive, then pick syllables psuedorandomly: ([code](https://github.com/dclelland/scratch/blob/master/proposal-a-syllables.rb))

    ["zod", "dad", "het", "dey", "hor", "dot", "kap", "gar", "bat", "gin", "bir", "gum", "bun", "heg", "dek", "hod",
     "dog", "huy", "gad", "bag", "gey", "bid", "got", "boy", "har", "das", "hin", "dir", "huk", "dun", "keg", "gek",
     "ben", "gog", "bok", "had", "daf", "hey", "dib", "hos", "doy", "kar", "gas", "bay", "gip", "bis", "gun", "bup",
     "hek", "dem", "hof", "dok", "kab", "gaf", "bak", "gib", "bif", "goy", "bub", "has", "dat", "hip", "dis", "hum",
     "dup", "kek", "gem", "bep", "gok", "bom", "haf", "dag", "hib", "did", "hot", "dub", "kas", "gat", "beb", "gir",
     "bit", "gup", "bur", "hem", "den", "hog", "dom", "kad", "gag", "bam", "gid", "big", "gub", "bud", "hat", "day",
     "hir", "dit", "hun", "dur", "kem", "gen", "ber", "gom", "bon", "hag", "dak", "hid", "dif", "hoy", "dud", "kat",
     "gay", "bed", "gis", "biy", "gur", "bus", "hen", "dep", "hok", "don", "kaf", "gak", "ban", "gif", "bik", "gud",
     "buf", "hay", "deb", "his", "diy", "hup", "dus", "ken", "gep", "bes", "gon", "bop", "hak", "dam", "hif", "dig",
     "hub", "duf", "kay", "geb", "bef", "git", "bob", "gus", "but", "hep", "der", "hom", "dop", "kag", "gam", "bap",
     "gig", "bim", "guf", "bug", "heb", "ded", "hit", "dob", "hur", "dut", "bab", "ger", "bet", "gop", "bor", "ham",
     "dan", "hig", "dim", "hud", "dug", "keb", "ged", "beg", "giy", "bod", "gut", "buy", "her", "des", "hon", "dor",
     "kam", "gan", "bar", "gik", "bin", "gug", "buk", "hed", "def", "hiy", "dod", "hus", "duy", "bad", "ges", "bey",
     "gor", "bos", "han", "dap", "hik", "din", "huf", "duk", "ked", "gef", "bek", "gob", "bof", "guy", "dab", "hes",
     "det", "hop", "dos", "kan", "gap", "bas", "gim", "bip", "guk", "bum", "hef", "deg", "hob", "dof", "hut", "gab",
     "baf", "get", "bib", "gos", "bot", "hap", "dar", "him", "dip", "hug", "dum", "kef", "geg", "bem", "gof", "bog"]

    ["ozo", "ivi", "eve", "eba", "uza", "ozu", "ivo", "evi", "ebe", "aba", "uba", "ivu", "evo", "ebi", "abe", "ube",
     "iza", "evu", "ebo", "abi", "ubi", "ize", "eza", "ebu", "abo", "ubo", "izi", "eze", "eda", "abu", "ubu", "izo",
     "ezi", "ede", "ada", "uda", "izu", "ezo", "edi", "ade", "ude", "oba", "ezu", "edo", "adi", "udi", "obe", "iba",
     "edu", "ado", "udo", "obi", "ibe", "ega", "adu", "udu", "obo", "ibi", "ege", "aha", "uga", "obu", "ibo", "egi",
     "ahe", "uge", "oha", "ibu", "ego", "ahi", "ugi", "ohe", "ida", "egu", "aho", "ugo", "ohi", "ide", "eha", "ahu",
     "ugu", "oho", "idi", "ehe", "ala", "uha", "ohu", "ido", "ehi", "ale", "uhe", "ola", "idu", "eho", "ali", "uhi",
     "ole", "iha", "ehu", "alo", "uho", "oli", "ihe", "eka", "alu", "uhu", "olo", "ihi", "eke", "ama", "ula", "olu",
     "iho", "eki", "ame", "ule", "oma", "ihu", "eko", "ami", "uli", "ome", "ila", "eku", "amo", "ulo", "omi", "ile",
     "ela", "amu", "ulu", "omo", "ili", "ele", "ana", "uma", "omu", "ilo", "eli", "ane", "ume", "ona", "ilu", "elo",
     "ani", "umi", "one", "ima", "elu", "ano", "umo", "oni", "ime", "ema", "anu", "umu", "ono", "imi", "eme", "apa",
     "una", "onu", "imo", "emi", "ape", "une", "opa", "imu", "emo", "api", "uni", "ope", "ina", "emu", "apo", "uno",
     "opi", "ine", "ena", "apu", "unu", "opo", "ini", "ene", "ata", "upa", "opu", "ino", "eni", "ate", "upe", "ota",
     "inu", "eno", "ati", "upi", "ote", "ipa", "enu", "ato", "upo", "oti", "ipe", "epa", "atu", "upu", "oto", "ipi",
     "epe", "ava", "uta", "otu", "ipo", "epi", "ave", "ute", "ova", "ipu", "epo", "avi", "uti", "ove", "ita", "epu",
     "avo", "uto", "ovi", "ite", "eta", "avu", "utu", "ovo", "iti", "ete", "aza", "uva", "ovu", "ito", "eti", "aze",
     "uve", "oza", "itu", "eto", "azi", "uvi", "oze", "iva", "etu", "azo", "uvo", "ozi", "ive", "eva", "azu", "uvu"]

0 is still ~zod, but 256 is now ~ozozod. Which is not what we wanted, we wanted ~zodozo! Frig. Didn't realise this thing was big-endian.

Formatted for Hoon anyway:

    ++  po
      ~/  %po
      =+  :-  ^=  sis
              'ozoivieveebauzaozuivoeviebeabaubaivuevoebiabeube\
              /izaevueboabiubiizeezaebuabouboiziezeedaabuubuizo\
              /eziedeadaudaizuezoediadeudeobaezuedoadiudiobeiba\
              /eduadoudoobiibeegaaduuduoboibiegeahaugaobuiboegi\
              /aheugeohaibuegoahiugioheidaeguahougoohiideehaahu\
              /uguohoidiehealauhaohuidoehialeuheolaiduehoaliuhi\
              /oleihaehualouhooliiheekaaluuhuoloihiekeamaulaolu\
              /ihoekiameuleomaihuekoamiuliomeilaekuamouloomiile\
              /elaamuuluomoilieleanaumaomuiloelianeumeonailuelo\
              /aniumioneimaeluanoumooniimeemaanuumuonoimiemeapa\
              /unaonuimoemiapeuneopaimuemoapiuniopeinaemuapouno\
              /opiineenaapuunuopoinieneataupaopuinoeniateupeota\
              /inuenoatiupioteipaenuatoupootiipeepaatuupuotoipi\
              /epeavautaotuipoepiaveuteovaipuepoaviutioveitaepu\
              /avoutooviiteetaavuutuovoitieteazauvaovuitoetiaze\
              /uveozaituetoaziuviozeivaetuazouvooziiveevaazuuvu'
          ^=  dex
          'zoddadhetdeyhordotkapgarbatginbirgumbunhegdekhod\
          /doghuygadbaggeybidgotboyhardashindirhukdunkeggek\
          /bengogbokhaddafheydibhosdoykargasbaygipbisgunbup\
          /hekdemhofdokkabgafbakgibbifgoybubhasdathipdishum\
          /dupkekgembepgokbomhafdaghibdidhotdubkasgatbebgir\
          /bitgupburhemdenhogdomkadgagbamgidbiggubbudhatday\
          /hirdithundurkemgenbergombonhagdakhiddifhoydudkat\
          /gaybedgisbiygurbushendephokdonkafgakbangifbikgud\
          /bufhaydebhisdiyhupduskengepbesgonbophakdamhifdig\
          /hubdufkaygebbefgitbobgusbuthepderhomdopkaggambap\
          /gigbimgufbughebdedhitdobhurdutbabgerbetgopborham\
          /danhigdimhuddugkebgedbeggiybodgutbuyherdeshondor\
          /kamganbargikbingugbukheddefhiydodhusduybadgesbey\
          /gorboshandaphikdinhufdukkedgefbekgobbofguydabhes\
          /dethopdoskangapbasgimbipgukbumhefdeghobdofhutgab\
          /bafgetbibgosbothapdarhimdiphugdumkefgegbemgofbog'
      |%

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

