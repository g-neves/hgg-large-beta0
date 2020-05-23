*
* ../../../../startform3 comhgglo.frm
*

*-------defining variables-------------------------
v Q1,Q2;
s mH, M1;
s i, pi, alphas, vev;
cf gnacc;
s x1, n;


.global

*-----------loading results---------------------
load results/hgglo1l1to2.res;

l res1l = hgglo1l1to2;
.sort


*---------identities--------------------------------
id Q1.Q1 = 0;
id Q2.Q2 = 0;
id nc^2/ng = 1 + 1/ng;
id Q1.Q2 = -mH^2/2;
*id gnacc(x1?) = x1;
*id n = 4 - 2*ep;
*id Tf = 1/2;
multiply, ( -i/(16*pi^2) )*4*pi*alphas*M1/vev;
id ep=0;
.sort
b eM1,M1,alphas, i, pi, vev;
print +s;
.end
