@initials = %w(p t k b d g m n f z l h)
@vowels = %w(a e i o u)
@evens = %w(b d g n v z r)
@odds = %w(p t k m f s l)
@finals = %w(p t k b d g m n v s r y)

@alphabet = %w(a b c d e f g h i j k l m n o p q r s t u v w x y z)

# Rules of combination
# Pick any starting letter
# Pick any letter that goes with that letter
# If you have two vowels, or two consonants in a row, you must pick a vowel or a consonant
# W and Y are considered vowels
# In fact, could probably have the general structure (c)(v)(c)(v)(c)/(v)(c)(v)(c)(v) or whatever where each c or v is one or two of its type
# Odd numbers go VCV
# Even numbers go CVC


  
a = %w(i w y p b t d k g m n f v s a l r c x)
e = %w(a i w y p b t d k g m n f v s z l r c q x)
i = %w(a e o p b t d k g m n f v s z l r c x)
o = %w(u w y p b t d k g m n f v s z l r c x)
u = %w(p b t d k g m n f v s z l r c x)
w = %w(a e i y n s r h)
y = %w(a e i o w m n s)
p = %w(a e i o u y t k m s l r h)
b = %w(a e i o u y d g m s l r c h)
t = %w(a e i o u w y p k m s l r c h)
d = %w(a e i o u y b g m s l r c h)
k = %w(a e i o u y p t n s l r c h)
g = %w(a e i o u y b d n s l r c h)
m = %w(a e i o u y p b f s l r)
n = %w(a e i o u y t d k g f v s z l r c)
f = %w(a e i o u y m n l r)
v = %w(a e i o u y)
s = %w(a e i o u w y p t k m n l r c h)
z = %w(a e i o u)
l = %w(a e i o u y p b t d k g m n f v s r c)
r = %w(a e i o u y p b t d k g m n f v s l c)
c = %w(a e i o u y t k s l r h)
h = %w(a e i o u y)
j = %w(a e i o u)
q = %w(u)
x = %w(a e i o u y p t c)






#     a  e  i  o  u   w  y   p  b  t  d  k  g   m  n   f  v  s  z   l  r   c  h  j  q  x
#  a     ea ia        wa ya  pa ba ta da ka ga  ma na  fa va sa za  la ra  ca ha ja    xa
#  e        ie        we ye  pe be te de ke ge  me ne  fe ve se ze  le re  ce he je    xe
#  i  ai ei io        wi yi  pi bi ti di ki gi  mi ni  fi vi si zi  li ri  ci hi ji    xi
#  o                     yo  po bo to do ko go  mo no  fo vo so zo  lo ro  co ho jo    xo
#  u           ou            pu bu tu du ku gu  mu nu  fu vu su zu  lu ru  cu hu ju qu xu
#                                                                                         
#  w  aw ew    ow        yw        tw                        sw                          
#  y  ay ey    oy     wy     py by ty dy ky gy  my ny  fy vy sy zy  ly ry  cy hy       xy
#                                                                                         
#  p  ap ep ip op up               tp    kp     mp           sp     lp rp              xp
#  b  ab eb ib ob ub                  db    gb  mb                  lb rb                
#  t  at et it ot ut         pt          kt        nt        st     lt rt  ct          xt
#  d  ad ed id od ud            bd          gd     nd               ld rd                
#  k  ak ek ik ok uk         pk    tk              nk        sk     lk rk  ck            
#  g  ag eg ig og ug            bg    dg           ng               lg rg                
#                                                                                         
#  m  am em im om um     ym  pm bm tm dm               fm    sm     lm rm                
#  n  an en in on un  wn yn              kn gn         fn    sn     ln rn                
#                                                                                         
#  f  af ef if of uf                            mf nf               lf rf                
#  v  av ev iv ov uv                               nv               lv rv                
#  s  as es is os us  ws ys  ps bs ts ds ks gs  ms ns               ls rs  cs            
#  z  az ez iz oz uz                               nz                                    
#                                                                                         
#  l  al el il ol ul         pl bl tl dl kl gl  ml nl  fl    sl        rl  cl            
#  r  ar er ir or ur  wr     pr br tr dr kr gr  mr nr  fr    sr     lr     cr            
#                                                                                         
#  c  ac ec ic oc uc            bc tc dc kc gc     nc        sc     lc rc              xc
#  h                  wh     ph bh th dh kh gh               sh            ch            
#  j                                                                                     
#  q     eq                                                                              
#  x  ax ex ix ox ux                                                                     



#     a  e  i  o  u   w  y   p  b  t  d  k  g   m  n   f  v  s  z   l  r   c  h  j  q  x
# a        ai    au  aw ay  ap ab at ad ak ag  am an  af av as az  al ar  ac ah aj aq ax
# e  ea ee ei eo     ew ey  ep eb et ed ek eg  em en  ef ev es ez  el er  ec eh ej eq ex
# i  ia ie io        iw iy  ip ib it id ik ig  im in  if iv is iz  il ir  ic ih ij iq ix
# o  oa oe oi oo ou  ow oy  op ob ot od ok og  om on  of ov os oz  ol or  oc oh oj oq ox
# u  ua    ui    ue  uw uy  up ub ut ud uk ug  um un  uf uv us uz  ul ur  uc uh uj uq ux
# w  wa we wi wo wu         wp wb wt wd wk wg  wm wn  wf wv ws wz  wl wr  wc wh wj wq wx
# y  ya ye yi yo yu         yp yb yt yd yk yg  ym yn  yf yv ys yz  yl yr  yc yh yj yq yx
# p  pa pe pi po pu  pw py     pb pt pd pk pg  pm pn  pf pv ps pz  pl pr  pc ph pj pq px
# b  ba be bi bo bu  bw by  bp    bt bd bk bg  bm bn  bf bv bs bz  bl br  bc bh bj bq bx
# t  ta te ti to tu  tw ty  tp tb    td tk tg  tm tn  tf tv ts tz  tl tr  tc th tj tq tx
# d  da de di do du  dw dy  dp db dt    dk dg  dm dn  df dv ds dz  dl dr  dc dh dj dq dx
# k  ka ke ki ko ku  kw ky  kp kb kt kd    kg  km kn  kf kv ks kz  kl kr  kc kh kj kq kx
# g  ga ge gi go gu  gw gy  gp gb gt gd gk     gm gn  gf gv gs gz  gl gr  gc gh gj gq gx
# m  ma me mi mo mu  mw my  mp mb mt md mk mg     mn  mf mv ms mz  ml mr  mc mh mj mq mx
# n  na ne ni no nu  nw ny  np nb nt nd nk ng  nm     nf nv ns nz  nl nr  nc nh nj nq nx
# f  fa fe fi fo fu  fw fy  fp fb ft fd fk fg  fm fn     fv fs fz  fl fr  fc fh fj fq fx
# v  va ve vi vo vu  vw vy  vp vb vt vd vk vg  vm vn  vf    vs vz  vl vr  vc vh vj vq vx
# s  sa se si so su  sw sy  sp sb st sd sk sg  sm sn  sf sv    sz  sl sr  sc sh sj sq sx
# z  za ze zi zo zu  zw zy  zp zb zt zd zk zg  zm zn  zf zv zs zy  zl zr  zc zh zj zq zx
# l  la le li lo lu  lw ly  lp lb lt ld lk lg  lm ln  lf lv ls lz     lr  lc lh lj lq lx
# r  ra re ri ro ru  rw ry  rp rb rt rd rk rg  rm rn  rf rv rs rz  rl     rc rh rj rq rx
# c  ca ce ci co cu  cw cy  cp cb ct cd ck cg  cm cn  cf cv cs cz  cl cr     ch cj cq cx
# h  ha he hi ho hu  hw hy  hp hb ht hd hk hg  hm hn  hf hv hs hz  hl hr  hc    hj hq hx
# j  ja je ji jo ju  jw jy  jp jb jt jd jk jg  jm jn  jf jv js jz  jl jr  jc jh    jq jx
# q  qa qe qi qo qu  qw qy  qp qb qt qd qk qg  qm qn  qf qv qs qz  ql qr  qc qh qj    qx
# x  xa xe xi xo xu  xw xy  xp xb xt xd xk xg  xm xn  xf xv xs xz  xl xr  xc xh xj xq   
