{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 382.0, 215.0, 529.0, 493.0 ],
		"bglocked" : 0,
		"defrect" : [ 382.0, 215.0, 529.0, 493.0 ],
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
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pipe 3000",
					"hidden" : 1,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 80.0, 390.0, 63.0, 20.0 ],
					"id" : "obj-2",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r control_msg",
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 300.0, 20.0, 83.0, 20.0 ],
					"id" : "obj-1",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel start cont stop",
					"numinlets" : 1,
					"numoutlets" : 4,
					"patching_rect" : [ 260.0, 60.0, 139.0, 20.0 ],
					"id" : "obj-59",
					"fontname" : "Arial",
					"outlettype" : [ "bang", "bang", "bang", "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 1",
					"hidden" : 1,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 10.0, 72.0, 20.0 ],
					"id" : "obj-58",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 1",
					"hidden" : 1,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 80.0, 370.0, 72.0, 20.0 ],
					"id" : "obj-57",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "inlet",
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 260.0, 10.0, 25.0, 25.0 ],
					"id" : "obj-55",
					"outlettype" : [ "" ],
					"comment" : ""
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess \"from MaxMSP 1\"",
					"hidden" : 1,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 240.0, 210.0, 160.0, 20.0 ],
					"id" : "obj-52",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "remember the time relative syntax references the global transport",
					"linecount" : 4,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 90.0, 113.0, 62.0 ],
					"id" : "obj-51",
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 200.0, 90.0, 20.0, 20.0 ],
					"id" : "obj-47",
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "+~ 50",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 300.0, 40.0, 20.0 ],
					"id" : "obj-40",
					"fontname" : "Arial",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~ 200",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 280.0, 44.0, 20.0 ],
					"id" : "obj-41",
					"fontname" : "Arial",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "cycle~",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 320.0, 44.0, 20.0 ],
					"id" : "obj-42",
					"fontname" : "Arial",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "flonum",
					"maximum" : 1.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 200.0, 350.0, 50.0, 20.0 ],
					"id" : "obj-32",
					"fontname" : "Arial",
					"outlettype" : [ "float", "bang" ],
					"minimum" : 0.0,
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "*~ 0.",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 390.0, 35.0, 20.0 ],
					"id" : "obj-35",
					"fontname" : "Arial",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ezdac~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 160.0, 430.0, 45.0, 45.0 ],
					"id" : "obj-22"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "click~",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 90.0, 38.0, 20.0 ],
					"id" : "obj-24",
					"fontname" : "Arial",
					"outlettype" : [ "signal" ],
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 30.0, 20.0, 20.0 ],
					"id" : "obj-25",
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 4n",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 60.0, 56.0, 20.0 ],
					"id" : "obj-26",
					"fontname" : "Arial",
					"outlettype" : [ "bang" ],
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "scope~",
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 210.0, 114.0, 50.0 ],
					"id" : "obj-44",
					"calccount" : 700,
					"rounded" : 0,
					"bgcolor" : [ 0.529412, 0.529412, 0.529412, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sync~",
					"numinlets" : 1,
					"numoutlets" : 3,
					"patching_rect" : [ 160.0, 120.0, 59.0, 20.0 ],
					"id" : "obj-45",
					"fontname" : "Arial",
					"outlettype" : [ "signal", "", "int" ],
					"fontsize" : 11.595187
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p keystroke",
					"numinlets" : 0,
					"numoutlets" : 3,
					"patching_rect" : [ 420.0, 70.0, 72.0, 20.0 ],
					"id" : "obj-56",
					"fontname" : "Arial",
					"outlettype" : [ "bang", "bang", "bang" ],
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 919.0, 202.0, 224.0, 306.0 ],
						"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
						"bglocked" : 0,
						"defrect" : [ 919.0, 202.0, 224.0, 306.0 ],
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
						"imprint" : 1,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 0.0,
						"boxes" : [ 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 2",
									"hidden" : 0,
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 80.0, 100.0, 32.5, 20.0 ],
									"id" : "obj-7",
									"presentation" : 0,
									"fontname" : "Arial",
									"outlettype" : [ "bang", "bang" ],
									"background" : 0,
									"color" : [ 0.8, 0.84, 0.71, 1.0 ],
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"ignoreclick" : 0,
									"fontface" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "togedge",
									"hidden" : 0,
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 120.0, 140.0, 59.0, 20.0 ],
									"id" : "obj-5",
									"presentation" : 0,
									"fontname" : "Arial",
									"outlettype" : [ "bang", "bang" ],
									"background" : 0,
									"color" : [ 0.8, 0.84, 0.71, 1.0 ],
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"ignoreclick" : 0,
									"fontface" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "cont",
									"hidden" : 0,
									"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 120.0, 250.0, 31.0, 20.0 ],
									"id" : "obj-147",
									"presentation" : 0,
									"fontname" : "Arial",
									"background" : 0,
									"underline" : 0,
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
									"ignoreclick" : 1,
									"fontface" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "stop",
									"hidden" : 0,
									"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 160.0, 250.0, 33.0, 20.0 ],
									"id" : "obj-148",
									"presentation" : 0,
									"fontname" : "Arial",
									"background" : 0,
									"underline" : 0,
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
									"ignoreclick" : 1,
									"fontface" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "start",
									"hidden" : 0,
									"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 40.0, 250.0, 35.0, 20.0 ],
									"id" : "obj-149",
									"presentation" : 0,
									"fontname" : "Arial",
									"background" : 0,
									"underline" : 0,
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
									"ignoreclick" : 1,
									"fontface" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"hidden" : 0,
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 40.0, 210.0, 25.0, 25.0 ],
									"id" : "obj-1",
									"presentation" : 0,
									"background" : 0,
									"ignoreclick" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "select 32 8",
									"hidden" : 0,
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"numinlets" : 1,
									"numoutlets" : 3,
									"patching_rect" : [ 40.0, 70.0, 98.0, 20.0 ],
									"id" : "obj-33",
									"presentation" : 0,
									"fontname" : "Arial",
									"outlettype" : [ "bang", "bang", "" ],
									"background" : 0,
									"color" : [ 0.8, 0.84, 0.71, 1.0 ],
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"ignoreclick" : 0,
									"fontface" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "key",
									"hidden" : 0,
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"numinlets" : 0,
									"numoutlets" : 4,
									"patching_rect" : [ 40.0, 20.0, 59.5, 20.0 ],
									"id" : "obj-6",
									"presentation" : 0,
									"fontname" : "Arial",
									"outlettype" : [ "int", "int", "int", "int" ],
									"background" : 0,
									"color" : [ 0.8, 0.84, 0.71, 1.0 ],
									"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
									"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
									"ignoreclick" : 0,
									"fontface" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"hidden" : 0,
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 120.0, 210.0, 25.0, 25.0 ],
									"id" : "obj-54",
									"presentation" : 0,
									"background" : 0,
									"ignoreclick" : 0,
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"hidden" : 0,
									"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 160.0, 210.0, 25.0, 25.0 ],
									"id" : "obj-55",
									"presentation" : 0,
									"background" : 0,
									"ignoreclick" : 0,
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-55", 0 ],
									"hidden" : 0,
									"color" : [ 0.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [ 169.5, 162.0, 169.5, 162.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-54", 0 ],
									"hidden" : 0,
									"color" : [ 0.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [ 129.5, 162.0, 129.5, 162.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-33", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"color" : [ 0.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [ 49.5, 135.0, 129.5, 135.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 0 ],
									"destination" : [ "obj-55", 0 ],
									"hidden" : 0,
									"color" : [ 0.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [ 89.5, 179.0, 169.5, 179.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-33", 0 ],
									"hidden" : 0,
									"color" : [ 0.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [ 49.5, 42.0, 49.5, 42.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-33", 1 ],
									"destination" : [ "obj-7", 0 ],
									"hidden" : 0,
									"color" : [ 0.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [ 89.0, 90.0, 89.5, 90.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-7", 1 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"color" : [ 0.0, 0.0, 0.0, 1.0 ],
									"midpoints" : [ 103.0, 157.0, 49.5, 157.0 ]
								}

							}
 ]
					}
,
					"saved_object_attributes" : 					{
						"default_fontface" : 0,
						"fontname" : "Arial",
						"default_fontname" : "Arial",
						"globalpatchername" : "",
						"fontface" : 0,
						"default_fontsize" : 12.0,
						"fontsize" : 12.0
					}

				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Midi Control Messages",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 260.0, 180.0, 132.048996, 20.0 ],
					"id" : "obj-146",
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "cont",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 304.0, 160.0, 31.0, 20.0 ],
					"id" : "obj-147",
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "stop",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 344.0, 160.0, 33.0, 20.0 ],
					"id" : "obj-148",
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "start",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 264.0, 160.0, 35.0, 20.0 ],
					"id" : "obj-149",
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "251",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 300.0, 130.0, 32.5, 18.0 ],
					"id" : "obj-150",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "252",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 340.0, 130.0, 32.5, 18.0 ],
					"id" : "obj-151",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "250",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 260.0, 130.0, 32.5, 18.0 ],
					"id" : "obj-103",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiout",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 250.0, 49.0, 20.0 ],
					"id" : "obj-8",
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 1,
					"midpoints" : [ 249.5, 231.0, 209.5, 231.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-2", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 1,
					"midpoints" : [ 89.5, 426.0, 169.5, 426.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-57", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 1,
					"midpoints" : [ 89.5, 390.0, 89.5, 390.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 1,
					"midpoints" : [ 169.5, 30.0, 169.5, 30.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-41", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 141.0, 169.5, 141.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 300.0, 169.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 321.0, 169.5, 321.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 411.0, 169.5, 411.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-22", 1 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 426.0, 195.5, 426.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-35", 1 ],
					"hidden" : 0,
					"midpoints" : [ 209.5, 372.0, 185.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 342.0, 169.5, 342.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 111.0, 169.5, 111.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 195.0, 49.5, 195.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 2 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 209.5, 141.0, 209.5, 141.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-47", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 87.0, 209.5, 87.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-24", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 81.0, 169.5, 81.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [ 169.5, 51.0, 169.5, 51.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-151", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 349.5, 150.0, 209.5, 150.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-150", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 309.5, 150.0, 209.5, 150.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-8", 0 ],
					"hidden" : 0,
					"midpoints" : [ 269.5, 150.0, 209.5, 150.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-103", 0 ],
					"hidden" : 0,
					"midpoints" : [ 269.5, 81.0, 269.5, 81.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 1 ],
					"destination" : [ "obj-150", 0 ],
					"hidden" : 0,
					"midpoints" : [ 309.5, 81.0, 309.5, 81.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 2 ],
					"destination" : [ "obj-151", 0 ],
					"hidden" : 0,
					"midpoints" : [ 349.5, 81.0, 349.5, 81.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [ 269.5, 36.0, 269.5, 36.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [ 309.5, 42.0, 269.5, 42.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-103", 0 ],
					"hidden" : 0,
					"midpoints" : [ 429.5, 117.0, 269.5, 117.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 2 ],
					"destination" : [ "obj-151", 0 ],
					"hidden" : 0,
					"midpoints" : [ 482.5, 117.0, 349.5, 117.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 1 ],
					"destination" : [ "obj-150", 0 ],
					"hidden" : 0,
					"midpoints" : [ 456.0, 117.0, 309.5, 117.0 ]
				}

			}
 ]
	}

}
