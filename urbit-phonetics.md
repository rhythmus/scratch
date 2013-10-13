## Research:

I've looked into what letters correspond to what phonemes by language (or the romanisation of that language). I looked at the ten languages with the highest number of internet users, plus Hindi, because I felt like it.

[This spreadsheet](https://docs.google.com/spreadsheet/ccc?key=0AoF7JCDAQNZCdDZrNmJid0owRnRGUDRCR3NreXZ1cHc&usp=sharing) should make it easy to see which letters are cool and which are a total write-off. From that I have selected a set of letters and letter pairs whose pronunciation remains relatively stable across a wide range of languages:

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

- f/v: In this instance I have simply paired /f/ (the voiceless labiodental fricative) with its voiced counterpart, /v/. I am tempted to drop /v/ altogether, as so many languages have massive trouble with /v/. Japanese speakers tend to turn it into a /b/, rather than an /f/, for instance.
- s/z: I have done the same here - /z/ is simply /s/'s voiced counterpart. Romance languages (English too) tend to turn /s/ into /z/ often, so I have relegated /z/ to onsets and /s/ to codas.
- h/y: I doubt these two letters will ever be confused with one another but it felt aesthetically *right* to keep /h/ at the start and /j/ in the middle of the word.
- l/r: For our Japanese friends.

IPA is simple:

    p  /p/   b  /b/   m  /m/   f/v  /f~v/   h  /h/   l/r  /l~r/
    t  /t/   d  /d/   n  /n/   s/z  /s~z/   y  /j/
    k  /k/   g  /g/

#### Moving on:

I generated some addresses of different lengths, selecting syllables randomly. ([code](https://github.com/dclelland/scratch/blob/master/urbit-phonetics-a.rb))

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

I generated the full set of combinations, trimmed some that are potentially offensive, then picked syllables psuedorandomly:

    ["zod", "zes", "mik", "bof", "mud", "har", "pun", "gom", "dak", "geb", "kun", "bef", "buy", "tos", "dar", "lob",
     "lof", "puk", "vok", "zek", "bir", "kir", "var", "zen", "kaf", "gad", "dud", "bis", "naf", "das", "hag", "tir",
     "pet", "lif", "zip", "bon", "nif", "zim", "mur", "bum", "zey", "tar", "mab", "gus", "hap", "zin", "mok", "gik",
     "tem", "mit", "piy", "nok", "les", "zib", "zud", "tug", "vos", "hak", "gob", "pin", "pug", "hip", "vut", "kur",
     "num", "pim", "hat", "hon", "kik", "tes", "vup", "vat", "biy", "pem", "zit", "daf", "vif", "gin", "zas", "dug",
     "zir", "het", "pan", "kus", "net", "tod", "may", "pat", "hem", "kuk", "dop", "hek", "pof", "kin", "lip", "hog",
     "bod", "nep", "dog", "mag", "pag", "lik", "dem", "pid", "bab", "niy", "nuy", "dur", "van", "dub", "tud", "vig",
     "mop", "meb", "tun", "pom", "bik", "kap", "gib", "bep", "hub", "ved", "nir", "mir", "ked", "tor", "hus", "gip",
     "gur", "dib", "dey", "heg", "vip", "bif", "nik", "tis", "mup", "nop", "him", "dod", "vur", "pus", "mes", "vad",
     "vod", "mum", "pap", "kis", "zom", "nef", "pes", "bob", "mun", "pep", "nun", "ner", "pot", "lib", "pod", "zok",
     "pon", "lef", "bas", "bid", "hun", "giy", "pud", "goy", "beg", "hob", "boy", "zuf", "hom", "kef", "tog", "vay",
     "kor", "kod", "pup", "duk", "laf", "bek", "pef", "lut", "bam", "dos", "ped", "ven", "kit", "mod", "pum", "gem",
     "mip", "vor", "tid", "vum", "zep", "huf", "ley", "nam", "kim", "gab", "noy", "viy", "nup", "maf", "vis", "gup",
     "hoy", "tuy", "nap", "nog", "vek", "tot", "dom", "nid", "tup", "lin", "kay", "tiy", "lid", "pay", "gag", "nom",
     "gud", "pop", "kug", "gog", "dum", "vey", "zub", "tik", "veg", "per", "miy", "gub", "tap", "hig", "gar", "meg",
     "tum", "kop", "dut", "deg", "dag", "bag", "ten", "vik", "ted", "din", "zem", "lis", "dap", "nas", "lim", "lor"]

    ["ozo", "emo", "ulu", "uvu", "ute", "epo", "eze", "ova", "ime", "uzo", "eli", "onu", "eba", "uge", "avi", "uho",
     "ede", "oli", "ize", "ibu", "ahi", "oga", "uma", "ego", "azo", "eza", "uli", "ima", "ogu", "ugi", "izo", "ibo",
     "ado", "otu", "egu", "apa", "eni", "uva", "utu", "edi", "ali", "ine", "ama", "ovo", "edo", "eha", "ava", "eto",
     "ehe", "ovi", "ave", "one", "eku", "obo", "epi", "uni", "ebi", "ide", "ege", "edu", "uto", "unu", "udo", "ati",
     "ita", "oba", "oto", "ame", "ibi", "ove", "ivu", "oha", "ipu", "egi", "ena", "apo", "ili", "uze", "eka", "ebu",
     "ivi", "uta", "upo", "izu", "eme", "ila", "ani", "iho", "ota", "enu", "ilo", "oho", "opu", "ene", "ive", "ina",
     "aba", "ato", "epa", "alu", "eno", "ehu", "ini", "ito", "apu", "ibe", "iba", "ubo", "ale", "uhi", "alo", "amo",
     "upe", "inu", "elo", "obu", "ipo", "uvi", "olu", "ogi", "izi", "ope", "obe", "ugo", "ebe", "ovu", "ubi", "ata",
     "abo", "umu", "aze", "eti", "iza", "imu", "ete", "ate", "ozi", "uga", "ano", "oni", "azi", "uza", "umo", "opo",
     "ubu", "epe", "ugu", "ole", "ela", "imo", "ane", "epu", "ono", "eke", "ona", "evi", "ohi", "ega", "oge", "aha",
     "avo", "ulo", "ilu", "une", "ema", "eho", "imi", "emi", "ula", "azu", "uzi", "ude", "ote", "ami", "ube", "ite",
     "opa", "ehi", "ipi", "eki", "evo", "uda", "ebo", "ida", "ola", "ezo", "avu", "ipa", "abe", "iva", "atu", "itu",
     "ihu", "eda", "ozu", "ino", "olo", "upu", "aho", "uhu", "api", "ahe", "oze", "opi", "eve", "idi", "ada", "uno",
     "uve", "evu", "oti", "una", "uhe", "uvo", "uha", "aza", "ape", "ihe", "ade", "obi", "ule", "umi", "iti", "udi",
     "ezu", "uba", "elu", "amu", "abu", "iha", "ile", "ahu", "ezi", "etu", "ume", "oza", "ana", "adi", "anu", "adu",
     "ipe", "ala", "eta", "uti", "ogo", "eva", "upa", "eko", "ohu", "idu", "emu", "ido", "ohe", "abi", "ihi", "upi"]

0 is still ~zod, but 256 is now ~ozozod. Which is not what we wanted, we wanted ~zodozo! Frig. Didn't realise this thing was big-endian.

Pre formatted anyway, I'll have to learn me some Hoon later:

    ++  po
      ~/  %po
      =+  :-  ^=  sis
              'ozoemouluuvuuteepoezeovaimeuzoelionuebaugeaviuho\
              /edeoliizeibuahiogaumaegoazoezauliimaoguugiizoibo\
              /adootueguapaeniuvautuedialiineamaovoedoehaavaeto\
              /eheoviaveoneekuoboepiuniebiideegeeduutounuudoati\
              /itaobaotoameibioveivuohaipuegienaapoiliuzeekaebu\
              /iviutaupoizuemeilaaniihootaenuiloohoopueneiveina\
              /abaatoepaaluenoehuiniitoapuibeibauboaleuhialoamo\
              /upeinueloobuipouvioluogiiziopeobeugoebeovuubiata\
              /aboumuazeetiizaimueteateoziugaanooniaziuzaumoopo\
              /ubuepeuguoleelaimoaneepuonoekeonaeviohiegaogeaha\
              /avouloiluuneemaehoimiemiulaazuuziudeoteamiubeite\
              /opaehiipiekievoudaeboidaolaezoavuipaabeivaatuitu\
              /ihuedaozuinooloupuahouhuapiaheozeopieveidiadauno\
              /uveevuotiunauheuvouhaazaapeiheadeobiuleumiitiudi\
              /ezuubaeluamuabuihaileahuezietuumeozaanaadianuadu\
              /ipealaetautiogoevaupaekoohuiduemuidooheabiihiupi'
          ^=  dex
          'zodzesmikbofmudharpungomdakgebkunbefbuytosdarlob\
          /lofpukvokzekbirkirvarzenkafgaddudbisnafdashagtir\
          /petlifzipbonnifzimmurbumzeytarmabgushapzinmokgik\
          /temmitpiynokleszibzudtugvoshakgobpinpughipvutkur\
          /numpimhathonkiktesvupvatbiypemzitdafvifginzasdug\
          /zirhetpankusnettodmaypathemkukdophekpofkinliphog\
          /bodnepdogmagpaglikdempidbabniynuydurvandubtudvig\
          /mopmebtunpombikkapgibbephubvednirmirkedtorhusgip\
          /gurdibdeyhegvipbifniktismupnophimdodvurpusmesvad\
          /vodmumpapkiszomnefpesbobmunpepnunnerpotlibpodzok\
          /ponlefbasbidhungiypudgoybeghobboyzufhomkeftogvay\
          /korkodpupduklafbekpeflutbamdospedvenkitmodpumgem\
          /mipvortidvumzephufleynamkimgabnoyviynupmafvisgup\
          /hoytuynapnogvektotdomnidtuplinkaytiylidpaygagnom\
          /gudpopkuggogdumveyzubtikvegpermiygubtaphiggarmeg\
          /tumkopdutdegdagbagtenvikteddinzemlisdapnaslimlor'
      |%

Anyway, to wrap up, here's a stack of sample ship names:

    ~deg
    ~ted
    ~gog
    ~net

    ~zomezu
    ~duralo
    ~basidu
    ~likivu

    ~biyazu-lipehu
    ~gubuvu-hunule
    ~napoto-vadobo
    ~pofuti-mipinu

    ~tesolo-kukulo-haguvi-honuda
    ~kinova-tumebo-honahe-nupipa
    ~tedenu-hubabi-bifedi-pinoha
    ~guruma-zomubo-demano-lafuda

    ~vorado-zibole-totila-hakuho--gupimo-doduto-pofela-varavu
    ~potuta-boduve-vayunu-begobu--dakume-gomini-pusegu-gudonu
    ~zomeda-lisalu-kuruti-lesamu--bagune-kefemu-vatado-pusedu
    ~mabihu-gadadu-kurobo-kodani--bamala-tesitu-giyibu-pofobe

## Proposal B:

WIP, will probably be extensively hand-tuned CVCCVC

## Proposal C:

WIP, will investigate a more fluid structure.


## Relevant links:

Urbit phonetic base discussion thread:

https://groups.google.com/forum/#!msg/urbit-dev/zW3rgpX_AxQ/a0gLMIc4VRoJ

Mnemnion's proposal:

https://github.com/mnemnion/porch/blob/master/phonemes.md

IPA soundboard:

http://web.uvic.ca/ling/resources/ipa/charts/IPAlab/IPAlab.htm

