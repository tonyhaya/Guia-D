s=poly(0,'s');
sig=2.343;
n=(s+17);
d=(s^2+2*s+5);
g=syslin('c',n/d);
gf=g/(1+g);
t=[0:0.01:5];
y1=csim('step',t,gf);

A=[0 1;-25.7513 -2.26]
B=[0;1];
C=[17 1];
D=[0];

sys=syslin('c',A,B,C,D);
G0=ss2tf(sys);
H=(s+2.13+5.12*%i)*(s+2.13-5.12*%i);
//Compensador por zeros complexos

phi_1=(atan(5.12/(17-2.13))*(180/%pi));
the_1=180-(atan((5.1-2)/(2.13-1))*(180/%pi));
the_2=180-(atan((5.12+2)/(2.13-1))*(180/%pi));
the_3=180-(atan((5.12)/(2.13))*(180/%pi));

a=(180+the_1+the_2-phi_1+the_3);

wd=sqrt((-.213*5.12*2/(tan(a)))-5.12^2+.213^2);

PID=((s+sig+wd)*(s+sig-wd))/s;


g1=g*PID;
g1_f=(g1/(1+g1));
y4=csim('step',t,g1_f);

/*evans(g1,100);
plot(-2.13,5.12,'or');
plot(-2.13,-5.12,'or');
sgrid(.384,5.54,['k']);*/
//Compensador por Espaços de Estados

A_1=[0 1 0;-98.1713 -19.26 522.7721;-17 -1 0];
A_2=[0 1 0;-451.7513 -102.26 3075.13;-17 -1 0];
B=[0;0;1];
C=[17 1 0];


sys_1=syslin('c',A_1,B,C,D);
sys_2=syslin('c',A_2,B,C,D)

G1=ss2tf(sys_1);
G2=ss2tf(sys_2);
y2=csim('step',t,G0)
n_1= 8887.1257 +522.7721*s;
d_1=8887.1257 +620.9434*s +19.26*s^2 +s^3;
g_1=syslin('c',n_1/d_1);
y2=csim('step',t,G1);

n_2=52277.21+3075.13*s;
d_2=52277.21 +3526.8813*s +102.26*s^2 +s^3;
g_2=syslin('c',n_2/d_2);

y3=csim('step',t,G2);

/*
plot(t,y1,'r--');
plot(t,y2,'^k-');
plot(t,y3,'gd-');
plot(t,y4,'b-.');
xlabel('Tempo(s)');
ylabel('Resposta ao degrau');
legend(['Sistema Original';'Sistema compensado Espaços de Estados';'Sistema compensado s+100';'Sistema compensado zeros']);
title("Comparações dos sistemas compensado");*/


/*subplot(221);
plot(t,y1,'r--');
xlabel('Tempo(s)');
ylabel('Resposta ao degrau');
legend(['Sistema Original';]);


subplot(222);
plot(t,y2,'k^-');
xlabel('Tempo(s)');
ylabel('Resposta ao degrau');
legend(['Sistema compensado Espaços de estados';]);


subplot(223);
plot(t,y3,'g>-');
xlabel('Tempo(s)');
ylabel('Resposta ao degrau');
legend(['Sistema compensado S+100';]);

subplot(224);
plot(t,y4,'b.-');
xlabel('Tempo(s)');
ylabel('Resposta ao degrau');
legend(['Sistema compensado Zeros';]);*/
