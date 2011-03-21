{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 72.0, 119.0, 1350.0, 744.0 ],
		"bgcolor" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 72.0, 119.0, 1350.0, 744.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 1,
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
					"maxclass" : "message",
					"text" : "0",
					"presentation_rect" : [ 1124.0, 290.0, 0.0, 0.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 1140.0, 300.0, 32.5, 18.0 ],
					"id" : "obj-136",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 1100.0, 300.0, 32.5, 18.0 ],
					"id" : "obj-135",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "5 key",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1140.0, 280.0, 41.0, 20.0 ],
					"id" : "obj-132",
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pak 176 i 127",
					"numinlets" : 3,
					"numoutlets" : 1,
					"patching_rect" : [ 80.0, 390.0, 99.0, 20.0 ],
					"id" : "obj-117",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "key",
					"numinlets" : 0,
					"numoutlets" : 4,
					"patching_rect" : [ 120.0, 370.0, 59.5, 20.0 ],
					"id" : "obj-61",
					"fontname" : "Arial",
					"outlettype" : [ "int", "int", "int", "int" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Control Messages",
					"presentation_rect" : [ 360.0, 80.0, 112.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 800.0, 130.0, 112.0, 20.0 ],
					"id" : "obj-106",
					"presentation" : 1,
					"fontname" : "Arial",
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "cont",
					"presentation_rect" : [ 400.0, 110.0, 37.0, 18.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 840.0, 150.0, 37.0, 18.0 ],
					"id" : "obj-109",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "stop",
					"presentation_rect" : [ 440.0, 110.0, 37.0, 18.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 880.0, 150.0, 37.0, 18.0 ],
					"id" : "obj-107",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "start",
					"presentation_rect" : [ 360.0, 110.0, 38.0, 18.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 800.0, 150.0, 38.0, 18.0 ],
					"id" : "obj-65",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "MidiClockGenerator",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 800.0, 200.0, 117.0, 20.0 ],
					"id" : "obj-53",
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 53",
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 1100.0, 280.0, 43.0, 20.0 ],
					"id" : "obj-105",
					"fontname" : "Arial",
					"outlettype" : [ "bang", "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "key",
					"numinlets" : 0,
					"numoutlets" : 4,
					"patching_rect" : [ 1100.0, 260.0, 59.5, 20.0 ],
					"id" : "obj-48",
					"fontname" : "Arial",
					"outlettype" : [ "int", "int", "int", "int" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 1080.0, 300.0, 20.0, 20.0 ],
					"id" : "obj-113",
					"outlettype" : [ "bang" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 1",
					"hidden" : 1,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 500.0, 280.0, 72.0, 20.0 ],
					"id" : "obj-60",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p GM_prgm_changer",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 340.0, 90.0, 124.0, 20.0 ],
					"id" : "obj-104",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 640.0, 480.0 ],
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
									"maxclass" : "comment",
									"text" : "General MIdi Program Changer",
									"presentation_linecount" : 2,
									"presentation_rect" : [ 40.0, 80.0, 138.0, 34.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 70.0, 110.0, 192.0, 20.0 ],
									"id" : "obj-65",
									"presentation" : 1,
									"fontname" : "Arial",
									"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
									"fontface" : 1,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "player pos",
									"presentation_rect" : [ 90.0, 110.0, 69.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 230.0, 140.0, 78.0, 20.0 ],
									"id" : "obj-61",
									"presentation" : 1,
									"fontname" : "Arial",
									"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
									"fontface" : 1,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "p midi_prgm_changer",
									"numinlets" : 2,
									"numoutlets" : 0,
									"patching_rect" : [ 70.0, 160.0, 139.0, 20.0 ],
									"id" : "obj-60",
									"fontname" : "Arial",
									"fontsize" : 12.0,
									"patcher" : 									{
										"fileversion" : 1,
										"rect" : [ 25.0, 69.0, 640.0, 480.0 ],
										"bglocked" : 0,
										"defrect" : [ 25.0, 69.0, 640.0, 480.0 ],
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
										"boxes" : [ 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "target $1",
													"numinlets" : 2,
													"numoutlets" : 1,
													"patching_rect" : [ 160.0, 120.0, 58.0, 18.0 ],
													"id" : "obj-68",
													"fontname" : "Arial",
													"outlettype" : [ "" ],
													"fontsize" : 12.0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "b 2",
													"numinlets" : 1,
													"numoutlets" : 2,
													"patching_rect" : [ 50.0, 110.0, 32.5, 20.0 ],
													"id" : "obj-65",
													"fontname" : "Arial",
													"outlettype" : [ "bang", "bang" ],
													"fontsize" : 12.0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "s thum_msg_2",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 50.0, 190.0, 89.0, 20.0 ],
													"id" : "obj-64",
													"fontname" : "Arial",
													"fontsize" : 12.0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "newobj",
													"text" : "s thum_msg_1",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 120.0, 170.0, 89.0, 20.0 ],
													"id" : "obj-63",
													"fontname" : "Arial",
													"fontsize" : 12.0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "prgm 0",
													"numinlets" : 2,
													"numoutlets" : 1,
													"patching_rect" : [ 50.0, 170.0, 69.0, 18.0 ],
													"id" : "obj-61",
													"fontname" : "Arial",
													"outlettype" : [ "" ],
													"fontsize" : 12.0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "prgm $1",
													"numinlets" : 2,
													"numoutlets" : 1,
													"patching_rect" : [ 100.0, 100.0, 55.0, 18.0 ],
													"id" : "obj-48",
													"fontname" : "Arial",
													"outlettype" : [ "" ],
													"fontsize" : 12.0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "message",
													"text" : "target 1",
													"numinlets" : 2,
													"numoutlets" : 1,
													"patching_rect" : [ 120.0, 150.0, 51.0, 18.0 ],
													"id" : "obj-29",
													"fontname" : "Arial",
													"outlettype" : [ "" ],
													"fontsize" : 12.0
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"patching_rect" : [ 70.0, 40.0, 25.0, 25.0 ],
													"id" : "obj-7",
													"outlettype" : [ "int" ],
													"comment" : ""
												}

											}
, 											{
												"box" : 												{
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"patching_rect" : [ 160.0, 40.0, 25.0, 25.0 ],
													"id" : "obj-39",
													"outlettype" : [ "int" ],
													"comment" : ""
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"source" : [ "obj-48", 0 ],
													"destination" : [ "obj-61", 1 ],
													"hidden" : 0,
													"midpoints" : [ 109.5, 118.0, 109.5, 118.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-61", 0 ],
													"destination" : [ "obj-64", 0 ],
													"hidden" : 0,
													"midpoints" : [ 59.5, 190.0, 59.5, 190.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-29", 0 ],
													"destination" : [ "obj-63", 0 ],
													"hidden" : 0,
													"midpoints" : [ 129.5, 169.0, 129.5, 169.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-65", 0 ],
													"destination" : [ "obj-61", 0 ],
													"hidden" : 0,
													"midpoints" : [ 59.5, 130.0, 59.5, 130.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-65", 1 ],
													"destination" : [ "obj-29", 0 ],
													"hidden" : 0,
													"midpoints" : [ 73.0, 130.0, 129.5, 130.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-68", 0 ],
													"destination" : [ "obj-29", 1 ],
													"hidden" : 0,
													"midpoints" : [ 169.5, 139.0, 162.0, 139.0, 162.0, 145.0, 161.5, 145.0 ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-7", 0 ],
													"destination" : [ "obj-65", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-7", 0 ],
													"destination" : [ "obj-48", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
, 											{
												"patchline" : 												{
													"source" : [ "obj-39", 0 ],
													"destination" : [ "obj-68", 0 ],
													"hidden" : 0,
													"midpoints" : [  ]
												}

											}
 ]
									}
,
									"saved_object_attributes" : 									{
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
, 							{
								"box" : 								{
									"maxclass" : "number",
									"maximum" : 20,
									"presentation_rect" : [ 40.0, 110.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 190.0, 140.0, 43.0, 20.0 ],
									"id" : "obj-53",
									"presentation" : 1,
									"fontname" : "Arial",
									"outlettype" : [ "int", "bang" ],
									"minimum" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "prgm #",
									"presentation_rect" : [ 220.0, 110.0, 53.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 110.0, 140.0, 51.0, 20.0 ],
									"id" : "obj-105",
									"presentation" : 1,
									"fontname" : "Arial",
									"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
									"fontface" : 1,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"maximum" : 127,
									"presentation_rect" : [ 160.0, 110.0, 50.0, 20.0 ],
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 70.0, 140.0, 43.0, 20.0 ],
									"id" : "obj-35",
									"presentation" : 1,
									"fontname" : "Arial",
									"outlettype" : [ "int", "bang" ],
									"minimum" : 0,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
									"presentation_rect" : [ 20.0, 70.0, 264.0, 73.0 ],
									"numinlets" : 1,
									"mode" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 100.0, 275.0, 92.0 ],
									"id" : "obj-64",
									"presentation" : 1,
									"rounded" : 50,
									"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-35", 0 ],
									"destination" : [ "obj-60", 0 ],
									"hidden" : 0,
									"midpoints" : [ 79.5, 160.0, 79.5, 160.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-53", 0 ],
									"destination" : [ "obj-60", 1 ],
									"hidden" : 0,
									"midpoints" : [ 199.5, 160.0, 199.5, 160.0 ]
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
					"maxclass" : "newobj",
					"text" : "p ToDo",
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 720.0, 30.0, 48.0, 20.0 ],
					"id" : "obj-101",
					"fontname" : "Arial",
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 25.0, 69.0, 477.0, 218.0 ],
						"bglocked" : 0,
						"defrect" : [ 25.0, 69.0, 477.0, 218.0 ],
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
									"maxclass" : "comment",
									"text" : "- replace unnecessary jit.gl.render w/ lcd obj",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 80.0, 30.0, 276.0, 20.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "- more thorough implementation of Magic Modes",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 80.0, 90.0, 276.0, 20.0 ],
									"id" : "obj-1",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "- implement poly~ timer (2 min)\n in order to eliminate dormant players",
									"linecount" : 2,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 80.0, 50.0, 262.0, 34.0 ],
									"id" : "obj-51",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
 ],
						"lines" : [  ]
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
					"text" : "opening txt",
					"presentation_rect" : [ 60.0, 220.0, 67.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 680.0, 350.0, 67.0, 20.0 ],
					"id" : "obj-99",
					"presentation" : 1,
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"presentation_rect" : [ 40.0, 220.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 600.0, 350.0, 16.0, 16.0 ],
					"id" : "obj-70",
					"presentation" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "fade",
					"presentation_rect" : [ 280.0, 230.0, 40.0, 21.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 860.0, 240.0, 39.0, 21.0 ],
					"id" : "obj-98",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 14.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route msg title bv_pwr bv_fade",
					"linecount" : 2,
					"numinlets" : 1,
					"numoutlets" : 5,
					"patching_rect" : [ 580.0, 260.0, 125.0, 34.0 ],
					"id" : "obj-112",
					"fontname" : "Arial",
					"outlettype" : [ "", "", "", "", "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r proj_msg",
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 580.0, 240.0, 67.0, 20.0 ],
					"id" : "obj-111",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "\"Akai MPK49 Port 1\"",
					"linecount" : 2,
					"hidden" : 1,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 280.0, 250.0, 82.0, 32.0 ],
					"id" : "obj-110",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"hidden" : 1,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 200.0, 220.0, 60.0, 20.0 ],
					"id" : "obj-97",
					"fontname" : "Arial",
					"outlettype" : [ "bang" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "\"from MaxMSP 1\"",
					"linecount" : 2,
					"hidden" : 1,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 200.0, 250.0, 73.0, 32.0 ],
					"id" : "obj-16",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Player Report Window",
					"presentation_rect" : [ 800.0, 10.0, 138.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 560.0, 110.0, 141.0, 20.0 ],
					"id" : "obj-9",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ButtonView fade",
					"presentation_rect" : [ 60.0, 310.0, 96.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 680.0, 410.0, 96.0, 20.0 ],
					"id" : "obj-96",
					"presentation" : 1,
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "ButtonView pwr",
					"presentation_rect" : [ 60.0, 280.0, 95.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 680.0, 390.0, 95.0, 20.0 ],
					"id" : "obj-95",
					"presentation" : 1,
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"presentation_rect" : [ 40.0, 310.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 660.0, 410.0, 16.0, 16.0 ],
					"id" : "obj-93",
					"presentation" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"presentation_rect" : [ 40.0, 280.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 640.0, 390.0, 16.0, 16.0 ],
					"id" : "obj-90",
					"presentation" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "title fade",
					"presentation_rect" : [ 60.0, 250.0, 57.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 680.0, 370.0, 57.0, 20.0 ],
					"id" : "obj-94",
					"presentation" : 1,
					"fontname" : "Arial",
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"presentation_rect" : [ 40.0, 250.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 620.0, 370.0, 16.0, 16.0 ],
					"id" : "obj-92",
					"presentation" : 1,
					"outlettype" : [ "int" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiparse",
					"numinlets" : 1,
					"numoutlets" : 7,
					"patching_rect" : [ 200.0, 370.0, 140.0, 20.0 ],
					"id" : "obj-126",
					"fontname" : "Arial",
					"outlettype" : [ "", "", "", "int", "int", "int", "int" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js Midi.js",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 240.0, 410.0, 57.0, 20.0 ],
					"id" : "obj-130",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend cc_msg",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 240.0, 390.0, 99.0, 20.0 ],
					"id" : "obj-128",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiin",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 200.0, 350.0, 42.0, 20.0 ],
					"id" : "obj-123",
					"fontname" : "Arial",
					"outlettype" : [ "int" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"presentation_rect" : [ 180.0, 80.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 1000.0, 50.0, 20.0, 20.0 ],
					"id" : "obj-103",
					"presentation" : 1,
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "global tempo",
					"presentation_rect" : [ 230.0, 110.0, 85.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 840.0, 90.0, 83.0, 20.0 ],
					"id" : "obj-102",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "master musical clock",
					"presentation_rect" : [ 200.0, 80.0, 133.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1020.0, 50.0, 131.0, 20.0 ],
					"id" : "obj-100",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 116",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 920.0, 10.0, 84.0, 20.0 ],
					"id" : "obj-67",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 1040.0, 100.0, 36.0, 20.0 ],
					"id" : "obj-78",
					"fontname" : "Arial",
					"outlettype" : [ "bang", "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 1040.0, 120.0, 32.5, 18.0 ],
					"id" : "obj-79",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"presentation_rect" : [ 180.0, 110.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 920.0, 90.0, 50.0, 20.0 ],
					"id" : "obj-83",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "tempo $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 920.0, 110.0, 61.0, 18.0 ],
					"id" : "obj-88",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "transport",
					"numinlets" : 2,
					"numoutlets" : 9,
					"patching_rect" : [ 1000.0, 150.0, 59.0, 20.0 ],
					"id" : "obj-91",
					"fontname" : "Arial",
					"outlettype" : [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numinlets" : 1,
					"numoutlets" : 1,
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 280.0, 490.0, 20.0, 20.0 ],
					"id" : "obj-87",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.658824, 0.658824, 0.729412, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "quantize mode",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 300.0, 490.0, 96.0, 20.0 ],
					"id" : "obj-84",
					"fontname" : "Arial",
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b",
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 280.0, 510.0, 32.5, 20.0 ],
					"id" : "obj-85",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 quant metro $1",
					"linecount" : 2,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 280.0, 570.0, 126.0, 25.0 ],
					"id" : "obj-86",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ProjectionView",
					"numinlets" : 5,
					"numoutlets" : 0,
					"patching_rect" : [ 580.0, 440.0, 99.0, 20.0 ],
					"id" : "obj-55",
					"fontname" : "Arial",
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"hidden" : 1,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 280.0, 440.0, 72.0, 20.0 ],
					"id" : "obj-58",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "latency comp",
					"linecount" : 2,
					"presentation_rect" : [ 480.0, 140.0, 85.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 220.0, 490.0, 53.0, 34.0 ],
					"id" : "obj-77",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b",
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 160.0, 510.0, 32.5, 20.0 ],
					"id" : "obj-73",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"presentation_rect" : [ 420.0, 140.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 160.0, 490.0, 57.0, 20.0 ],
					"id" : "obj-63",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"bgcolor" : [ 0.658824, 0.658824, 0.729412, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 pipe $1",
					"linecount" : 2,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 570.0, 95.0, 25.0 ],
					"id" : "obj-54",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"presentation_rect" : [ 300.0, 140.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 420.0, 490.0, 20.0, 20.0 ],
					"id" : "obj-81",
					"presentation" : 1,
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.658824, 0.658824, 0.729412, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "sync mode",
					"presentation_rect" : [ 320.0, 140.0, 77.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 440.0, 490.0, 77.0, 20.0 ],
					"id" : "obj-80",
					"presentation" : 1,
					"fontname" : "Arial",
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_1 target 0",
					"linecount" : 2,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 520.0, 600.0, 96.0, 25.0 ],
					"id" : "obj-76",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b",
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 420.0, 510.0, 32.5, 20.0 ],
					"id" : "obj-75",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 sync $1",
					"linecount" : 2,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 420.0, 570.0, 96.0, 25.0 ],
					"id" : "obj-68",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r report",
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 500.0, 110.0, 49.0, 20.0 ],
					"id" : "obj-66",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"presentation_rect" : [ 800.0, 30.0, 221.0, 269.0 ],
					"numinlets" : 1,
					"numoutlets" : 4,
					"patching_rect" : [ 500.0, 130.0, 239.0, 80.0 ],
					"id" : "obj-29",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "", "int", "", "" ],
					"readonly" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b 2",
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 20.0, 520.0, 32.5, 20.0 ],
					"id" : "obj-39",
					"fontname" : "Arial",
					"outlettype" : [ "bang", "bang" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 dump bang",
					"linecount" : 2,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 20.0, 570.0, 110.0, 25.0 ],
					"id" : "obj-56",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 9.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "120 0",
					"presentation_rect" : [ 40.0, 140.0, 57.0, 25.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 20.0, 490.0, 57.0, 25.0 ],
					"id" : "obj-7",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"fontface" : 3,
					"fontsize" : 18.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "alert $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 800.0, 360.0, 51.0, 18.0 ],
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
					"numoutlets" : 2,
					"patching_rect" : [ 800.0, 320.0, 61.0, 20.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 800.0, 340.0, 59.0, 20.0 ],
					"id" : "obj-122",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"presentation_rect" : [ 220.0, 250.0, 538.0, 71.0 ],
					"numinlets" : 1,
					"numoutlets" : 4,
					"patching_rect" : [ 800.0, 270.0, 275.0, 39.0 ],
					"id" : "obj-119",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "", "int", "", "" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"fontsize" : 14.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Click box to type a broadcast message -  Tab to send it.",
					"presentation_rect" : [ 360.0, 330.0, 257.0, 18.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 820.0, 280.0, 255.0, 18.0 ],
					"id" : "obj-89",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p Magic_Mode",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 880.0, 410.0, 89.0, 20.0 ],
					"id" : "obj-69",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 302.0, 170.0, 348.0, 310.0 ],
						"bglocked" : 0,
						"defrect" : [ 302.0, 170.0, 348.0, 310.0 ],
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
									"maxclass" : "comment",
									"text" : "D Major Penta",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 150.0, 240.0, 91.0, 20.0 ],
									"id" : "obj-4",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "62\\,64\\,66\\,69\\,71\\,74\\,76\\,78",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 140.0, 270.0, 164.0, 18.0 ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "if $i1 == 1 then $i1 else out2 $i1",
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 50.0, 50.0, 182.0, 20.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"outlettype" : [ "", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "notes $1",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 200.0, 57.0, 18.0 ],
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
									"numoutlets" : 2,
									"patching_rect" : [ 50.0, 80.0, 38.5, 20.0 ],
									"id" : "obj-63",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "int" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "63\\,67\\,68\\,70\\,73\\,75\\,77\\,79",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 170.0, 172.0, 18.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 70.0, 120.0, 59.0, 18.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 10.0, 25.0, 25.0 ],
									"id" : "obj-67",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 250.0, 25.0, 25.0 ],
									"id" : "obj-68",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [ 222.5, 105.0, 81.0, 105.0, 81.0, 117.0, 79.5, 117.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-63", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-67", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 36.0, 59.5, 36.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-68", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 219.0, 59.5, 219.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-56", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 189.0, 59.5, 189.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-63", 0 ],
									"destination" : [ "obj-56", 0 ],
									"hidden" : 0,
									"midpoints" : [ 59.5, 102.0, 59.5, 102.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-63", 1 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [ 79.0, 102.0, 79.5, 102.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-68", 0 ],
									"hidden" : 0,
									"midpoints" : [ 79.5, 156.0, 36.0, 156.0, 36.0, 237.0, 59.5, 237.0 ]
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
					"text" : "PANIC!",
					"presentation_rect" : [ 40.0, 170.0, 65.0, 25.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 80.0, 490.0, 62.0, 25.0 ],
					"id" : "obj-57",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 16.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiout",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 430.0, 49.0, 20.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 920.0, 480.0, 55.0, 18.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 1000.0, 660.0, 103.0, 20.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 1120.0, 520.0, 57.0, 18.0 ],
					"id" : "obj-15",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "player instances",
					"presentation_rect" : [ 20.0, 80.0, 105.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 90.0, 104.0, 20.0 ],
					"id" : "obj-47",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "server IP",
					"presentation_rect" : [ 40.0, 10.0, 59.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 480.0, 30.0, 60.0, 20.0 ],
					"id" : "obj-46",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "current key offset",
					"presentation_rect" : [ 600.0, 10.0, 115.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 580.0, 80.0, 115.0, 20.0 ],
					"id" : "obj-45",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"presentation_rect" : [ 180.0, 140.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 1100.0, 350.0, 20.0, 20.0 ],
					"id" : "obj-42",
					"presentation" : 1,
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"presentation_rect" : [ 300.0, 180.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 920.0, 440.0, 20.0, 20.0 ],
					"id" : "obj-40",
					"presentation" : 1,
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"presentation_rect" : [ 180.0, 180.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"patching_rect" : [ 880.0, 390.0, 20.0, 20.0 ],
					"id" : "obj-38",
					"presentation" : 1,
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "close",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 100.0, 110.0, 39.0, 20.0 ],
					"id" : "obj-34",
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "open",
					"presentation_rect" : [ 20.0, 100.0, 40.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 40.0, 110.0, 40.0, 20.0 ],
					"id" : "obj-32",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 100.0, 130.0, 21.0, 112.0 ],
					"id" : "obj-20",
					"outlettype" : [ "" ],
					"size" : 21.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"maximum" : 20,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 100.0, 240.0, 50.0, 20.0 ],
					"id" : "obj-25",
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"minimum" : 0,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "wclose $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 100.0, 260.0, 62.0, 18.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 40.0, 130.0, 21.0, 111.0 ],
					"id" : "obj-52",
					"outlettype" : [ "" ],
					"size" : 21.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "magic mode",
					"presentation_rect" : [ 200.0, 180.0, 83.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 900.0, 390.0, 83.0, 20.0 ],
					"id" : "obj-50",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p osc_definitions",
					"presentation_rect" : [ 460.0, 20.0, 111.0, 20.0 ],
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 340.0, 60.0, 111.0, 20.0 ],
					"id" : "obj-2",
					"presentation" : 1,
					"fontname" : "Arial",
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
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
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 45.0, 180.0, 154.0, 20.0 ],
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
									"numoutlets" : 0,
									"patching_rect" : [ 105.0, 30.0, 256.0, 20.0 ],
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
									"numoutlets" : 0,
									"patching_rect" : [ 45.0, 60.0, 175.0, 20.0 ],
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
									"numoutlets" : 0,
									"patching_rect" : [ 45.0, 90.0, 241.0, 75.0 ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"bgcolor" : [ 0.45098, 0.74902, 1.0, 1.0 ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "/thum/1butt = alert message\n/thum/2butt = alert message w/ back button\n/thum/key = offsets the base note w/ signed ints (zero is C)\n/thum/mode = changes the modal scale of the device (integer 0 to 5)\n/thum/notes = comma separated note set of 8 midi note #'s. (0 - 88)\n/thum/magic = turns \"magic mode\" on (zero or non-zero)\n/thum/marq = display message in the main view marquee\n/thum/srvip = server IP address\n/thum/shake = ip exchange confirmation message\n/thum/kill = turn off networking on the device",
									"linecount" : 10,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 45.0, 210.0, 377.0, 144.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"bgcolor" : [ 0.45098, 0.74902, 0.94902, 1.0 ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"grad2" : [ 0.45098, 0.6, 1.0, 1.0 ],
									"numinlets" : 1,
									"mode" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 15.0, 406.0, 360.0 ],
									"id" : "obj-9",
									"rounded" : 50,
									"bgcolor" : [ 0.439216, 0.639216, 0.980392, 1.0 ],
									"grad1" : [ 0.45098, 0.74902, 1.0, 1.0 ]
								}

							}
 ],
						"lines" : [  ]
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
					"text" : "marquee",
					"presentation_rect" : [ 320.0, 180.0, 59.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 940.0, 440.0, 61.0, 20.0 ],
					"id" : "obj-14",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p marquee_test_msgs",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 920.0, 460.0, 129.0, 20.0 ],
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
									"numoutlets" : 4,
									"patching_rect" : [ 75.0, 180.0, 75.0, 20.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 106.5, 135.0, 32.5, 18.0 ],
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
									"numoutlets" : 4,
									"patching_rect" : [ 74.5, 155.0, 84.0, 20.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 75.0, 90.0, 71.0, 20.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 75.0, 30.0, 25.0, 25.0 ],
									"id" : "obj-57",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 75.0, 210.0, 25.0, 25.0 ],
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
					"maxclass" : "number",
					"presentation_rect" : [ 720.0, 200.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 1120.0, 500.0, 50.0, 20.0 ],
					"id" : "obj-43",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r server_IP",
					"hidden" : 1,
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 460.0, 10.0, 69.0, 20.0 ],
					"id" : "obj-8",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "10.0.1.9",
					"presentation_rect" : [ 20.0, 30.0, 110.0, 18.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 340.0, 30.0, 139.0, 18.0 ],
					"id" : "obj-6",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "test seq",
					"presentation_rect" : [ 200.0, 140.0, 56.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1120.0, 350.0, 56.0, 20.0 ],
					"id" : "obj-37",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p server_heartbeat",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 70.0, 40.0, 111.0, 20.0 ],
					"id" : "obj-36",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 771.0, 78.0, 459.0, 472.0 ],
						"bglocked" : 0,
						"defrect" : [ 771.0, 78.0, 459.0, 472.0 ],
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
									"text" : "for setting the ip display\ncurrently not being used",
									"linecount" : 2,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 300.0, 15.0, 138.0, 34.0 ],
									"id" : "obj-4",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess set 0.0.0.0",
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 300.0, 60.0, 121.0, 20.0 ],
									"id" : "obj-48",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess en0",
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 195.0, 45.0, 85.0, 20.0 ],
									"id" : "obj-5",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "/thum/srvip 10.0.1.9",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 75.0, 345.0, 169.0, 18.0 ],
									"id" : "obj-9",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s server_IP",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 255.0, 270.0, 71.0, 20.0 ],
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
									"numoutlets" : 2,
									"patching_rect" : [ 135.0, 90.0, 49.0, 20.0 ],
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
									"numoutlets" : 2,
									"patching_rect" : [ 30.0, 90.0, 33.0, 20.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 67.0, 91.0, 20.0 ],
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
									"items" : "<empty>",
									"numoutlets" : 3,
									"types" : [  ],
									"patching_rect" : [ 165.0, 240.0, 138.0, 20.0 ],
									"id" : "obj-2",
									"fontname" : "Arial",
									"outlettype" : [ "int", "", "" ],
									"align" : 1,
									"ignoreclick" : 1,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "mxj net.local",
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 165.0, 195.0, 77.0, 20.0 ],
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
									"numoutlets" : 0,
									"patching_rect" : [ 75.0, 375.0, 191.0, 20.0 ],
									"id" : "obj-14",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 136.0, 30.0, 30.0 ],
									"id" : "obj-15",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 49.0, 211.0, 30.0, 30.0 ],
									"id" : "obj-16",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qmetro 100",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 180.0, 71.0, 20.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 225.0, 300.0, 86.0, 18.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 135.0, 30.0, 25.0, 25.0 ],
									"id" : "obj-32",
									"outlettype" : [ "" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 330.0, 420.0, 25.0, 25.0 ],
									"id" : "obj-34",
									"comment" : ""
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 207.0, 58.5, 207.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-17", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 168.0, 39.5, 168.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-14", 0 ],
									"hidden" : 0,
									"midpoints" : [ 84.5, 363.0, 84.5, 363.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-9", 1 ],
									"hidden" : 0,
									"midpoints" : [ 234.5, 318.0, 234.5, 318.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 234.0, 261.0, 234.5, 261.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 111.0, 39.5, 111.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 174.5, 216.0, 174.5, 216.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 1 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 53.5, 123.0, 150.0, 123.0, 150.0, 225.0, 174.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-21", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 87.0, 39.5, 87.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 123.0, 174.5, 123.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 1 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 174.5, 111.0, 174.5, 111.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-25", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 144.5, 225.0, 174.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-25", 0 ],
									"hidden" : 0,
									"midpoints" : [ 144.5, 57.0, 144.5, 57.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 1 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 53.5, 123.0, 339.5, 123.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 1 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 232.5, 225.0, 339.5, 225.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 1 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 234.0, 267.0, 264.5, 267.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-17", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 330.0, 84.5, 330.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 1 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 53.5, 123.0, 174.5, 123.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-25", 0 ],
									"hidden" : 0,
									"midpoints" : [ 204.5, 75.0, 144.5, 75.0 ]
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
					"maxclass" : "newobj",
					"text" : "p display_engine",
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 580.0, 10.0, 101.0, 20.0 ],
					"id" : "obj-22",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 475.0, 306.0, 449.0, 281.0 ],
						"bglocked" : 0,
						"defrect" : [ 475.0, 306.0, 449.0, 281.0 ],
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
									"text" : "jit.gl.render keydisplay",
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 30.0, 180.0, 129.0, 20.0 ],
									"id" : "obj-3",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r display_msg",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 22.0, 21.0, 85.0, 20.0 ],
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
									"numoutlets" : 0,
									"patching_rect" : [ 276.0, 233.0, 25.0, 25.0 ],
									"id" : "obj-1",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "size 115 50",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 276.0, 185.0, 71.0, 18.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 75.0, 60.0, 20.0 ],
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
									"numoutlets" : 2,
									"patching_rect" : [ 30.0, 210.0, 80.0, 35.0 ],
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
									"numoutlets" : 2,
									"patching_rect" : [ 30.0, 135.0, 54.0, 20.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 105.0, 69.0, 20.0 ],
									"id" : "obj-87",
									"fontname" : "Arial",
									"outlettype" : [ "bang" ],
									"fontsize" : 11.595187
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.gl.text2d @color 100. 100. 100. 1. @tracking 1.1 @align 1 @position 0. -0.4",
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 22.0, 43.0, 411.0, 20.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 170.0, 185.0, 100.0, 18.0 ],
									"id" : "obj-6",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 201.0, 39.5, 201.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-85", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 156.0, 39.5, 156.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-87", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 96.0, 39.5, 96.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 96.0, 285.5, 96.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-26", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 96.0, 179.5, 96.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-87", 0 ],
									"destination" : [ "obj-85", 0 ],
									"hidden" : 0,
									"midpoints" : [ 39.5, 126.0, 39.5, 126.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 285.5, 204.0, 285.5, 204.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-1", 0 ],
									"hidden" : 0,
									"midpoints" : [ 179.5, 219.0, 285.5, 219.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-2", 0 ],
									"destination" : [ "obj-94", 0 ],
									"hidden" : 0,
									"midpoints" : [ 31.5, 42.0, 31.5, 42.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-85", 1 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [ 74.5, 165.0, 39.5, 165.0 ]
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
					"maxclass" : "jit.pwindow",
					"presentation_rect" : [ 600.0, 30.0, 115.0, 50.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 580.0, 30.0, 115.0, 50.0 ],
					"id" : "obj-5",
					"presentation" : 1,
					"outlettype" : [ "", "" ],
					"dstrect" : [ 0, 0, 0, 0 ],
					"name" : "keydisplay"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p test_seq",
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 1100.0, 370.0, 66.0, 20.0 ],
					"id" : "obj-44",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 419.0, 153.0, 333.0, 544.0 ],
						"bglocked" : 0,
						"defrect" : [ 419.0, 153.0, 333.0, 544.0 ],
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
									"maxclass" : "message",
									"text" : "0",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 430.0, 32.5, 18.0 ],
									"id" : "obj-57",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 0",
									"numinlets" : 2,
									"numoutlets" : 2,
									"patching_rect" : [ 40.0, 410.0, 36.0, 20.0 ],
									"id" : "obj-51",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "pipe 4n",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 80.0, 50.0, 50.0, 20.0 ],
									"id" : "obj-44",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 100.0, 310.0, 50.0, 20.0 ],
									"id" : "obj-56",
									"fontname" : "Arial",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 100.0, 210.0, 50.0, 20.0 ],
									"id" : "obj-53",
									"fontname" : "Arial",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 140.0, 120.0, 45.5, 18.0 ],
									"id" : "obj-45",
									"fontname" : "Arial",
									"outlettype" : [ "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "sel 0",
									"numinlets" : 2,
									"numoutlets" : 2,
									"patching_rect" : [ 80.0, 260.0, 36.0, 20.0 ],
									"id" : "obj-48",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "counter 3",
									"numinlets" : 5,
									"numoutlets" : 4,
									"patching_rect" : [ 80.0, 180.0, 99.0, 20.0 ],
									"id" : "obj-39",
									"fontname" : "Arial",
									"outlettype" : [ "int", "", "", "int" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "offset from C4",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 140.0, 410.0, 87.0, 20.0 ],
									"id" : "obj-27",
									"fontname" : "Arial",
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "harmonic\n sequence",
									"linecount" : 2,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 200.0, 370.0, 69.0, 34.0 ],
									"id" : "obj-7",
									"fontname" : "Arial",
									"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
									"fontface" : 1,
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 100.0, 150.0, 20.0, 20.0 ],
									"id" : "obj-26",
									"outlettype" : [ "bang" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 4n",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 80.0, 120.0, 58.0, 20.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 80.0, 80.0, 20.0, 20.0 ],
									"id" : "obj-3",
									"outlettype" : [ "int" ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 80.0, 10.0, 25.0, 25.0 ],
									"id" : "obj-1",
									"outlettype" : [ "int" ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "5",
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 160.0, 370.0, 32.5, 18.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 120.0, 370.0, 32.5, 18.0 ],
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
									"numoutlets" : 2,
									"patching_rect" : [ 80.0, 410.0, 50.0, 20.0 ],
									"id" : "obj-37",
									"fontname" : "Arial",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "select 0 2 4",
									"numinlets" : 1,
									"numoutlets" : 4,
									"patching_rect" : [ 80.0, 340.0, 139.0, 20.0 ],
									"id" : "obj-34",
									"fontname" : "Arial",
									"outlettype" : [ "bang", "bang", "bang", "" ],
									"fontsize" : 12.0
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "counter 7",
									"numinlets" : 5,
									"numoutlets" : 4,
									"patching_rect" : [ 80.0, 280.0, 99.0, 20.0 ],
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
									"numoutlets" : 1,
									"patching_rect" : [ 80.0, 370.0, 32.5, 18.0 ],
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
									"numoutlets" : 0,
									"patching_rect" : [ 80.0, 500.0, 25.0, 25.0 ],
									"id" : "obj-43",
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
									"numinlets" : 1,
									"mode" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 40.0, 90.0, 237.0, 356.0 ],
									"id" : "obj-64",
									"rounded" : 50,
									"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-57", 0 ],
									"destination" : [ "obj-43", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 486.0, 89.5, 486.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-51", 0 ],
									"destination" : [ "obj-57", 0 ],
									"hidden" : 0,
									"midpoints" : [  ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-51", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 102.0, 49.5, 102.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-44", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 36.0, 89.5, 36.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-44", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 72.0, 89.5, 72.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-39", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 141.0, 89.5, 141.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-26", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 147.0, 109.5, 147.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 102.0, 89.5, 102.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-39", 0 ],
									"destination" : [ "obj-48", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 201.0, 89.5, 201.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-39", 0 ],
									"destination" : [ "obj-53", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 207.0, 109.5, 207.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-45", 0 ],
									"destination" : [ "obj-39", 2 ],
									"hidden" : 0,
									"midpoints" : [ 149.5, 165.0, 132.0, 165.0, 132.0, 177.0, 129.5, 177.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-48", 0 ],
									"destination" : [ "obj-32", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 282.0, 89.5, 282.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-45", 0 ],
									"destination" : [ "obj-32", 2 ],
									"hidden" : 0,
									"midpoints" : [ 149.5, 165.0, 189.0, 165.0, 189.0, 267.0, 129.5, 267.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 360.0, 89.5, 360.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 1 ],
									"destination" : [ "obj-41", 0 ],
									"hidden" : 0,
									"midpoints" : [ 129.5, 360.0, 129.5, 360.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 2 ],
									"destination" : [ "obj-42", 0 ],
									"hidden" : 0,
									"midpoints" : [ 169.5, 360.0, 169.5, 360.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 300.0, 89.5, 300.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-56", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 306.0, 109.5, 306.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-45", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 102.0, 149.5, 102.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 390.0, 89.5, 390.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-41", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 129.5, 390.0, 89.5, 390.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-42", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 169.5, 390.0, 89.5, 390.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-37", 0 ],
									"destination" : [ "obj-43", 0 ],
									"hidden" : 0,
									"midpoints" : [ 89.5, 432.0, 89.5, 432.0 ]
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
					"maxclass" : "newobj",
					"text" : "loadmess 5",
					"hidden" : 1,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 1190.0, 320.0, 72.0, 20.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 1000.0, 550.0, 60.0, 18.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 1100.0, 430.0, 46.0, 18.0 ],
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
					"presentation_rect" : [ 800.0, 310.0, 102.0, 21.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 1000.0, 610.0, 98.0, 21.0 ],
					"id" : "obj-49",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 14.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear_players",
					"presentation_rect" : [ 920.0, 310.0, 102.0, 21.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 1000.0, 580.0, 98.0, 21.0 ],
					"id" : "obj-10",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 14.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"presentation_rect" : [ 720.0, 140.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 1100.0, 410.0, 50.0, 20.0 ],
					"id" : "obj-30",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "On Mac: en0 for ethernet",
					"presentation_rect" : [ 250.0, 40.0, 126.0, 18.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 180.0, 30.0, 126.0, 18.0 ],
					"id" : "obj-19",
					"presentation" : 1,
					"fontname" : "Arial",
					"fontface" : 1,
					"fontsize" : 10.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Select an interface FIRST",
					"presentation_rect" : [ 220.0, 20.0, 153.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 120.0, 10.0, 155.0, 20.0 ],
					"id" : "obj-11",
					"presentation" : 1,
					"fontname" : "Arial Bold",
					"bgcolor" : [ 1.0, 0.501961, 0.501961, 1.0 ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"bgcolor2" : [ 1.0, 0.501961, 0.501961, 1.0 ],
					"presentation_rect" : [ 140.0, 20.0, 78.0, 25.0 ],
					"numinlets" : 1,
					"items" : [ "en1", ",", "lo0" ],
					"numoutlets" : 3,
					"types" : [  ],
					"patching_rect" : [ 40.0, 10.0, 78.0, 25.0 ],
					"id" : "obj-12",
					"presentation" : 1,
					"fontname" : "Arial Bold",
					"outlettype" : [ "int", "", "" ],
					"framecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"bgcolor" : [ 1.0, 0.301961, 0.301961, 1.0 ],
					"fontsize" : 16.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open $1",
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 40.0, 260.0, 54.0, 18.0 ],
					"id" : "obj-26",
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"maximum" : 20,
					"presentation_rect" : [ 60.0, 100.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 40.0, 240.0, 50.0, 20.0 ],
					"id" : "obj-27",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"minimum" : 0,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r thum_msg_2",
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 320.0, 87.0, 20.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 40.0, 340.0, 139.0, 20.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 140.0, 290.0, 87.0, 20.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 960.0, 520.0, 88.0, 20.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 960.0, 700.0, 95.0, 20.0 ],
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
					"numoutlets" : 1,
					"patching_rect" : [ 960.0, 500.0, 99.0, 20.0 ],
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
					"presentation_rect" : [ 620.0, 120.0, 100.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1220.0, 350.0, 100.0, 20.0 ],
					"id" : "obj-74",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "change mode slider",
					"presentation_rect" : [ 600.0, 180.0, 125.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1140.0, 470.0, 125.0, 20.0 ],
					"id" : "obj-13",
					"presentation" : 1,
					"fontname" : "Arial",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"presentation_rect" : [ 580.0, 180.0, 175.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 1120.0, 460.0, 150.0, 40.0 ],
					"knobcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-41",
					"presentation" : 1,
					"outlettype" : [ "" ],
					"size" : 6.0,
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"presentation_rect" : [ 580.0, 120.0, 175.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 1190.0, 340.0, 141.0, 40.0 ],
					"knobcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"id" : "obj-33",
					"presentation" : 1,
					"outlettype" : [ "" ],
					"size" : 13.0,
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"min" : -5.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"presentation_rect" : [ 220.0, 230.0, 46.0, 21.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 800.0, 240.0, 48.0, 21.0 ],
					"id" : "obj-82",
					"presentation" : 1,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 14.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
					"presentation_rect" : [ 20.0, 72.0, 108.0, 55.0 ],
					"numinlets" : 1,
					"mode" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 20.0, 80.0, 147.0, 208.0 ],
					"id" : "obj-64",
					"presentation" : 1,
					"rounded" : 50,
					"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
					"presentation_rect" : [ 160.0, 70.0, 366.0, 141.0 ],
					"numinlets" : 1,
					"mode" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 140.0, 480.0, 483.0, 167.0 ],
					"id" : "obj-35",
					"presentation" : 1,
					"rounded" : 50,
					"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
					"presentation_rect" : [ 20.0, 210.0, 155.0, 130.0 ],
					"numinlets" : 1,
					"mode" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 600.0, 330.0, 182.0, 105.0 ],
					"id" : "obj-51",
					"presentation" : 1,
					"rounded" : 50,
					"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ]
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-38", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1109.5, 372.0, 889.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-135", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1109.5, 318.0, 1109.5, 318.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-136", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1149.5, 336.0, 1109.5, 336.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-105", 0 ],
					"destination" : [ "obj-135", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1109.5, 300.0, 1109.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-105", 1 ],
					"destination" : [ "obj-136", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1133.5, 300.0, 1149.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 0 ],
					"destination" : [ "obj-117", 1 ],
					"hidden" : 0,
					"midpoints" : [ 129.5, 390.0, 129.5, 390.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-117", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 89.5, 411.0, 49.5, 411.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-60", 0 ],
					"destination" : [ "obj-70", 0 ],
					"hidden" : 1,
					"midpoints" : [ 509.5, 336.0, 609.5, 336.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-113", 0 ],
					"destination" : [ "obj-42", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1089.5, 336.0, 1109.5, 336.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-97", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 1,
					"midpoints" : [ 209.5, 240.0, 209.5, 240.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 1,
					"midpoints" : [ 209.5, 282.0, 228.0, 282.0, 228.0, 315.0, 147.0, 315.0, 147.0, 327.0, 27.0, 327.0, 27.0, 417.0, 49.5, 417.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [ 929.5, 30.0, 929.5, 30.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-103", 0 ],
					"hidden" : 0,
					"midpoints" : [ 929.5, 45.0, 1009.5, 45.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1009.5, 72.0, 1009.5, 72.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-103", 0 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1009.5, 87.0, 1049.5, 87.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1049.5, 120.0, 1049.5, 120.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 0 ],
					"destination" : [ "obj-91", 1 ],
					"hidden" : 0,
					"midpoints" : [ 1049.5, 138.0, 1049.5, 138.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-88", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [ 929.5, 147.0, 1009.5, 147.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-88", 0 ],
					"hidden" : 0,
					"midpoints" : [ 929.5, 111.0, 929.5, 111.0 ]
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
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 1,
					"midpoints" : [ 289.5, 477.0, 169.5, 477.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-119", 0 ],
					"hidden" : 1,
					"midpoints" : [ 809.5, 261.0, 809.5, 261.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-122", 0 ],
					"destination" : [ "obj-133", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 360.0, 809.5, 360.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-133", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 645.0, 1009.5, 645.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-129", 0 ],
					"destination" : [ "obj-122", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 342.0, 809.5, 342.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-129", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 309.0, 809.5, 309.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"midpoints" : [ 889.5, 411.0, 889.5, 411.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 889.5, 645.0, 1009.5, 645.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1109.5, 372.0, 1109.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [ 929.5, 462.0, 929.5, 462.0 ]
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
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 243.0, 109.5, 243.0 ]
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
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1129.5, 501.0, 1129.5, 501.0 ]
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
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 1,
					"midpoints" : [ 79.5, 60.0, 27.0, 60.0, 27.0, 6.0, 49.5, 6.0 ]
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
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1109.5, 390.0, 1109.5, 390.0 ]
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
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [ 969.5, 522.0, 969.5, 522.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1199.5, 405.0, 1109.5, 405.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1109.5, 432.0, 1109.5, 432.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 1,
					"midpoints" : [ 1199.5, 342.0, 1199.5, 342.0 ]
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
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1129.5, 522.0, 1129.5, 522.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 929.5, 480.0, 929.5, 480.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 929.5, 645.0, 1009.5, 645.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1129.5, 645.0, 1009.5, 645.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1109.5, 645.0, 1009.5, 645.0 ]
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
					"source" : [ "obj-73", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 183.0, 555.0, 529.5, 555.0 ]
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
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 429.5, 531.0, 429.5, 531.0 ]
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
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [ 429.5, 510.0, 429.5, 510.0 ]
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
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [ 29.5, 516.0, 29.5, 516.0 ]
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
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 1,
					"midpoints" : [ 289.5, 477.0, 429.5, 477.0 ]
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
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 109.5, 327.0, 49.5, 327.0 ]
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
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 49.5, 279.0, 49.5, 279.0 ]
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
					"source" : [ "obj-85", 0 ],
					"destination" : [ "obj-86", 0 ],
					"hidden" : 0,
					"midpoints" : [ 289.5, 531.0, 289.5, 531.0 ]
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
					"source" : [ "obj-123", 0 ],
					"destination" : [ "obj-126", 0 ],
					"hidden" : 0,
					"midpoints" : [ 209.5, 372.0, 209.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-128", 0 ],
					"destination" : [ "obj-130", 0 ],
					"hidden" : 0,
					"midpoints" : [ 249.5, 411.0, 249.5, 411.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-126", 2 ],
					"destination" : [ "obj-128", 0 ],
					"hidden" : 0,
					"midpoints" : [ 249.833328, 390.0, 249.5, 390.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [ 509.5, 132.0, 509.5, 132.0 ]
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
					"source" : [ "obj-110", 0 ],
					"destination" : [ "obj-123", 0 ],
					"hidden" : 1,
					"midpoints" : [ 289.5, 345.0, 209.5, 345.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-97", 0 ],
					"destination" : [ "obj-110", 0 ],
					"hidden" : 1,
					"midpoints" : [ 209.5, 246.0, 289.5, 246.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-112", 3 ],
					"destination" : [ "obj-93", 0 ],
					"hidden" : 0,
					"midpoints" : [ 669.0, 294.0, 669.5, 294.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-112", 2 ],
					"destination" : [ "obj-90", 0 ],
					"hidden" : 0,
					"midpoints" : [ 642.5, 357.0, 649.5, 357.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-112", 1 ],
					"destination" : [ "obj-92", 0 ],
					"hidden" : 0,
					"midpoints" : [ 616.0, 336.0, 629.5, 336.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-111", 0 ],
					"destination" : [ "obj-112", 0 ],
					"hidden" : 0,
					"midpoints" : [ 589.5, 261.0, 589.5, 261.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1009.5, 570.0, 969.5, 570.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1009.5, 645.0, 969.5, 645.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1009.5, 603.0, 969.5, 603.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 969.5, 540.0, 969.5, 540.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1009.5, 681.0, 969.5, 681.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-105", 0 ],
					"hidden" : 0,
					"midpoints" : [ 1109.5, 282.0, 1109.5, 282.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-70", 0 ],
					"destination" : [ "obj-55", 1 ],
					"hidden" : 0,
					"midpoints" : [ 609.5, 366.0, 609.5, 366.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-92", 0 ],
					"destination" : [ "obj-55", 2 ],
					"hidden" : 0,
					"midpoints" : [ 629.5, 387.0, 629.5, 387.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-90", 0 ],
					"destination" : [ "obj-55", 3 ],
					"hidden" : 0,
					"midpoints" : [ 649.5, 408.0, 649.5, 408.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-93", 0 ],
					"destination" : [ "obj-55", 4 ],
					"hidden" : 0,
					"midpoints" : [ 669.5, 426.0, 669.5, 426.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 309.0, 585.0, 309.0, 585.0, 435.0, 589.5, 435.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 261.0, 717.0, 261.0, 717.0, 315.0, 585.0, 315.0, 585.0, 435.0, 589.5, 435.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-98", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [ 869.5, 261.0, 717.0, 261.0, 717.0, 315.0, 585.0, 315.0, 585.0, 435.0, 589.5, 435.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-112", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"midpoints" : [ 589.5, 294.0, 589.5, 294.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-109", 0 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [ 849.5, 186.0, 809.5, 186.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-107", 0 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [ 889.5, 186.0, 809.5, 186.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-65", 0 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [ 809.5, 168.0, 809.5, 168.0 ]
				}

			}
 ]
	}

}
