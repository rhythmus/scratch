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

I generated some addresses of different lengths, selecting syllables randomly (not from a lookup table):

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

Sounds kinda polynesian huh?



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

