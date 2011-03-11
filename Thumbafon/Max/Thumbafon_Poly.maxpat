{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 27.0, 44.0, 1146.0, 771.0 ],
		"bglocked" : 0,
		"defrect" : [ 27.0, 44.0, 1146.0, 771.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
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
					"maxclass" : "newobj",
					"text" : "route metro",
					"id" : "obj-75",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 630.0, 560.0, 72.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t s s",
					"id" : "obj-39",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 970.0, 610.0, 33.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-76",
					"outlettype" : [ "int" ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 680.0, 590.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gswitch2",
					"id" : "obj-72",
					"outlettype" : [ "", "" ],
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 680.0, 610.0, 39.0, 32.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "gswitch2",
					"id" : "obj-88",
					"outlettype" : [ "", "" ],
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 550.0, 200.0, 39.0, 32.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "if $i2 then $i1 1 else out2 $i1 1",
					"linecount" : 3,
					"id" : "obj-74",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 700.0, 650.0, 64.0, 48.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "Quantizer",
					"id" : "obj-73",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 3,
					"numoutlets" : 1,
					"patching_rect" : [ 700.0, 700.0, 109.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p lcd_patching",
					"id" : "obj-104",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 130.0, 600.0, 88.0, 20.0 ],
					"fontname" : "Arial",
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 195.0, 180.0, 862.0, 579.0 ],
						"bglocked" : 0,
						"defrect" : [ 195.0, 180.0, 862.0, 579.0 ],
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
									"text" : "1.",
									"id" : "obj-14",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 720.0, 310.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t f f",
									"id" : "obj-12",
									"outlettype" : [ "float", "float" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 620.0, 360.0, 32.5, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pak scale 1. 1.",
									"id" : "obj-15",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 3,
									"numoutlets" : 1,
									"patching_rect" : [ 570.0, 400.0, 83.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"id" : "obj-44",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 680.0, 310.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 3",
									"id" : "obj-42",
									"outlettype" : [ "bang", "bang", "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 3,
									"patching_rect" : [ 680.0, 290.0, 99.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1",
									"id" : "obj-41",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 430.0, 150.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1",
									"id" : "obj-39",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 670.0, 170.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"id" : "obj-35",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 250.0, 260.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "text",
									"id" : "obj-33",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 760.0, 310.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 2",
									"id" : "obj-21",
									"outlettype" : [ "bang", "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 650.0, 150.0, 38.5, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1.99, 0. 1500",
									"id" : "obj-23",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 650.0, 250.0, 81.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line 0.",
									"id" : "obj-27",
									"outlettype" : [ "", "" ],
									"fontsize" : 12.0,
									"numinlets" : 3,
									"numoutlets" : 2,
									"patching_rect" : [ 650.0, 270.0, 49.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1., 1.99 2000",
									"id" : "obj-30",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 620.0, 110.0, 81.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line 1.",
									"id" : "obj-31",
									"outlettype" : [ "", "" ],
									"fontsize" : 12.0,
									"numinlets" : 3,
									"numoutlets" : 2,
									"patching_rect" : [ 620.0, 130.0, 49.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pak size 20",
									"id" : "obj-17",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 740.0, 100.0, 69.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "delay 750",
									"linecount" : 2,
									"id" : "obj-6",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 150.0, 240.0, 41.0, 34.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 2",
									"id" : "obj-1",
									"outlettype" : [ "bang", "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 230.0, 240.0, 38.5, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "lcdpos starts 1st line, kills noise, bangs name, starts 2nd line",
									"id" : "obj-11",
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 210.0, 30.0, 336.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "lcddev starts noise & sets dev name",
									"id" : "obj-10",
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 210.0, 10.0, 205.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t s b",
									"id" : "obj-8",
									"outlettype" : [ "", "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 400.0, 130.0, 49.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "unpack 1. 2.",
									"id" : "obj-5",
									"outlettype" : [ "float", "float" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 120.0, 120.0, 96.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 2",
									"id" : "obj-4",
									"outlettype" : [ "bang", "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 150.0, 190.0, 32.5, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"id" : "obj-3",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 230.0, 380.0, 189.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.op @op <p @val 127",
									"id" : "obj-28",
									"outlettype" : [ "jit_matrix", "" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"numoutlets" : 2,
									"patching_rect" : [ 430.0, 430.0, 132.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"id" : "obj-66",
									"outlettype" : [ "int" ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 430.0, 350.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qmetro 30",
									"id" : "obj-67",
									"outlettype" : [ "bang" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 430.0, 394.0, 63.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.noise 4 char 30 1",
									"id" : "obj-95",
									"outlettype" : [ "jit_matrix", "" ],
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 430.0, 410.0, 111.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0., $1 500",
									"id" : "obj-2",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 150.0, 300.0, 64.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"id" : "obj-102",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 80.0, 320.0, 26.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line 0.",
									"id" : "obj-122",
									"outlettype" : [ "", "" ],
									"fontsize" : 12.0,
									"numinlets" : 3,
									"numoutlets" : 2,
									"patching_rect" : [ 150.0, 320.0, 49.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"id" : "obj-123",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 150.0, 280.0, 65.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "1., $1 3000",
									"id" : "obj-124",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 120.0, 150.0, 71.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "line 1.",
									"id" : "obj-125",
									"outlettype" : [ "", "" ],
									"fontsize" : 12.0,
									"numinlets" : 3,
									"numoutlets" : 2,
									"patching_rect" : [ 120.0, 170.0, 49.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "route lcdmsg lcdpos lcddev lcdkill",
									"id" : "obj-98",
									"outlettype" : [ "", "", "", "", "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 5,
									"patching_rect" : [ 20.0, 70.0, 188.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pak position 0. 0.",
									"id" : "obj-96",
									"outlettype" : [ "" ],
									"fontsize" : 11.595187,
									"numinlets" : 3,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 350.0, 99.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.gl.text2d @color 100. 100. 100. 1. @tracking 1.2 @align 0",
									"id" : "obj-76",
									"outlettype" : [ "", "" ],
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 430.0, 490.0, 320.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-103",
									"outlettype" : [ "" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 20.0, 10.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-98", 3 ],
									"destination" : [ "obj-30", 0 ],
									"hidden" : 0,
									"midpoints" : [ 156.25, 105.0, 629.5, 105.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-98", 1 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 71.75, 105.0, 129.5, 105.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-98", 2 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 114.0, 105.0, 409.5, 105.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-103", 0 ],
									"destination" : [ "obj-98", 0 ],
									"hidden" : 0,
									"midpoints" : [ 29.5, 36.0, 29.5, 36.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-98", 0 ],
									"destination" : [ "obj-76", 0 ],
									"hidden" : 0,
									"midpoints" : [ 29.5, 477.0, 439.5, 477.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-44", 0 ],
									"destination" : [ "obj-66", 0 ],
									"hidden" : 0,
									"midpoints" : [ 689.5, 330.0, 439.5, 330.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-33", 0 ],
									"destination" : [ "obj-76", 0 ],
									"hidden" : 0,
									"midpoints" : [ 769.5, 477.0, 439.5, 477.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-41", 0 ],
									"destination" : [ "obj-66", 0 ],
									"hidden" : 0,
									"midpoints" : [ 439.5, 168.0, 439.5, 168.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 1 ],
									"destination" : [ "obj-41", 0 ],
									"hidden" : 0,
									"midpoints" : [ 439.5, 150.0, 439.5, 150.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-39", 0 ],
									"destination" : [ "obj-66", 0 ],
									"hidden" : 0,
									"midpoints" : [ 679.5, 237.0, 439.5, 237.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 1 ],
									"destination" : [ "obj-39", 0 ],
									"hidden" : 0,
									"midpoints" : [ 679.0, 171.0, 679.5, 171.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-31", 1 ],
									"destination" : [ "obj-21", 0 ],
									"hidden" : 0,
									"midpoints" : [ 659.5, 150.0, 659.5, 150.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-35", 0 ],
									"destination" : [ "obj-66", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.5, 336.0, 439.5, 336.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 1 ],
									"destination" : [ "obj-35", 0 ],
									"hidden" : 0,
									"midpoints" : [ 259.0, 261.0, 259.5, 261.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-23", 0 ],
									"destination" : [ "obj-27", 0 ],
									"hidden" : 0,
									"midpoints" : [ 659.5, 270.0, 659.5, 270.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-30", 0 ],
									"destination" : [ "obj-31", 0 ],
									"hidden" : 0,
									"midpoints" : [ 629.5, 129.0, 629.5, 129.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-123", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 159.5, 300.0, 159.5, 300.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-96", 0 ],
									"destination" : [ "obj-76", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 477.0, 439.5, 477.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-102", 0 ],
									"destination" : [ "obj-96", 1 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 339.0, 89.5, 339.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-122", 0 ],
									"destination" : [ "obj-96", 1 ],
									"hidden" : 0,
									"midpoints" : [ 159.5, 342.0, 89.5, 342.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-125", 0 ],
									"destination" : [ "obj-102", 0 ],
									"hidden" : 0,
									"midpoints" : [ 129.5, 306.0, 89.5, 306.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-125", 0 ],
									"destination" : [ "obj-96", 2 ],
									"hidden" : 0,
									"midpoints" : [ 129.5, 192.0, 129.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-124", 0 ],
									"destination" : [ "obj-125", 0 ],
									"hidden" : 0,
									"midpoints" : [ 129.5, 168.0, 129.5, 168.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-122", 0 ],
									"hidden" : 0,
									"midpoints" : [ 159.5, 318.0, 159.5, 318.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-66", 0 ],
									"destination" : [ "obj-67", 0 ],
									"hidden" : 0,
									"midpoints" : [ 439.5, 372.0, 439.5, 372.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-28", 0 ],
									"destination" : [ "obj-76", 0 ],
									"hidden" : 0,
									"midpoints" : [ 439.5, 450.0, 439.5, 450.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-76", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 477.0, 439.5, 477.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-67", 0 ],
									"destination" : [ "obj-95", 0 ],
									"hidden" : 0,
									"midpoints" : [ 439.5, 414.0, 439.5, 414.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-95", 0 ],
									"destination" : [ "obj-28", 0 ],
									"hidden" : 0,
									"midpoints" : [ 439.5, 432.0, 439.5, 432.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-3", 1 ],
									"hidden" : 0,
									"midpoints" : [ 409.5, 150.0, 409.5, 150.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-123", 1 ],
									"hidden" : 0,
									"midpoints" : [ 206.5, 141.0, 206.0, 141.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-124", 0 ],
									"hidden" : 0,
									"midpoints" : [ 129.5, 141.0, 129.5, 141.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-125", 1 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [ 159.5, 192.0, 159.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 1 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 173.0, 225.0, 239.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [ 239.5, 261.0, 239.5, 261.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-123", 0 ],
									"hidden" : 0,
									"midpoints" : [ 159.5, 276.0, 159.5, 276.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 159.5, 210.0, 159.5, 210.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-23", 0 ],
									"hidden" : 0,
									"midpoints" : [ 659.5, 171.0, 659.5, 171.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-76", 0 ],
									"hidden" : 0,
									"midpoints" : [ 579.5, 477.0, 439.5, 477.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-31", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [ 629.5, 150.0, 629.5, 150.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-27", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [ 659.5, 345.0, 629.5, 345.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-15", 1 ],
									"hidden" : 0,
									"midpoints" : [ 629.5, 381.0, 611.5, 381.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 1 ],
									"destination" : [ "obj-15", 2 ],
									"hidden" : 0,
									"midpoints" : [ 643.0, 381.0, 643.5, 381.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-27", 1 ],
									"destination" : [ "obj-42", 0 ],
									"hidden" : 0,
									"midpoints" : [ 689.5, 291.0, 689.5, 291.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [ 729.5, 345.0, 629.5, 345.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 1 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [ 729.5, 312.0, 729.5, 312.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 0 ],
									"destination" : [ "obj-44", 0 ],
									"hidden" : 0,
									"midpoints" : [ 689.5, 312.0, 689.5, 312.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 2 ],
									"destination" : [ "obj-33", 0 ],
									"hidden" : 0,
									"midpoints" : [ 769.5, 312.0, 769.5, 312.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"globalpatchername" : "",
						"fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route lcd",
					"id" : "obj-71",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 130.0, 580.0, 57.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 2",
					"hidden" : 1,
					"id" : "obj-68",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 130.0, 560.0, 30.0, 20.0 ],
					"fontname" : "Arial",
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pipe",
					"id" : "obj-60",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 690.0, 250.0, 33.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend 127.0.0.1 41337",
					"id" : "obj-44",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 30.0, 460.0, 147.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b s",
					"id" : "obj-67",
					"outlettype" : [ "bang", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 100.0, 130.0, 31.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/thum/shake",
					"id" : "obj-49",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 30.0, 290.0, 74.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "current buttons",
					"id" : "obj-40",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 940.0, 390.0, 97.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "table",
					"id" : "obj-66",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 600.0, 310.0, 50.0, 20.0 ],
					"fontname" : "Arial",
					"showeditor" : 0,
					"editor_rect" : [ 100.0, 100.0, 300.0, 300.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"name" : "",
						"notename" : 0,
						"signed" : 0,
						"size" : 8,
						"showeditor" : 0,
						"range" : 128
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "table",
					"id" : "obj-65",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 570.0, 460.0, 49.0, 20.0 ],
					"fontname" : "Arial",
					"showeditor" : 0,
					"editor_rect" : [ 100.0, 100.0, 300.0, 300.0 ],
					"saved_object_attributes" : 					{
						"embed" : 0,
						"name" : "",
						"notename" : 0,
						"signed" : 0,
						"size" : 8,
						"showeditor" : 0,
						"range" : 128
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-63",
					"outlettype" : [ "int" ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 690.0, 130.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"id" : "obj-26",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 690.0, 180.0, 34.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t l l",
					"id" : "obj-87",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 870.0, 410.0, 32.5, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i i",
					"id" : "obj-83",
					"outlettype" : [ "int", "int" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 970.0, 480.0, 32.5, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 0",
					"id" : "obj-84",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 970.0, 510.0, 34.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "iter",
					"id" : "obj-85",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 970.0, 460.0, 27.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl filter 0",
					"id" : "obj-86",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 930.0, 440.0, 59.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i i",
					"id" : "obj-82",
					"outlettype" : [ "int", "int" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 910.0, 500.0, 32.5, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "$1 100",
					"id" : "obj-81",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 910.0, 530.0, 47.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "itable",
					"hint" : "x 0 y 1",
					"id" : "obj-205",
					"outlettype" : [ "int", "bang" ],
					"embed" : 0,
					"name" : "",
					"size" : 8,
					"numinlets" : 2,
					"range" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 870.0, 320.0, 167.0, 64.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "iter",
					"id" : "obj-192",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 910.0, 480.0, 27.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl filter 0",
					"id" : "obj-188",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 870.0, 460.0, 59.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "select 0",
					"id" : "obj-187",
					"outlettype" : [ "bang", "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 900.0, 150.0, 59.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"id" : "obj-186",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 940.0, 170.0, 32.5, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "buddy",
					"id" : "obj-182",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 870.0, 250.0, 49.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "zl group 8",
					"id" : "obj-130",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 870.0, 390.0, 63.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "dump",
					"id" : "obj-92",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 690.0, 200.0, 41.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-95",
					"outlettype" : [ "int" ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 900.0, 130.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/thum/kill",
					"id" : "obj-64",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 190.0, 130.000031, 58.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route dev",
					"hidden" : 1,
					"id" : "obj-70",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 40.0, 30.0, 61.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 2",
					"hidden" : 1,
					"id" : "obj-69",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 40.0, 9.999992, 30.0, 20.0 ],
					"fontname" : "Arial",
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"text" : "\"device name\"",
					"id" : "obj-62",
					"outlettype" : [ "", "int", "", "" ],
					"readonly" : 1,
					"fontface" : 1,
					"fontsize" : 30.0,
					"numinlets" : 1,
					"numoutlets" : 4,
					"patching_rect" : [ 40.0, 50.0, 304.0, 43.0 ],
					"fontname" : "Arial",
					"rounded" : 25.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "dev IP",
					"id" : "obj-59",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 280.0, 420.0, 48.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ALL off",
					"id" : "obj-57",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 480.0, 360.0, 56.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Messaging",
					"id" : "obj-56",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 3,
					"fontsize" : 18.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 250.0, 220.0, 109.0, 27.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route key mode sync pipe",
					"id" : "obj-54",
					"outlettype" : [ "", "", "", "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 5,
					"patching_rect" : [ 450.0, 50.0, 177.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 2",
					"hidden" : 1,
					"id" : "obj-52",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 450.0, 29.999977, 30.0, 20.0 ],
					"fontname" : "Arial",
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "midi ch",
					"id" : "obj-36",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 940.0, 680.0, 51.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "prgm #",
					"id" : "obj-31",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 980.0, 650.0, 53.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route dump",
					"id" : "obj-30",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 410.0, 360.0, 71.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 2",
					"hidden" : 1,
					"id" : "obj-28",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 410.0, 330.000061, 30.0, 20.0 ],
					"fontname" : "Arial",
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route button notes",
					"id" : "obj-27",
					"outlettype" : [ "", "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 3,
					"patching_rect" : [ 730.0, 50.0, 107.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 2",
					"hidden" : 1,
					"id" : "obj-19",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 730.0, 30.0, 30.0, 20.0 ],
					"fontname" : "Arial",
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "123 0",
					"id" : "obj-25",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 410.0, 640.0, 41.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route midi prgm quant",
					"id" : "obj-14",
					"outlettype" : [ "", "", "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 4,
					"patching_rect" : [ 890.0, 590.0, 139.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-18",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 930.0, 650.0, 50.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-15",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 890.0, 680.0, 50.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiformat",
					"id" : "obj-13",
					"outlettype" : [ "int" ],
					"fontsize" : 12.0,
					"numinlets" : 7,
					"numoutlets" : 1,
					"patching_rect" : [ 680.0, 740.0, 119.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 2",
					"hidden" : 1,
					"id" : "obj-12",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 890.0, 570.0, 30.0, 20.0 ],
					"fontname" : "Arial",
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"id" : "obj-8",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 430.0, 410.0, 37.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b 3",
					"id" : "obj-4",
					"outlettype" : [ "bang", "bang", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 3,
					"patching_rect" : [ 410.0, 380.0, 59.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t b i",
					"id" : "obj-21",
					"outlettype" : [ "bang", "int" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 570.0, 480.0, 32.5, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"id" : "obj-11",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 570.0, 500.0, 23.5, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "dump",
					"id" : "obj-6",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 470.0, 410.0, 41.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p Magic",
					"id" : "obj-17",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 280.0, 53.0, 20.0 ],
					"fontname" : "Arial",
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 175.0, 44.0, 336.0, 222.0 ],
						"bglocked" : 0,
						"defrect" : [ 175.0, 44.0, 336.0, 222.0 ],
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
									"text" : "sprintf symout %s",
									"id" : "obj-2",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 20.0, 110.0, 105.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "/thum/notes $1",
									"id" : "obj-12",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 150.0, 70.0, 90.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sprintf symout %s",
									"id" : "obj-11",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 150.0, 50.0, 105.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "/thum/magic $1",
									"id" : "obj-4",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 20.0, 130.0, 93.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"id" : "obj-6",
									"outlettype" : [ "int" ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 20.0, 80.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-13",
									"outlettype" : [ "" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 20.0, 10.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-14",
									"outlettype" : [ "" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 150.0, 10.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-15",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 20.0, 180.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [ 159.5, 165.0, 29.5, 165.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [ 29.5, 150.0, 29.5, 150.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 159.5, 36.0, 159.5, 36.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 29.5, 36.0, 29.5, 36.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-12", 0 ],
									"hidden" : 0,
									"midpoints" : [ 159.5, 72.0, 159.5, 72.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"fontface" : 0,
						"globalpatchername" : "",
						"fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"fontname" : "Arial",
						"default_fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Note Manager",
					"id" : "obj-61",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 3,
					"fontsize" : 18.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 890.0, 80.0, 128.0, 27.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-55",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 620.0, 370.0, 40.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-50",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 520.0, 500.0, 40.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "noteOFF#",
					"id" : "obj-45",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 460.0, 500.0, 66.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "out 1",
					"hidden" : 1,
					"id" : "obj-38",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 680.0, 770.0, 37.0, 20.0 ],
					"fontname" : "Arial",
					"saved_object_attributes" : 					{
						"attr_comment" : ""
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+",
					"id" : "obj-37",
					"outlettype" : [ "int" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 600.0, 340.0, 32.5, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "listfunnel",
					"id" : "obj-46",
					"outlettype" : [ "list" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 600.0, 280.0, 58.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "coll modes",
					"id" : "obj-48",
					"outlettype" : [ "", "", "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 4,
					"patching_rect" : [ 600.0, 260.0, 68.0, 20.0 ],
					"fontname" : "Arial",
					"saved_object_attributes" : 					{
						"embed" : 0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-43",
					"outlettype" : [ "int" ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 550.0, 180.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "buddy",
					"id" : "obj-155",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 570.0, 410.0, 49.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "buddy",
					"id" : "obj-32",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 700.0, 540.0, 49.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pack i i",
					"id" : "obj-33",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 700.0, 560.0, 49.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/thum/mode $1",
					"id" : "obj-9",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 220.0, 360.0, 91.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/thum/key $1",
					"id" : "obj-5",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 250.0, 310.0, 79.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf symout %s",
					"id" : "obj-35",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 220.0, 340.0, 105.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-34",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 450.0, 90.0, 40.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sprintf symout %i",
					"id" : "obj-29",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 250.0, 290.0, 102.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "mode#",
					"id" : "obj-24",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 530.0, 90.0, 47.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "vel",
					"id" : "obj-23",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 770.0, 180.0, 26.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-22",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 730.0, 180.0, 40.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-20",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 570.0, 179.999985, 40.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "unpack",
					"id" : "obj-16",
					"outlettype" : [ "int", "int" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 730.0, 90.0, 47.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "noteON#",
					"id" : "obj-47",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 660.0, 370.0, 59.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "butt#",
					"id" : "obj-42",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 610.0, 180.0, 43.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-41",
					"outlettype" : [ "int", "bang" ],
					"minimum" : 0,
					"fontsize" : 12.0,
					"maximum" : 5,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 490.0, 90.0, 40.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "note# offset",
					"linecount" : 2,
					"id" : "obj-7",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 400.0, 90.0, 47.0, 34.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route ip msg magic kill",
					"id" : "obj-1",
					"outlettype" : [ "", "", "", "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 5,
					"patching_rect" : [ 100.0, 110.0, 139.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"id" : "obj-3",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 420.0, 121.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "in 2",
					"hidden" : 1,
					"id" : "obj-2",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 100.0, 90.0, 30.0, 20.0 ],
					"fontname" : "Arial",
					"saved_object_attributes" : 					{

					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "host $1",
					"id" : "obj-53",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 70.0, 340.0, 50.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend 127.0.0.1 31337",
					"id" : "obj-10",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 130.0, 440.0, 147.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"id" : "obj-58",
					"mode" : 1,
					"numinlets" : 1,
					"angle" : 10.0,
					"grad1" : [ 0.45098, 0.74902, 0.929412, 1.0 ],
					"numoutlets" : 0,
					"patching_rect" : [ 390.0, 40.0, 663.811279, 729.06604 ],
					"rounded" : 50,
					"grad2" : [ 0.45098, 0.6, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"id" : "obj-51",
					"mode" : 1,
					"numinlets" : 1,
					"angle" : 10.0,
					"grad1" : [ 0.45098, 0.74902, 0.929412, 1.0 ],
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 40.0, 341.0, 451.0 ],
					"rounded" : 50,
					"grad2" : [ 0.45098, 0.6, 1.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"id" : "obj-89",
					"mode" : 1,
					"numinlets" : 1,
					"angle" : 10.0,
					"grad1" : [ 0.45098, 0.74902, 0.929412, 1.0 ],
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 570.0, 130.0, 58.0 ],
					"rounded" : 50,
					"grad2" : [ 0.45098, 0.6, 1.0, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-74", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [ 709.5, 699.0, 709.5, 699.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-74", 1 ],
					"destination" : [ "obj-73", 1 ],
					"hidden" : 0,
					"midpoints" : [ 754.5, 699.0, 754.5, 699.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [ 709.5, 720.0, 689.5, 720.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 1 ],
					"destination" : [ "obj-73", 2 ],
					"hidden" : 0,
					"midpoints" : [ 993.5, 630.0, 799.5, 630.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 1,
					"midpoints" : [ 899.5, 591.0, 899.5, 591.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 899.5, 612.0, 899.5, 612.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-13", 6 ],
					"hidden" : 0,
					"midpoints" : [ 899.5, 666.0, 819.0, 666.0, 819.0, 735.0, 789.5, 735.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 1 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"midpoints" : [ 939.5, 612.0, 939.5, 612.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 1 ],
					"destination" : [ "obj-13", 3 ],
					"hidden" : 0,
					"midpoints" : [ 939.5, 636.0, 819.0, 636.0, 819.0, 735.0, 739.5, 735.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-76", 0 ],
					"destination" : [ "obj-72", 0 ],
					"hidden" : 0,
					"midpoints" : [ 689.5, 612.0, 689.5, 612.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-72", 1 ],
					"hidden" : 0,
					"midpoints" : [ 709.5, 582.0, 709.5, 582.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"midpoints" : [ 689.5, 642.0, 689.5, 642.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 1 ],
					"destination" : [ "obj-74", 0 ],
					"hidden" : 0,
					"midpoints" : [ 709.5, 642.0, 709.5, 642.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-13", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 1,
					"midpoints" : [ 689.5, 762.0, 689.5, 762.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 2 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"midpoints" : [ 459.5, 402.0, 479.5, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 1 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 439.5, 402.0, 439.5, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [ 419.5, 402.0, 419.5, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [ 419.5, 381.0, 419.5, 381.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-13", 2 ],
					"hidden" : 0,
					"midpoints" : [ 419.5, 726.0, 722.833313, 726.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [ 459.5, 276.0, 259.5, 276.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [ 499.5, 276.0, 229.5, 276.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-34", 0 ],
					"hidden" : 0,
					"midpoints" : [ 459.5, 72.0, 459.5, 72.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 1,
					"midpoints" : [ 459.5, 51.0, 459.5, 51.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 1 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 499.0, 72.0, 499.5, 72.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 2 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"midpoints" : [ 538.5, 81.0, 699.5, 81.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-26", 1 ],
					"hidden" : 0,
					"midpoints" : [ 459.5, 165.0, 714.5, 165.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-34", 0 ],
					"destination" : [ "obj-37", 1 ],
					"hidden" : 0,
					"midpoints" : [ 459.5, 336.0, 623.0, 336.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-26", 1 ],
					"hidden" : 0,
					"midpoints" : [ 499.5, 165.0, 714.5, 165.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-48", 0 ],
					"hidden" : 0,
					"midpoints" : [ 499.5, 246.0, 609.5, 246.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 1 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 139.5, 132.0, 139.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-67", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 132.0, 109.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 1 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [ 121.5, 327.0, 79.5, 327.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 276.0, 39.5, 276.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-66", 0 ],
					"hidden" : 0,
					"midpoints" : [ 609.5, 300.0, 609.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"midpoints" : [ 609.5, 330.0, 609.5, 330.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-50", 0 ],
					"hidden" : 0,
					"midpoints" : [ 579.5, 480.0, 529.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 579.5, 480.0, 579.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-155", 1 ],
					"destination" : [ "obj-65", 1 ],
					"hidden" : 0,
					"midpoints" : [ 609.5, 432.0, 609.5, 432.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [ 439.5, 447.0, 579.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-155", 0 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [ 579.5, 432.0, 579.5, 432.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [ 479.5, 447.0, 579.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [ 699.5, 150.0, 699.5, 150.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-92", 0 ],
					"hidden" : 0,
					"midpoints" : [ 699.5, 201.0, 699.5, 201.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 1 ],
					"destination" : [ "obj-95", 0 ],
					"hidden" : 0,
					"midpoints" : [ 767.5, 126.0, 909.5, 126.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-182", 0 ],
					"hidden" : 0,
					"midpoints" : [ 739.5, 165.0, 879.5, 165.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [ 979.5, 528.0, 957.0, 528.0, 957.0, 525.0, 807.0, 525.0, 807.0, 87.0, 739.5, 87.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-87", 1 ],
					"destination" : [ "obj-86", 0 ],
					"hidden" : 0,
					"midpoints" : [ 893.0, 432.0, 939.5, 432.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-130", 0 ],
					"destination" : [ "obj-87", 0 ],
					"hidden" : 0,
					"midpoints" : [ 879.5, 411.0, 879.5, 411.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-86", 1 ],
					"destination" : [ "obj-85", 0 ],
					"hidden" : 0,
					"midpoints" : [ 979.5, 462.0, 979.5, 462.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 0 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [ 979.5, 480.0, 979.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-84", 0 ],
					"hidden" : 0,
					"midpoints" : [ 979.5, 501.0, 979.5, 501.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [ 919.5, 549.0, 807.0, 549.0, 807.0, 87.0, 739.5, 87.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 0,
					"midpoints" : [ 919.5, 522.0, 919.5, 522.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-192", 0 ],
					"destination" : [ "obj-82", 0 ],
					"hidden" : 0,
					"midpoints" : [ 919.5, 501.0, 919.5, 501.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-188", 1 ],
					"destination" : [ "obj-192", 0 ],
					"hidden" : 0,
					"midpoints" : [ 919.5, 480.0, 919.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-1", 0 ],
					"hidden" : 1,
					"midpoints" : [ 109.5, 111.0, 109.5, 111.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 2 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 132.0, 169.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-70", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 1,
					"midpoints" : [ 49.5, 51.0, 49.5, 51.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 1,
					"midpoints" : [ 49.5, 30.0, 49.5, 30.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 1,
					"midpoints" : [ 419.5, 351.0, 419.5, 351.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 405.0, 139.5, 405.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-32", 1 ],
					"hidden" : 0,
					"midpoints" : [ 579.5, 519.0, 739.5, 519.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-155", 1 ],
					"hidden" : 0,
					"midpoints" : [ 609.5, 360.0, 609.5, 360.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [ 609.5, 402.0, 709.5, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-32", 1 ],
					"hidden" : 0,
					"midpoints" : [ 739.5, 201.0, 739.5, 201.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"midpoints" : [ 609.5, 282.0, 609.5, 282.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"midpoints" : [ 709.5, 561.0, 709.5, 561.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 1 ],
					"destination" : [ "obj-33", 1 ],
					"hidden" : 0,
					"midpoints" : [ 739.5, 561.0, 739.5, 561.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 229.5, 405.0, 139.5, 405.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 259.5, 312.0, 259.5, 312.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 259.5, 330.0, 139.5, 330.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-20", 0 ],
					"hidden" : 0,
					"midpoints" : [ 739.5, 165.0, 579.5, 165.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 79.5, 426.0, 139.5, 426.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-3", 1 ],
					"hidden" : 0,
					"midpoints" : [ 79.5, 405.0, 271.5, 405.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"midpoints" : [ 229.5, 360.0, 229.5, 360.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 1 ],
					"destination" : [ "obj-32", 0 ],
					"hidden" : 0,
					"midpoints" : [ 593.0, 501.0, 709.5, 501.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-11", 0 ],
					"hidden" : 0,
					"midpoints" : [ 579.5, 501.0, 579.5, 501.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 1 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [ 767.5, 165.0, 739.5, 165.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 1 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 767.5, 165.0, 559.5, 165.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-19", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 1,
					"midpoints" : [ 739.5, 51.0, 739.5, 51.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"midpoints" : [ 739.5, 72.0, 739.5, 72.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 1 ],
					"destination" : [ "obj-17", 1 ],
					"hidden" : 0,
					"midpoints" : [ 783.5, 165.0, 203.5, 165.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 3 ],
					"destination" : [ "obj-64", 0 ],
					"hidden" : 0,
					"midpoints" : [ 199.5, 132.0, 199.5, 132.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"midpoints" : [ 199.5, 267.0, 139.5, 267.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-95", 0 ],
					"destination" : [ "obj-187", 0 ],
					"hidden" : 0,
					"midpoints" : [ 909.5, 150.0, 909.5, 150.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-187", 1 ],
					"destination" : [ "obj-186", 0 ],
					"hidden" : 0,
					"midpoints" : [ 949.5, 171.0, 949.5, 171.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-186", 0 ],
					"destination" : [ "obj-182", 1 ],
					"hidden" : 0,
					"midpoints" : [ 949.5, 237.0, 909.5, 237.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-187", 0 ],
					"destination" : [ "obj-182", 1 ],
					"hidden" : 0,
					"midpoints" : [ 909.5, 171.0, 909.5, 171.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [ 609.5, 366.0, 629.5, 366.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-182", 0 ],
					"destination" : [ "obj-205", 0 ],
					"hidden" : 0,
					"midpoints" : [ 879.5, 270.0, 879.5, 270.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-182", 1 ],
					"destination" : [ "obj-205", 1 ],
					"hidden" : 0,
					"midpoints" : [ 909.5, 306.0, 1027.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [ 39.5, 309.0, 39.5, 309.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [ 79.5, 447.0, 39.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-87", 0 ],
					"destination" : [ "obj-188", 0 ],
					"hidden" : 0,
					"midpoints" : [ 879.5, 432.0, 879.5, 432.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-205", 0 ],
					"destination" : [ "obj-130", 0 ],
					"hidden" : 0,
					"midpoints" : [ 879.5, 384.0, 879.5, 384.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-92", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [ 699.5, 219.0, 699.5, 219.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-60", 0 ],
					"destination" : [ "obj-205", 0 ],
					"hidden" : 0,
					"midpoints" : [ 699.5, 306.0, 879.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 3 ],
					"destination" : [ "obj-60", 1 ],
					"hidden" : 0,
					"midpoints" : [ 578.0, 81.0, 675.0, 81.0, 675.0, 237.0, 713.5, 237.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-68", 0 ],
					"destination" : [ "obj-71", 0 ],
					"hidden" : 1,
					"midpoints" : [ 139.5, 582.0, 139.5, 582.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-104", 0 ],
					"hidden" : 0,
					"midpoints" : [ 139.5, 600.0, 139.5, 600.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-88", 0 ],
					"destination" : [ "obj-65", 0 ],
					"hidden" : 0,
					"midpoints" : [ 559.5, 447.0, 579.5, 447.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-88", 1 ],
					"destination" : [ "obj-155", 0 ],
					"hidden" : 0,
					"midpoints" : [ 579.5, 234.0, 579.5, 234.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-88", 1 ],
					"destination" : [ "obj-66", 0 ],
					"hidden" : 0,
					"midpoints" : [ 579.5, 306.0, 609.5, 306.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-88", 1 ],
					"hidden" : 0,
					"midpoints" : [ 579.5, 201.0, 579.5, 201.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-88", 0 ],
					"hidden" : 0,
					"midpoints" : [ 559.5, 201.0, 559.5, 201.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 2 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [ 979.5, 612.0, 979.5, 612.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [ 979.5, 630.0, 759.0, 630.0, 759.0, 525.0, 639.5, 525.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 639.5, 582.0, 689.5, 582.0 ]
				}

			}
 ]
	}

}
