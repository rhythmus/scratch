@initials = %w(p t k b d g m n f z l h)
@vowels = %w(a e i o u)
@evens = %w(b d g n v z r)
@odds = %w(p t k m f s l)
@finals = %w(p t k b d g m n v s r y)

@alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

puts @alphabet.permutation(2).to_a.to_s

#    a  b  c  d  e  f  g  h  i  j  k  l  m  n  o  p  q  r  s  t  u  v  w  x  y  z
# a     ab ac ad ae af ag ah ai aj ak al am an ao ap aq ar as at au av aw ax ay az
# b  ba    bc bd be bf bg bh bi bj bk bl bm bn bo bp bq br bs bt bu bv bw bx by bz
# c  ca cb    cd ce cf cg ch ci cj ck cl cm cn co cp cq cr cs ct cu cv cw cx cy cz
# d  da db dc    de df dg dh di dj dk dl dm dn do dp dq dr ds dt du dv dw dx dy dz
# e  ea eb ec ed    ef eg eh ei ej ek el em en eo ep eq er es et eu ev ew ex ey ez
# f  fa fb fc fd fe    fg fh fi fj fk fl fm fn fo fp fq fr fs ft fu fv fw fx fy fz
# g  ga gb gc gd ge gf    gh gi gj gk gl gm gn go gp gq gr gs gt gu gv gw gx gy gz
# h  ha hb hc hd he hf hg    hi hj hk hl hm hn ho hp hq hr hs ht hu hv hw hx hy hz
# i  ia ib ic id ie if ig ih    ij ik il im in io ip iq ir is it iu iv iw ix iy iz
# j  ja jb jc jd je jf jg jh ji    jk jl jm jn jo jp jq jr js jt ju jv jw jx jy jz
# k  ka kb kc kd ke kf kg kh ki kj    kl km kn ko kp kq kr ks kt ku kv kw kx ky kz
# l  la lb lc ld le lf lg lh li lj lk    lm ln lo lp lq lr ls lt lu lv lw lx ly lz
# m  ma mb mc md me mf mg mh mi mj mk ml    mn mo mp mq mr ms mt mu mv mw mx my mz
# n  na nb nc nd ne nf ng nh ni nj nk nl nm    no np nq nr ns nt nu nv nw nx ny nz
# o  oa ob oc od oe of og oh oi oj ok ol om on    op oq or os ot ou ov ow ox oy oz
# p  pa pb pc pd pe pf pg ph pi pj pk pl pm pn po    pq pr ps pt pu pv pw px py pz
# q  qa qb qc qd qe qf qg qh qi qj qk ql qm qn qo qp    qr qs qt qu qv qw qx qy qz
# r  ra rb rc rd re rf rg rh ri rj rk rl rm rn ro rp rq    rs rt ru rv rw rx ry rz
# s  sa sb sc sd se sf sg sh si sj sk sl sm sn so sp sq sr    st su sv sw sx sy sz
# t  ta tb tc td te tf tg th ti tj tk tl tm tn to tp tq tr ts    tu tv tw tx ty tz
# u  ua ub uc ud ue uf ug uh ui uj uk ul um un uo up uq ur us ut    uv uw ux uy uz
# v  va vb vc vd ve vf vg vh vi vj vk vl vm vn vo vp vq vr vs vt vu    vw vx vy vz
# w  wa wb wc wd we wf wg wh wi wj wk wl wm wn wo wp wq wr ws wt wu wv    wx wy wz
# x  xa xb xc xd xe xf xg xh xi xj xk xl xm xn xo xp xq xr xs xt xu xv xw    xy xz
# y  ya yb yc yd ye yf yg yh yi yj yk yl ym yn yo yp yq yr ys yt yu yv yw yx    yz
# z  za zb zc zd ze zf zg zh zi zj zk zl zm zn zo zp zq zr zs zt zu zv zw zx    zy
