s=poly(0,'s');
ze=.384;
ta=1.88;
wn=(4/(ze*ta));
wd=wn*(sqrt(1-(ze^2)));
n=(s+17);
d=(s^2+2*s+5);
g=syslin('c',n/d);
gf=syslin('c',n/(n+d));
t=[0:0.01:5];
y1=csim('step',t,gf);

//**********************pd antes*****************************************

pd=(s+31.38);
pi=(s+.27)/s;

g_pd=syslin('c',(n*pd)/d);
g_pdf=syslin('c',(n*pd)/(d+(n*pd)));
g_pid=syslin('c',(n*pi*pd)/d);
g_pidf=syslin('c',(n*pi*pd)/(d+(n*pi*pd)));


/*y1=csim('step',t,gf);
plot(t,y1,'r-.');
plot(t,(zeros(t)+.773),'--');
xlabel('Tempo(s)');
ylabel('Resposta ao degrau');
legend(['Função G(s)']);
title("Sistema original");*/

/*evans(g);
plot((-wn*ze),wd,'gx');*/

/*evans(g_pd,100);
plot(-wn*ze,wd,'kx')
;sgrid(ze,wn,['r']);*/


y2=csim('step',t,g_pdf);
y3=csim('step',t,g_pidf);

/*plot(t,y1,'r-.');
plot(t,y2,'g--.');
plot(t,y3,'kd.');
plot(t,(zeros(t)+.773),'--r');
plot(t,ones(t),'-.r');
xlabel('Tempo(s)');
ylabel('Resposta ao degrau');
legend(['Sistema Original';'Sistema compensado PD';'Sistema compensado PID']);
title("Comparação dos sistemas original e compensado");*/



/*evans(g_pid,100);
plot((-wn*ze),wd,'kx');
sgrid(ze,wn,['r']);*/




//*****************************PI antes*********************************


a_pi=(s+.54)/s;

g_api=syslin('c',(n*a_pi)/d);
g_apif=syslin('c',(n*a_pi)/(d+(n*a_pi)));
t2=[0:.01:5];
y4=csim('step',t2,g_apif);
y5=csim('step',t2,gf);

/*plot(t2,y5,'r');
plot(t2,y4,'k');
plot(t2,(zeros(t2)+.773),'--');
plot(t2,(ones(t2)),'-.');
xlabel('Tempo(s)');
ylabel('Resposta ao degrau');
legend(['Sistema Original';'Sistema compensado PI']);
title("Comparação do sistema compensado PI antes");*/

/*evans(g_api,100);
plot((-wn*ze),wd,'ko');
sgrid(ze,wn,['r']);*/

a_pd=(s+60.77);
g_apid=syslin('c',(n*a_pi*a_pd)/d);
g_apidf=syslin('c',(n*a_pi*a_pd)/(d+(n*a_pi*a_pd)));
y6=csim('step',t2,g_apidf);

/*evans(g_apid,100);
plot((-wn*ze),wd,'ko');
sgrid(ze,wn,['r']);*/


/*plot(t2,y5,'r');
plot(t2,y4,'k');
plot(t2,y6,'k')
plot(t2,(zeros(t2)+.773),'--');
plot(t2,(ones(t2)),'-.');
xlabel('Tempo(s)');
ylabel('Resposta ao degrau');
legend(['Sistema Original';'Sistema compensado PI';'Sistema compensado PID']);
title("Comparação do sistema compensado PI antes");*/


/*subplot(2,2,1);
evans(g);
plot((-wn*ze),wd,'bo');
title("LGR original")

subplot(222);
evans(g_pid,100);
plot((-wn*ze),wd,'ro');
sgrid(ze,wn,['r']);
title("LGR PID")

subplot(223);
evans(g_apid,100);
plot((-wn*ze),wd,'ko');
sgrid(ze,wn,['r']);
title("LGR PID PI_a")*/


/*subplot(223);
plot(t2,y4,'k');
plot(t2,y6,'k');
plot(t,(zeros(t)+1),'--');
title("Sistema compensado PI antes");
subplot(221);
plot(t,y1,'r');
plot(t,(zeros(t)+.773),'--');
title("Sistema original")
subplot(222);
plot(t,y3,'b');
plot(t,(zeros(t)+1),'--');
title("Sistema compensado PD + PID");
subplot(224);
plot(t2,y4,'k');
plot(t2,y6,'k');
plot(t,y1,'r');
plot(t,y3,'b');
plot(t,(zeros(t)+1),'--');
plot(t,(zeros(t)+.773),'--');
legend(['$\frac{s²+17.54s+9.18}{s³+2s²+5s}$';'$\frac{s³+78.31s+1075.09s+557.869}{s³+2s²+5s}$'
;'$\frac{s+17}{s²+2s+5}$';'$\frac{s³+44.54s²+475.543s+125.169}{s³+2s²+5}$'],["in_lower_right"]);*/
