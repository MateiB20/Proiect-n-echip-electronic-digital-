FACULTATEA DE AUTOMATICĂ ȘI CALCULATOARE
Temă:  COUNTER – REGISTRU PARALEL
Coordonator: Asist. Drd. Marius Obreja


I. Specificații proiect: 
COUNTER – REGISTRU
Să se implementeze în FPGA prin descriere în limbaj VHDL un sistem având următoarele specificatii:
	 sistem secvenţial de 8 biţi 
	 reset prioritar activ pe 1
	două intrări de selecţie din care să se stabilească funcţionare de registru paralel sau numărător binar direct/invers.

Implementarea proiectului va fi făcută printr-o descriere comportamentală










                                                                                                      





Fişierul bitstream rezultat în urma procesului de implementare va fi verificat utilizând placa de dezvoltare BASYS3.
II. Functionalitatea sistemului:
Sistemul COUNTER-REGISTRU are urmatoarele functionalități:
	Sursa de clock este reprezentată de un buton extern
	Acesta funcționeză pe frontul pozitiv al clock-ului
	Contine un numărător pe 8 biți
	Conține un registru pe 8 biți
	Începe numărătoarea de la un anumit număr intodus prin 8 switch-uri 
	Conține reset prioritar activ pe 1 
	Conține reset pentru numărător
	Se poate selecta functionalitatea dintre numărător și registru paralel 
	Se poate selecta direcția numărătorului direct/invers 
	Ieșirea este conectată la 8 led-uri










III. Descrierea a sistemului de dezvoltare BASYS 3 și al mediului de lucru Vivado : 
Basys 3 este o placă FPGA entry-level proiectată de Digilent, având arhitectura Xilinx Artix 7-FPGA. Basys 3 include caracteristicile standard găsite pe toate plăcile Basys: o colecție mare de dispozitive I/O la bord, switch-uri, led-uri, procesoare și controlere încorporate, toate circuitele de suport FPGA necesare pentru a oferi studenților o mai bună reprezentare a ingineriei la nivel profesional.
Vivado este o aplicație software pentru sinteza și analiza modelelor de limbaj folosite pentru descriere hardware (în cazul nostru VHDL), înlocuind Xilinx ISE cu caracteristici suplimentare pentru dezvoltarea sistemului pe un cip și sinteza la nivel înalt. Vivado reprezintă o rescriere și o regândire de la bază a întregului flux de proiectare.


 
IV. Metoda de implementare a sistemului:
Pentru implementarea sistemului s-au folosit programul de sinteza Vivado si limbajul VHDL.
	U18(clk) este butonul de modificare clock-ul 
	switch-urile de la V17 până la W13(D_IN) sunt intratea pentru registrul paralel 
	V2(reset_pr) este resetul prioritar activ pe 1 
	T3(x) selectează funcționalitatea de numărător 
	T2(y) selectează funcționalitatea de registru paralel
	 R3(reset_in) este reset-ul numărătorului
	W2 (ud_in) direcția numărătorului (direct/invers)
	U1(load) reprezintă load-ul registrului paralel
	led-urile de la U16 la V14(D_OUT) sunt ieșirea

Programul începe cu o structura conditionala pentru resetul prioritar în care se tratează următoarea situație: 
	activ - ieșirile negative indeferent de celelalte intrări
	nu e activ – funcționalitatea devine numărător sau registru paralel
Numărătorul: are reset_in asemanator cu cel prioritar (dacă este activ iesirea devine zero) si un ud_in cu care se alege dacă se numără direct sau invers. Totul realizându-se luând în considerare clock-ul care trebuie să fie activ.
Registrul paralel: ieșirea preia intrarea cu condiția ca clock-ul să fie pe frontul pozitiv si ca intrarea load să fie activă. 
 Atributele folosite din placa de bază:
 
Hartă:		Functionalitate
U18		CLOCK
V17-W13		INTRARE
V2		RESET PRIORITAR
T3		FUNCȚIONARE NUMĂRĂTOR
T2		FUNCȚIONARE REGISTRU PARALEL
R3		RESET  NUMĂRĂTOR
W2		DIRECȚIE  NUMĂRĂTOR
U1		LOAD
U16-V14		IEȘIRE

  
V. Editarea fişierului VHDL:
Entitatea COUNTER_REGISTRU:
 
Cuprinde descrierea entităților folosite si descrierea modului in care urmează a fi folosite.










 







 
 
VI. Descrierea paşilor de sinteză şi testarea circuitului rezultat
	S-a creeat un proiect nou in programul Vivado
	S-a implementat sistemul printr-o descriere comportamentală
	S-a editat fișierul de constrângeri în vederea realizării legăturilor între switch-uri led-uri si butoane
	S-a realizat analiza RTL(Register Transfer Level)
	S-a sintetizat modulul
	S-a lansat implementarea proiectului care a avut ca efect final generarea fișierului bitstream
	S-a programat placa de dezvoltare BASYS 3 cu fișierul bitstream si s-a testat funcționarea corespunzătoare a modulului implementat
















 
 
În concluzie, s-a implementat în FPGA prin descriere în limbaj VHDL, un sistem secvenţial de 8 biţi: cu reset prioritar activ pe 1; cu două intrări de selecţie din care să se stabilească funcţionare de registru paralel sau numărător binar direct/invers. 

Bibliografie:
1. VHDL Reference Manual, http://www.ics.uci.edu/~jmoorkan/vhdlref/Synario%20VHDL%20Manual.pdf
2. BASYS 3 Reference Manual, https://reference.digilentinc.com/reference/programmable-logic/basys-3/reference-manual
3.https://www.nhn.ou.edu/~bumm/ELAB/Labs/Basys3_FGPA_pin_outs.pdf
4.https://digilent.com/reference/_media/basys3:basys3_rm.pdf


