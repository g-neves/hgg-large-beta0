*
* ../../../../startform3 comhgamgamlo.frm
*

*-------defining variables-------------------------
v Q1,Q2;
s mH, M1;
s i, pi, alphas, vev;
cf gnacc;
s x1, n, ng;
s [a],[b], [al/pi], aem, nh;


.global

*-----------loading results---------------------
load results/hgamgamlo1l1to2.res;

l res1l = hgamgamlo1l1to2;
.sort


*---------identities--------------------------------
id Q1.Q1 = 0;
id Q2.Q2 = 0;
id nc^2/ng = 1 + 1/ng;
id Q1.Q2 = -mH^2/2;
multiply, ( -i/(16*pi^2) )*4*pi*aem*M1*nh/vev;
id aem = [al/pi]*pi;
id [A] = [a];
id [B] = [b];
*id ep=0;
.sort
b eM1,M1,[al/pi], nh, i, pi, vev,[a],[b],nc;
print +s;
.end
