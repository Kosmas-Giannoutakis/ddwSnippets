DDWSnippets {
	classvar <snips, action, states, <state;

	*initClass {
		snips = Dictionary.new;
		Class.initClassTree(Clock);
		Class.initClassTree(Document);
		action = { |doc, char, modifiers, unicode, keycode|
			if(keycode == 96 and: { modifiers bitAnd: 262144 != 0 }) {
				this.makeGui;  // changes focus to GUI window
			}
		};
		AppClock.sched(1.0, { this.enable });
	}

	*enable {
		var temp = Document.globalKeyDownAction;
		if(temp.isNil or: { not(temp === action or: {
			temp.isKindOf(FunctionList) and: temp.array.includes(action)
		}) }) {
			Document.globalKeyDownAction = temp.addFunc(action);
			"DDWSnippets successfully enabled".postln;
		} {
			"DDWSnippets already enabled".warn;
		}
	}

	*disable {
		Document.globalKeyDownAction = Document.globalKeyDownAction.removeFunc(action);
	}

	*put { |name, value|
		snips.put(name.asString, value.asString)
	}

	*removeAt { |name|
		snips.removeAt(name.asString)
	}

	*at { |name|
		snips.at(name.asString)
	}

	*insert { |doc, key|
		var snip = snips[key], temp, i, pos;
		if(snip.notNil) {
			i = snip.find("##");
			if(i.notNil) {
				temp = snip;
				if(i > 0) { snip = temp[ .. i-1] } { snip = String.new };
				if(i < (temp.size - 2)) { snip = snip ++ temp[i+2..] };
			};
			pos = doc.selectionStart;
			doc.selectedString_(snip);
			if(i.notNil) {
				// Yeah. Seriously. I actually have to do this. SMH
				if(doc.respondsTo(\selectRange)) {
					doc.selectRange(pos + i, 0)
				} {
					doc.select(pos + i, 0)
				}
			};
		} {
			"DDWSnippets: % is undefined".format(key).warn;
		};
	}

	*makeGui { |doc(Document.current)|
		var window, textField, listView, str;
		var allKeys = snips.keys.as(Array).sort, keys, current;

		window = Window("Snippets",
			Rect.aboutPoint(Window.screenBounds.center, 120, 90));
		window.layout = VLayout(
			textField = TextField().fixedHeight_(20),
			listView = ListView().canFocus_(false)
		);

		textField.action_({ |view|
			this.insert(doc, current);
			window.close;
		})
		.keyDownAction_({ |view, char, modifiers, unicode, keycode|
			var i;
			case
			{ char.ascii == 27 and: { modifiers bitAnd: 0x001E0000 == 0 } } {
				window.close;
			}
			{ #[65362, 65364].includes(keycode) } {
				i = (listView.value + keycode - 65363).clip(0, keys.size - 1);
				if(i != listView.value) {
					listView.value = i;
					current = str = keys[i];
					textField.string = str;
				};
				true
			}
		})
		.keyUpAction_({ |view, char, modifiers, unicode, keycode|
			var i;
			// no ctrl, alt, super
			// 0x001C0000: [262144, 524288, 1048576].reduce('bitOr').asHexString(8)
			if(char.isPrint and: { modifiers bitAnd: 0x001C0000 == 0 }) {
				str = view.string;
				current = keys[listView.value];
				keys = allKeys.select { |item| item[.. str.size-1] == str };
				i = keys.indexOfEqual(current) ?? { 0 };
				listView.items_(keys).value_(i);
			};
		});

		keys = allKeys;
		current = keys[0];
		listView.items_(keys).value_(0);

		textField.focus(true);
		window.front;
	}
}