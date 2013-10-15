## Proposal B

I shall stick to my [established letter sets](https://github.com/dclelland/scratch/blob/master/urbit-phonetics-a.md), but work with a CVCCVC structure (which I shall split into three two-character blocks and address as blocks A, B, and C from now on).

Blocks A and C are the simplest, comprising just a consonant and a vowel each.

I selected my consonants starting with the six basic stops (p t k b d g), followed by two nasals (m and n).
Then four fricatives and two liquids (f/v, s/z, l/r), in pairs between sets in order to avoid ambiguity.
And finally h and y. H tends to disappear at the end of words so I keep h in the first set and balance it out with y in the final set.

    Block A consonants      p t k b d g m n f z l h
    Block C consonants      p t k b d g m n v s r y
    Vowels                  a e i o u

Block B, comprising two consonants, is trickier. I mapped out all two-consonant combinations, then eliminated double-ups and pairs where a voiced consonant was matched with an unvoiced consonant (I have generalised n and r as voiced and m and l as voiced so that our system works). This is so that even if the user pronounces, say, /sm/ as /zm/ (as is pretty common in European languages, especially English), we still know it should be /sm/. It's like a really basic checksum.

       p  b  t  d  k  g  m  n  f  v  s  z  l  r 
    p        tp    kp    mp    fp    sp    lp   
    b           db    gb    nb    vb    zb    rb
    t  pt          kt    mt    ft    st    lt   
    d     bd          gd    nd    vd    zd    rd
    k  pk    tk          mk    fk    sk    lk   
    g     bg    dg          ng    vg    zg    rg
    m  pm    tm    km          fm    sm    lm   
    n     bn    dn    gn          vn    zn    rn
    f  pf    tf    kf    mf          sf    lf   
    v     bv    dv    gv    nv          zv    rv
    s  ps    ts    ks    ms    fs          ls   
    z     bz    dz    gz    nz    vz          rz
    l  pl    tl    kl    ml    fl    sl         
    r     br    dr    gr    nr    vr    zr      

Taking all combinations gives us three blocks of 60, 84, and 60 combinations respectively.

    Block A          Block B                Block C
    pa pe pi po pu   pt tp kp mp fp sp lp   ap ep ip op up
    ta te ti to tu   bd db gb nb vb zb rb   at et it ot ut
    ka ke ki ko ku   pk tk kt mt ft st lt   ak ek ik ok uk
    ba be bi bo bu   bg dg gd nd vd zd rd   ab eb ib ob ub
    da de di do du   pm tm km mk fk sk lk   ad ed id od ud
    ga ge gi go gu   bn dn gn ng vg zg rg   ag eg ig og ug
    ma me mi mo mu   pf tf kf mf fm sm lm   am em im om um
    na ne ni no nu   bv dv gv nv vn zn rn   an en in on un
    fa fe fi fo fu   ps ts ks ms fs sf lf   av ev iv ov uv
    za ze zi zo zu   bz dz gz nz vz zv rv   as es is os us
    la le li lo lu   pl tl kl ml fl sl ls   ar er ir or ur
    ha he hi ho hu   br dr gr nr vr zr rz   ay ey iy oy uy

Good to go! Let's generate some fake ship names to test (of course, we can't do carriers yet):

    ~gogdan
    ~keklem
    ~favbob
    ~tilmon-fomlem
    ~lozdon-dimfim
    ~hatlun-hosmor
    ~huvzar-famlev-dilsug-goksig
    ~nebzup-zibgay-ferbok-levnib
    ~natlen-bolkeb-bufsit-kuflub
    ~leplod-beplak-gimfep-hegzub--zigran-noklob-timsin-begrun
    ~bimsur-hozgun-zakfap-hoftev--tergen-lalsug-haklay-gopmet
    ~poftus-lunbob-tolked-mupsor--pogvek-pinret-burvet-gitlog

### Mathematics

So far I've looked at two ways of generating words from numbers.

The *first* approach involves generating a lookup table with four sets of 256 syllables, one each for every combination of left, right, odd, and even.

This allows us to select voiced or unvoiced boundary consonants based on whether the number is odd or even. In true urbit fashion, zero (true) is voiced (this allows for ~zod, as well).

A bonus feature is that since we draw our syllables from a regular source, syllables from different tables sound similar: e.g. (doz dos zod sod) or (zeg zek ges kes).

We can also easily blacklist syllables we don't like. I've been removing (nig nog dik fuk fok fag gay gey kak kok pis god vag vom kum pig fat).

The one drawback is that while this approach successfully avoids bad consonant clusters, it does not guarantee avoiding doubled consonants. I'm not 100% sure this is still an issue but I believe it helps break up the look of a ships's name somewhat.

([Here's the code.](https://github.com/dclelland/scratch/blob/master/urbit-phonetics-b.rb))

Syllable tables:

    Even Sinistra
    doz taz lon zuv kar fuz nar pan lan fig gun gab hoz ped gir deb
    niv fen pen boz fir nub nud nin lob luv mog dad lub nib laz fav
    ded zov bob gag kin nan dor kug tin had pez bod hir leg tar hur
    ler man lin ker lur fiv nob hiz beg tir gog tiz bug gur kev zag
    fab ten hid par teg lod maz lun liz tan bez mer hav don hib keb
    gev bur meb guv dub ner pog ken ton hin zer der tib fed bab fag
    lid hig zar zug fez duv pid kon ked kir kig bog mid muz foz daz
    neb luz ged gid loz zab bad huz for lez ban dug far tod bud faz
    dov gaz mur pag lug zid ter dan pug feb gob dar paz zen ned hed
    meg kav peb tez hov feg ger bed lov fob fiz pir fan goz diz nug
    ziz tud fub ziv pib zod zin kur buz nag muv miv nod mir moz big
    hon deg med lad fid niz kab duz zeg tug hen kor zan non fud fov
    bid hug keg div din bin kub lab pev piv gub nun kaz haz tag tev
    nev dud tub kuv lud zeb nid mib zon noz ted zur fer gud mun kiz
    ber zob pav lar geb zor beb tuv led toz naz pur tab tuz mub bov
    buv kud zed dob kob gen zad pab geg lav lib hun biv lag heb bor

    Odd Sinistra
    dos tas lom zuf kal fus nal pam lam fik gum gap hos pet gil dep
    nif fem pem bos fil nup nut nim lop luf mok dat lup nip las faf
    det zof bop gak kim nam dol kuk tim hat pes bot hil lek tal hul
    lel mam lim kel lul fif nop his bek til gok tis buk gul kef zak
    fap tem hit pal tek lot mas lum lis tam bes mel haf dom hip kep
    gef bul mep guf dup nel pok kem tom him zel del tip fet bap fak
    lit hik zal zuk fes duf pit kom ket kil kik bok mit mus fos das
    nep lus get git los zap bat hus fol les bam duk fal tot but fas
    dof gas mul pak luk zit tel dam puk fep gop dal pas zem net het
    mek kaf pep tes hof fek gel bet lof fop fis pil fam gos dis nuk
    zis tut fup zif pip zot zim kul bus nak muf mif not mil mos bik
    hom dek met lat fit nis kap dus zek tuk hem kol zam nom fut fof
    bit huk kek dif dim bim kup lap pef pif gup num kas has tak tef
    nef dut tup kuf lut zep nit mip zom nos tet zul fel gut mum kis
    bel zop paf lal gep zol bep tuf let tos nas pul tap tus mup bof
    buf kut zet dop kop gem zat pap gek laf lip hum bif lak hep bol

    Even Dextra
    zod zat nor vus rak zuv ran nap nar giv nug bag zoy dep rig bed
    vin nev nep zob riv bun dun nin bor vur gom dad bur bin zar vav
    ded vos bob gag nik nan rod guk nit day zep dob riy ger rat ruy
    rer nam nir rek rur viv bon ziy geb rit gog zit gub rug vek gas
    bav net diy rap get dor zam nur zir nat zeb rem vay nod biy bek
    veg rub bem vug bud ren gop nek not niy res red bit dev bab gav
    dir giy ras gus zev vud dip nok dek rik gik gob dim zum zov zad
    ben zur deg dig zor bas dab zuy rov zer nab gud rav dot dub zav
    vod zag rum gap gur dis ret nad gup bev bog rad zap nes den dey
    gem vak bep zet voy gev reg deb vor bov ziv rip nav zog zid gun
    zis dut buv vis bip dos nis ruk zub gan vum vim don rim zom gib
    noy ged dem dar div zin bak zud ges gut ney rok nas non duv vov
    dib guy gek vid nid nib buk bar vep vip bug nun zak zay gat vet
    ven dud but vuk dur bes din bim nos zon det rus rev dug num zik
    reb bos vap rar beg ros beb vut der zot zan rup bat zut bum vob
    vub duk des bod bok neg das bap geg var bir nuy vib gar bey rob

    Odd Dextra
    sod sat mor fus lak suv lan map mar kiv mug pag soy tep lig ped
    fin mev mep sob liv pun tun min por fur kom tad pur pin sar fav
    ted fos pob kag mik man lod kuk mit tay sep tob liy ker lat luy
    ler mam mir lek lur fiv pon siy keb lit kog sit kub lug fek kas
    pav met tiy lap ket tor sam mur sir mat seb lem fay mod piy pek
    feg lub pem fug pud len kop mek mot miy les led pit tev pab kav
    tir kiy las kus sev fud tip mok tek lik kik kob tim sum sov sad
    pen sur teg tig sor pas tab suy lov ser mab kud lav tot tub sav
    fod sag lum kap kur tis let mad kup pev pog lad sap mes ten tey
    kem fak pep set foy kev leg teb for pov siv lip mav sog sid kun
    sis tut puv fis pip tos mis luk sub kan fum fim ton lim som kib
    moy ked tem tar tiv sin pak sud kes kut mey lok mas mon tuv fov
    tib kuy kek fid mid mib puk par fep fip pug mun sak say kat fet
    fen tud put fuk tur pes tin pim mos son tet lus lev tug mum sik
    leb pos fap lar peg los peb fut ter sot san lup pat sut pum fob
    fub tuk tes pod pok meg tas pap keg far pir muy fib kar pey lob

Example ships:

    ~gengos
    ~targom
    ~zipsus
    ~hulkan
    ~benvet-farbop
    ~niftum-zelsov
    ~duzdum-bappas
    ~meddub-namsur
    ~nirbud-durzuk-pamfer-mebgom
    ~zifsev-loktud-zuzniv-zeskev
    ~poggib-dagvos-norgoy-girnad
    ~nomfin-hibvur-pamlit-lottip
    ~lassin-nanrut-zufpor-tippor--hopmet-zotlay-koddat-zufmar
    ~fempas-nipsov-tipser-nipman--dozdis-lilpey-ditpem-bogrus
    ~bivziy-keznar-lerzen-timtes--duplod-lumsug-filtuk-laddin
    ~nospek-tillus-gevbod-zoppes--gemmos-tisluk-ferzay-dednid

Numbers 0-512:

    ~zod ~sat ~nor ~fus ~rak ~suv ~ran ~map ~nar ~kiv ~nug ~pag ~zoy ~tep ~rig ~ped
    ~vin ~mev ~nep ~sob ~riv ~pun ~dun ~min ~bor ~fur ~gom ~tad ~bur ~pin ~zar ~fav
    ~ded ~fos ~bob ~kag ~nik ~man ~rod ~kuk ~nit ~tay ~zep ~tob ~riy ~ker ~rat ~luy
    ~rer ~mam ~nir ~lek ~rur ~fiv ~bon ~siy ~geb ~lit ~gog ~sit ~gub ~lug ~vek ~kas
    ~bav ~met ~diy ~lap ~get ~tor ~zam ~mur ~zir ~mat ~zeb ~lem ~vay ~mod ~biy ~pek
    ~veg ~lub ~bem ~fug ~bud ~len ~gop ~mek ~not ~miy ~res ~led ~bit ~tev ~bab ~kav
    ~dir ~kiy ~ras ~kus ~zev ~fud ~dip ~mok ~dek ~lik ~gik ~kob ~dim ~sum ~zov ~sad
    ~ben ~sur ~deg ~tig ~zor ~pas ~dab ~suy ~rov ~ser ~nab ~kud ~rav ~tot ~dub ~sav
    ~vod ~sag ~rum ~kap ~gur ~tis ~ret ~mad ~gup ~pev ~bog ~lad ~zap ~mes ~den ~tey
    ~gem ~fak ~bep ~set ~voy ~kev ~reg ~teb ~vor ~pov ~ziv ~lip ~nav ~sog ~zid ~kun
    ~zis ~tut ~buv ~fis ~bip ~tos ~nis ~luk ~zub ~kan ~vum ~fim ~don ~lim ~zom ~kib
    ~noy ~ked ~dem ~tar ~div ~sin ~bak ~sud ~ges ~kut ~ney ~lok ~nas ~mon ~duv ~fov
    ~dib ~kuy ~gek ~fid ~nid ~mib ~buk ~par ~vep ~fip ~bug ~mun ~zak ~say ~gat ~fet
    ~ven ~tud ~but ~fuk ~dur ~pes ~din ~pim ~nos ~son ~det ~lus ~rev ~tug ~num ~sik
    ~reb ~pos ~vap ~lar ~beg ~los ~beb ~fut ~der ~sot ~zan ~lup ~bat ~sut ~bum ~fob
    ~vub ~tuk ~des ~pod ~bok ~meg ~das ~pap ~geg ~far ~bir ~muy ~vib ~kar ~bey ~lob
    ~dozzat ~tassat ~lonzat ~zufsat ~karzat ~fussat ~narzat ~pamsat ~lanzat ~fiksat
    ~gunzat ~gapsat ~hozzat ~petsat ~girzat ~depsat ~nivzat ~femsat ~penzat ~bossat
    ~firzat ~nupsat ~nudzat ~nimsat ~lobzat ~lufsat ~mogzat ~datsat ~lubzat ~nipsat
    ~lazzat ~fafsat ~dedzat ~zofsat ~bobzat ~gaksat ~kinzat ~namsat ~dorzat ~kuksat
    ~tinzat ~hatsat ~pezzat ~botsat ~hirzat ~leksat ~tarzat ~hulsat ~lerzat ~mamsat
    ~linzat ~kelsat ~lurzat ~fifsat ~nobzat ~hissat ~begzat ~tilsat ~gogzat ~tissat
    ~bugzat ~gulsat ~kevzat ~zaksat ~fabzat ~temsat ~hidzat ~palsat ~tegzat ~lotsat
    ~mazzat ~lumsat ~lizzat ~tamsat ~bezzat ~melsat ~havzat ~domsat ~hibzat ~kepsat
    ~gevzat ~bulsat ~mebzat ~gufsat ~dubzat ~nelsat ~pogzat ~kemsat ~tonzat ~himsat
    ~zerzat ~delsat ~tibzat ~fetsat ~babzat ~faksat ~lidzat ~hiksat ~zarzat ~zuksat
    ~fezzat ~dufsat ~pidzat ~komsat ~kedzat ~kilsat ~kigzat ~boksat ~midzat ~mussat
    ~fozzat ~dassat ~nebzat ~lussat ~gedzat ~gitsat ~lozzat ~zapsat ~badzat ~hussat
    ~forzat ~lessat ~banzat ~duksat ~farzat ~totsat ~budzat ~fassat ~dovzat ~gassat
    ~murzat ~paksat ~lugzat ~zitsat ~terzat ~damsat ~pugzat ~fepsat ~gobzat ~dalsat
    ~pazzat ~zemsat ~nedzat ~hetsat ~megzat ~kafsat ~pebzat ~tessat ~hovzat ~feksat
    ~gerzat ~betsat ~lovzat ~fopsat ~fizzat ~pilsat ~fanzat ~gossat ~dizzat ~nuksat
    ~zizzat ~tutsat ~fubzat ~zifsat ~pibzat ~zotsat ~zinzat ~kulsat ~buzzat ~naksat
    ~muvzat ~mifsat ~nodzat ~milsat ~mozzat ~biksat ~honzat ~deksat ~medzat ~latsat
    ~fidzat ~nissat ~kabzat ~dussat ~zegzat ~tuksat ~henzat ~kolsat ~zanzat ~nomsat
    ~fudzat ~fofsat ~bidzat ~huksat ~kegzat ~difsat ~dinzat ~bimsat ~kubzat ~lapsat
    ~pevzat ~pifsat ~gubzat ~numsat ~kazzat ~hassat ~tagzat ~tefsat ~nevzat ~dutsat
    ~tubzat ~kufsat ~ludzat ~zepsat ~nidzat ~mipsat ~zonzat ~nossat ~tedzat ~zulsat
    ~ferzat ~gutsat ~munzat ~kissat ~berzat ~zopsat ~pavzat ~lalsat ~gebzat ~zolsat
    ~bebzat ~tufsat ~ledzat ~tossat ~nazzat ~pulsat ~tabzat ~tussat ~mubzat ~bofsat
    ~buvzat ~kutsat ~zedzat ~dopsat ~kobzat ~gemsat ~zadzat ~papsat ~gegzat ~lafsat
    ~libzat ~humsat ~bivzat ~laksat ~hebzat ~bolsat ~doznor


The *second* approach is to select letters one by one, as if from a branching tree diagram. This is perhaps best illustrated in code:

    @initials = %w(p t k b d g m n f z l h)
    @vowels = %w(a e i o u)
    @evens = %w(p t k m v z r)
    @odds = %w(b d g n f s l)
    @finals = %w(p t k b d g m n v s r y)

    def word(value)
      a = @initials.sample
      b = @vowels.sample
      if value.even?
        c = @evens.sample
        d = @evens.reject {|x| x == c}.sample
      else 
        c = @odds.sample
        d = @odds.reject {|x| x == c}.sample
      end
      e = @vowels.sample
      f = @finals.sample
      "#{a}#{b}#{c}#{d}#{e}#{f}"
    end

In this instance, the #sample method picks a random element from an array. I have not yet figured out a good way of turning the value into an index to be chosen from each array.

This approach, while avoiding doubled consonants, has the disadvantage of not being able to support a blacklist (easily). If anyone knows what they're doing here, please do get in touch. 
