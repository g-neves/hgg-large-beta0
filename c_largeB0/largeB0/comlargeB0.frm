*
* ../../../../startform3 comlargeB0.frm
*

*--------------defining variables-----------------------------------------------

v Q1,Q2;
s i, pi, as, vev, Cf, Ca, nc, ng, alphas, u,a,b,j,ep;
cf poly, Gamma, iGamma, deno, Gam, iGam;
s A, tau, M1, n;
cf dummy, bin;
s x1,x2,x3;
s u,u1,u2,u3;
s A,B,[A],[B];
polyratfun poly;
cf nom, deno, gnacc;

.global

off statistics;

*-----------loading results-----------------------------------------------------

load results/largeB02l1to23.res;

l tot = largeB02l1to23;
.sort

*-------------------identities--------------------------------------------------

id Q1.Q1 = 0;
id Q2.Q2 = 0;

id nc^2*ng^-1 = 1 + ng^-1;
id nc*ng^-1 = nc^-1 + ng^-1*nc^-1;
id nc^-1 = nc - 2*Cf;
id nc = Ca;
*multiply ( -i/(16*pi^2)^2 )*4^2*pi^2*alphas^2*M1/vev;
multiply -M1/vev;
*id ep=0;
id alphas/pi = as;
.sort

*-------------------------------------------------------------------------------

* Expressing bin() in terms of nom and deno

id bin(0,1,x3?) = nom(0,0,x3);
id bin(1,2,x3?) = nom(0,0,x3*(x3+1))*deno(2,0,0);
id bin(2,3,x3?) = nom(0,0,x3*(x3+1)*(x3+2))*deno(6,0,0);
id bin(3,4,x3?) = nom(0,0,x3*(x3+1)*(x3+2)*(x3+3))*deno(24,0,0);

*
* Simplifying the Gamma-functions
*

id Gam(x1?,x2?,x3?)*iGam(x1?,x2?,x3?) = 1;

* First, dealing w/ Gamma-functions without 'ep' and 'u' dependence
* to avoid zero multiplication or division;

id Gam(1,0,0) = 1;
id iGam(1,0,0) = 1;

repeat;
  id Gam(2,0,0) = 1;
  id iGam(2,0,0) = 1;
  id Gam(x1?,0,0) = nom(x1-1,0,0)*Gam(x1-1,0,0);
  id iGam(x1?,0,0) = deno(x1-1,0,0)*iGam(x1-1,0,0);
endrepeat;

.sort

* Putting all Gamma functions into form Gam(0,x2,x3)

repeat;
  id Gam(x1?pos_,x2?,x3?) = nom(x1-1,x2,x3)*Gam(x1-1,x2,x3);
  id iGam(x1?pos_,x2?,x3?) = deno(x1-1,x2,x3)*iGam(x1-1,x2,x3);
  id Gam(x1?neg_,x2?,x3?) = deno(x1,x2,x3)*Gam(x1+1,x2,x3);
  id iGam(x1?neg_,x2?,x3?) = nom(x1,x2,x3)*iGam(x1+1,x2,x3);
endrepeat;

* Now, all (i)Gam() are of the kind: (i)Gam(0,x2,x3)

id Gam(0,x2?,x3?) = deno(0,x2,x3)*Gam(1,x2,x3);
id iGam(0,x2?,x3?) = nom(0,x2,x3)*iGam(1,x2,x3);

* Collecting the rational functions

id nom(x1?,x2?,x3?) = poly(x1 + ep*x2 + x3,1);
id deno(x1?,x2?,x3?) = poly(1, x1 + ep*x2 + x3);
id ep^x1?pos_ = poly(ep^x1,1);
id ep^x1?neg_ = poly(1,ep^(-x1));
id gnacc(x1?) = poly(x1,1);

.sort

polyratfun;

id poly(x1?,x2?) = nom(x1)*deno(x2);
.sort

factarg nom,deno;

.sort

chainout nom;
chainout deno;

repeat;
  id, once Gam(x1?,x2?,x3?)*nom(x1 + ep*x2? + x3?) = Gam(x1+1,x2,x3);
  id, once Gam(x1?,x2?,x3?)*nom(-x1?,-x2?,-x3?) = -Gam(x1+1,x2,x3);
  id, once iGam(x1?,x2?,x3?)*deno(x1?,x2?,x3?) = iGam(x1+1,x2,x3);
  id, once iGam(x1?,x2?,x3?)*deno(-x1?,-x2?,-x3?) = -iGam(x1+1,x2,x3);
endrepeat;

id iGam(1,-1,0)*deno(-1 + ep) = -iGam(2,-1,0);

id nom(x1?number_) = x1;
id deno(x1?number_) = 1/x1;

*-------------------------------------------------------------------------------


argument nom;
  id ep^6 = 0;
  id ep^7 = 0;
  id ep^8 = 0;
endargument;


id [B] = 0;
id [A] = A;
id i = 1;
id as = 1;
id vev^x1? = 1;
id eM1 = 1;

id n = 4 - 2*ep;
id n^x1? = (4 - 2*ep)^x1;
multiply, replace_(n,4-2*ep);
*id ep = 0;
*multiply, replace_(ep,0);
id nom(0) = 0;
id Gam(x1?,x2?,x3?) = Gamma(x1 + x2*ep + x3);
id iGam(x1?,x2?,x3?) = 1/Gamma(x1 + x2*ep + x3);


* Further simplifications of gamma functions
id Gamma(1 + u1 + ep)*deno(u1+ep) = Gamma(u1 + ep);
id deno(1 + 2*ep + 2*u1)/Gamma(1 + 2*ep + 2*u1) = 1/Gamma(2 + 2*ep + 2*u1);
id deno(-2 + ep)/Gamma(2 - ep) = -1/Gamma(3 - ep);


b eM1,M1 i, pi, [A], [B], as, vev, Cf, Ca, mH, Gamma, iGam, gnpref, A;

format Mathematica;

print +s;
.end
