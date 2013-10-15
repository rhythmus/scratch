## Proposal B

I shall stick to my [established letter sets](https://github.com/dclelland/scratch/blob/master/urbit-phonetics-a.md), but work with a CVCCVC structure (which I shall split into three two-character blocks and address as blocks A, B, and C from now on).

Blocks A and C are the simplest, comprising just a consonant and a vowel each.

I selected my consonants starting with the six basic stops (p t k b d g), followed by two nasals (m and n).
Then four fricatives and two liquids (f/v, s/z, l/r), in pairs between sets in order to avoid ambiguity.
And finally h and y. H tends to disappear at the end of words so I keep h in the first set and balance it out with y in the final set.

    Block A consonants      p t k b d g m n f z l h
    Block C consonants      p t k b d g m n v s r y
    Vowels                  a e i o u

Block B, comprising two consonants, is trickier. I mapped out all two-consonant combinations, then eliminated double-ups and pairs where a voiced consonant was matched with an unvoiced consonant (I have generalised n and r as voiced and m and l as voiced so that our system works). This is so that even if the user pronounces, say, /sm/ as /zm/ (as is pretty common in European languages, especially English), we still know it should be /sm/.

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

Sounds good to me.

### Mathematics

So far I've explored two ways of generating the words from numbers.

In order to avoid selecting bad consonant combinations, both require us to first define two sets of consonants, odd and even:

    Evens   b d g n v z r
    Odds    p t k m f s l

The *first* approach involves generating a lookup table with three sets of 256 syllables:

- Dextra: Coda selected alternately from Odd and Even sets
- Sinistra Even: Onset selected from the Odd set
- Sinistra Odd: Onset selected from the Even set

Sinistra Even and Sinistra Odd should be synchronised, e.g: "zan", "ran", "pen", "ten"

We can then select any syllable from Dextra for our first syllable, and any from Sinistra based on whether the number is even or odd. In true urbit fashion, true (zero) is voiced (this allows for ~zod, as well).

This can almost be seen as a kind of really basic checksum - the inner consonant cluster should always match up and be unambiguously pronounceable.

However, while this approach successfully avoids bad consonant clusters, it does not guarantee avoiding doubled consonants. I'm not 100% sure this is still an issue but I believe it helps break up the look of a ships's name visually, while /rr/ and /ll/ might be ambiguous, too.

This approach however does however allow us blacklist offensive syllables. I've been using `%w(nig dik fuk fok fag kak pis god vag vom)` for mine.

([Here's the code.](https://github.com/dclelland/scratch/blob/master/urbit-phonetics-b.rb)) And some more sample ships.

Syllable tables:







Example ships:

    ~leskoy
    ~zopmem-hemtov
    ~parzum-zodbin-litfor-monruy
    ~pumlun-leskov-notsur-zevgip--pokkug-bavnur-tatlad-niplad

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

This approach, while avoiding doubled consonants, has the disadvantage of not being able to support a blacklist.


