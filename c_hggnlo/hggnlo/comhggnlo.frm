*
* ../../../../startform3 comhggnlo.frm
*

*--------------defining variables-----------------------------------------------

v Q1,Q2;
s i, pi, as, vev, Cf, Ca, nc, ng, alphas, ep;
s A, M1;

.global

*-----------loading results-----------------------------------------------------

load results/hggnlo2l1to23.res;

l res2l = hggnlo2l1to23;
.sort

*-------------------identities--------------------------------------------------

id Q1.Q1 = 0;
id Q2.Q2 = 0;

id nc^2*ng^-1 = 1 + ng^-1;
id nc*ng^-1 = nc^-1 + ng^-1*nc^-1;
id nc^-1 = nc - 2*Cf;
id nc = Ca;
multiply ( -i/(16*pi^2)^2 )*(4*pi)^2*alphas^2*M1/vev;
id ep=0;
id alphas/pi = as;
.sort

b eM1,M1 i, pi, [A], [B], as, vev;

print +s;
.end
