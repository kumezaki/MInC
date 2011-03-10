{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 170.0, 110.0, 1180.0, 286.0 ],
		"bglocked" : 0,
		"defrect" : [ 170.0, 110.0, 1180.0, 286.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 10.0, 10.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p Messaging",
					"numoutlets" : 0,
					"id" : "obj-26",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 30.0, 150.0, 79.0, 20.0 ],
					"fontname" : "Arial",
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 106.0, 265.0, 584.0, 392.0 ],
						"bglocked" : 0,
						"defrect" : [ 106.0, 265.0, 584.0, 392.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 10.0, 10.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pak size 12",
									"numoutlets" : 1,
									"id" : "obj-15",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"patching_rect" : [ 115.0, 171.0, 67.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "fontlist",
									"numoutlets" : 1,
									"id" : "obj-16",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"patching_rect" : [ 25.0, 82.0, 42.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "tracking $1",
									"numoutlets" : 1,
									"id" : "obj-20",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"patching_rect" : [ 199.0, 176.0, 65.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"numoutlets" : 2,
									"id" : "obj-25",
									"outlettype" : [ "float", "bang" ],
									"fontsize" : 11.595187,
									"triscale" : 0.9,
									"numinlets" : 1,
									"patching_rect" : [ 199.0, 153.0, 50.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "umenu",
									"numoutlets" : 3,
									"id" : "obj-42",
									"outlettype" : [ "int", "", "" ],
									"fontsize" : 11.595187,
									"items" : [ "left", ",", "center", ",", "right" ],
									"types" : [  ],
									"numinlets" : 1,
									"patching_rect" : [ 292.0, 153.0, 60.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "align $1",
									"numoutlets" : 1,
									"id" : "obj-43",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"patching_rect" : [ 292.0, 176.0, 50.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "font, face and spacing",
									"numoutlets" : 0,
									"id" : "obj-52",
									"fontface" : 1,
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"patching_rect" : [ 20.0, 42.0, 131.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "leadscale is multiplied by the font's standard leading to set the vertical offset between lines of text.",
									"linecount" : 4,
									"numoutlets" : 0,
									"id" : "obj-53",
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"patching_rect" : [ 292.0, 92.0, 148.0, 60.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "leadscale $1",
									"numoutlets" : 1,
									"id" : "obj-63",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"patching_rect" : [ 294.0, 73.0, 74.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "flonum",
									"numoutlets" : 2,
									"id" : "obj-64",
									"outlettype" : [ "float", "bang" ],
									"fontsize" : 11.595187,
									"triscale" : 0.9,
									"numinlets" : 1,
									"patching_rect" : [ 294.0, 49.0, 50.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "prepend face",
									"numoutlets" : 1,
									"id" : "obj-79",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"patching_rect" : [ 177.0, 93.0, 89.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "umenu",
									"numoutlets" : 3,
									"id" : "obj-80",
									"outlettype" : [ "int", "", "" ],
									"fontsize" : 11.595187,
									"items" : [ "normal", ",", "bold", ",", "italic" ],
									"types" : [  ],
									"numinlets" : 1,
									"patching_rect" : [ 177.0, 66.0, 95.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"numoutlets" : 2,
									"id" : "obj-81",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 11.595187,
									"triscale" : 0.9,
									"numinlets" : 1,
									"patching_rect" : [ 112.0, 135.0, 50.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "tosymbol",
									"numoutlets" : 1,
									"id" : "obj-82",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"patching_rect" : [ 25.0, 139.0, 57.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pak font Times",
									"numoutlets" : 1,
									"id" : "obj-83",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"patching_rect" : [ 26.0, 171.0, 87.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "umenu",
									"numoutlets" : 3,
									"id" : "obj-84",
									"outlettype" : [ "int", "", "" ],
									"fontsize" : 11.595187,
									"items" : [ "Apple Braille Outline 6 Dot", ",", "Apple Braille Outline 8 Dot", ",", "Apple Braille Pinpoint 6 Dot", ",", "Apple Braille Pinpoint 8 Dot", ",", "Apple Braille", ",", "Apple Symbols", ",", "AppleGothic Regular", ",", ".Aqua Kana", ",", "Courier", ",", "Courier Oblique", ",", "Geeza Pro", ",", "Geneva", ",", ".Helvetica LT MM", ",", "Helvetica", ",", "Helvetica Oblique", ",", "Helvetica Neue", ",", "Helvetica Neue Condensed Bold", ",", "Helvetica Neue UltraLight", ",", "Helvetica Neue Light", ",", "Helvetica Neue Condensed Black", ",", "Helvetica Neue Medium", ",", ".Keyboard", ",", "LastResort", ",", "Lucida Grande", ",", "Menlo Regular", ",", "Menlo Bold", ",", "Menlo Italic", ",", "Monaco", ",", "Heiti TC Light", ",", "Heiti SC Light", ",", "Symbol", ",", "Thonburi", ",", ".Times LT MM", ",", "Times Roman", ",", "Times Bold", ",", "Times Italic", ",", "Zapf Dingbats", ",", "Hiragino Mincho ProN W3", ",", "Hiragino Mincho ProN W6", ",", "Hiragino Kaku Gothic ProN W3", ",", "Hiragino Kaku Gothic ProN W6", ",", "LiHei Pro", ",", "STXihei", ",", "STHeiti", ",", "Al Bayan Plain", ",", "American Typewriter", ",", "American Typewriter Light", ",", "American Typewriter Condensed", ",", "American Typewriter Condensed Light", ",", "Andale Mono", ",", "Apple Chancery", ",", "Apple LiGothic Medium", ",", "Apple LiSung Light", ",", "Apple Casual", ",", "AppleMyungjo Regular", ",", "Arial Black", ",", "Arial Narrow", ",", "Arial Rounded MT Bold", ",", "Arial Unicode MS", ",", "Arial", ",", "Arial Hebrew", ",", "Ayuthaya", ",", "Baghdad", ",", "Baskerville", ",", "Baskerville SemiBold", ",", "BiauKai", ",", "Big Caslon Medium", ",", "BlairMdITC TT Medium", ",", "Bordeaux Roman Bold LET Plain:1.0", ",", "Chalkboard", ",", "Chalkduster", ",", "Charcoal CY", ",", "Cochin", ",", "Comic Sans MS", ",", "Copperplate", ",", "Copperplate Light", ",", "Corsiva Hebrew", ",", "Courier New", ",", "Cracked", ",", "DecoType Naskh", ",", "Devanagari MT", ",", "Didot", ",", "Euphemia UCAS", ",", "Futura Medium", ",", "Futura Condensed Medium", ",", "Futura Condensed ExtraBold", ",", "Geneva CY", ",", "Georgia", ",", "Gill Sans", ",", "Gill Sans Light", ",", "Gujarati MT", ",", "GungSeo Regular", ",", "Gurmukhi MT", ",", "Handwriting - Dakota", ",", "HeadLineA Regular", ",", "Hei Regular", ",", "Helsinki Metronome", ",", "Helsinki Special", ",", "Helsinki Text", ",", "Helsinki", ",", "Helvetica CY Plain", ",", "Helvetica CY Oblique", ",", "Herculanum", ",", "Hiragino Sans GB W3", ",", "Hiragino Sans GB W6", ",", "Hoefler Text Ornaments", ",", "Hoefler Text", ",", "Hoefler Text Black", ",", "Impact", ",", "InaiMathi", ",", "Inkpen2 Chords", ",", "Inkpen2 Metronome", ",", "Inkpen2 Script", ",", "Inkpen2 Special", ",", "Inkpen2 Text", ",", "Inkpen2", ",", "Kai Regular", ",", "Kailasa Regular", ",", "Kokonor Regular", ",", "Krungthep", ",", "KufiStandardGK", ",", "Marker Felt Thin", ",", "Marker Felt Wide", ",", "Abadi MT Condensed Extra Bold", ",", "Abadi MT Condensed Light", ",", "Andale Mono", ",", "Arial", ",", "Arial Black", ",", "Arial Narrow", ",", "Arial Rounded MT Bold", ",", "Baskerville Old Face", ",", "Batang", ",", "Bauhaus 93", ",", "Bell MT", ",", "Bernard MT Condensed", ",", "Book Antiqua", ",", "Bookman Old Style", ",", "Bookshelf Symbol 7", ",", "Braggadocio", ",", "Britannic Bold", ",", "Brush Script MT Italic", ",", "Calibri", ",", "Calisto MT", ",", "Cambria", ",", "Candara", ",", "Century", ",", "Century Gothic", ",", "Century Schoolbook", ",", "Colonna MT", ",", "Comic Sans MS", ",", "Consolas", ",", "Constantia", ",", "Cooper Black", ",", "Copperplate Gothic Bold", ",", "Copperplate Gothic Light", ",", "Corbel", ",", "Curlz MT", ",", "Desdemona", ",", "Edwardian Script ITC", ",", "Engravers MT", ",", "Eurostile", ",", "Footlight MT Light", ",", "Franklin Gothic Book", ",", "Franklin Gothic Medium", ",", "Garamond", ",", "Georgia", ",", "Gill Sans MT", ",", "Gill Sans Ultra Bold", ",", "Gloucester MT Extra Condensed", ",", "Goudy Old Style", ",", "Gulim", ",", "Haettenschweiler", ",", "Harrington", ",", "Impact", ",", "Imprint MT Shadow", ",", "Kino MT", ",", "Lucida Blackletter", ",", "Lucida Bright", ",", "Lucida Bright Demibold", ",", "Lucida Calligraphy Italic", ",", "Lucida Console", ",", "Lucida Fax Regular", ",", "Lucida Fax Demibold", ",", "Lucida Fax Italic", ",", "Lucida Handwriting Italic", ",", "Lucida Sans Regular", ",", "Lucida Sans Demibold Roman", ",", "Lucida Sans Italic", ",", "Lucida Sans Demibold Italic", ",", "Lucida Sans Typewriter Regular", ",", "Lucida Sans Typewriter Bold", ",", "Lucida Sans Typewriter Oblique", ",", "Lucida Sans Typewriter Bold Oblique", ",", "Lucida Sans Unicode", ",", "Marlett", ",", "Matura MT Script Capitals", ",", "Meiryo", ",", "Mistral", ",", "Modern No. 20", ",", "Monotype Corsiva", ",", "Monotype Sorts", ",", "MS Gothic", ",", "MS Mincho", ",", "MS PGothic", ",", "MS PMincho", ",", "MS Reference Sans Serif", ",", "MS Reference Specialty", ",", "MT Extra", ",", "News Gothic MT", ",", "Onyx", ",", "Perpetua Titling MT Light", ",", "Perpetua Titling MT Bold", ",", "Perpetua", ",", "Playbill", ",", "PMingLiU", ",", "Rockwell", ",", "Rockwell Extra Bold", ",", "SimSun", ",", "Stencil", ",", "Tahoma", ",", "Times New Roman", ",", "Trebuchet MS", ",", "Tw Cen MT", ",", "Verdana", ",", "Wide Latin", ",", "Wingdings", ",", "Wingdings 2", ",", "Wingdings 3", ",", "Microsoft Sans Serif", ",", "Mshtakan Oblique", ",", "Mshtakan", ",", "Nadeem", ",", "New Peninim MT", ",", "New Peninim MT Bold Inclined", ",", "New Peninim MT Inclined", ",", "GB18030 Bitmap", ",", "Optima Regular", ",", "Optima Bold", ",", "Optima Italic", ",", "Optima ExtraBlack", ",", "Opus Chords Sans Condensed", ",", "Opus Chords Sans", ",", "Opus Chords", ",", "Opus Figured Bass Extras", ",", "Opus Figured Bass", ",", "Opus Function Symbols", ",", "Opus Metronome", ",", "Opus Note Names", ",", "Opus Ornaments", ",", "Opus Percussion", ",", "Opus PlainChords", ",", "Opus Roman Chords", ",", "Opus Special Extra", ",", "Opus Special", ",", "Opus Text", ",", "Opus", ",", "Osaka", ",", "Osaka-Mono", ",", "Palatino", ",", "Papyrus", ",", "Papyrus Condensed", ",", "PCMyungjo Regular", ",", "PhotoScore Extra", ",", "PilGi Regular", ",", "Plantagenet Cherokee", ",", "PortagoITC TT", ",", "Raanana", ",", "Reprise Chords", ",", "Reprise Metronome", ",", "Reprise Rehearsal", ",", "Reprise Script", ",", "Reprise Special", ",", "Reprise Stamp", ",", "Reprise Text", ",", "Reprise Title", ",", "Reprise", ",", "Sathu", ",", "Silom", ",", "Skia Regular", ",", "Heiti TC Medium", ",", "Heiti SC Medium", ",", "Tahoma", ",", "Times New Roman", ",", "Trebuchet MS", ",", "Verdana", ",", "Webdings", ",", "Wingdings 2", ",", "Wingdings 3", ",", "Wingdings", ",", "Zapfino", ",", "Hiragino Maru Gothic Pro W4", ",", "Hiragino Maru Gothic ProN W4", ",", "Hiragino Mincho Pro W3", ",", "Hiragino Mincho Pro W6", ",", "Hiragino Kaku Gothic Pro W3", ",", "Hiragino Kaku Gothic Pro W6", ",", "Hiragino Kaku Gothic Std W8", ",", "Hiragino Kaku Gothic StdN W8", ",", "LiSong Pro", ",", "STFangsong", ",", "STSong", ",", "STKaiti", ",", "Helvetica Light", ",", "Helvetica Light Oblique" ],
									"types" : [  ],
									"numinlets" : 1,
									"patching_rect" : [ 25.0, 107.0, 147.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"bgcolor" : [ 0.701961, 0.980392, 0.705882, 1.0 ],
									"numoutlets" : 0,
									"id" : "obj-100",
									"numinlets" : 1,
									"patching_rect" : [ 20.0, 40.0, 429.0, 162.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawto TextView",
									"numoutlets" : 1,
									"id" : "obj-12",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"patching_rect" : [ 90.0, 270.0, 97.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.gl.text2d @color 0.1 0.5 0.8 1. @tracking 1.2 @align 2",
									"numoutlets" : 2,
									"id" : "obj-76",
									"outlettype" : [ "", "" ],
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"patching_rect" : [ 210.0, 320.0, 301.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-64", 0 ],
									"destination" : [ "obj-63", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 0 ],
									"destination" : [ "obj-43", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-80", 1 ],
									"destination" : [ "obj-79", 0 ],
									"hidden" : 0,
									"midpoints" : [ 224.5, 88.0, 186.5, 88.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-81", 0 ],
									"destination" : [ "obj-15", 1 ],
									"hidden" : 0,
									"midpoints" : [ 121.5, 164.0, 172.5, 164.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-82", 0 ],
									"destination" : [ "obj-83", 1 ],
									"hidden" : 0,
									"midpoints" : [ 34.5, 168.0, 103.5, 168.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-84", 1 ],
									"destination" : [ "obj-82", 0 ],
									"hidden" : 0,
									"midpoints" : [ 98.5, 132.0, 34.5, 132.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-84", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-76", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0,
						"globalpatchername" : "",
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial"
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "speed",
					"numoutlets" : 0,
					"id" : "obj-45",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 130.0, 30.0, 43.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "phrase select",
					"linecount" : 2,
					"numoutlets" : 0,
					"id" : "obj-44",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 80.0, 20.0, 49.0, 34.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "1 is normal speed",
					"numoutlets" : 0,
					"id" : "obj-41",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 180.0, 50.0, 105.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numoutlets" : 2,
					"id" : "obj-30",
					"outlettype" : [ "int", "bang" ],
					"minimum" : 0,
					"fontsize" : 12.0,
					"maximum" : 20,
					"numinlets" : 1,
					"patching_rect" : [ 130.0, 50.0, 50.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numoutlets" : 2,
					"id" : "obj-21",
					"outlettype" : [ "int", "bang" ],
					"minimum" : 0,
					"fontsize" : 12.0,
					"maximum" : 4,
					"numinlets" : 1,
					"patching_rect" : [ 80.0, 50.0, 44.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"numoutlets" : 1,
					"id" : "obj-19",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 560.0, 20.0, 60.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r qmet",
					"numoutlets" : 1,
					"id" : "obj-28",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 30.0, 200.0, 45.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.fpsgui",
					"numoutlets" : 2,
					"id" : "obj-27",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 950.0, 200.0, 80.0, 36.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.fpsgui",
					"numoutlets" : 2,
					"id" : "obj-22",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 660.0, 230.0, 80.0, 36.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.matrix TextView 4 char 974 360",
					"numoutlets" : 2,
					"id" : "obj-17",
					"outlettype" : [ "jit_matrix", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 30.0, 220.0, 189.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r qmet",
					"numoutlets" : 1,
					"id" : "obj-14",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 660.0, 130.0, 45.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b erase",
					"numoutlets" : 2,
					"id" : "obj-85",
					"outlettype" : [ "bang", "erase" ],
					"fontsize" : 11.595187,
					"numinlets" : 1,
					"patching_rect" : [ 660.0, 150.0, 54.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.gl.render TextView @erase_color 0. 0. 0. 1.",
					"numoutlets" : 2,
					"id" : "obj-40",
					"outlettype" : [ "bang", "" ],
					"fontsize" : 11.595187,
					"numinlets" : 1,
					"patching_rect" : [ 660.0, 200.0, 244.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"numoutlets" : 1,
					"id" : "obj-11",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 1000.0, 70.0, 37.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"numoutlets" : 1,
					"id" : "obj-65",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 815.0, 45.0, 60.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "fsmenubar 0",
					"numoutlets" : 1,
					"id" : "obj-9",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"numinlets" : 2,
					"patching_rect" : [ 815.0, 75.0, 75.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p esc-fullscreen",
					"numoutlets" : 1,
					"id" : "obj-92",
					"outlettype" : [ "" ],
					"fontsize" : 11.595187,
					"numinlets" : 0,
					"patching_rect" : [ 840.0, 100.0, 90.0, 20.0 ],
					"fontname" : "Arial",
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 86.0, 108.0, 235.0, 205.0 ],
						"bglocked" : 0,
						"defrect" : [ 86.0, 108.0, 235.0, 205.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 10.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 0,
						"toolbarvisible" : 1,
						"boxanimatetime" : 200,
						"imprint" : 0,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Escape ASCII Code",
									"numoutlets" : 0,
									"id" : "obj-7",
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"patching_rect" : [ 86.0, 67.0, 114.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numoutlets" : 0,
									"id" : "obj-2",
									"numinlets" : 1,
									"patching_rect" : [ 27.0, 157.25, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "fullscreen $1",
									"numoutlets" : 1,
									"id" : "obj-3",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"patching_rect" : [ 27.0, 127.25, 76.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "key",
									"numoutlets" : 4,
									"id" : "obj-4",
									"outlettype" : [ "int", "int", "int", "int" ],
									"fontsize" : 11.595187,
									"numinlets" : 0,
									"patching_rect" : [ 27.0, 37.0, 46.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "select 27",
									"numoutlets" : 2,
									"id" : "obj-5",
									"outlettype" : [ "bang", "" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"patching_rect" : [ 27.0, 67.25, 57.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"numoutlets" : 1,
									"id" : "obj-6",
									"outlettype" : [ "int" ],
									"numinlets" : 1,
									"patching_rect" : [ 27.0, 97.25, 20.0, 20.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontsize" : 10.0,
						"fontface" : 0,
						"fontsize" : 10.0,
						"globalpatchername" : "",
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial"
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ButtonView",
					"numoutlets" : 1,
					"id" : "obj-3",
					"outlettype" : [ "jit_matrix" ],
					"fontsize" : 12.0,
					"numinlets" : 3,
					"patching_rect" : [ 30.0, 80.0, 119.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r qmet",
					"numoutlets" : 1,
					"id" : "obj-24",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 950.0, 50.0, 45.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r qmet",
					"numoutlets" : 1,
					"id" : "obj-23",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 0,
					"patching_rect" : [ 30.0, 60.0, 45.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s qmet",
					"numoutlets" : 0,
					"id" : "obj-18",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 560.0, 80.0, 47.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numoutlets" : 1,
					"id" : "obj-10",
					"outlettype" : [ "int" ],
					"numinlets" : 1,
					"patching_rect" : [ 560.0, 40.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.matrix MainView 4 char 1024 768",
					"numoutlets" : 2,
					"id" : "obj-8",
					"outlettype" : [ "jit_matrix", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 950.0, 110.0, 200.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.matrix MainView 4 char 1024 768 @usedstdim 1 @dstdimstart 252 380 @dstdimend 772 710",
					"numoutlets" : 2,
					"id" : "obj-7",
					"outlettype" : [ "jit_matrix", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 30.0, 100.0, 519.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.matrix MainView 4 char 1024 768 @usedstdim 1 @dstdimstart 24 10 @dstdimend 999 370",
					"numoutlets" : 2,
					"id" : "obj-6",
					"outlettype" : [ "jit_matrix", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 30.0, 240.0, 506.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.window Projection @size 1024 768",
					"numoutlets" : 2,
					"id" : "obj-5",
					"outlettype" : [ "bang", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"patching_rect" : [ 950.0, 160.0, 209.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "qmetro 30",
					"numoutlets" : 1,
					"id" : "obj-2",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"patching_rect" : [ 560.0, 60.0, 65.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 41.0, 569.5, 41.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 824.5, 147.0, 959.5, 147.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-92", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 849.5, 147.0, 959.5, 147.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1009.5, 90.0, 959.5, 90.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [ 824.5, 66.0, 824.5, 66.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 959.5, 132.0, 959.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 959.5, 72.0, 959.5, 72.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-85", 0 ],
					"hidden" : 0,
					"midpoints" : [ 669.5, 150.0, 669.5, 150.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 62.0, 569.5, 62.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 80.0, 569.5, 80.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [ 959.5, 180.0, 959.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-3", 2 ],
					"hidden" : 0,
					"midpoints" : [ 139.5, 72.0, 139.5, 72.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-3", 1 ],
					"hidden" : 0,
					"midpoints" : [ 89.5, 72.0, 89.5, 72.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 102.0, 39.5, 102.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 81.0, 39.5, 81.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 240.0, 39.5, 240.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 222.0, 39.5, 222.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 1 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [ 704.5, 186.0, 669.5, 186.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 0 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [ 669.5, 171.0, 669.5, 171.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [ 669.5, 222.0, 669.5, 222.0 ]
				}

			}
 ]
	}

}
