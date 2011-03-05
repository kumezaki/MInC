{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 280.0, 91.0, 905.0, 716.0 ],
		"bglocked" : 0,
		"defrect" : [ 280.0, 91.0, 905.0, 716.0 ],
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
					"maxclass" : "number",
					"id" : "obj-16",
					"outlettype" : [ "int", "bang" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 140.0, 10.0, 50.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "tempo $1",
					"id" : "obj-14",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 140.0, 30.0, 61.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "transport @tempo 120",
					"id" : "obj-20",
					"outlettype" : [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 9,
					"patching_rect" : [ 110.0, 80.0, 130.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 1",
					"id" : "obj-13",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 30.0, 230.0, 34.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pipe 16nd",
					"id" : "obj-11",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 30.0, 200.0, 63.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 0",
					"id" : "obj-8",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 100.0, 240.0, 34.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route 1 2 3 4 5 6 7 8",
					"id" : "obj-3",
					"outlettype" : [ "", "", "", "", "", "", "", "", "" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 9,
					"patching_rect" : [ 30.0, 270.0, 127.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "itable",
					"hint" : "x 7 y = 0",
					"id" : "obj-4",
					"outlettype" : [ "int", "bang" ],
					"name" : "",
					"numinlets" : 2,
					"range" : 9,
					"numoutlets" : 2,
					"patching_rect" : [ 30.0, 110.0, 173.0, 75.0 ],
					"size" : 8,
					"table_data" : [ 0, 1, 3, 5, 7, 4, 4, 0, 0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "togedge",
					"id" : "obj-34",
					"outlettype" : [ "bang", "bang" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 440.0, 460.0, 54.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "led",
					"id" : "obj-35",
					"outlettype" : [ "int" ],
					"oncolor" : [ 0.0, 0.298039, 1.0, 1.0 ],
					"offcolor" : [ 0.0, 0.090196, 0.611765, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 440.0, 430.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "togedge",
					"id" : "obj-36",
					"outlettype" : [ "bang", "bang" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 330.0, 460.0, 54.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "led",
					"id" : "obj-38",
					"outlettype" : [ "int" ],
					"oncolor" : [ 0.501961, 0.0, 1.0, 1.0 ],
					"offcolor" : [ 0.243137, 0.0, 0.611765, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 330.0, 430.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "togedge",
					"id" : "obj-39",
					"outlettype" : [ "bang", "bang" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 240.0, 460.0, 54.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "led",
					"id" : "obj-40",
					"outlettype" : [ "int" ],
					"oncolor" : [ 0.94902, 0.0, 1.0, 1.0 ],
					"offcolor" : [ 0.521569, 0.003922, 0.65098, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 240.0, 430.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "togedge",
					"id" : "obj-42",
					"outlettype" : [ "bang", "bang" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 150.0, 460.0, 54.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "led",
					"id" : "obj-44",
					"outlettype" : [ "int" ],
					"offcolor" : [ 0.611765, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 150.0, 430.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "togedge",
					"id" : "obj-32",
					"outlettype" : [ "bang", "bang" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 440.0, 350.0, 54.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "led",
					"id" : "obj-33",
					"outlettype" : [ "int" ],
					"oncolor" : [ 0.898039, 1.0, 0.0, 1.0 ],
					"offcolor" : [ 0.580392, 0.611765, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 440.0, 320.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "togedge",
					"id" : "obj-26",
					"outlettype" : [ "bang", "bang" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 330.0, 350.0, 54.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "led",
					"id" : "obj-27",
					"outlettype" : [ "int" ],
					"oncolor" : [ 0.6, 1.0, 0.0, 1.0 ],
					"offcolor" : [ 0.368627, 0.611765, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 330.0, 320.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "togedge",
					"id" : "obj-24",
					"outlettype" : [ "bang", "bang" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 240.0, 350.0, 54.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "led",
					"id" : "obj-25",
					"outlettype" : [ "int" ],
					"oncolor" : [ 0.0, 0.8, 0.396078, 1.0 ],
					"offcolor" : [ 0.078431, 0.533333, 0.0, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 240.0, 320.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "togedge",
					"id" : "obj-12",
					"outlettype" : [ "bang", "bang" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 150.0, 350.0, 54.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "led",
					"id" : "obj-5",
					"outlettype" : [ "int" ],
					"oncolor" : [ 0.0, 0.898039, 1.0, 1.0 ],
					"offcolor" : [ 0.0, 0.580392, 0.611765, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 150.0, 320.0, 30.0, 30.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "counter 7",
					"id" : "obj-166",
					"outlettype" : [ "int", "", "", "int" ],
					"fontname" : "Arial",
					"numinlets" : 5,
					"fontsize" : 12.0,
					"numoutlets" : 4,
					"patching_rect" : [ 30.0, 80.0, 73.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-152",
					"outlettype" : [ "int" ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 110.0, 30.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 8n",
					"id" : "obj-150",
					"outlettype" : [ "bang" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 30.0, 60.0, 58.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "fsmenubar 0",
					"id" : "obj-9",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 11.595187,
					"numoutlets" : 1,
					"patching_rect" : [ 770.0, 500.0, 75.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p yellow_button",
					"id" : "obj-108",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 440.0, 380.0, 94.0, 20.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 482.0, 299.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 482.0, 299.0 ],
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
									"text" : "t b s",
									"id" : "obj-59",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 60.0, 140.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"id" : "obj-60",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 300.0, 130.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt8 360 0",
									"id" : "obj-61",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 300.0, 160.0, 119.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt8 yellow1.png",
									"id" : "obj-62",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 299.0, 111.0, 145.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt8 yellow2.png",
									"id" : "obj-63",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 114.0, 145.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt8 360 0",
									"id" : "obj-64",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 170.0, 119.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-105",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 300.0, 70.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-106",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 70.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-107",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 210.0, 230.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-59", 1 ],
									"destination" : [ "obj-107", 0 ],
									"hidden" : 0,
									"midpoints" : [ 83.5, 162.0, 219.5, 162.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-60", 1 ],
									"destination" : [ "obj-107", 0 ],
									"hidden" : 0,
									"midpoints" : [ 323.5, 150.0, 219.5, 150.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-64", 0 ],
									"destination" : [ "obj-107", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 216.0, 219.5, 216.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-63", 0 ],
									"destination" : [ "obj-107", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 132.0, 105.0, 132.0, 105.0, 156.0, 219.5, 156.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-61", 0 ],
									"destination" : [ "obj-107", 0 ],
									"hidden" : 0,
									"midpoints" : [ 309.5, 216.0, 219.5, 216.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-106", 0 ],
									"destination" : [ "obj-63", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 96.0, 69.5, 96.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-105", 0 ],
									"destination" : [ "obj-62", 0 ],
									"hidden" : 0,
									"midpoints" : [ 309.5, 108.0, 308.5, 108.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-59", 0 ],
									"destination" : [ "obj-64", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 162.0, 69.5, 162.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-63", 0 ],
									"destination" : [ "obj-59", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 132.0, 69.5, 132.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-60", 0 ],
									"destination" : [ "obj-61", 0 ],
									"hidden" : 0,
									"midpoints" : [ 309.5, 150.0, 309.5, 150.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-62", 0 ],
									"destination" : [ "obj-60", 0 ],
									"hidden" : 0,
									"midpoints" : [ 308.5, 129.0, 309.5, 129.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p seafoam_button",
					"id" : "obj-104",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 330.0, 380.0, 107.0, 20.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 415.0, 257.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 415.0, 257.0 ],
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
									"text" : "t b s",
									"id" : "obj-66",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 60.0, 126.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"id" : "obj-67",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 230.0, 120.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt7 240 0",
									"id" : "obj-68",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 230.0, 150.0, 119.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt7 seafoam1.png",
									"id" : "obj-69",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 230.0, 100.0, 157.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt7 seafoam2.png",
									"id" : "obj-70",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 100.0, 157.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt7 240 0",
									"id" : "obj-71",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 156.0, 119.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-101",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 230.0, 40.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-102",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 40.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-103",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 150.0, 210.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-66", 1 ],
									"destination" : [ "obj-103", 0 ],
									"hidden" : 0,
									"midpoints" : [ 83.5, 147.0, 45.0, 147.0, 45.0, 195.0, 159.5, 195.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-67", 1 ],
									"destination" : [ "obj-103", 0 ],
									"hidden" : 0,
									"midpoints" : [ 253.5, 141.0, 189.0, 141.0, 189.0, 195.0, 159.5, 195.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-71", 0 ],
									"destination" : [ "obj-103", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 195.0, 159.5, 195.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-68", 0 ],
									"destination" : [ "obj-103", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 195.0, 159.5, 195.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-102", 0 ],
									"destination" : [ "obj-70", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 66.0, 69.5, 66.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-101", 0 ],
									"destination" : [ "obj-69", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 66.0, 239.5, 66.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-69", 0 ],
									"destination" : [ "obj-67", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 120.0, 239.5, 120.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-67", 0 ],
									"destination" : [ "obj-68", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 141.0, 239.5, 141.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-70", 0 ],
									"destination" : [ "obj-66", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 120.0, 69.5, 120.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-66", 0 ],
									"destination" : [ "obj-71", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 147.0, 69.5, 147.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p green_button",
					"id" : "obj-100",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 240.0, 380.0, 91.0, 20.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 452.0, 291.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 452.0, 291.0 ],
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
									"text" : "t b s",
									"id" : "obj-73",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 60.0, 130.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"id" : "obj-74",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 250.0, 120.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt6 120 0",
									"id" : "obj-75",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 250.0, 150.0, 119.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt6 green1.png",
									"id" : "obj-76",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 250.0, 100.0, 143.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt6 green2.png",
									"id" : "obj-77",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 104.0, 143.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt6 120 0",
									"id" : "obj-78",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 160.0, 119.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-97",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 250.0, 50.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-98",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 40.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-99",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 180.0, 220.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-73", 1 ],
									"destination" : [ "obj-99", 0 ],
									"hidden" : 0,
									"midpoints" : [ 83.5, 150.0, 189.5, 150.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-74", 1 ],
									"destination" : [ "obj-99", 0 ],
									"hidden" : 0,
									"midpoints" : [ 273.5, 141.0, 189.5, 141.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-78", 0 ],
									"destination" : [ "obj-99", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 207.0, 189.5, 207.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-75", 0 ],
									"destination" : [ "obj-99", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 207.0, 189.5, 207.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-98", 0 ],
									"destination" : [ "obj-77", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 66.0, 69.5, 66.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-97", 0 ],
									"destination" : [ "obj-76", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 75.0, 259.5, 75.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-73", 0 ],
									"destination" : [ "obj-78", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 150.0, 69.5, 150.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-77", 0 ],
									"destination" : [ "obj-73", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 123.0, 69.5, 123.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-74", 0 ],
									"destination" : [ "obj-75", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 141.0, 259.5, 141.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-76", 0 ],
									"destination" : [ "obj-74", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 120.0, 259.5, 120.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p aqua_button",
					"id" : "obj-96",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 150.0, 380.0, 87.0, 20.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 268.0, 255.0, 413.0, 299.0 ],
						"bglocked" : 0,
						"defrect" : [ 268.0, 255.0, 413.0, 299.0 ],
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
									"text" : "t b s",
									"id" : "obj-81",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 60.0, 140.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"id" : "obj-82",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 240.0, 140.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt5",
									"id" : "obj-83",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 200.0, 85.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt5 aqua1.png",
									"id" : "obj-84",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 120.0, 139.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt5 aqua2.png",
									"id" : "obj-85",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 120.0, 139.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt5",
									"id" : "obj-86",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 200.0, 85.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-93",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 70.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-94",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 70.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-95",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 160.0, 240.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-81", 1 ],
									"destination" : [ "obj-95", 0 ],
									"hidden" : 0,
									"midpoints" : [ 83.5, 186.0, 169.5, 186.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-82", 1 ],
									"destination" : [ "obj-95", 0 ],
									"hidden" : 0,
									"midpoints" : [ 263.5, 186.0, 169.5, 186.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-86", 0 ],
									"destination" : [ "obj-95", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 237.0, 169.5, 237.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-83", 0 ],
									"destination" : [ "obj-95", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 219.0, 169.5, 219.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-94", 0 ],
									"destination" : [ "obj-85", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 96.0, 69.5, 96.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-93", 0 ],
									"destination" : [ "obj-84", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 96.0, 249.5, 96.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-84", 0 ],
									"destination" : [ "obj-82", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 138.0, 249.5, 138.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-82", 0 ],
									"destination" : [ "obj-83", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 162.0, 249.5, 162.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-85", 0 ],
									"destination" : [ "obj-81", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 138.0, 69.5, 138.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-81", 0 ],
									"destination" : [ "obj-86", 0 ],
									"hidden" : 0,
									"midpoints" : [ 69.5, 162.0, 69.5, 162.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p blue_button",
					"id" : "obj-91",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 440.0, 490.0, 83.0, 20.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 431.0, 305.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 431.0, 305.0 ],
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
									"text" : "t b s",
									"id" : "obj-52",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 40.0, 120.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"id" : "obj-53",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 240.0, 120.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt4 360 145",
									"id" : "obj-54",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 180.0, 132.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt4 blue1.png",
									"id" : "obj-55",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 100.0, 135.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt4 blue2.png",
									"id" : "obj-56",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 100.0, 135.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt4 360 145",
									"id" : "obj-57",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 180.0, 132.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-88",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 60.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-89",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 60.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-90",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 150.0, 240.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-52", 1 ],
									"destination" : [ "obj-90", 0 ],
									"hidden" : 0,
									"midpoints" : [ 63.5, 165.0, 183.0, 165.0, 183.0, 225.0, 159.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-53", 1 ],
									"destination" : [ "obj-90", 0 ],
									"hidden" : 0,
									"midpoints" : [ 263.5, 165.0, 183.0, 165.0, 183.0, 225.0, 159.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-57", 0 ],
									"destination" : [ "obj-90", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 225.0, 159.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-54", 0 ],
									"destination" : [ "obj-90", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 225.0, 159.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-89", 0 ],
									"destination" : [ "obj-56", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 87.0, 49.5, 87.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-88", 0 ],
									"destination" : [ "obj-55", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 87.0, 249.5, 87.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-55", 0 ],
									"destination" : [ "obj-53", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 120.0, 249.5, 120.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-53", 0 ],
									"destination" : [ "obj-54", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 141.0, 249.5, 141.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-56", 0 ],
									"destination" : [ "obj-52", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 120.0, 49.5, 120.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-52", 0 ],
									"destination" : [ "obj-57", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 141.0, 49.5, 141.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p purple_button",
					"id" : "obj-87",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 330.0, 490.0, 94.0, 20.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 430.0, 330.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 430.0, 330.0 ],
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
									"text" : "t b s",
									"id" : "obj-45",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 50.0, 140.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"id" : "obj-46",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 230.0, 140.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt3 240 145",
									"id" : "obj-47",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 230.0, 190.0, 132.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt3 purple1.png",
									"id" : "obj-48",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 230.0, 120.0, 145.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt3 purple2.png",
									"id" : "obj-49",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 120.0, 145.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt3 240 145",
									"id" : "obj-50",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 190.0, 132.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-42",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 230.0, 80.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-44",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 80.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-51",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 170.0, 250.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-45", 1 ],
									"destination" : [ "obj-51", 0 ],
									"hidden" : 0,
									"midpoints" : [ 73.5, 177.0, 192.0, 177.0, 192.0, 237.0, 179.5, 237.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-46", 1 ],
									"destination" : [ "obj-51", 0 ],
									"hidden" : 0,
									"midpoints" : [ 253.5, 177.0, 192.0, 177.0, 192.0, 237.0, 179.5, 237.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-50", 0 ],
									"destination" : [ "obj-51", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 237.0, 179.5, 237.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-47", 0 ],
									"destination" : [ "obj-51", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 237.0, 179.5, 237.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-44", 0 ],
									"destination" : [ "obj-49", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 105.0, 59.5, 105.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 0 ],
									"destination" : [ "obj-48", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 105.0, 239.5, 105.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-45", 0 ],
									"destination" : [ "obj-50", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 162.0, 59.5, 162.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-49", 0 ],
									"destination" : [ "obj-45", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 138.0, 59.5, 138.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-46", 0 ],
									"destination" : [ "obj-47", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 162.0, 239.5, 162.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-48", 0 ],
									"destination" : [ "obj-46", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 138.0, 239.5, 138.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p pink_button",
					"id" : "obj-41",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 240.0, 490.0, 83.0, 20.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 393.0, 273.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 393.0, 273.0 ],
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
									"text" : "t b s",
									"id" : "obj-22",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 30.0, 100.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"id" : "obj-23",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 220.0, 100.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt2 120 145",
									"id" : "obj-24",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 220.0, 140.0, 132.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt2 pink1.png",
									"id" : "obj-25",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 220.0, 80.0, 134.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt2 pink2.png",
									"id" : "obj-26",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 80.0, 134.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt2 120 145",
									"id" : "obj-27",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 140.0, 132.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-38",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 220.0, 40.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-39",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 40.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-40",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 120.0, 210.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-22", 1 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [ 53.5, 120.0, 15.0, 120.0, 15.0, 195.0, 129.5, 195.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-23", 1 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [ 243.5, 120.0, 174.0, 120.0, 174.0, 195.0, 129.5, 195.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-27", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 195.0, 129.5, 195.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 0 ],
									"destination" : [ "obj-40", 0 ],
									"hidden" : 0,
									"midpoints" : [ 229.5, 195.0, 129.5, 195.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-39", 0 ],
									"destination" : [ "obj-26", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 66.0, 39.5, 66.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-38", 0 ],
									"destination" : [ "obj-25", 0 ],
									"hidden" : 0,
									"midpoints" : [ 229.5, 66.0, 229.5, 66.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 0 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [ 229.5, 99.0, 229.5, 99.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-23", 0 ],
									"destination" : [ "obj-24", 0 ],
									"hidden" : 0,
									"midpoints" : [ 229.5, 120.0, 229.5, 120.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-22", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 99.0, 39.5, 99.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-27", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 120.0, 39.5, 120.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p red_button",
					"id" : "obj-37",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 150.0, 490.0, 78.0, 20.0 ],
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 349.0, 256.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 349.0, 256.0 ],
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
									"text" : "t b s",
									"id" : "obj-9",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 50.0, 90.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"id" : "obj-8",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 12.0,
									"numoutlets" : 2,
									"patching_rect" : [ 190.0, 90.0, 33.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt1 0 145",
									"id" : "obj-5",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 190.0, 150.0, 119.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt1 red1.png",
									"id" : "obj-35",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 190.0, 70.0, 130.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "readpict butt1 red2.png",
									"id" : "obj-36",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 70.0, 130.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "drawpict butt1 0 145",
									"id" : "obj-4",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 12.0,
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 150.0, 119.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-32",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 190.0, 30.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-33",
									"outlettype" : [ "bang" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 30.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-34",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 210.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-9", 1 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 73.5, 136.0, 36.0, 136.0, 36.0, 196.0, 59.5, 196.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 1 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 213.5, 136.0, 171.0, 136.0, 171.0, 196.0, 59.5, 196.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 169.0, 59.5, 169.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 199.5, 196.0, 59.5, 196.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-33", 0 ],
									"destination" : [ "obj-36", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 55.0, 59.5, 55.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-35", 0 ],
									"hidden" : 0,
									"midpoints" : [ 199.5, 55.0, 199.5, 55.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 112.0, 59.5, 112.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-36", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 88.0, 59.5, 88.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 199.5, 112.0, 199.5, 112.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-35", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 199.5, 88.0, 199.5, 88.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 12.0,
						"fontface" : 0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "size 480 290",
					"id" : "obj-10",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 690.0, 530.0, 79.0, 18.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p esc-fullscreen",
					"id" : "obj-92",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 0,
					"fontsize" : 11.595187,
					"numoutlets" : 1,
					"patching_rect" : [ 800.0, 530.0, 90.0, 20.0 ],
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
									"id" : "obj-7",
									"fontname" : "Arial",
									"numinlets" : 1,
									"fontsize" : 11.595187,
									"numoutlets" : 0,
									"patching_rect" : [ 86.0, 67.0, 114.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-2",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 27.0, 157.25, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "fullscreen $1",
									"id" : "obj-3",
									"outlettype" : [ "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 1,
									"patching_rect" : [ 27.0, 127.25, 76.0, 18.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "key",
									"id" : "obj-4",
									"outlettype" : [ "int", "int", "int", "int" ],
									"fontname" : "Arial",
									"numinlets" : 0,
									"fontsize" : 11.595187,
									"numoutlets" : 4,
									"patching_rect" : [ 27.0, 37.0, 46.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "select 27",
									"id" : "obj-5",
									"outlettype" : [ "bang", "" ],
									"fontname" : "Arial",
									"numinlets" : 2,
									"fontsize" : 11.595187,
									"numoutlets" : 2,
									"patching_rect" : [ 27.0, 67.25, 57.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"id" : "obj-6",
									"outlettype" : [ "int" ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 27.0, 97.25, 20.0, 20.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-5", 0 ],
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
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-3", 0 ],
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
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontname" : "Arial",
						"default_fontsize" : 10.0,
						"fontface" : 0,
						"fontsize" : 10.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 1",
					"id" : "obj-2",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 560.0, 240.0, 72.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.window button_view",
					"id" : "obj-7",
					"outlettype" : [ "bang", "" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 560.0, 580.0, 130.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t getfps b",
					"id" : "obj-43",
					"outlettype" : [ "", "bang" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 11.595187,
					"numoutlets" : 2,
					"patching_rect" : [ 560.0, 610.0, 58.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "jit.fpsgui",
					"id" : "obj-141",
					"outlettype" : [ "", "" ],
					"mode" : 1,
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 11.595187,
					"numoutlets" : 2,
					"patching_rect" : [ 560.0, 650.0, 80.0, 35.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-130",
					"outlettype" : [ "int" ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 590.0, 449.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "qmetro 30",
					"id" : "obj-131",
					"outlettype" : [ "bang" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 11.595187,
					"numoutlets" : 1,
					"patching_rect" : [ 590.0, 470.0, 63.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "jit.lcd 4 char 480 290",
					"id" : "obj-1",
					"outlettype" : [ "jit_matrix", "" ],
					"fontname" : "Arial",
					"numinlets" : 1,
					"fontsize" : 12.0,
					"numoutlets" : 2,
					"patching_rect" : [ 560.0, 530.0, 121.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"id" : "obj-21",
					"outlettype" : [ "" ],
					"fontname" : "Arial",
					"numinlets" : 2,
					"fontsize" : 12.0,
					"numoutlets" : 1,
					"patching_rect" : [ 620.0, 500.0, 37.0, 18.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 186.0, 39.5, 186.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 222.0, 39.5, 222.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-152", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 119.5, 51.0, 119.5, 51.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 258.0, 39.5, 258.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 249.0, 39.5, 249.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 195.0, 109.5, 195.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 629.5, 519.0, 570.0, 519.0, 570.0, 525.0, 569.5, 525.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-131", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 599.5, 516.0, 569.5, 516.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-130", 0 ],
					"destination" : [ "obj-131", 0 ],
					"hidden" : 0,
					"midpoints" : [ 599.5, 471.0, 599.5, 471.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 1 ],
					"destination" : [ "obj-141", 0 ],
					"hidden" : 0,
					"midpoints" : [ 608.5, 630.0, 569.5, 630.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-141", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 630.0, 569.5, 630.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 600.0, 569.5, 600.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 552.0, 569.5, 552.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [ 699.5, 567.0, 569.5, 567.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 159.5, 525.0, 569.5, 525.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 249.5, 525.0, 569.5, 525.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-87", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 339.5, 525.0, 569.5, 525.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-91", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 449.5, 525.0, 569.5, 525.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-96", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 159.5, 417.0, 569.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-100", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 249.5, 417.0, 569.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-104", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 339.5, 417.0, 569.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-108", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 0,
					"midpoints" : [ 449.5, 417.0, 569.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 1 ],
					"destination" : [ "obj-96", 1 ],
					"hidden" : 0,
					"midpoints" : [ 194.5, 372.0, 227.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-96", 0 ],
					"hidden" : 0,
					"midpoints" : [ 159.5, 372.0, 159.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 0,
					"midpoints" : [ 159.5, 351.0, 159.5, 351.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [ 249.5, 351.0, 249.5, 351.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-100", 0 ],
					"hidden" : 0,
					"midpoints" : [ 249.5, 372.0, 249.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 1 ],
					"destination" : [ "obj-100", 1 ],
					"hidden" : 0,
					"midpoints" : [ 284.5, 372.0, 321.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [ 339.5, 351.0, 339.5, 351.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [ 449.5, 351.0, 449.5, 351.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-108", 0 ],
					"hidden" : 0,
					"midpoints" : [ 449.5, 372.0, 449.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 1 ],
					"destination" : [ "obj-108", 1 ],
					"hidden" : 0,
					"midpoints" : [ 484.5, 372.0, 524.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 1 ],
					"destination" : [ "obj-104", 1 ],
					"hidden" : 0,
					"midpoints" : [ 374.5, 372.0, 427.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-104", 0 ],
					"hidden" : 0,
					"midpoints" : [ 339.5, 372.0, 339.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [ 449.5, 462.0, 449.5, 462.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 0,
					"midpoints" : [ 339.5, 462.0, 339.5, 462.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [ 249.5, 462.0, 249.5, 462.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [ 159.5, 462.0, 159.5, 462.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [ 159.5, 480.0, 159.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 1 ],
					"destination" : [ "obj-37", 1 ],
					"hidden" : 0,
					"midpoints" : [ 194.5, 486.0, 218.5, 486.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 249.5, 480.0, 249.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 1 ],
					"destination" : [ "obj-41", 1 ],
					"hidden" : 0,
					"midpoints" : [ 284.5, 486.0, 313.5, 486.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-87", 0 ],
					"hidden" : 0,
					"midpoints" : [ 339.5, 480.0, 339.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 1 ],
					"destination" : [ "obj-87", 1 ],
					"hidden" : 0,
					"midpoints" : [ 374.5, 486.0, 414.5, 486.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [ 449.5, 480.0, 449.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 1 ],
					"destination" : [ "obj-91", 1 ],
					"hidden" : 0,
					"midpoints" : [ 484.5, 486.0, 513.5, 486.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-130", 0 ],
					"hidden" : 1,
					"midpoints" : [ 569.5, 435.0, 599.5, 435.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 1,
					"midpoints" : [ 569.5, 306.0, 159.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 1,
					"midpoints" : [ 569.5, 306.0, 249.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 1,
					"midpoints" : [ 569.5, 306.0, 339.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 1,
					"midpoints" : [ 569.5, 306.0, 449.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 1,
					"midpoints" : [ 569.5, 417.0, 159.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 1,
					"midpoints" : [ 569.5, 417.0, 249.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 1,
					"midpoints" : [ 569.5, 417.0, 339.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 1,
					"midpoints" : [ 569.5, 417.0, 449.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-166", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 102.0, 39.5, 102.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 435.0, 699.5, 435.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 2 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [ 66.5, 417.0, 339.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 3 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [ 80.0, 417.0, 449.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 417.0, 159.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 1 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [ 53.0, 417.0, 249.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 4 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 93.5, 306.0, 159.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 5 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [ 107.0, 306.0, 249.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 6 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [ 120.5, 306.0, 339.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 7 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [ 134.0, 306.0, 449.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 435.0, 779.5, 435.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-92", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 567.0, 569.5, 567.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"midpoints" : [ 779.5, 567.0, 569.5, 567.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"midpoints" : [ 149.5, 32.0, 149.5, 32.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 149.5, 60.0, 119.5, 60.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-150", 0 ],
					"destination" : [ "obj-166", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 81.0, 39.5, 81.0 ]
				}

			}
 ]
	}

}
