/*** DDWSnippets config ***/

DDWSnippets.autoEnable = nil;
DDWSnippets.verbose = true;

DDWSnippets.hotkeyCode = 96;
DDWSnippets.hotkeyMods = 262144;


DDWSnippets.put("bass glitch - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\bass_glitch, {
	var x=AllpassC.ar(
		SinOsc.ar(55).tanh,
		0.4,
		TExpRand.ar(
			2e-4,
			0.4,
			Impulse.ar(8)
		).round([2e-3,4e-3]),
		2);
	x
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("untuned note ascending - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\untuned_note_ascending, {
    var x;
	var a=LocalIn.ar;
	LocalOut.ar(
		Mix.ar(
			x=SinOsc.ar(
				(Decay.ar(
					Impulse.ar([4,4.005]),
					1e3*a.abs)*50),
				a).distort));
	x;
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("repeated tone glitch 1 - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\repeated_tone_glitch1, {
	var f=LocalIn.ar(2).tanh;
	var k=Latch.kr(
		f[0].abs,
		Impulse.kr(0.5));
	LocalOut.ar(
		f+AllpassN.ar(
			Pulse.ar(
				[2,3],
				k*0.01+1e-6,
				0.9),
			1,k*0.3,100*k))
	;f
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("repeated tone glitch 2 - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\repeated_tone_glitch2, {
	var f=LocalIn.ar(2).tanh;
	var k=Latch.kr(
		f[0].abs,
		Impulse.kr(1/4));
	LocalOut.ar(
		f+CombC.ar(
			Blip.ar(
				[4,6],
				100*k+50,
				0.9),
			1,k*0.3,50*f));
	f
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("raining - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\raining, {
	Mix({
		a=LFNoise1.ar(0.2.rand);
		DelayC.ar(
			BPF.ar(
				WhiteNoise.ar(Dust2.ar(a*a*4**2).lag(8e-3)),
				10e3.rand+300,
				0.09),
			3,
			a*1.5+1.5,
			45
	)}!80).dup
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("frog quacking - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\frog_quacking, {
	var a=BPF.ar(
		Saw.ar([40,40.001]),
		LFNoise0.kr(128)+1*4e3+146,
		LFNoise1.kr(1)+1*5e-2+0.01).tanh;
	CombC.ar(
		a,9,
		a.abs.lag(2)*9,
		a.abs.lag(1)*100)
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("atonal rhythmic accompaniment - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\atonal_rhythmic_accompaniment, {
    var x;
	LocalOut.ar(
		x=DelayC.ar(
			LPF.ar(
				LFNoise0.ar(8)**2+
				LocalIn.ar(2).tanh.round(0.05),
				6e3),
			1,
			LFNoise0.ar(8!2).range(1e-4,0.02)));
	x.tanh
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("tone motif - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\tone_motif, {
	var p=Impulse.ar(8)*LFNoise1.ar(2);
	CombL.ar(
		Saw.ar(
			[3,4],
			Decay.ar(p,0.1)).tanh,
		1,
		TRand.ar(0,0.01,p).round(15e-4),
		TRand.ar(-30,30,p)
	)
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("gliding clusters - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\gliding_clusters, { //10 sec silence after evaluation
	var x;
    LocalOut.ar(
		x=LFNoise1.ar(
			0.5*LocalIn.ar(1)+0.1,
			0.5,
			0.5));
	PitchShift.ar(
		PitchShift.ar(
			Pulse.ar([90,90.01],x),
			10,x*4,x),
		10,4-(x*4),1-x)
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("minimal patterns - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\minimal_patterns, { //5 sec silence after evaluation
	var q=[0,3,5,7,10];
	var p=Impulse.kr(4)*LFNoise0.kr>0;
	PitchShift.ar(
		Saw.ar(
			Demand.kr(p,0,Drand((q+12++q+33).midicps,inf)),
			Decay.kr(p,3)),
		7,
		2)!2
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("percussive pentatonic - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\percussive_pentatonic, {
	var p=[0,3,5,7,10,12]+30;
	var a=Demand.kr(Impulse.kr(8),0,Drand(p+24++p,inf));
	(BHiPass.ar(
		LFNoise1.ar(8)**3,
		[a,a+0.2].midicps,
		a/2e3,67-a
	)).tanh
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("percussive phrygian - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\percussive_phrygian, {
	var p=[0,0,0,1,5,7,10,12,12,12]+30;
	var a=Duty.kr(1/8,0,Dxrand(p+24++p++p,inf));
	(BHiPass.ar(
		LFNoise1.ar(8)**6,
		[a,a+7].midicps,
		a/3e3,67-a
	)).tanh
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("kick pattern - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\kick_pattern, {
	var x;
	LeakDC.ar(
		BRF.ar(
			Saw.ar(8,
				Decay2.kr(
					x=Duty.kr(
						1/8,
						0,
						Drand([0,Drand((0.4,0.5..1))],inf)),
					0.01,
					0.3
			))**1.5,
			x*20+[45.1,45],
			0.1
	)).tanh
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("synth polyrhythms - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\synth_polyrhythms, {
	p=Impulse.kr(1/4);
	k=Duty.kr(2,0,Dxrand((50,52..90),inf));
	r={|a|
		Saw.ar(
			TIRand.kr(1,6,p),
			a+1*3)}!3;
	BPF.ar(r.sum,[k,k+0.5],1/9,50).tanh
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("glissandi to major - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\glissandi2major, {
	var a;
	Mix({|k|
		k=k+1/2;
		2/k*Mix({|i|
			i=i+1;
			Blip.ar(
				i*XLine.kr(rand(2e2,4e2),
					87+LFNoise2.kr(2)*k,
					15),
				2,
				1/(i/a=XLine.kr(0.3,1,9))/9
		)}!9
	)}!40
	)!2*a
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("happy cricket - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\happy_cricket, {
	var b;
	var r=[0,3,5,7,10,12]+40;
	var p=Duty.ar(1/4,0,Drand((r+12++r).midicps,inf));
	Blip.ar(
		[b=TRand.ar(1500,2e3,Impulse.ar(16)).lag,b+p],
		1
	).mean!2**2
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("high morse noise - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\high_morse_noise, {
	var n=LFNoise0.kr(_);
	var v=Blip.ar([2e4,2e4-9],1,n.(16)*0.5+0.5**9);
	42.do{
		v=LeakDC.ar(
			AllpassC.ar(
				v,
				1,
				n.(5)*5e-2+(5e-2+1e-3),
				100
			)
		)
	};tanh(v*99)
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("big music box - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\big_music_box, {
	Mix(
		HPF.ar(
			MidEQ.ar(
				Limiter.ar(
					GVerb.ar(
						HPF.ar(
							Pulse.ar(
								[[0.1,0.11],[0.12,0.13]],
								0.6,
								5e-3
							),
							99
						),
						[[1,5/4],[1.5,2]],
						99
					)
				),
				9e3,
				0.9,
				9
			),
			200
		)
	)
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("beat synth outbreaks - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\beat_synth_outbreaks, {
	var i=Impulse.ar(_);
	SinOsc.ar(
		i.(2).lagud(0,0.4)*360,
		Integrator.ar(
			Integrator.ar(
				i.(64).lag(
					LFNoise1.ar(2!2,2,2)
				)*99,
				0.9
			),
			0.99
		).fold2(pi)
	)
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("chiptune overtones - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\chiptune_overtones, {
	var k;
	Splay.ar(
		Integrator.ar(
			LFNoise0.ar(
				5!3,
				k=Duty.ar(
					6.4,
					0,
					Dseq([0.05,Drand([0.04,0.08],1)],inf)
				)
			).round(k/10)
		).sin.sqrt.tanh,
		0.3
	)
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("glitch marching - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\glitch_marching, {
	var k;
	LocalOut.ar(
		k=LeakDC.ar(
			Integrator.ar(
				Pulse.ar(
					pi/[1,2.57],
					[0.54,0.46]
				),
				(1-LocalIn.ar(2)).fold(0,[0.9,0.85]
				)
			).wrap2(pi).sin
		)
	);
	k.mean!2
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("synth harmonics outbreak - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\synth_harmonics_outbreak, {
	var n=LFNoise0.ar(_);
	var f=[60,61];
	tanh(
		BBandPass.ar(
			max(
				max(
					n.(4),
					l=n.(6)
				),
				SinOsc.ar(f*ceil(l*9).lag(0.1))*0.7
			),
			f,
			n.(1).abs/2
		)*700*l.lag(1)
	)
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("crackling - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\crackling, {
	var k, y;
	LocalOut.ar(
		k=tanh(
			500*(
				PinkNoise.ar(1!2)**
				(8/(LagUD.ar(
					y=LocalIn.ar(2).range(0,0.9)+0.1,
					0,
					0.2
				)))
			)
		)
	);
	Splay.ar(k,1-y).sum;
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("noisy atonal - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\noisy_atonal, {
	var i=Impulse.ar(8).lag(0.3)!2;
	10.do{
		i=LeakDC.ar(
			AllpassC.ar(
				i,
				1,
				LFNoise0.ar(8).range(1e-5,0.2),
				-0.15,
				LFNoise0.ar(8).range(1,3)
			)
		).tanh
	};
	i
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("feedback resonances - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\feedback_resonances, {
	var n=LFNoise0.kr(*_);
	var v=Blip.ar(
		[60,61],
		5,
		n.(4)**8);
	12.do{
		v=LeakDC.ar(
			CombC.ar(
				v,
				1,
				n.([1,0.05,0.06]).lag(5e3),
				9
			)
		)
	};
	Limiter.ar(v,0.9,1)
}).clock_(t).quant_(1).fadeTime_(0).play)");

DDWSnippets.put("ultra high frequencies - Batuhan Bozkurt (earslap)", "

//Tweet by Batuhan Bozkurt (earslap)
//https://earslap.com/

(Ndef(\\ultra_high_frequencies, {
	Blip.ar(
		[16e3,16150],
		2,
		LFTri.ar(
			Duty.ar(
				LFNoise0.ar(0.2,4,6),
				0,
				Dseq([70,30,0],inf)
			)
		).clip(0,1)
	)
}).clock_(t).quant_(1).fadeTime_(0).play)");




