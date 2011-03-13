{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 80.0, 108.0, 1189.0, 702.0 ],
		"bgcolor" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 80.0, 108.0, 1189.0, 702.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 20.0, 10.0 ],
		"gridsnaponopen" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Player Report Window",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 620.0, 120.0, 141.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-9",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 591.0, 114.0, 138.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ButtonView fade",
					"fontsize" : 12.0,
					"patching_rect" : [ 520.0, 380.0, 96.0, 20.0 ],
					"id" : "obj-96",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ButtonView start/stop",
					"fontsize" : 12.0,
					"patching_rect" : [ 480.0, 360.0, 125.0, 20.0 ],
					"id" : "obj-95",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 500.0, 380.0, 20.0, 20.0 ],
					"id" : "obj-93",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 460.0, 360.0, 20.0, 20.0 ],
					"id" : "obj-90",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "title fade",
					"fontsize" : 12.0,
					"patching_rect" : [ 440.0, 340.0, 67.0, 20.0 ],
					"id" : "obj-94",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"outlettype" : [ "int" ],
					"patching_rect" : [ 420.0, 340.0, 20.0, 20.0 ],
					"id" : "obj-92",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "text Welcome. Please note the nearest EXIT in the unlikely event of an emergency.",
					"linecount" : 2,
					"fontsize" : 8.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 380.0, 290.0, 164.0, 23.0 ],
					"id" : "obj-70",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiparse",
					"fontsize" : 12.0,
					"outlettype" : [ "", "", "", "int", "int", "int", "int" ],
					"patching_rect" : [ 160.0, 390.0, 140.0, 20.0 ],
					"id" : "obj-126",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 7
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js Midi.js",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 200.0, 430.0, 57.0, 20.0 ],
					"id" : "obj-130",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend cc_msg",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 200.0, 410.0, 99.0, 20.0 ],
					"id" : "obj-128",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiin",
					"fontsize" : 12.0,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 160.0, 370.0, 42.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-123",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 440.0, 210.0, 42.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1010.0, 50.0, 20.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-103",
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"numinlets" : 1,
					"presentation_rect" : [ 310.0, 70.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "global tempo",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 840.0, 90.0, 83.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-102",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 530.0, 70.0, 85.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "master musical clock",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 1030.0, 50.0, 131.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-100",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 330.0, 70.0, 133.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 116",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 930.0, 10.0, 84.0, 20.0 ],
					"id" : "obj-67",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"fontsize" : 12.0,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 1050.0, 100.0, 36.0, 20.0 ],
					"id" : "obj-78",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1050.0, 120.0, 32.5, 18.0 ],
					"id" : "obj-79",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 930.0, 90.0, 50.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-83",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 480.0, 70.0, 50.0, 20.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "tempo $1",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 930.0, 110.0, 61.0, 18.0 ],
					"id" : "obj-88",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "transport",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
					"patching_rect" : [ 1010.0, 150.0, 59.0, 20.0 ],
					"id" : "obj-91",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 9
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"outlettype" : [ "int" ],
					"patching_rect" : [ 280.0, 490.0, 20.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-87",
					"bgcolor" : [ 0.658824, 0.658824, 0.729412, 1.0 ],
					"numinlets" : 1,
					"presentation_rect" : [ 310.0, 210.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "quantize mode",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 300.0, 490.0, 96.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-84",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 330.0, 210.0, 94.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 280.0, 510.0, 32.5, 20.0 ],
					"id" : "obj-85",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 quant metro $1",
					"linecount" : 2,
					"fontsize" : 9.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 570.0, 126.0, 25.0 ],
					"id" : "obj-86",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ProjectionView",
					"fontsize" : 12.0,
					"patching_rect" : [ 380.0, 400.0, 139.0, 20.0 ],
					"id" : "obj-55",
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 4,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"hidden" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 280.0, 440.0, 72.0, 20.0 ],
					"id" : "obj-58",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "latency",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 220.0, 490.0, 52.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-77",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 480.0, 160.0, 137.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 160.0, 510.0, 32.5, 20.0 ],
					"id" : "obj-73",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontface" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 160.0, 490.0, 57.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-63",
					"bgcolor" : [ 0.658824, 0.658824, 0.729412, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 430.0, 160.0, 50.0, 20.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 pipe $1",
					"linecount" : 2,
					"fontsize" : 9.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.0, 570.0, 95.0, 25.0 ],
					"id" : "obj-54",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess set 0.0.0.0",
					"hidden" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 340.0, 10.0, 121.0, 20.0 ],
					"id" : "obj-48",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"outlettype" : [ "int" ],
					"patching_rect" : [ 420.0, 490.0, 20.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-81",
					"bgcolor" : [ 0.658824, 0.658824, 0.729412, 1.0 ],
					"numinlets" : 1,
					"presentation_rect" : [ 310.0, 160.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "sync mode",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 440.0, 490.0, 77.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-80",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 330.0, 160.0, 77.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_1 target 0",
					"linecount" : 2,
					"fontsize" : 9.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 520.0, 620.0, 96.0, 25.0 ],
					"id" : "obj-76",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 420.0, 510.0, 32.5, 20.0 ],
					"id" : "obj-75",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 sync $1",
					"linecount" : 2,
					"fontsize" : 9.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 420.0, 570.0, 96.0, 25.0 ],
					"id" : "obj-68",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r report",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 560.0, 120.0, 49.0, 20.0 ],
					"id" : "obj-66",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"text" : "players: \n",
					"fontsize" : 12.0,
					"outlettype" : [ "", "int", "", "" ],
					"patching_rect" : [ 560.0, 140.0, 239.0, 89.0 ],
					"presentation" : 1,
					"id" : "obj-29",
					"readonly" : 1,
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 860.0, 20.0, 207.0, 195.0 ],
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "To Do:\n- implement poly~ timer (2 min)",
					"linecount" : 2,
					"fontsize" : 12.0,
					"patching_rect" : [ 720.0, 30.0, 179.0, 34.0 ],
					"id" : "obj-51",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b 2",
					"fontsize" : 12.0,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 20.0, 520.0, 32.5, 20.0 ],
					"id" : "obj-39",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 dump bang",
					"linecount" : 2,
					"fontsize" : 9.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 570.0, 110.0, 25.0 ],
					"id" : "obj-56",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "120 0",
					"fontface" : 3,
					"fontsize" : 18.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 20.0, 490.0, 57.0, 25.0 ],
					"presentation" : 1,
					"id" : "obj-7",
					"bgcolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"presentation_rect" : [ 940.0, 260.0, 57.0, 25.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "MIdi Program Changer",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 220.0, 130.0, 140.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-65",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 140.0, 110.0, 138.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "player pos",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 380.0, 160.0, 78.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-61",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 90.0, 190.0, 69.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p midi_prgm_changer",
					"fontsize" : 12.0,
					"patching_rect" : [ 220.0, 180.0, 139.0, 20.0 ],
					"id" : "obj-60",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 0.0, 0.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"defrect" : [ 0.0, 0.0, 640.0, 480.0 ],
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
									"maxclass" : "message",
									"text" : "target $1",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 160.0, 120.0, 58.0, 18.0 ],
									"id" : "obj-68",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 2",
									"fontsize" : 12.0,
									"outlettype" : [ "bang", "bang" ],
									"patching_rect" : [ 50.0, 110.0, 32.5, 20.0 ],
									"id" : "obj-65",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s thum_msg_2",
									"fontsize" : 12.0,
									"patching_rect" : [ 50.0, 190.0, 89.0, 20.0 ],
									"id" : "obj-64",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s thum_msg_1",
									"fontsize" : 12.0,
									"patching_rect" : [ 120.0, 170.0, 89.0, 20.0 ],
									"id" : "obj-63",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "prgm 12",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 170.0, 69.0, 18.0 ],
									"id" : "obj-61",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "prgm $1",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 100.0, 100.0, 55.0, 18.0 ],
									"id" : "obj-48",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "target 1",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 120.0, 150.0, 51.0, 18.0 ],
									"id" : "obj-29",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "int" ],
									"patching_rect" : [ 70.0, 40.0, 25.0, 25.0 ],
									"id" : "obj-7",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "int" ],
									"patching_rect" : [ 160.0, 40.0, 25.0, 25.0 ],
									"id" : "obj-39",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-39", 0 ],
									"destination" : [ "obj-68", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-48", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-65", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-68", 0 ],
									"destination" : [ "obj-29", 1 ],
									"hidden" : 0,
									"midpoints" : [ 169.5, 139.0, 162.0, 139.0, 162.0, 145.0, 161.5, 145.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-65", 1 ],
									"destination" : [ "obj-29", 0 ],
									"hidden" : 0,
									"midpoints" : [ 73.0, 130.0, 129.5, 130.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-65", 0 ],
									"destination" : [ "obj-61", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 130.0, 59.5, 130.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-29", 0 ],
									"destination" : [ "obj-63", 0 ],
									"hidden" : 0,
									"midpoints" : [ 129.5, 169.0, 129.5, 169.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-61", 0 ],
									"destination" : [ "obj-64", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 190.0, 59.5, 190.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-48", 0 ],
									"destination" : [ "obj-61", 1 ],
									"hidden" : 0,
									"midpoints" : [ 109.5, 118.0, 109.5, 118.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 340.0, 160.0, 43.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-53",
					"minimum" : 0,
					"fontname" : "Arial",
					"maximum" : 20,
					"numinlets" : 1,
					"presentation_rect" : [ 40.0, 190.0, 50.0, 20.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "alert $1",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 620.0, 380.0, 51.0, 18.0 ],
					"id" : "obj-133",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route text",
					"fontsize" : 12.0,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 620.0, 340.0, 61.0, 20.0 ],
					"id" : "obj-129",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "tosymbol",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 620.0, 360.0, 59.0, 20.0 ],
					"id" : "obj-122",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"text" : "write a message...\t",
					"fontsize" : 14.0,
					"outlettype" : [ "", "int", "", "" ],
					"patching_rect" : [ 620.0, 280.0, 265.0, 22.0 ],
					"presentation" : 1,
					"id" : "obj-119",
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 420.0, 260.0, 327.0, 23.0 ],
					"numoutlets" : 4
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 12",
					"hidden" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 200.0, 90.0, 79.0, 20.0 ],
					"id" : "obj-106",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "prgm #",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 260.0, 160.0, 51.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-105",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 160.0, 140.0, 53.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Click box to type a broadcast message -  Tab to send it.",
					"fontsize" : 10.0,
					"patching_rect" : [ 620.0, 280.0, 269.0, 18.0 ],
					"presentation" : 1,
					"id" : "obj-89",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 430.0, 280.0, 271.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p Magic_Mode",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 700.0, 350.0, 89.0, 20.0 ],
					"id" : "obj-69",
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 302.0, 170.0, 301.0, 250.0 ],
						"bglocked" : 0,
						"defrect" : [ 302.0, 170.0, 301.0, 250.0 ],
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
									"maxclass" : "message",
									"text" : "notes $1",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 40.0, 180.0, 57.0, 18.0 ],
									"id" : "obj-1",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b i",
									"fontsize" : 12.0,
									"outlettype" : [ "bang", "int" ],
									"patching_rect" : [ 40.0, 70.0, 38.5, 20.0 ],
									"id" : "obj-63",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "64\\,68\\,71\\,74\\,78\\,82\\,85\\,88",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 40.0, 150.0, 164.0, 18.0 ],
									"id" : "obj-56",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "magic $1",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 60.0, 120.0, 59.0, 18.0 ],
									"id" : "obj-16",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "int" ],
									"patching_rect" : [ 40.0, 40.0, 25.0, 25.0 ],
									"id" : "obj-67",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 40.0, 210.0, 25.0, 25.0 ],
									"id" : "obj-68",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-68", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 138.0, 27.0, 138.0, 27.0, 207.0, 49.5, 207.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-67", 0 ],
									"destination" : [ "obj-63", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 66.0, 49.5, 66.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-63", 1 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.0, 90.0, 69.5, 90.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-63", 0 ],
									"destination" : [ "obj-56", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 90.0, 49.5, 90.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-56", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 168.0, 49.5, 168.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-68", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 198.0, 49.5, 198.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 220.0, 160.0, 43.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-35",
					"minimum" : 0,
					"fontname" : "Arial",
					"maximum" : 127,
					"numinlets" : 1,
					"presentation_rect" : [ 230.0, 180.0, 50.0, 20.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "PANIC!",
					"fontface" : 1,
					"fontsize" : 16.0,
					"patching_rect" : [ 80.0, 490.0, 62.0, 25.0 ],
					"presentation" : 1,
					"id" : "obj-57",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 940.0, 290.0, 65.0, 25.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiout",
					"fontsize" : 12.0,
					"patching_rect" : [ 40.0, 370.0, 49.0, 20.0 ],
					"id" : "obj-31",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "marq $1",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 360.0, 55.0, 18.0 ],
					"id" : "obj-28",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend send_all",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 860.0, 590.0, 103.0, 20.0 ],
					"id" : "obj-21",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "mode $1",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1000.0, 420.0, 57.0, 18.0 ],
					"id" : "obj-15",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "player instances",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 40.0, 90.0, 104.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-47",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 140.0, 270.0, 105.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "server IP",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 480.0, 30.0, 60.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-46",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 40.0, 10.0, 59.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "current key offset",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 580.0, 80.0, 115.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-45",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 690.0, 10.0, 115.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"outlettype" : [ "int" ],
					"patching_rect" : [ 900.0, 240.0, 20.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-42",
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"numinlets" : 1,
					"presentation_rect" : [ 310.0, 110.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"outlettype" : [ "int" ],
					"patching_rect" : [ 800.0, 320.0, 20.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-40",
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"numinlets" : 1,
					"presentation_rect" : [ 430.0, 110.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"outlettype" : [ "int" ],
					"patching_rect" : [ 700.0, 320.0, 20.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-38",
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"numinlets" : 1,
					"presentation_rect" : [ 530.0, 110.0, 20.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "close",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 100.0, 110.0, 39.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-34",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 210.0, 300.0, 39.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "open",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 40.0, 110.0, 40.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-32",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 10.0, 300.0, 40.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"outlettype" : [ "" ],
					"patching_rect" : [ 100.0, 130.0, 21.0, 112.0 ],
					"presentation" : 1,
					"id" : "obj-20",
					"size" : 21.0,
					"numinlets" : 1,
					"presentation_rect" : [ 250.0, 300.0, 131.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 100.0, 240.0, 50.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-25",
					"minimum" : 0,
					"fontname" : "Arial",
					"maximum" : 20,
					"numinlets" : 1,
					"presentation_rect" : [ 330.0, 320.0, 50.0, 20.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "wclose $1",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 100.0, 260.0, 62.0, 18.0 ],
					"id" : "obj-17",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 130.0, 21.0, 111.0 ],
					"presentation" : 1,
					"id" : "obj-52",
					"size" : 21.0,
					"numinlets" : 1,
					"presentation_rect" : [ 50.0, 300.0, 131.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "magic mode",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 720.0, 320.0, 83.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-50",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 550.0, 110.0, 83.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p osc_definitions",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 340.0, 50.0, 111.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-2",
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 0,
					"presentation_rect" : [ 460.0, 20.0, 111.0, 20.0 ],
					"numoutlets" : 0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 150.0, 54.0, 470.0, 396.0 ],
						"bglocked" : 0,
						"defrect" : [ 150.0, 54.0, 470.0, 396.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
									"text" : "Messages TO Thumbafon",
									"fontface" : 1,
									"fontsize" : 12.0,
									"patching_rect" : [ 45.0, 180.0, 154.0, 20.0 ],
									"id" : "obj-8",
									"bgcolor" : [ 0.45098, 0.74902, 0.94902, 1.0 ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "All messages are sent to/from as C  strings",
									"fontsize" : 12.0,
									"patching_rect" : [ 105.0, 30.0, 256.0, 20.0 ],
									"id" : "obj-7",
									"bgcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
									"fontname" : "Arial Bold",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Messages FROM Thumbafon",
									"fontface" : 1,
									"fontsize" : 12.0,
									"patching_rect" : [ 45.0, 60.0, 175.0, 20.0 ],
									"id" : "obj-6",
									"bgcolor" : [ 0.45098, 0.74902, 1.0, 1.0 ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "/thum/join = joining performance\n/thum/leave = leaving performance\n/thum/butt = button message\n/thum/hint = hint button\n/thum/prev = alert window \"Previous\" button",
									"linecount" : 5,
									"fontsize" : 12.0,
									"patching_rect" : [ 45.0, 90.0, 241.0, 75.0 ],
									"id" : "obj-3",
									"bgcolor" : [ 0.45098, 0.74902, 1.0, 1.0 ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "/thum/1butt = alert message\n/thum/2butt = alert message w/ back button\n/thum/key = offsets the base note w/ signed ints (zero is C)\n/thum/mode = changes the modal scale of the device (integer 0 to 5)\n/thum/notes = comma separated note set of 8 midi note #'s. (0 - 88)\n/thum/magic = turns \"magic mode\" on (zero or non-zero)\n/thum/marq = display message in the main view marquee\n/thum/srvip = server IP address\n/thum/shake = ip exchange confirmation message\n/thum/kill = turn off networking on the device",
									"linecount" : 10,
									"fontsize" : 12.0,
									"patching_rect" : [ 45.0, 210.0, 377.0, 144.0 ],
									"id" : "obj-2",
									"bgcolor" : [ 0.45098, 0.74902, 0.94902, 1.0 ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"mode" : 1,
									"patching_rect" : [ 30.0, 15.0, 406.0, 360.0 ],
									"id" : "obj-9",
									"grad1" : [ 0.45098, 0.74902, 1.0, 1.0 ],
									"rounded" : 50,
									"bgcolor" : [ 0.439216, 0.639216, 0.980392, 1.0 ],
									"grad2" : [ 0.45098, 0.6, 1.0, 1.0 ],
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
 ],
						"lines" : [  ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "marquee",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 820.0, 320.0, 61.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-14",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 450.0, 110.0, 59.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p MainView_Test_Messages",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 800.0, 340.0, 162.0, 20.0 ],
					"id" : "obj-59",
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 242.0, 287.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 242.0, 287.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
									"maxclass" : "newobj",
									"text" : "coll lyrics.txt",
									"fontsize" : 12.0,
									"outlettype" : [ "", "", "", "" ],
									"patching_rect" : [ 75.0, 180.0, 75.0, 20.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 4,
									"saved_object_attributes" : 									{
										"embed" : 0
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 106.5, 135.0, 32.5, 18.0 ],
									"id" : "obj-54",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "counter 0 146",
									"fontsize" : 12.0,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 74.5, 155.0, 84.0, 20.0 ],
									"id" : "obj-40",
									"fontname" : "Arial",
									"numinlets" : 5,
									"numoutlets" : 4
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 3000",
									"fontsize" : 12.0,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 75.0, 90.0, 71.0, 20.0 ],
									"id" : "obj-34",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "int" ],
									"patching_rect" : [ 75.0, 30.0, 25.0, 25.0 ],
									"id" : "obj-57",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 75.0, 210.0, 25.0, 25.0 ],
									"id" : "obj-58",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-58", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.5, 201.0, 84.5, 201.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.5, 111.0, 84.0, 111.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-57", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.5, 57.0, 84.5, 57.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-54", 0 ],
									"destination" : [ "obj-40", 2 ],
									"hidden" : 0,
									"midpoints" : [ 116.0, 153.0, 116.5, 153.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-40", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.0, 177.0, 84.5, 177.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-57", 0 ],
									"destination" : [ "obj-54", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.5, 75.0, 60.0, 75.0, 60.0, 120.0, 116.0, 120.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 1000.0, 400.0, 50.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-43",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 790.0, 190.0, 50.0, 20.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r server_IP",
					"hidden" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 460.0, 10.0, 69.0, 20.0 ],
					"id" : "obj-8",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0.0.0.0",
					"fontface" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 340.0, 30.0, 139.0, 18.0 ],
					"presentation" : 1,
					"id" : "obj-6",
					"fontname" : "Arial",
					"numinlets" : 2,
					"presentation_rect" : [ 20.0, 30.0, 110.0, 18.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "test seq",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 920.0, 240.0, 56.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-37",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 330.0, 110.0, 56.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p server_heartbeat",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 70.0, 40.0, 111.0, 20.0 ],
					"id" : "obj-36",
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 390.0, 426.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 390.0, 426.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
									"maxclass" : "message",
									"text" : "/thum/srvip 10.0.1.4",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 75.0, 300.0, 169.0, 18.0 ],
									"id" : "obj-9",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s server_IP",
									"fontsize" : 12.0,
									"patching_rect" : [ 255.0, 225.0, 71.0, 20.0 ],
									"id" : "obj-1",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"fontsize" : 12.0,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 135.0, 45.0, 49.0, 20.0 ],
									"id" : "obj-25",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"fontsize" : 12.0,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 30.0, 45.0, 33.0, 20.0 ],
									"id" : "obj-13",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess clear",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 30.0, 22.0, 91.0, 20.0 ],
									"id" : "obj-21",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "umenu",
									"items" : "<empty>",
									"fontsize" : 12.0,
									"align" : 1,
									"outlettype" : [ "int", "", "" ],
									"patching_rect" : [ 165.0, 195.0, 138.0, 20.0 ],
									"id" : "obj-2",
									"types" : [  ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"ignoreclick" : 1,
									"numoutlets" : 3
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "mxj net.local",
									"fontsize" : 12.0,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 165.0, 150.0, 77.0, 20.0 ],
									"id" : "obj-6",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "udpsend 255.255.255.255 41337",
									"fontsize" : 12.0,
									"patching_rect" : [ 75.0, 330.0, 191.0, 20.0 ],
									"id" : "obj-14",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"outlettype" : [ "int" ],
									"patching_rect" : [ 30.0, 91.0, 30.0, 30.0 ],
									"id" : "obj-15",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 49.0, 166.0, 30.0, 30.0 ],
									"id" : "obj-16",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qmetro 100",
									"fontsize" : 12.0,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 30.0, 135.0, 71.0, 20.0 ],
									"id" : "obj-17",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "/thum/srvip $1",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 225.0, 255.0, 86.0, 18.0 ],
									"id" : "obj-8",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "" ],
									"patching_rect" : [ 135.0, 15.0, 25.0, 25.0 ],
									"id" : "obj-32",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 330.0, 375.0, 25.0, 25.0 ],
									"id" : "obj-34",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-13", 1 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 53.5, 78.0, 174.5, 78.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 270.0, 84.5, 270.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 234.0, 222.0, 264.5, 222.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 232.5, 180.0, 339.5, 180.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 1 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 53.5, 78.0, 339.5, 78.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-25", 0 ],
									"hidden" : 0,
									"midpoints" : [ 144.5, 42.0, 144.5, 42.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 144.5, 180.0, 174.5, 180.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 1 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 174.5, 66.0, 174.5, 66.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 78.0, 174.5, 78.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 42.0, 39.5, 42.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 1 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 53.5, 78.0, 150.0, 78.0, 150.0, 180.0, 174.5, 180.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 174.5, 171.0, 174.5, 171.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 66.0, 39.5, 66.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 234.0, 216.0, 234.5, 216.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-9", 1 ],
									"hidden" : 0,
									"midpoints" : [ 234.5, 279.0, 234.5, 279.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.5, 318.0, 84.5, 318.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 123.0, 39.5, 123.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 162.0, 58.5, 162.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p display_engine",
					"hidden" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 580.0, 10.0, 101.0, 20.0 ],
					"id" : "obj-22",
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 64.0, 372.0, 449.0, 281.0 ],
						"bglocked" : 0,
						"defrect" : [ 64.0, 372.0, 449.0, 281.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
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
									"maxclass" : "newobj",
									"text" : "r display_msg",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 22.0, 21.0, 85.0, 20.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"numinlets" : 0,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 276.0, 233.0, 25.0, 25.0 ],
									"id" : "obj-1",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "size 115 50",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 276.0, 185.0, 71.0, 18.0 ],
									"id" : "obj-10",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadbang",
									"fontsize" : 12.0,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 31.0, 70.0, 60.0, 20.0 ],
									"id" : "obj-26",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "jit.fpsgui",
									"fontsize" : 11.595187,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 31.0, 206.0, 80.0, 35.0 ],
									"id" : "obj-20",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b erase",
									"fontsize" : 11.595187,
									"outlettype" : [ "bang", "erase" ],
									"patching_rect" : [ 31.0, 132.0, 54.0, 20.0 ],
									"id" : "obj-85",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qmetro 100",
									"fontsize" : 11.595187,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 31.0, 107.0, 69.0, 20.0 ],
									"id" : "obj-87",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.gl.render keydisplay",
									"fontsize" : 11.595187,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 31.0, 184.0, 125.0, 20.0 ],
									"id" : "obj-92",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.gl.text2d @color 100. 100. 100. 1. @tracking 1.1 @align 1 @position 0. -0.4",
									"fontsize" : 11.595187,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 22.0, 43.0, 411.0, 20.0 ],
									"id" : "obj-94",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "name keydisplay",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 170.0, 185.0, 100.0, 18.0 ],
									"id" : "obj-6",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-94", 0 ],
									"hidden" : 0,
									"midpoints" : [ 31.5, 43.0, 31.5, 43.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 179.5, 220.0, 285.5, 220.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 285.5, 205.0, 285.5, 205.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-85", 1 ],
									"destination" : [ "obj-92", 0 ],
									"hidden" : 0,
									"midpoints" : [ 75.5, 169.0, 40.5, 169.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-85", 0 ],
									"destination" : [ "obj-92", 0 ],
									"hidden" : 0,
									"midpoints" : [ 40.5, 154.0, 40.5, 154.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-92", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [ 40.5, 205.0, 40.5, 205.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-87", 0 ],
									"destination" : [ "obj-85", 0 ],
									"hidden" : 0,
									"midpoints" : [ 40.5, 127.0, 40.5, 127.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 40.5, 91.0, 179.5, 91.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 40.5, 91.0, 285.5, 91.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-87", 0 ],
									"hidden" : 0,
									"midpoints" : [ 40.5, 91.0, 40.5, 91.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.pwindow",
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 580.0, 30.0, 115.0, 50.0 ],
					"presentation" : 1,
					"id" : "obj-5",
					"dstrect" : [ 0, 0, 0, 0 ],
					"numinlets" : 1,
					"presentation_rect" : [ 690.0, 30.0, 115.0, 50.0 ],
					"numoutlets" : 2,
					"name" : "keydisplay"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p test_seq",
					"fontsize" : 12.0,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 900.0, 260.0, 66.0, 20.0 ],
					"id" : "obj-44",
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 283.0, 143.0, 568.0, 558.0 ],
						"bglocked" : 0,
						"defrect" : [ 283.0, 143.0, 568.0, 558.0 ],
						"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
						"openinpresentation" : 0,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 0,
						"gridsize" : [ 20.0, 10.0 ],
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
									"text" : "sel 0",
									"fontsize" : 12.0,
									"outlettype" : [ "bang", "" ],
									"patching_rect" : [ 50.0, 240.0, 36.0, 20.0 ],
									"id" : "obj-48",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "counter 3",
									"fontsize" : 12.0,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 50.0, 220.0, 73.0, 20.0 ],
									"id" : "obj-39",
									"fontname" : "Arial",
									"numinlets" : 5,
									"numoutlets" : 4
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pipe",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 240.0, 33.0, 20.0 ],
									"id" : "obj-31",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"outlettype" : [ "int" ],
									"patching_rect" : [ 330.0, 280.0, 20.0, 20.0 ],
									"id" : "obj-36",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "80",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 530.0, 320.0, 32.5, 18.0 ],
									"id" : "obj-47",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b b b",
									"fontsize" : 12.0,
									"outlettype" : [ "bang", "bang", "bang" ],
									"patching_rect" : [ 450.0, 280.0, 46.0, 20.0 ],
									"id" : "obj-46",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 3
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"outlettype" : [ "int" ],
									"patching_rect" : [ 450.0, 160.0, 20.0, 20.0 ],
									"id" : "obj-40",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "80",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 490.0, 320.0, 32.5, 18.0 ],
									"id" : "obj-38",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "36",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 450.0, 320.0, 32.5, 18.0 ],
									"id" : "obj-35",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 450.0, 260.0, 20.0, 20.0 ],
									"id" : "obj-33",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 4n",
									"fontsize" : 12.0,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 450.0, 180.0, 58.0, 20.0 ],
									"id" : "obj-30",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "route pipe",
									"hidden" : 1,
									"fontsize" : 12.0,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 330.0, 100.0, 64.0, 20.0 ],
									"id" : "obj-29",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r thum_msg_2",
									"hidden" : 1,
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 330.0, 80.0, 87.0, 20.0 ],
									"id" : "obj-28",
									"fontname" : "Arial",
									"numinlets" : 0,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "offset from C4",
									"fontsize" : 12.0,
									"patching_rect" : [ 100.0, 380.0, 87.0, 20.0 ],
									"id" : "obj-27",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "hi hat",
									"fontface" : 1,
									"fontsize" : 12.0,
									"patching_rect" : [ 350.0, 130.0, 42.0, 20.0 ],
									"id" : "obj-23",
									"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "harmonic\n sequence",
									"linecount" : 2,
									"fontface" : 1,
									"fontsize" : 12.0,
									"patching_rect" : [ 80.0, 100.0, 69.0, 34.0 ],
									"id" : "obj-7",
									"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"outlettype" : [ "int" ],
									"patching_rect" : [ 250.0, 160.0, 20.0, 20.0 ],
									"id" : "obj-16",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "metro speed",
									"fontsize" : 12.0,
									"patching_rect" : [ 240.0, 70.0, 75.0, 20.0 ],
									"id" : "obj-21",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"fontsize" : 12.0,
									"outlettype" : [ "int", "bang" ],
									"patching_rect" : [ 190.0, 70.0, 50.0, 20.0 ],
									"id" : "obj-22",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "delay",
									"fontsize" : 12.0,
									"patching_rect" : [ 380.0, 180.0, 38.0, 20.0 ],
									"id" : "obj-19",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "note #",
									"fontsize" : 12.0,
									"patching_rect" : [ 340.0, 240.0, 42.0, 20.0 ],
									"id" : "obj-17",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "100",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 370.0, 340.0, 32.5, 18.0 ],
									"id" : "obj-10",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gswitch2",
									"int" : 1,
									"outlettype" : [ "", "" ],
									"patching_rect" : [ 330.0, 300.0, 59.0, 33.0 ],
									"id" : "obj-9",
									"numinlets" : 2,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 30.0, 200.0, 20.0, 20.0 ],
									"id" : "obj-26",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"fontsize" : 12.0,
									"outlettype" : [ "int", "bang" ],
									"patching_rect" : [ 330.0, 180.0, 45.0, 20.0 ],
									"id" : "obj-24",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pipe",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 250.0, 220.0, 33.0, 20.0 ],
									"id" : "obj-18",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess 10",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 310.0, 450.0, 79.0, 20.0 ],
									"id" : "obj-14",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"fontsize" : 12.0,
									"outlettype" : [ "int", "bang" ],
									"patching_rect" : [ 290.0, 240.0, 50.0, 20.0 ],
									"id" : "obj-12",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 8n",
									"fontsize" : 12.0,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 250.0, 180.0, 58.0, 20.0 ],
									"id" : "obj-6",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 250.0, 250.0, 20.0, 20.0 ],
									"id" : "obj-15",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "500",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 390.0, 390.0, 32.5, 18.0 ],
									"id" : "obj-13",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "50",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 330.0, 340.0, 32.5, 18.0 ],
									"id" : "obj-11",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "42",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 260.0, 390.0, 32.5, 18.0 ],
									"id" : "obj-8",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "makenote",
									"fontsize" : 12.0,
									"outlettype" : [ "float", "float" ],
									"patching_rect" : [ 260.0, 420.0, 149.0, 20.0 ],
									"id" : "obj-5",
									"fontname" : "Arial",
									"numinlets" : 3,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "noteout",
									"fontsize" : 12.0,
									"patching_rect" : [ 260.0, 490.0, 69.0, 20.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"numinlets" : 3,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 1n",
									"fontsize" : 12.0,
									"outlettype" : [ "bang" ],
									"patching_rect" : [ 50.0, 160.0, 58.0, 20.0 ],
									"id" : "obj-4",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"outlettype" : [ "int" ],
									"patching_rect" : [ 50.0, 100.0, 20.0, 20.0 ],
									"id" : "obj-3",
									"numinlets" : 1,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"outlettype" : [ "int" ],
									"patching_rect" : [ 50.0, 50.0, 25.0, 25.0 ],
									"id" : "obj-1",
									"numinlets" : 0,
									"numoutlets" : 1,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 124.0, 321.0, 32.5, 18.0 ],
									"id" : "obj-42",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "-2",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 87.0, 321.0, 32.5, 18.0 ],
									"id" : "obj-41",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"fontsize" : 12.0,
									"outlettype" : [ "int", "bang" ],
									"patching_rect" : [ 50.0, 380.0, 50.0, 20.0 ],
									"id" : "obj-37",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 2
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "select 0 1 2",
									"fontsize" : 12.0,
									"outlettype" : [ "bang", "bang", "bang", "" ],
									"patching_rect" : [ 50.0, 290.0, 130.0, 20.0 ],
									"id" : "obj-34",
									"fontname" : "Arial",
									"numinlets" : 1,
									"numoutlets" : 4
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "counter 2",
									"fontsize" : 12.0,
									"outlettype" : [ "int", "", "", "int" ],
									"patching_rect" : [ 50.0, 268.0, 73.0, 20.0 ],
									"id" : "obj-32",
									"fontname" : "Arial",
									"numinlets" : 5,
									"numoutlets" : 4
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "-5",
									"fontsize" : 12.0,
									"outlettype" : [ "" ],
									"patching_rect" : [ 50.0, 321.0, 32.5, 18.0 ],
									"id" : "obj-20",
									"fontname" : "Arial",
									"numinlets" : 2,
									"numoutlets" : 1
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"patching_rect" : [ 50.0, 470.0, 25.0, 25.0 ],
									"id" : "obj-43",
									"numinlets" : 1,
									"numoutlets" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"mode" : 1,
									"patching_rect" : [ 20.0, 90.0, 172.0, 321.0 ],
									"id" : "obj-64",
									"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ],
									"rounded" : 50,
									"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"mode" : 1,
									"patching_rect" : [ 240.0, 90.0, 184.0, 430.0 ],
									"id" : "obj-25",
									"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ],
									"rounded" : 50,
									"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
									"numinlets" : 1,
									"numoutlets" : 0
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-24", 0 ],
									"destination" : [ "obj-31", 1 ],
									"hidden" : 0,
									"midpoints" : [ 339.5, 225.0, 473.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-31", 0 ],
									"destination" : [ "obj-33", 0 ],
									"hidden" : 0,
									"midpoints" : [ 459.5, 261.0, 459.5, 261.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-30", 0 ],
									"destination" : [ "obj-31", 0 ],
									"hidden" : 0,
									"midpoints" : [ 459.5, 201.0, 459.5, 201.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-33", 0 ],
									"destination" : [ "obj-46", 0 ],
									"hidden" : 0,
									"midpoints" : [ 459.5, 282.0, 459.5, 282.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 240.0, 259.5, 240.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 201.0, 259.5, 201.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 0 ],
									"destination" : [ "obj-18", 1 ],
									"hidden" : 0,
									"midpoints" : [ 339.5, 216.0, 273.5, 216.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-40", 0 ],
									"destination" : [ "obj-30", 0 ],
									"hidden" : 0,
									"midpoints" : [ 459.5, 180.0, 459.5, 180.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-28", 0 ],
									"destination" : [ "obj-29", 0 ],
									"hidden" : 1,
									"midpoints" : [ 339.5, 102.0, 339.5, 102.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-29", 0 ],
									"destination" : [ "obj-24", 0 ],
									"hidden" : 1,
									"midpoints" : [ 339.5, 120.0, 339.5, 120.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 75.0, 59.5, 75.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-37", 0 ],
									"destination" : [ "obj-43", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 402.0, 59.5, 402.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 288.0, 59.5, 288.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 133.5, 366.0, 59.5, 366.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-41", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 96.5, 366.0, 59.5, 366.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 2 ],
									"destination" : [ "obj-42", 0 ],
									"hidden" : 0,
									"midpoints" : [ 133.5, 312.0, 133.5, 312.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 1 ],
									"destination" : [ "obj-41", 0 ],
									"hidden" : 0,
									"midpoints" : [ 96.5, 312.0, 96.5, 312.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 312.0, 59.5, 312.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 339.0, 59.5, 339.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 375.0, 399.5, 375.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 375.0, 269.5, 375.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-5", 2 ],
									"hidden" : 0,
									"midpoints" : [ 399.5, 408.0, 399.5, 408.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-5", 1 ],
									"hidden" : 0,
									"midpoints" : [ 339.5, 405.0, 334.5, 405.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 269.5, 408.0, 269.5, 408.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-2", 1 ],
									"hidden" : 0,
									"midpoints" : [ 399.5, 486.0, 294.5, 486.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 269.5, 441.0, 269.5, 441.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-8", 1 ],
									"hidden" : 0,
									"midpoints" : [ 299.5, 375.0, 283.0, 375.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-2", 2 ],
									"hidden" : 0,
									"midpoints" : [ 319.5, 471.0, 319.5, 471.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 339.5, 333.0, 339.5, 333.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 1 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 379.5, 333.0, 379.5, 333.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-9", 1 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 270.0, 379.5, 270.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-5", 1 ],
									"hidden" : 0,
									"midpoints" : [ 379.5, 375.0, 334.5, 375.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 147.0, 259.5, 147.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 120.0, 59.5, 120.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-26", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 180.0, 39.5, 180.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-4", 1 ],
									"hidden" : 0,
									"midpoints" : [ 199.5, 147.0, 98.5, 147.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 180.0, 259.5, 180.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-6", 1 ],
									"hidden" : 0,
									"midpoints" : [ 199.5, 102.0, 298.5, 102.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-46", 0 ],
									"destination" : [ "obj-35", 0 ],
									"hidden" : 0,
									"midpoints" : [ 459.5, 300.0, 459.5, 300.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-46", 1 ],
									"destination" : [ "obj-38", 0 ],
									"hidden" : 0,
									"midpoints" : [ 473.0, 315.0, 499.5, 315.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 120.0, 75.0, 120.0, 75.0, 87.0, 177.0, 87.0, 177.0, 57.0, 459.5, 57.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-46", 2 ],
									"destination" : [ "obj-47", 0 ],
									"hidden" : 0,
									"midpoints" : [ 486.5, 300.0, 539.5, 300.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-47", 0 ],
									"destination" : [ "obj-5", 2 ],
									"hidden" : 0,
									"midpoints" : [ 539.5, 417.0, 399.5, 417.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-38", 0 ],
									"destination" : [ "obj-5", 1 ],
									"hidden" : 0,
									"midpoints" : [ 499.5, 375.0, 334.5, 375.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-35", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 459.5, 375.0, 303.0, 375.0, 303.0, 414.0, 269.5, 414.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-36", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 270.0, 315.0, 270.0, 315.0, 276.0, 339.5, 276.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-36", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [ 339.5, 300.0, 339.5, 300.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-36", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 147.0, 237.0, 147.0, 237.0, 282.0, 315.0, 282.0, 315.0, 276.0, 339.5, 276.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-39", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 180.0, 59.5, 180.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-39", 0 ],
									"destination" : [ "obj-48", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 240.0, 59.5, 240.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-48", 0 ],
									"destination" : [ "obj-32", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 261.0, 59.5, 261.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"globalpatchername" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 5",
					"hidden" : 1,
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 980.0, 240.0, 72.0, 20.0 ],
					"id" : "obj-72",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "loadbang",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 860.0, 480.0, 60.0, 18.0 ],
					"id" : "obj-71",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "key $1",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 980.0, 330.0, 46.0, 18.0 ],
					"id" : "obj-62",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "player_report",
					"fontface" : 1,
					"fontsize" : 14.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 860.0, 540.0, 98.0, 21.0 ],
					"presentation" : 1,
					"id" : "obj-49",
					"fontname" : "Arial",
					"numinlets" : 2,
					"presentation_rect" : [ 850.0, 230.0, 102.0, 21.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear_players",
					"fontface" : 1,
					"fontsize" : 14.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 860.0, 510.0, 98.0, 21.0 ],
					"presentation" : 1,
					"id" : "obj-10",
					"fontname" : "Arial",
					"numinlets" : 2,
					"presentation_rect" : [ 980.0, 230.0, 102.0, 21.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 980.0, 310.0, 50.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-30",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 790.0, 130.0, 50.0, 20.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "On Mac: en0 for ethernet",
					"fontface" : 1,
					"fontsize" : 10.0,
					"patching_rect" : [ 180.0, 30.0, 126.0, 18.0 ],
					"presentation" : 1,
					"id" : "obj-19",
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 250.0, 40.0, 126.0, 18.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Select an interface FIRST",
					"fontsize" : 12.0,
					"patching_rect" : [ 120.0, 10.0, 155.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-11",
					"bgcolor" : [ 1.0, 0.501961, 0.501961, 1.0 ],
					"fontname" : "Arial Bold",
					"numinlets" : 1,
					"presentation_rect" : [ 220.0, 20.0, 153.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"items" : [ "en0", ",", "lo0" ],
					"fontsize" : 16.0,
					"framecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"outlettype" : [ "int", "", "" ],
					"patching_rect" : [ 40.0, 10.0, 78.0, 25.0 ],
					"presentation" : 1,
					"id" : "obj-12",
					"types" : [  ],
					"bgcolor" : [ 1.0, 0.301961, 0.301961, 1.0 ],
					"fontname" : "Arial Bold",
					"numinlets" : 1,
					"bgcolor2" : [ 1.0, 0.501961, 0.501961, 1.0 ],
					"presentation_rect" : [ 140.0, 20.0, 78.0, 25.0 ],
					"numoutlets" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open $1",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 260.0, 54.0, 18.0 ],
					"id" : "obj-26",
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"fontsize" : 12.0,
					"outlettype" : [ "int", "bang" ],
					"patching_rect" : [ 40.0, 240.0, 50.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-27",
					"minimum" : 0,
					"fontname" : "Arial",
					"maximum" : 20,
					"numinlets" : 1,
					"presentation_rect" : [ 130.0, 320.0, 50.0, 20.0 ],
					"numoutlets" : 2
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r thum_msg_2",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 160.0, 320.0, 87.0, 20.0 ],
					"id" : "obj-24",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "poly~ Thumbafon_Poly",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 40.0, 340.0, 139.0, 20.0 ],
					"id" : "obj-23",
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r thum_msg_1",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 140.0, 290.0, 87.0, 20.0 ],
					"id" : "obj-18",
					"fontname" : "Arial",
					"numinlets" : 0,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend parse",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 820.0, 450.0, 88.0, 20.0 ],
					"id" : "obj-4",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js Thumbafon.js",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 820.0, 630.0, 95.0, 20.0 ],
					"id" : "obj-3",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 1337",
					"fontsize" : 12.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 820.0, 430.0, 99.0, 20.0 ],
					"id" : "obj-1",
					"fontname" : "Arial",
					"numinlets" : 1,
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "key offset slider",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 1010.0, 270.0, 100.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-74",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 700.0, 110.0, 100.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "change mode slider",
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 1020.0, 370.0, 125.0, 20.0 ],
					"presentation" : 1,
					"id" : "obj-13",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"presentation_rect" : [ 700.0, 170.0, 125.0, 20.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"outlettype" : [ "" ],
					"patching_rect" : [ 1000.0, 360.0, 160.0, 40.0 ],
					"presentation" : 1,
					"id" : "obj-41",
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"size" : 6.0,
					"knobcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"presentation_rect" : [ 680.0, 170.0, 160.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"outlettype" : [ "" ],
					"patching_rect" : [ 980.0, 260.0, 184.0, 40.0 ],
					"presentation" : 1,
					"id" : "obj-33",
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"size" : 13.0,
					"knobcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"min" : -5.0,
					"presentation_rect" : [ 660.0, 110.0, 179.0, 20.0 ],
					"numoutlets" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"mode" : 1,
					"patching_rect" : [ 200.0, 120.0, 275.0, 92.0 ],
					"presentation" : 1,
					"id" : "obj-64",
					"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ],
					"rounded" : 50,
					"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
					"numinlets" : 1,
					"presentation_rect" : [ 20.0, 90.0, 271.0, 149.0 ],
					"numoutlets" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"fontface" : 1,
					"fontsize" : 14.0,
					"outlettype" : [ "" ],
					"patching_rect" : [ 620.0, 260.0, 48.0, 21.0 ],
					"presentation" : 1,
					"id" : "obj-82",
					"fontname" : "Arial",
					"numinlets" : 2,
					"presentation_rect" : [ 370.0, 260.0, 46.0, 21.0 ],
					"numoutlets" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-106", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 1,
					"midpoints" : [ 209.5, 156.0, 229.5, 156.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-87", 0 ],
					"hidden" : 1,
					"midpoints" : [ 289.5, 462.0, 289.5, 462.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-92", 0 ],
					"destination" : [ "obj-55", 1 ],
					"hidden" : 0,
					"midpoints" : [ 429.5, 362.0, 429.5, 362.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [ 629.5, 326.0, 389.5, 326.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-70", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [ 389.5, 314.0, 389.5, 314.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 142.0, 569.5, 142.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-126", 2 ],
					"destination" : [ "obj-128", 0 ],
					"hidden" : 0,
					"midpoints" : [ 209.833328, 411.0, 209.5, 411.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-128", 0 ],
					"destination" : [ "obj-130", 0 ],
					"hidden" : 0,
					"midpoints" : [ 209.5, 432.0, 209.5, 432.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-123", 0 ],
					"destination" : [ "obj-126", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 390.0, 169.5, 390.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 303.0, 555.0, 529.5, 555.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 0 ],
					"destination" : [ "obj-86", 0 ],
					"hidden" : 0,
					"midpoints" : [ 289.5, 531.0, 289.5, 531.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-23", 1 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 342.0, 169.5, 342.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 49.5, 279.0, 49.5, 279.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 149.5, 327.0, 49.5, 327.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 327.0, 49.5, 327.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 49.5, 360.0, 49.5, 360.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 869.5, 500.0, 829.5, 500.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 869.5, 575.0, 829.5, 575.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 869.5, 533.0, 829.5, 533.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 829.5, 470.0, 829.5, 470.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 869.5, 611.0, 829.5, 611.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 1,
					"midpoints" : [ 289.5, 477.0, 429.5, 477.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 43.0, 555.0, 529.5, 555.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [ 29.5, 516.0, 29.5, 516.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [ 29.5, 540.0, 29.5, 540.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [ 429.5, 510.0, 429.5, 510.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 443.0, 555.0, 529.5, 555.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 429.5, 531.0, 429.5, 531.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 531.0, 169.5, 531.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 183.0, 555.0, 529.5, 555.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 510.0, 169.5, 510.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 989.5, 575.0, 869.5, 575.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1009.5, 575.0, 869.5, 575.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 575.0, 869.5, 575.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 362.0, 809.5, 362.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1009.5, 422.0, 1009.5, 422.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-6", 1 ],
					"hidden" : 1,
					"midpoints" : [ 469.5, 30.0, 469.5, 30.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 1,
					"midpoints" : [ 989.5, 260.0, 989.5, 260.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [ 989.5, 332.0, 989.5, 332.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 989.5, 302.0, 989.5, 302.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [ 829.5, 452.0, 829.5, 452.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [ 49.5, 261.0, 49.5, 261.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 909.5, 305.0, 989.5, 305.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 589.5, 30.0, 589.5, 30.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 1,
					"midpoints" : [ 79.5, 60.0, 27.0, 60.0, 27.0, 6.0, 49.5, 6.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 1 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 1,
					"midpoints" : [ 79.0, 36.0, 79.5, 36.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1009.5, 401.0, 1009.5, 401.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [ 49.5, 243.0, 49.5, 243.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 243.0, 109.5, 243.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 261.0, 109.5, 261.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 341.0, 809.5, 341.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [ 909.5, 260.0, 909.5, 260.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 709.5, 575.0, 869.5, 575.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"midpoints" : [ 709.5, 341.0, 709.5, 341.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-129", 0 ],
					"hidden" : 0,
					"midpoints" : [ 629.5, 302.0, 629.5, 302.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-129", 0 ],
					"destination" : [ "obj-122", 0 ],
					"hidden" : 0,
					"midpoints" : [ 629.5, 362.0, 629.5, 362.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-133", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 629.5, 575.0, 869.5, 575.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-122", 0 ],
					"destination" : [ "obj-133", 0 ],
					"hidden" : 0,
					"midpoints" : [ 629.5, 380.0, 629.5, 380.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-60", 1 ],
					"hidden" : 0,
					"midpoints" : [ 349.5, 180.0, 349.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [ 229.5, 180.0, 229.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-119", 0 ],
					"hidden" : 1,
					"midpoints" : [ 629.5, 281.0, 629.5, 281.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 1,
					"midpoints" : [ 349.5, 30.0, 349.5, 30.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 1,
					"midpoints" : [ 289.5, 477.0, 169.5, 477.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-87", 0 ],
					"destination" : [ "obj-85", 0 ],
					"hidden" : 0,
					"midpoints" : [ 289.5, 510.0, 289.5, 510.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-88", 0 ],
					"hidden" : 0,
					"midpoints" : [ 939.5, 112.0, 939.5, 112.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-88", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [ 939.5, 145.0, 1019.5, 145.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 0 ],
					"destination" : [ "obj-91", 1 ],
					"hidden" : 0,
					"midpoints" : [ 1059.5, 139.0, 1059.5, 139.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1059.5, 121.0, 1059.5, 121.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1019.5, 85.0, 1059.5, 85.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1019.5, 70.0, 1019.5, 70.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-93", 0 ],
					"destination" : [ "obj-55", 3 ],
					"hidden" : 0,
					"midpoints" : [ 509.5, 401.0, 509.5, 401.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-90", 0 ],
					"destination" : [ "obj-55", 2 ],
					"hidden" : 0,
					"midpoints" : [ 469.5, 380.0, 469.5, 380.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-103", 0 ],
					"hidden" : 0,
					"midpoints" : [ 939.5, 46.0, 1019.5, 46.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [ 939.5, 31.0, 939.5, 31.0 ]
				}

			}
 ]
	}

}
