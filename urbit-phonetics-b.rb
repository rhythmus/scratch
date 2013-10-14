@blacklist = %w(nig dik fuk fok fag kak pis god vag vom)

@block1 = %w(pa pe pi po pu ta te ti to tu ka ke ki ko ku ba be bi bo bu da de di do du ga ge gi go gu ma me mi mo mu na ne ni no nu fa fe fi fo fu za ze zi zo zu la le li lo lu ha he hi ho hu)

@block2 = %w(tp kp mp fp sp lp db gb nb vb zb rb pt kt mt ft st lt bd gd nd vd zd rd pk tk mk fk sk lk bg dg ng vg zg rg pm tm km fm sm lm bn dn gn vn zn rn pf tf kf mf sf lf bv dv gv nv zv rv ps ts ks ms fs ls bz dz gz nz vz rz pl tl kl ml fl sl br dr gr nr vr zr)

@block3 = %w(ap ep ip op up at et it ot ut ak ek ik ok uk ab eb ib ob ub ad ed id od ud ag eg ig og ug am em im om um an en in on un av ev iv ov uv as es is os us ar er ir or ur ay ey iy oy uy)

def random_word
  "#{@block1.sample}#{@block2.sample}#{@block3.sample}"
end

srand

cruiser = "~#{random_word}"
destroyer = "~#{random_word}-#{random_word}"
yacht = "~#{random_word}-#{random_word}-#{random_word}-#{random_word}"
submarine = "~#{random_word}-#{random_word}-#{random_word}-#{random_word}--#{random_word}-#{random_word}-#{random_word}-#{random_word}"

puts cruiser
puts destroyer
puts yacht
puts submarine
