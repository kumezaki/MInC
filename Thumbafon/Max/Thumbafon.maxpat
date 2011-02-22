{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ -1042.0, 427.0, 737.0, 316.0 ],
		"bglocked" : 0,
		"defrect" : [ -1042.0, 427.0, 737.0, 316.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 1,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 10.0, 10.0 ],
		"gridsnaponopen" : 2,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 0,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "alert $1",
					"numinlets" : 2,
					"patching_rect" : [ 340.0, 260.0, 51.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-133",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route text",
					"numinlets" : 1,
					"patching_rect" : [ 340.0, 220.0, 61.0, 20.0 ],
					"numoutlets" : 2,
					"id" : "obj-129",
					"fontname" : "Arial",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "tosymbol",
					"numinlets" : 1,
					"patching_rect" : [ 340.0, 240.0, 59.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-122",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"text" : "I'm not too crazy about this text view thing.",
					"numinlets" : 1,
					"patching_rect" : [ 340.0, 140.0, 248.0, 80.0 ],
					"numoutlets" : 4,
					"presentation" : 1,
					"id" : "obj-119",
					"fontname" : "Arial",
					"outlettype" : [ "", "int", "", "" ],
					"presentation_rect" : [ 410.0, 210.0, 248.0, 80.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"patching_rect" : [ 40.0, 470.0, 20.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-114",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gswitch",
					"numinlets" : 3,
					"patching_rect" : [ 40.0, 500.0, 59.0, 21.0 ],
					"numoutlets" : 1,
					"id" : "obj-112",
					"outlettype" : [ "" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Disklavier latency",
					"numinlets" : 1,
					"patching_rect" : [ 100.0, 490.0, 106.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-109",
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 64",
					"hidden" : 1,
					"numinlets" : 1,
					"patching_rect" : [ 150.0, 340.0, 79.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-106",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "midi pgm change",
					"numinlets" : 1,
					"patching_rect" : [ 170.0, 360.0, 107.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-105",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 230.0, 120.0, 111.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Click box to type a broadcast message -  Tab to send it.",
					"numinlets" : 1,
					"patching_rect" : [ 340.0, 120.0, 256.0, 18.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-89",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"presentation_rect" : [ 410.0, 290.0, 255.0, 18.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p Magic_Mode",
					"numinlets" : 1,
					"patching_rect" : [ 370.0, 410.0, 89.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-69",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
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
									"numinlets" : 2,
									"patching_rect" : [ 40.0, 180.0, 57.0, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-1",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b i",
									"numinlets" : 1,
									"patching_rect" : [ 40.0, 70.0, 38.5, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-63",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "int" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "64\\,68\\,71\\,74\\,78\\,82\\,85\\,88",
									"numinlets" : 2,
									"patching_rect" : [ 40.0, 150.0, 164.0, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-56",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "magic $1",
									"numinlets" : 2,
									"patching_rect" : [ 60.0, 120.0, 59.0, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-16",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"patching_rect" : [ 40.0, 40.0, 25.0, 25.0 ],
									"numoutlets" : 1,
									"id" : "obj-67",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"patching_rect" : [ 40.0, 210.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"id" : "obj-68",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-68", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 198.0, 49.5, 198.0 ]
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
									"source" : [ "obj-63", 0 ],
									"destination" : [ "obj-56", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 90.0, 49.5, 90.0 ]
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
									"source" : [ "obj-67", 0 ],
									"destination" : [ "obj-63", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 66.0, 49.5, 66.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-68", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 138.0, 27.0, 138.0, 27.0, 207.0, 49.5, 207.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pipe 500",
					"numinlets" : 2,
					"patching_rect" : [ 80.0, 470.0, 57.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-55",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numinlets" : 1,
					"patching_rect" : [ 150.0, 400.0, 50.0, 20.0 ],
					"numoutlets" : 2,
					"presentation" : 1,
					"id" : "obj-35",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"presentation_rect" : [ 300.0, 160.0, 50.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"numinlets" : 1,
					"patching_rect" : [ 150.0, 380.0, 128.0, 20.0 ],
					"numoutlets" : 1,
					"presentation" : 1,
					"id" : "obj-9",
					"outlettype" : [ "" ],
					"presentation_rect" : [ 220.0, 140.0, 128.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "PANIC!",
					"numinlets" : 1,
					"patching_rect" : [ 90.0, 360.0, 51.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-57",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 130.0, 100.0, 51.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "123 0",
					"numinlets" : 2,
					"patching_rect" : [ 90.0, 380.0, 47.0, 21.0 ],
					"numoutlets" : 1,
					"presentation" : 1,
					"id" : "obj-51",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"fontface" : 3,
					"presentation_rect" : [ 130.0, 80.0, 50.0, 21.0 ],
					"fontsize" : 14.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiformat",
					"numinlets" : 7,
					"patching_rect" : [ 60.0, 440.0, 108.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-54",
					"fontname" : "Arial",
					"outlettype" : [ "int" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiout",
					"numinlets" : 1,
					"patching_rect" : [ 40.0, 530.0, 49.0, 20.0 ],
					"numoutlets" : 0,
					"id" : "obj-31",
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "marq $1",
					"numinlets" : 2,
					"patching_rect" : [ 420.0, 280.0, 55.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-28",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend send_all",
					"numinlets" : 1,
					"patching_rect" : [ 550.0, 460.0, 103.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-21",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "mode $1",
					"numinlets" : 2,
					"patching_rect" : [ 670.0, 400.0, 57.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-15",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "poly~ instances",
					"numinlets" : 1,
					"patching_rect" : [ 50.0, 100.0, 99.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-47",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 150.0, 220.0, 100.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "server IP",
					"numinlets" : 1,
					"patching_rect" : [ 460.0, 40.0, 60.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-46",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 40.0, 10.0, 59.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "current key offset",
					"numinlets" : 1,
					"patching_rect" : [ 560.0, 80.0, 115.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-45",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 570.0, 10.0, 115.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"patching_rect" : [ 610.0, 160.0, 20.0, 20.0 ],
					"numoutlets" : 1,
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"id" : "obj-42",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.45098, 0.65098, 1.0, 1.0 ],
					"presentation_rect" : [ 400.0, 90.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"patching_rect" : [ 420.0, 240.0, 20.0, 20.0 ],
					"numoutlets" : 1,
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"id" : "obj-40",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.45098, 0.65098, 1.0, 1.0 ],
					"presentation_rect" : [ 400.0, 150.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"patching_rect" : [ 370.0, 380.0, 20.0, 20.0 ],
					"numoutlets" : 1,
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"presentation" : 1,
					"id" : "obj-38",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.45098, 0.65098, 1.0, 1.0 ],
					"presentation_rect" : [ 400.0, 120.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "close",
					"numinlets" : 1,
					"patching_rect" : [ 110.0, 120.0, 39.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-34",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 210.0, 250.0, 39.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "open",
					"numinlets" : 1,
					"patching_rect" : [ 50.0, 120.0, 40.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-32",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 10.0, 250.0, 40.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"numinlets" : 1,
					"patching_rect" : [ 120.0, 140.0, 21.0, 100.0 ],
					"numoutlets" : 1,
					"presentation" : 1,
					"id" : "obj-20",
					"outlettype" : [ "" ],
					"size" : 9.0,
					"presentation_rect" : [ 250.0, 250.0, 131.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"minimum" : 0,
					"numinlets" : 1,
					"maximum" : 8,
					"patching_rect" : [ 120.0, 240.0, 50.0, 20.0 ],
					"numoutlets" : 2,
					"presentation" : 1,
					"id" : "obj-25",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"presentation_rect" : [ 330.0, 270.0, 50.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "wclose $1",
					"numinlets" : 2,
					"patching_rect" : [ 120.0, 260.0, 62.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-17",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"numinlets" : 1,
					"patching_rect" : [ 60.0, 140.0, 21.0, 100.0 ],
					"numoutlets" : 1,
					"presentation" : 1,
					"id" : "obj-52",
					"outlettype" : [ "" ],
					"size" : 9.0,
					"presentation_rect" : [ 50.0, 250.0, 131.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "magic mode",
					"numinlets" : 1,
					"patching_rect" : [ 390.0, 380.0, 83.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-50",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 420.0, 120.0, 83.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p osc_definitions",
					"numinlets" : 0,
					"patching_rect" : [ 350.0, 60.0, 111.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-2",
					"fontname" : "Arial",
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 410.0, 30.0, 111.0, 20.0 ],
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ -502.0, 526.0, 460.0, 365.0 ],
						"bglocked" : 0,
						"defrect" : [ -502.0, 526.0, 460.0, 365.0 ],
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
									"numinlets" : 1,
									"patching_rect" : [ 45.0, 180.0, 154.0, 20.0 ],
									"numoutlets" : 0,
									"id" : "obj-8",
									"fontname" : "Arial",
									"bgcolor" : [ 0.45098, 0.74902, 0.94902, 1.0 ],
									"fontface" : 1,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "All messages are sent to/from as C  strings",
									"numinlets" : 1,
									"patching_rect" : [ 105.0, 30.0, 256.0, 20.0 ],
									"numoutlets" : 0,
									"id" : "obj-7",
									"fontname" : "Arial Bold",
									"bgcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Messages FROM Thumbafon",
									"numinlets" : 1,
									"patching_rect" : [ 45.0, 60.0, 175.0, 20.0 ],
									"numoutlets" : 0,
									"id" : "obj-6",
									"fontname" : "Arial",
									"bgcolor" : [ 0.45098, 0.74902, 1.0, 1.0 ],
									"fontface" : 1,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "/thum/join = joining performance\n/thum/leave = leaving performance\n/thum/butt = button message\n/thum/hint = hint button\n/thum/prev = alert window \"Previous\" button",
									"linecount" : 5,
									"numinlets" : 1,
									"patching_rect" : [ 45.0, 90.0, 241.0, 75.0 ],
									"numoutlets" : 0,
									"id" : "obj-3",
									"fontname" : "Arial",
									"bgcolor" : [ 0.45098, 0.74902, 1.0, 1.0 ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "/thum/1butt = alert message\n/thum/2butt = alert message w/ back button\n/thum/key = offsets the base note w/ signed ints (zero is C)\n/thum/mode = changes the modal scale of the device (integer 0 to 5)\n/thum/notes = comma separated note set of 8 midi note #'s. (0 - 88)\n/thum/magic = turns \"magic mode\" on (zero or non-zero)\n/thum/marq = display message in the main view marquee\n/thum/srvip = server IP address",
									"linecount" : 8,
									"numinlets" : 1,
									"patching_rect" : [ 45.0, 210.0, 377.0, 117.0 ],
									"numoutlets" : 0,
									"id" : "obj-2",
									"fontname" : "Arial",
									"bgcolor" : [ 0.45098, 0.74902, 0.94902, 1.0 ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"numinlets" : 1,
									"rounded" : 50,
									"mode" : 1,
									"patching_rect" : [ 30.0, 15.0, 406.0, 331.0 ],
									"numoutlets" : 0,
									"grad1" : [ 0.45098, 0.74902, 1.0, 1.0 ],
									"id" : "obj-9",
									"bgcolor" : [ 0.439216, 0.639216, 0.980392, 1.0 ],
									"grad2" : [ 0.45098, 0.6, 1.0, 1.0 ]
								}

							}
 ],
						"lines" : [  ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "marquee messages",
					"numinlets" : 1,
					"patching_rect" : [ 440.0, 240.0, 121.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-14",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 420.0, 150.0, 123.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p MainView_Test_Messages",
					"numinlets" : 1,
					"patching_rect" : [ 420.0, 260.0, 162.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-59",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
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
									"numinlets" : 1,
									"patching_rect" : [ 75.0, 180.0, 75.0, 20.0 ],
									"numoutlets" : 4,
									"id" : "obj-2",
									"fontname" : "Arial",
									"outlettype" : [ "", "", "", "" ],
									"fontsize" : 12.0,
									"saved_object_attributes" : 									{
										"embed" : 0
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"numinlets" : 2,
									"patching_rect" : [ 106.5, 135.0, 32.5, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-54",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "counter 0 146",
									"numinlets" : 5,
									"patching_rect" : [ 74.5, 155.0, 84.0, 20.0 ],
									"numoutlets" : 4,
									"id" : "obj-40",
									"fontname" : "Arial",
									"outlettype" : [ "int", "", "", "int" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 3000",
									"numinlets" : 2,
									"patching_rect" : [ 75.0, 90.0, 71.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-34",
									"fontname" : "Arial",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"patching_rect" : [ 75.0, 30.0, 25.0, 25.0 ],
									"numoutlets" : 1,
									"id" : "obj-57",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"patching_rect" : [ 75.0, 210.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"id" : "obj-58",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-57", 0 ],
									"destination" : [ "obj-54", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.5, 75.0, 60.0, 75.0, 60.0, 120.0, 116.0, 120.0 ]
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
									"source" : [ "obj-54", 0 ],
									"destination" : [ "obj-40", 2 ],
									"hidden" : 0,
									"midpoints" : [ 116.0, 153.0, 116.5, 153.0 ]
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
									"source" : [ "obj-34", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.5, 111.0, 84.0, 111.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-58", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.5, 201.0, 84.5, 201.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numinlets" : 1,
					"patching_rect" : [ 670.0, 380.0, 50.0, 20.0 ],
					"numoutlets" : 2,
					"presentation" : 1,
					"id" : "obj-43",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"presentation_rect" : [ 660.0, 180.0, 50.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r server_IP",
					"hidden" : 1,
					"numinlets" : 0,
					"patching_rect" : [ 370.0, 10.0, 69.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-8",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "10.0.1.16",
					"numinlets" : 2,
					"patching_rect" : [ 350.0, 40.0, 110.0, 18.0 ],
					"numoutlets" : 1,
					"presentation" : 1,
					"id" : "obj-6",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"presentation_rect" : [ 20.0, 30.0, 110.0, 18.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "test seq",
					"numinlets" : 1,
					"patching_rect" : [ 630.0, 160.0, 56.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-37",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 420.0, 90.0, 56.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p server_heartbeat",
					"hidden" : 1,
					"numinlets" : 1,
					"patching_rect" : [ 80.0, 60.0, 111.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-36",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 325.0, 350.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 325.0, 350.0 ],
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
									"text" : "s server_IP",
									"numinlets" : 1,
									"patching_rect" : [ 188.0, 218.0, 71.0, 20.0 ],
									"numoutlets" : 0,
									"id" : "obj-1",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"numinlets" : 1,
									"patching_rect" : [ 176.0, 142.0, 33.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-25",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"numinlets" : 1,
									"patching_rect" : [ 26.0, 45.0, 33.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-13",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess clear",
									"numinlets" : 1,
									"patching_rect" : [ 26.0, 22.0, 91.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-21",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "umenu",
									"numinlets" : 1,
									"items" : [ "10.0.1.16", ",", "fe80:0:0:0:226:b0ff:fedf:4bd0%4" ],
									"patching_rect" : [ 137.0, 179.0, 120.0, 20.0 ],
									"align" : 1,
									"numoutlets" : 3,
									"id" : "obj-2",
									"fontname" : "Arial",
									"outlettype" : [ "int", "", "" ],
									"ignoreclick" : 1,
									"fontsize" : 12.0,
									"types" : [  ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "mxj net.local",
									"numinlets" : 1,
									"patching_rect" : [ 137.0, 79.0, 77.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-6",
									"fontname" : "Arial",
									"outlettype" : [ "", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "udpsend 255.255.255.255 41337",
									"numinlets" : 1,
									"patching_rect" : [ 26.0, 252.0, 187.0, 20.0 ],
									"numoutlets" : 0,
									"id" : "obj-14",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"numinlets" : 1,
									"patching_rect" : [ 26.0, 97.0, 30.0, 30.0 ],
									"numoutlets" : 1,
									"id" : "obj-15",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"numinlets" : 1,
									"patching_rect" : [ 45.0, 172.0, 30.0, 30.0 ],
									"numoutlets" : 1,
									"id" : "obj-16",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qmetro 100",
									"numinlets" : 2,
									"patching_rect" : [ 26.0, 141.0, 71.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-17",
									"fontname" : "Arial",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "/thum/srvip $1",
									"numinlets" : 2,
									"patching_rect" : [ 26.0, 223.0, 86.0, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-8",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"patching_rect" : [ 176.0, 106.0, 25.0, 25.0 ],
									"numoutlets" : 1,
									"id" : "obj-32",
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"patching_rect" : [ 262.5, 286.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"id" : "obj-34",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [ 35.5, 66.0, 35.5, 66.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [ 35.5, 243.0, 35.5, 243.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 146.5, 99.0, 146.5, 99.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 197.0, 210.0, 35.5, 210.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 1 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 84.0, 123.0, 84.0, 123.0, 165.0, 146.5, 165.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [ 35.5, 42.0, 35.5, 42.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 35.5, 75.0, 146.5, 75.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 1 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 199.5, 162.0, 123.0, 162.0, 123.0, 75.0, 146.5, 75.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 185.5, 162.0, 146.5, 162.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [ 35.5, 129.0, 35.5, 129.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [ 35.5, 168.0, 54.5, 168.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 35.5, 162.0, 35.5, 162.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-25", 0 ],
									"hidden" : 0,
									"midpoints" : [ 185.5, 132.0, 185.5, 132.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 1 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 84.0, 123.0, 84.0, 123.0, 210.0, 272.0, 210.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 204.5, 99.0, 272.0, 99.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p display_engine",
					"hidden" : 1,
					"numinlets" : 0,
					"patching_rect" : [ 560.0, 10.0, 101.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-22",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
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
									"numinlets" : 0,
									"patching_rect" : [ 22.0, 21.0, 85.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-2",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"patching_rect" : [ 276.0, 233.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"id" : "obj-1",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "size 115 50",
									"numinlets" : 2,
									"patching_rect" : [ 276.0, 185.0, 71.0, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-10",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadbang",
									"numinlets" : 1,
									"patching_rect" : [ 31.0, 70.0, 60.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-26",
									"fontname" : "Arial",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "jit.fpsgui",
									"numinlets" : 1,
									"patching_rect" : [ 31.0, 206.0, 80.0, 35.0 ],
									"numoutlets" : 2,
									"id" : "obj-20",
									"fontname" : "Arial",
									"outlettype" : [ "", "" ],
									"fontsize" : 11.595187
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b erase",
									"numinlets" : 1,
									"patching_rect" : [ 31.0, 132.0, 54.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-85",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "erase" ],
									"fontsize" : 11.595187
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qmetro 100",
									"numinlets" : 2,
									"patching_rect" : [ 31.0, 107.0, 69.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-87",
									"fontname" : "Arial",
									"outlettype" : [ "bang" ],
									"fontsize" : 11.595187
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.gl.render keydisplay",
									"numinlets" : 1,
									"patching_rect" : [ 31.0, 184.0, 125.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-92",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "" ],
									"fontsize" : 11.595187
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.gl.text2d @color 100. 100. 100. 1. @tracking 1.1 @align 1 @position 0. -0.4",
									"numinlets" : 1,
									"patching_rect" : [ 22.0, 43.0, 411.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-94",
									"fontname" : "Arial",
									"outlettype" : [ "", "" ],
									"fontsize" : 11.595187
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "name keydisplay",
									"numinlets" : 2,
									"patching_rect" : [ 170.0, 185.0, 100.0, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-6",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-87", 0 ],
									"hidden" : 0,
									"midpoints" : [ 40.5, 91.0, 40.5, 91.0 ]
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
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 40.5, 91.0, 179.5, 91.0 ]
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
									"source" : [ "obj-92", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [ 40.5, 205.0, 40.5, 205.0 ]
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
									"source" : [ "obj-85", 1 ],
									"destination" : [ "obj-92", 0 ],
									"hidden" : 0,
									"midpoints" : [ 75.5, 169.0, 40.5, 169.0 ]
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
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 179.5, 220.0, 285.5, 220.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-94", 0 ],
									"hidden" : 0,
									"midpoints" : [ 31.5, 43.0, 31.5, 43.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.pwindow",
					"numinlets" : 1,
					"patching_rect" : [ 560.0, 30.0, 115.0, 50.0 ],
					"numoutlets" : 2,
					"presentation" : 1,
					"dstrect" : [ 0, 0, 0, 0 ],
					"id" : "obj-5",
					"outlettype" : [ "", "" ],
					"presentation_rect" : [ 570.0, 30.0, 115.0, 50.0 ],
					"name" : "keydisplay"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p test_seq",
					"numinlets" : 1,
					"patching_rect" : [ 610.0, 180.0, 66.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-44",
					"fontname" : "Arial",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 364.0, 454.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 364.0, 454.0 ],
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
									"maxclass" : "toggle",
									"numinlets" : 1,
									"patching_rect" : [ 180.0, 60.0, 20.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-16",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "metro speed",
									"numinlets" : 1,
									"patching_rect" : [ 230.0, 60.0, 80.0, 20.0 ],
									"numoutlets" : 0,
									"id" : "obj-21",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"numinlets" : 1,
									"patching_rect" : [ 230.0, 80.0, 50.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-22",
									"fontname" : "Arial",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "delay time",
									"numinlets" : 1,
									"patching_rect" : [ 259.0, 112.0, 64.0, 20.0 ],
									"numoutlets" : 0,
									"id" : "obj-19",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "note #",
									"numinlets" : 1,
									"patching_rect" : [ 230.0, 170.0, 42.0, 20.0 ],
									"numoutlets" : 0,
									"id" : "obj-17",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "80",
									"numinlets" : 2,
									"patching_rect" : [ 290.0, 270.0, 32.5, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-10",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gswitch2",
									"numinlets" : 2,
									"patching_rect" : [ 250.0, 230.0, 59.0, 33.0 ],
									"numoutlets" : 2,
									"id" : "obj-9",
									"outlettype" : [ "", "" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"numinlets" : 1,
									"patching_rect" : [ 20.0, 220.0, 20.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-26",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"numinlets" : 1,
									"patching_rect" : [ 257.0, 134.0, 50.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-24",
									"fontname" : "Arial",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "delay",
									"numinlets" : 2,
									"patching_rect" : [ 180.0, 160.0, 39.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-18",
									"fontname" : "Arial",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess 10",
									"numinlets" : 1,
									"patching_rect" : [ 230.0, 380.0, 79.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-14",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"numinlets" : 1,
									"patching_rect" : [ 230.0, 190.0, 50.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-12",
									"fontname" : "Arial",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 250",
									"numinlets" : 2,
									"patching_rect" : [ 180.0, 120.0, 69.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-6",
									"fontname" : "Arial",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"numinlets" : 1,
									"patching_rect" : [ 180.0, 190.0, 20.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-15",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "500",
									"numinlets" : 2,
									"patching_rect" : [ 310.0, 320.0, 32.5, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-13",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "100",
									"numinlets" : 2,
									"patching_rect" : [ 250.0, 270.0, 32.5, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-11",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "42",
									"numinlets" : 2,
									"patching_rect" : [ 180.0, 320.0, 32.5, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-8",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "makenote",
									"numinlets" : 3,
									"patching_rect" : [ 180.0, 350.0, 149.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-5",
									"fontname" : "Arial",
									"outlettype" : [ "float", "float" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "noteout",
									"numinlets" : 3,
									"patching_rect" : [ 180.0, 420.0, 69.0, 20.0 ],
									"numoutlets" : 0,
									"id" : "obj-2",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 1000",
									"numinlets" : 2,
									"patching_rect" : [ 40.0, 180.0, 71.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-4",
									"fontname" : "Arial",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"numinlets" : 1,
									"patching_rect" : [ 40.0, 70.0, 20.0, 20.0 ],
									"numoutlets" : 1,
									"id" : "obj-3",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"patching_rect" : [ 40.0, 10.0, 25.0, 25.0 ],
									"numoutlets" : 1,
									"id" : "obj-1",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "-2",
									"numinlets" : 2,
									"patching_rect" : [ 114.0, 273.0, 32.5, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-42",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "3",
									"numinlets" : 2,
									"patching_rect" : [ 77.0, 273.0, 32.5, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-41",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"numinlets" : 1,
									"patching_rect" : [ 40.0, 330.0, 50.0, 20.0 ],
									"numoutlets" : 2,
									"id" : "obj-37",
									"fontname" : "Arial",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "select 0 1 2",
									"numinlets" : 1,
									"patching_rect" : [ 40.0, 242.0, 130.0, 20.0 ],
									"numoutlets" : 4,
									"id" : "obj-34",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "bang", "bang", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "counter 2",
									"numinlets" : 5,
									"patching_rect" : [ 40.0, 220.0, 73.0, 20.0 ],
									"numoutlets" : 4,
									"id" : "obj-32",
									"fontname" : "Arial",
									"outlettype" : [ "int", "", "", "int" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"numinlets" : 2,
									"patching_rect" : [ 40.0, 273.0, 32.5, 18.0 ],
									"numoutlets" : 1,
									"id" : "obj-20",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"patching_rect" : [ 40.0, 420.0, 25.0, 25.0 ],
									"numoutlets" : 0,
									"id" : "obj-43",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 81.0, 189.5, 81.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-6", 1 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 102.0, 239.5, 102.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 105.0, 189.5, 105.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 141.0, 189.5, 141.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-5", 1 ],
									"hidden" : 0,
									"midpoints" : [ 299.5, 336.0, 254.5, 336.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-9", 1 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 225.0, 299.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 1 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 299.5, 264.0, 299.5, 264.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 225.0, 259.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 264.0, 259.5, 264.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 0 ],
									"destination" : [ "obj-18", 1 ],
									"hidden" : 0,
									"midpoints" : [ 266.5, 156.0, 209.5, 156.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 180.0, 189.5, 180.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-26", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 201.0, 29.5, 201.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-32", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 201.0, 49.5, 201.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 90.0, 49.5, 90.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-2", 2 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 402.0, 239.5, 402.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-8", 1 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 306.0, 203.0, 306.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 372.0, 189.5, 372.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-2", 1 ],
									"hidden" : 0,
									"midpoints" : [ 319.5, 417.0, 214.5, 417.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 339.0, 189.5, 339.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-5", 1 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 336.0, 254.5, 336.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-5", 2 ],
									"hidden" : 0,
									"midpoints" : [ 319.5, 339.0, 319.5, 339.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 210.0, 189.5, 210.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 306.0, 319.5, 306.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 291.0, 49.5, 291.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 264.0, 49.5, 264.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 1 ],
									"destination" : [ "obj-41", 0 ],
									"hidden" : 0,
									"midpoints" : [ 86.5, 264.0, 86.5, 264.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 2 ],
									"destination" : [ "obj-42", 0 ],
									"hidden" : 0,
									"midpoints" : [ 123.5, 264.0, 123.5, 264.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-41", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 86.5, 315.0, 49.5, 315.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 123.5, 315.0, 49.5, 315.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 240.0, 49.5, 240.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-37", 0 ],
									"destination" : [ "obj-43", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 351.0, 49.5, 351.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 36.0, 49.5, 36.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontname" : "Arial",
						"globalpatchername" : "",
						"default_fontface" : 0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 5",
					"hidden" : 1,
					"numinlets" : 1,
					"patching_rect" : [ 640.0, 210.0, 72.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-72",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "loadbang",
					"numinlets" : 2,
					"patching_rect" : [ 550.0, 350.0, 60.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-71",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "key $1",
					"numinlets" : 2,
					"patching_rect" : [ 640.0, 300.0, 46.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-62",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "player_report",
					"numinlets" : 2,
					"patching_rect" : [ 550.0, 410.0, 81.0, 18.0 ],
					"numoutlets" : 1,
					"presentation" : 1,
					"id" : "obj-49",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"presentation_rect" : [ 20.0, 70.0, 81.0, 18.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear_players",
					"numinlets" : 2,
					"patching_rect" : [ 550.0, 380.0, 82.0, 18.0 ],
					"numoutlets" : 1,
					"presentation" : 1,
					"id" : "obj-10",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"presentation_rect" : [ 20.0, 100.0, 82.0, 18.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"numinlets" : 1,
					"patching_rect" : [ 640.0, 280.0, 50.0, 20.0 ],
					"numoutlets" : 2,
					"presentation" : 1,
					"id" : "obj-30",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"presentation_rect" : [ 660.0, 120.0, 50.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "On Mac: en0 for ethernet",
					"numinlets" : 1,
					"patching_rect" : [ 190.0, 50.0, 126.0, 18.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-19",
					"fontname" : "Arial",
					"fontface" : 1,
					"presentation_rect" : [ 250.0, 40.0, 126.0, 18.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Select an interface FIRST",
					"numinlets" : 1,
					"patching_rect" : [ 130.0, 30.0, 155.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-11",
					"fontname" : "Arial Bold",
					"bgcolor" : [ 1.0, 0.501961, 0.501961, 1.0 ],
					"presentation_rect" : [ 220.0, 20.0, 153.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"numinlets" : 1,
					"items" : [ "en1", ",", "en0", ",", "lo0" ],
					"patching_rect" : [ 50.0, 30.0, 78.0, 25.0 ],
					"numoutlets" : 3,
					"presentation" : 1,
					"bgcolor2" : [ 1.0, 0.501961, 0.501961, 1.0 ],
					"framecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-12",
					"fontname" : "Arial Bold",
					"outlettype" : [ "int", "", "" ],
					"bgcolor" : [ 1.0, 0.301961, 0.301961, 1.0 ],
					"presentation_rect" : [ 140.0, 20.0, 78.0, 25.0 ],
					"fontsize" : 16.0,
					"types" : [  ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open $1",
					"numinlets" : 2,
					"patching_rect" : [ 60.0, 260.0, 54.0, 18.0 ],
					"numoutlets" : 1,
					"id" : "obj-26",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"minimum" : 0,
					"numinlets" : 1,
					"maximum" : 8,
					"patching_rect" : [ 60.0, 240.0, 50.0, 20.0 ],
					"numoutlets" : 2,
					"presentation" : 1,
					"id" : "obj-27",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"presentation_rect" : [ 130.0, 270.0, 50.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r thum_msg_2",
					"numinlets" : 0,
					"patching_rect" : [ 230.0, 290.0, 87.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-24",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "poly~ Thumbafon_Poly",
					"numinlets" : 2,
					"patching_rect" : [ 60.0, 320.0, 149.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-23",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r thum_msg_1",
					"numinlets" : 0,
					"patching_rect" : [ 140.0, 290.0, 87.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-18",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend parse",
					"numinlets" : 1,
					"patching_rect" : [ 510.0, 320.0, 88.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-4",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js Thumbafon.js",
					"numinlets" : 1,
					"patching_rect" : [ 510.0, 500.0, 95.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-3",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 1337",
					"numinlets" : 1,
					"patching_rect" : [ 510.0, 300.0, 99.0, 20.0 ],
					"numoutlets" : 1,
					"id" : "obj-1",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "key offset slider",
					"numinlets" : 1,
					"patching_rect" : [ 680.0, 240.0, 100.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-74",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 570.0, 100.0, 100.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "change mode slider",
					"numinlets" : 1,
					"patching_rect" : [ 690.0, 350.0, 125.0, 20.0 ],
					"numoutlets" : 0,
					"presentation" : 1,
					"id" : "obj-13",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"presentation_rect" : [ 570.0, 160.0, 125.0, 20.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"numinlets" : 1,
					"patching_rect" : [ 670.0, 340.0, 160.0, 40.0 ],
					"knobcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"numoutlets" : 1,
					"presentation" : 1,
					"id" : "obj-41",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.74902 ],
					"size" : 6.0,
					"presentation_rect" : [ 550.0, 160.0, 160.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"numinlets" : 1,
					"patching_rect" : [ 640.0, 230.0, 184.0, 40.0 ],
					"knobcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"numoutlets" : 1,
					"presentation" : 1,
					"id" : "obj-33",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.74902 ],
					"size" : 13.0,
					"presentation_rect" : [ 530.0, 100.0, 179.0, 20.0 ],
					"min" : -5.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 559.5, 369.0, 519.5, 369.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 559.5, 447.0, 519.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 559.5, 399.0, 519.5, 399.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 519.5, 342.0, 519.5, 342.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 559.5, 480.0, 519.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-122", 0 ],
					"destination" : [ "obj-133", 0 ],
					"hidden" : 0,
					"midpoints" : [ 349.5, 261.0, 349.5, 261.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-133", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 349.5, 447.0, 559.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-129", 0 ],
					"destination" : [ "obj-122", 0 ],
					"hidden" : 0,
					"midpoints" : [ 349.5, 240.0, 349.5, 240.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-129", 0 ],
					"hidden" : 0,
					"midpoints" : [ 349.5, 222.0, 349.5, 222.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-114", 0 ],
					"destination" : [ "obj-112", 0 ],
					"hidden" : 0,
					"midpoints" : [ 49.5, 492.0, 49.5, 492.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-112", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 49.5, 522.0, 49.5, 522.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-112", 2 ],
					"hidden" : 0,
					"midpoints" : [ 89.5, 492.0, 89.5, 492.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-112", 1 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 462.0, 69.5, 462.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-106", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 1,
					"midpoints" : [ 159.5, 360.0, 159.5, 360.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"midpoints" : [ 379.5, 402.0, 379.5, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 379.5, 447.0, 559.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 462.0, 89.5, 462.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 342.0, 69.5, 342.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-54", 3 ],
					"hidden" : 0,
					"midpoints" : [ 159.5, 420.0, 114.0, 420.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [ 159.5, 402.0, 159.5, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [ 619.5, 180.0, 619.5, 180.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [ 429.5, 261.0, 429.5, 261.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [ 129.5, 261.0, 129.5, 261.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [ 129.5, 240.0, 129.5, 240.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 240.0, 69.5, 240.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 679.5, 381.0, 679.5, 381.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 1 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 1,
					"midpoints" : [ 89.0, 57.0, 89.5, 57.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 1,
					"midpoints" : [ 89.5, 81.0, 36.0, 81.0, 36.0, 27.0, 59.5, 27.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 30.0, 569.5, 30.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 619.5, 276.0, 649.5, 276.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 261.0, 69.5, 261.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [ 519.5, 321.0, 519.5, 321.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 649.5, 270.0, 649.5, 270.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [ 649.5, 300.0, 649.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 1,
					"midpoints" : [ 649.5, 231.0, 649.5, 231.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-6", 1 ],
					"hidden" : 1,
					"midpoints" : [ 379.5, 36.0, 450.5, 36.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 679.5, 402.0, 679.5, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 429.5, 282.0, 429.5, 282.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 429.5, 366.0, 537.0, 366.0, 537.0, 447.0, 559.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 679.5, 447.0, 559.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 649.5, 447.0, 559.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-54", 2 ],
					"hidden" : 0,
					"midpoints" : [ 99.5, 402.0, 99.166664, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 279.0, 69.5, 279.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-23", 1 ],
					"hidden" : 0,
					"midpoints" : [ 239.5, 312.0, 199.5, 312.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 149.5, 312.0, 69.5, 312.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 129.5, 288.0, 69.5, 288.0 ]
				}

			}
 ]
	}

}
