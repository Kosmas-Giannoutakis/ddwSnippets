/*** DDWSnippets config ***/

DDWSnippets.autoEnable = nil;
DDWSnippets.verbose = true;

DDWSnippets.hotkeyCode = 96;
DDWSnippets.hotkeyMods = 262144;

DDWSnippets.put("bass glitch", "play{AllpassC.ar(SinOsc.ar(55).tanh,0.4,TExpRand.ar(2e-4, 0.4,Impulse.ar(8)).round([2e-3,4e-3]),2)};// #supercollider with bass please...");