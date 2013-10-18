@initials = %w(p t k b d g m n f z l h)
@vowels = %w(a e i o u)
@evens = %w(b d g n v z r)
@odds = %w(p t k m f s l)
@finals = %w(p t k b d g m n v s r y)

@alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

#     a  e  i  o  u   w  y   p  b  t  d  k  g   m  n   f  v  s  z   l  r   c  h  j  q  x
# a     ae ai ao au  aw ay  ap ab at ad ak ag  am an  af av as az  al ar  ac ah aj aq ax
# e  ea    ei eo eu  ew ey  ep eb et ed ek eg  em en  ef ev es ez  el er  ec eh ej eq ex
# i  ia ie    io iu  iw iy  ip ib it id ik ig  im in  if iv is iz  il ir  ic ih ij iq ix
# o  oa oe oi    ou  ow oy  op ob ot od ok og  om on  of ov os oz  ol or  oc oh oj oq ox
# u  ua ue ui uo     uw uy  up ub ut ud uk ug  um un  uf uv us uz  ul ur  uc uh uj uq ux
#                                                                                       
# w  wa we wi wo wu     wy  wp wb wt wd wk wg  wm wn  wf wv ws wz  wl wr  wc wh wj wq wx
# y  ya ye yi yo yu  yw     yp yb yt yd yk yg  ym yn  yf yv ys yz  yl yr  yc yh yj yq yx
#                                                                                       
# p  pa pe pi po pu  pw py     pb pt pd pk pg  pm pn  pf pv ps pz  pl pr  pc ph pj pq px
# b  ba be bi bo bu  bw by  bp    bt bd bk bg  bm bn  bf bv bs bz  bl br  bc bh bj bq bx
# t  ta te ti to tu  tw ty  tp tb    td tk tg  tm tn  tf tv ts tz  tl tr  tc th tj tq tx
# d  da de di do du  dw dy  dp db dt    dk dg  dm dn  df dv ds dz  dl dr  dc dh dj dq dx
# k  ka ke ki ko ku  kw ky  kp kb kt kd    kg  km kn  kf kv ks kz  kl kr  kc kh kj kq kx
# g  ga ge gi go gu  gw gy  gp gb gt gd gk     gm gn  gf gv gs gz  gl gr  gc gh gj gq gx
#                                                                                       
# m  ma me mi mo mu  mw my  mp mb mt md mk mg     mn  mf mv ms mz  ml mr  mc mh mj mq mx
# n  na ne ni no nu  nw ny  np nb nt nd nk ng  nm     nf nv ns nz  nl nr  nc nh nj nq nx
#                                                                                       
# f  fa fe fi fo fu  fw fy  fp fb ft fd fk fg  fm fn     fv fs fz  fl fr  fc fh fj fq fx
# v  va ve vi vo vu  vw vy  vp vb vt vd vk vg  vm vn  vf    vs vz  vl vr  vc vh vj vq vx
# s  sa se si so su  sw sy  sp sb st sd sk sg  sm sn  sf sv    sz  sl sr  sc sh sj sq sx
# z  za ze zi zo zu  zw zy  zp zb zt zd zk zg  zm zn  zf zv zs zy  zl zr  zc zh zj zq zx

# l  la le li lo lu  lw ly  lp lb lt ld lk lg  lm ln  lf lv ls lz     lr  lc lh lj lq lx
# r  ra re ri ro ru  rw ry  rp rb rt rd rk rg  rm rn  rf rv rs rz  rl     rc rh rj rq rx
#                                                                                       
# c  ca ce ci co cu  cw cy  cp cb ct cd ck cg  cm cn  cf cv cs cz  cl cr     ch cj cq cx
# h  ha he hi ho hu  hw hy  hp hb ht hd hk hg  hm hn  hf hv hs hz  hl hr  hc    hj hq hx
# j  ja je ji jo ju  jw jy  jp jb jt jd jk jg  jm jn  jf jv js jz  jl jr  jc jh    jq jx
# q  qa qe qi qo qu  qw qy  qp qb qt qd qk qg  qm qn  qf qv qs qz  ql qr  qc qh qj    qx
# x  xa xe xi xo xu  xw xy  xp xb xt xd xk xg  xm xn  xf xv xs xz  xl xr  xc xh xj xq   
