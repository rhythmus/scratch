## Proposal B:

I shall stick to my [established letter sets](https://github.com/dclelland/scratch/blob/master/urbit-phonetics-a.md), but work with a CVCCVC structure (which I shall split into three two-character blocks and address as blocks A, B, and C from now on).

Blocks A and C are the simplest, comprising just a consonant and a vowel each.

I selected my consonants starting with the six basic stops (p t k b d g), followed by two nasals (m and n).
Then four fricatives and two liquids (f/v, s/z, l/r), in pairs between sets in order to avoid ambiguity.
And finally h and y. H tends to disappear at the end of words so I keep h in the first set and balance it out with y in the final set.

    Block A consonants      p t k b d g m n f z l h
    Block C consonants      p t k b d g m n v s r y
    Vowels                  a e i o u

Block B, comprising two consonants, is trickier. I mapped out all two-consonant combinations, then eliminated double-ups and pairs where a voiced consonant was matched with an unvoiced consonant, as well as pairs which might be ambiguous (see how we only have lf and rv, but not lv and rf).

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

Good to go! Let's generate some fake ship names to test (of course, we can't do carriers yet): ([code](https://github.com/dclelland/scratch/blob/master/urbit-phonetics-b.rb))

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

Sounds good to me. Now, just to find a solid mathematical mapping...



We wind up with four grids of consonants:

Perhaps the matched vowel/nonvowel consonants can serve as a kind of checksum, or as a clue as to whether the number is odd or even?

## Relevant links:

Urbit phonetic base discussion thread:

https://groups.google.com/forum/#!msg/urbit-dev/zW3rgpX_AxQ/a0gLMIc4VRoJ

Mnemnion's proposal:

https://github.com/mnemnion/porch/blob/master/phonemes.md

IPA soundboard:

http://web.uvic.ca/ling/resources/ipa/charts/IPAlab/IPAlab.htm

