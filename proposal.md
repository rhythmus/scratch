### Research:

I've looked into what letters correspond to what phonemes by language (or the romanisation of that language). I looked at the ten languages with the highest number of internet users, plus Hindi, because I felt like it:

https://docs.google.com/spreadsheet/ccc?key=0AoF7JCDAQNZCdDZrNmJid0owRnRGUDRCR3NreXZ1cHc&usp=sharing

From this I believe we can select a set of letters and letter pairs which are reasonably unambiguous in their pronunciation across a wide range of languages:

    unvoiced stops   p, t, k
    voiced stops     b, d, g
    nasals           m, n
    fricatives       f/v, s/z, h
    liquids          l/r, y
    vowels           a, e, i, o, u

### Proposal A:

Basic CVCVCV system (sounds better, avoids horrible dual-consonant clashes, slots into place easily)

~zod -> ~dozodo (follow this pattern)

### Proposal B:

Hand-tunes CVCCVC. Need to do directional graph of good consonant combinations. Retain ~zod. Perhaps look at inverting secondary numbers? ~dozzod etc.

### Proposal C:

Complex tuned 1 syllable per 16-bit number system. Work in progress/stillborn.


### Relevant links:

Urbit phonetic base discussion thread
https://groups.google.com/forum/#!msg/urbit-dev/zW3rgpX_AxQ/a0gLMIc4VRoJ

Mnemnion's proposal
https://github.com/mnemnion/porch/blob/master/phonemes.md

IPA soundboard
http://web.uvic.ca/ling/resources/ipa/charts/IPAlab/IPAlab.htm

