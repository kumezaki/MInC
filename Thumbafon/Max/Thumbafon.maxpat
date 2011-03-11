{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ 117.0, 114.0, 1119.0, 645.0 ],
		"bgcolor" : [ 0.74902, 0.792157, 0.929412, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 117.0, 114.0, 1119.0, 645.0 ],
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
					"text" : "32n",
					"id" : "obj-92",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"presentation_rect" : [ 440.0, 210.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 100.0, 510.0, 32.5, 18.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 160",
					"id" : "obj-67",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 900.0, 80.0, 85.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "4n",
					"id" : "obj-101",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"presentation_rect" : [ 560.0, 210.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 190.0, 510.0, 32.5, 18.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "8n",
					"id" : "obj-99",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"presentation_rect" : [ 520.0, 210.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 160.0, 510.0, 32.5, 18.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "16n",
					"id" : "obj-97",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"presentation_rect" : [ 480.0, 210.0, 32.5, 18.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 130.0, 510.0, 32.5, 18.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "quantize division",
					"linecount" : 2,
					"id" : "obj-93",
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 600.0, 210.0, 110.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 230.0, 510.0, 61.0, 34.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t s b",
					"id" : "obj-94",
					"outlettype" : [ "", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 130.0, 540.0, 33.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 quant rhythm $1",
					"linecount" : 2,
					"id" : "obj-95",
					"outlettype" : [ "" ],
					"fontsize" : 9.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 130.0, 580.0, 130.0, 25.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "master musical clock",
					"id" : "obj-70",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 880.0, 20.0, 122.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "sel 1",
					"id" : "obj-78",
					"outlettype" : [ "bang", "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 2,
					"patching_rect" : [ 990.0, 110.0, 36.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"id" : "obj-79",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 990.0, 130.0, 32.5, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-83",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 900.0, 100.0, 50.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "tempo $1",
					"id" : "obj-88",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 900.0, 120.0, 61.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-90",
					"outlettype" : [ "int" ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 860.0, 20.0, 20.0, 20.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "transport",
					"id" : "obj-91",
					"outlettype" : [ "int", "int", "float", "float", "float", "", "int", "float", "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 9,
					"patching_rect" : [ 860.0, 160.0, 149.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-87",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.658824, 0.658824, 0.729412, 1.0 ],
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 310.0, 210.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 300.0, 520.0, 20.0, 20.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "quantize mode",
					"id" : "obj-84",
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 330.0, 210.0, 94.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 320.0, 516.0, 96.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b",
					"id" : "obj-85",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 300.0, 540.0, 32.5, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 quant metro $1",
					"linecount" : 2,
					"id" : "obj-86",
					"outlettype" : [ "" ],
					"fontsize" : 9.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 300.0, 580.0, 126.0, 25.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "ProjectionView",
					"id" : "obj-55",
					"fontsize" : 12.0,
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 710.0, 100.0, 90.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 0",
					"hidden" : 1,
					"id" : "obj-58",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 190.0, 380.0, 72.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "latency compensation",
					"linecount" : 2,
					"id" : "obj-77",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 480.0, 160.0, 137.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 360.0, 400.0, 93.0, 34.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b",
					"id" : "obj-73",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 300.0, 430.0, 32.5, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-63",
					"outlettype" : [ "int", "bang" ],
					"bgcolor" : [ 0.658824, 0.658824, 0.729412, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 430.0, 160.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 300.0, 410.0, 50.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 pipe $1",
					"linecount" : 2,
					"id" : "obj-54",
					"outlettype" : [ "" ],
					"fontsize" : 9.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 300.0, 470.0, 95.0, 25.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess set 0.0.0.0",
					"hidden" : 1,
					"id" : "obj-48",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 350.0, 10.0, 121.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-81",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.658824, 0.658824, 0.729412, 1.0 ],
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 310.0, 160.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 190.0, 410.0, 20.0, 20.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "sync mode",
					"id" : "obj-80",
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 330.0, 160.0, 77.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 210.0, 410.0, 77.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_1 target 0",
					"linecount" : 2,
					"id" : "obj-76",
					"outlettype" : [ "" ],
					"fontsize" : 9.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 440.0, 580.0, 96.0, 25.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i b",
					"id" : "obj-75",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 190.0, 430.0, 32.5, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 sync $1",
					"linecount" : 2,
					"id" : "obj-68",
					"outlettype" : [ "" ],
					"fontsize" : 9.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 190.0, 470.0, 96.0, 25.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r report",
					"id" : "obj-66",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 470.0, 120.0, 49.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"id" : "obj-29",
					"outlettype" : [ "", "int", "", "" ],
					"readonly" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 860.0, 20.0, 207.0, 195.0 ],
					"numinlets" : 1,
					"numoutlets" : 4,
					"patching_rect" : [ 470.0, 140.0, 174.0, 60.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "To Do:\n- implement poly~ timer (2 minutes)",
					"linecount" : 3,
					"id" : "obj-51",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 700.0, 30.0, 109.0, 48.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "b 2",
					"id" : "obj-39",
					"outlettype" : [ "bang", "bang" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 70.0, 430.0, 32.5, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : ";\rthum_msg_2 dump bang",
					"linecount" : 2,
					"id" : "obj-56",
					"outlettype" : [ "" ],
					"fontsize" : 9.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 70.0, 470.0, 110.0, 25.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "120 0",
					"id" : "obj-7",
					"outlettype" : [ "" ],
					"bgcolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"fontface" : 3,
					"fontsize" : 18.0,
					"presentation_rect" : [ 940.0, 260.0, 57.0, 25.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 70.0, 400.0, 57.0, 25.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "MIdi Program Changer",
					"id" : "obj-65",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 140.0, 110.0, 138.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 140.0, 140.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "player pos",
					"id" : "obj-61",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 90.0, 190.0, 69.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 330.0, 260.0, 78.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p midi_prgm_changer",
					"id" : "obj-60",
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 0,
					"patching_rect" : [ 200.0, 260.0, 129.0, 20.0 ],
					"fontname" : "Arial",
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
									"id" : "obj-68",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 160.0, 120.0, 58.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "b 2",
									"id" : "obj-65",
									"outlettype" : [ "bang", "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 50.0, 110.0, 32.5, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s thum_msg_2",
									"id" : "obj-64",
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 50.0, 190.0, 89.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s thum_msg_1",
									"id" : "obj-63",
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 120.0, 170.0, 89.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "prgm 61",
									"id" : "obj-61",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 50.0, 170.0, 69.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "prgm $1",
									"id" : "obj-48",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 100.0, 100.0, 55.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "target 1",
									"id" : "obj-29",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 120.0, 150.0, 51.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-7",
									"outlettype" : [ "int" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 70.0, 40.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-39",
									"outlettype" : [ "int" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 160.0, 40.0, 25.0, 25.0 ],
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
					"maxclass" : "number",
					"id" : "obj-53",
					"outlettype" : [ "int", "bang" ],
					"minimum" : 0,
					"fontsize" : 12.0,
					"maximum" : 20,
					"presentation_rect" : [ 40.0, 190.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 340.0, 220.0, 50.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "dial",
					"id" : "obj-16",
					"outlettype" : [ "float" ],
					"presentation_rect" : [ 40.0, 110.0, 80.0, 80.0 ],
					"size" : 21.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 340.0, 140.0, 80.0, 80.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "alert $1",
					"id" : "obj-133",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 460.0, 300.0, 51.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route text",
					"id" : "obj-129",
					"outlettype" : [ "", "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 460.0, 260.0, 61.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "tosymbol",
					"id" : "obj-122",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 460.0, 280.0, 59.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "textedit",
					"text" : "hello chris",
					"id" : "obj-119",
					"outlettype" : [ "", "int", "", "" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"fontsize" : 14.0,
					"tabmode" : 0,
					"presentation_rect" : [ 420.0, 260.0, 327.0, 23.0 ],
					"numinlets" : 1,
					"keymode" : 1,
					"numoutlets" : 4,
					"patching_rect" : [ 460.0, 230.0, 265.0, 22.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadmess 64",
					"hidden" : 1,
					"id" : "obj-106",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 200.0, 170.0, 79.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "prgm #",
					"id" : "obj-105",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 160.0, 140.0, 53.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 220.0, 190.0, 51.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Click box to type a broadcast message -  Return to send it.",
					"id" : "obj-89",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontsize" : 10.0,
					"presentation_rect" : [ 430.0, 280.0, 271.0, 18.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 460.0, 230.0, 269.0, 18.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p Magic_Mode",
					"id" : "obj-69",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 490.0, 430.0, 89.0, 20.0 ],
					"fontname" : "Arial",
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
									"id" : "obj-1",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 180.0, 57.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b i",
									"id" : "obj-63",
									"outlettype" : [ "bang", "int" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 40.0, 70.0, 38.5, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "64\\,68\\,71\\,74\\,78\\,82\\,85\\,88",
									"id" : "obj-56",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 150.0, 164.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "magic $1",
									"id" : "obj-16",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 60.0, 120.0, 59.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-67",
									"outlettype" : [ "int" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 40.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-68",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 40.0, 210.0, 25.0, 25.0 ],
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
					"maxclass" : "number",
					"id" : "obj-35",
					"outlettype" : [ "int", "bang" ],
					"minimum" : 0,
					"fontsize" : 12.0,
					"maximum" : 127,
					"presentation_rect" : [ 230.0, 180.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 200.0, 230.0, 50.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"id" : "obj-9",
					"outlettype" : [ "" ],
					"presentation_rect" : [ 150.0, 160.0, 128.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 200.0, 210.0, 128.0, 20.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "PANIC!",
					"id" : "obj-57",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 16.0,
					"presentation_rect" : [ 940.0, 290.0, 65.0, 25.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 130.0, 400.0, 62.0, 25.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "midiout",
					"id" : "obj-31",
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 60.0, 370.0, 49.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "marq $1",
					"id" : "obj-28",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 540.0, 300.0, 55.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend send_all",
					"id" : "obj-21",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 670.0, 480.0, 103.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "mode $1",
					"id" : "obj-15",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 790.0, 420.0, 57.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "player instances",
					"id" : "obj-47",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 140.0, 270.0, 105.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 110.0, 104.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "server IP",
					"id" : "obj-46",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 40.0, 10.0, 59.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 460.0, 60.0, 60.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "current key offset",
					"id" : "obj-45",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 690.0, 10.0, 115.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 560.0, 100.0, 115.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-42",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 310.0, 110.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 740.0, 170.0, 20.0, 20.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-40",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 430.0, 110.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 540.0, 260.0, 20.0, 20.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"id" : "obj-38",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"checkedcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 530.0, 110.0, 20.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 490.0, 400.0, 20.0, 20.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "close",
					"id" : "obj-34",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 210.0, 300.0, 39.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 110.0, 130.0, 39.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "open",
					"id" : "obj-32",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 10.0, 300.0, 40.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 50.0, 130.0, 40.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"id" : "obj-20",
					"outlettype" : [ "" ],
					"presentation_rect" : [ 250.0, 300.0, 131.0, 20.0 ],
					"size" : 21.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 120.0, 150.0, 21.0, 112.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-25",
					"outlettype" : [ "int", "bang" ],
					"minimum" : 0,
					"fontsize" : 12.0,
					"maximum" : 20,
					"presentation_rect" : [ 330.0, 320.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 120.0, 260.0, 50.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "wclose $1",
					"id" : "obj-17",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 120.0, 280.0, 62.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"id" : "obj-52",
					"outlettype" : [ "" ],
					"presentation_rect" : [ 50.0, 300.0, 131.0, 20.0 ],
					"size" : 21.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 60.0, 150.0, 21.0, 111.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "magic mode",
					"id" : "obj-50",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 550.0, 110.0, 83.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 510.0, 400.0, 83.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p osc_definitions",
					"id" : "obj-2",
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 460.0, 20.0, 111.0, 20.0 ],
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 0,
					"numoutlets" : 0,
					"patching_rect" : [ 350.0, 80.0, 111.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1,
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ -1195.0, -38.0, 470.0, 396.0 ],
						"bglocked" : 0,
						"defrect" : [ -1195.0, -38.0, 470.0, 396.0 ],
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
									"id" : "obj-8",
									"bgcolor" : [ 0.45098, 0.74902, 0.94902, 1.0 ],
									"fontface" : 1,
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 45.0, 180.0, 154.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "All messages are sent to/from as C  strings",
									"id" : "obj-7",
									"bgcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 105.0, 30.0, 256.0, 20.0 ],
									"fontname" : "Arial Bold"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "Messages FROM Thumbafon",
									"id" : "obj-6",
									"bgcolor" : [ 0.45098, 0.74902, 1.0, 1.0 ],
									"fontface" : 1,
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 45.0, 60.0, 175.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "/thum/join = joining performance\n/thum/leave = leaving performance\n/thum/butt = button message\n/thum/hint = hint button\n/thum/prev = alert window \"Previous\" button",
									"linecount" : 5,
									"id" : "obj-3",
									"bgcolor" : [ 0.45098, 0.74902, 1.0, 1.0 ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 45.0, 90.0, 241.0, 75.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "/thum/1butt = alert message\n/thum/2butt = alert message w/ back button\n/thum/key = offsets the base note w/ signed ints (zero is C)\n/thum/mode = changes the modal scale of the device (integer 0 to 5)\n/thum/notes = comma separated note set of 8 midi note #'s. (0 - 88)\n/thum/magic = turns \"magic mode\" on (zero or non-zero)\n/thum/marq = display message in the main view marquee\n/thum/srvip = server IP address\n/thum/shake = ip exchange confirmation message\n/thum/kill = turn off networking on the device",
									"linecount" : 10,
									"id" : "obj-2",
									"bgcolor" : [ 0.45098, 0.74902, 0.94902, 1.0 ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 45.0, 210.0, 377.0, 144.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"id" : "obj-9",
									"mode" : 1,
									"bgcolor" : [ 0.439216, 0.639216, 0.980392, 1.0 ],
									"numinlets" : 1,
									"grad1" : [ 0.45098, 0.74902, 1.0, 1.0 ],
									"numoutlets" : 0,
									"patching_rect" : [ 30.0, 15.0, 406.0, 360.0 ],
									"rounded" : 50,
									"grad2" : [ 0.45098, 0.6, 1.0, 1.0 ]
								}

							}
 ],
						"lines" : [  ]
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
					"text" : "marquee",
					"id" : "obj-14",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 450.0, 110.0, 59.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 560.0, 260.0, 121.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p MainView_Test_Messages",
					"id" : "obj-59",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 540.0, 280.0, 162.0, 20.0 ],
					"fontname" : "Arial",
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
									"id" : "obj-2",
									"outlettype" : [ "", "", "", "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 4,
									"patching_rect" : [ 75.0, 180.0, 75.0, 20.0 ],
									"fontname" : "Arial",
									"saved_object_attributes" : 									{
										"embed" : 0
									}

								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"id" : "obj-54",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 106.5, 135.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "counter 0 146",
									"id" : "obj-40",
									"outlettype" : [ "int", "", "", "int" ],
									"fontsize" : 12.0,
									"numinlets" : 5,
									"numoutlets" : 4,
									"patching_rect" : [ 74.5, 155.0, 84.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 3000",
									"id" : "obj-34",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 75.0, 90.0, 71.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-57",
									"outlettype" : [ "int" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 75.0, 30.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-58",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 75.0, 210.0, 25.0, 25.0 ],
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
					"maxclass" : "number",
					"id" : "obj-43",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"presentation_rect" : [ 790.0, 190.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 790.0, 400.0, 50.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r server_IP",
					"hidden" : 1,
					"id" : "obj-8",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 370.0, 30.0, 69.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "10.0.1.4",
					"id" : "obj-6",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 20.0, 30.0, 110.0, 18.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 350.0, 60.0, 110.0, 18.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "test seq",
					"id" : "obj-37",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 330.0, 110.0, 56.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 760.0, 170.0, 56.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p server_heartbeat",
					"id" : "obj-36",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 80.0, 80.0, 111.0, 20.0 ],
					"fontname" : "Arial",
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
									"id" : "obj-9",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 75.0, 300.0, 169.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "s server_IP",
									"id" : "obj-1",
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 255.0, 225.0, 71.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"id" : "obj-25",
									"outlettype" : [ "bang", "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 135.0, 45.0, 49.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b s",
									"id" : "obj-13",
									"outlettype" : [ "bang", "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 30.0, 45.0, 33.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess clear",
									"id" : "obj-21",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 22.0, 91.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "umenu",
									"id" : "obj-2",
									"outlettype" : [ "int", "", "" ],
									"fontsize" : 12.0,
									"align" : 1,
									"numinlets" : 1,
									"items" : [ "10.0.1.4", ",", "fe80:0:0:0:226:b0ff:fedf:4bd0%4" ],
									"types" : [  ],
									"ignoreclick" : 1,
									"numoutlets" : 3,
									"patching_rect" : [ 165.0, 195.0, 138.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "mxj net.local",
									"id" : "obj-6",
									"outlettype" : [ "", "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 165.0, 150.0, 77.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "udpsend 255.255.255.255 41337",
									"id" : "obj-14",
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 75.0, 330.0, 191.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"id" : "obj-15",
									"outlettype" : [ "int" ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 91.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"id" : "obj-16",
									"outlettype" : [ "bang" ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 49.0, 166.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qmetro 100",
									"id" : "obj-17",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 30.0, 135.0, 71.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "/thum/srvip $1",
									"id" : "obj-8",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 225.0, 255.0, 86.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-32",
									"outlettype" : [ "" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 135.0, 15.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-34",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 330.0, 375.0, 25.0, 25.0 ],
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
					"text" : "p display_engine",
					"hidden" : 1,
					"id" : "obj-22",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 560.0, 30.0, 101.0, 20.0 ],
					"fontname" : "Arial",
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
									"id" : "obj-2",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 22.0, 21.0, 85.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-1",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 276.0, 233.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "size 115 50",
									"id" : "obj-10",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 276.0, 185.0, 71.0, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadbang",
									"id" : "obj-26",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 31.0, 70.0, 60.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "jit.fpsgui",
									"id" : "obj-20",
									"outlettype" : [ "", "" ],
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 31.0, 206.0, 80.0, 35.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "t b erase",
									"id" : "obj-85",
									"outlettype" : [ "bang", "erase" ],
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 31.0, 132.0, 54.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "qmetro 100",
									"id" : "obj-87",
									"outlettype" : [ "bang" ],
									"fontsize" : 11.595187,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 31.0, 107.0, 69.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.gl.render keydisplay",
									"id" : "obj-92",
									"outlettype" : [ "bang", "" ],
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 31.0, 184.0, 125.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "jit.gl.text2d @color 100. 100. 100. 1. @tracking 1.1 @align 1 @position 0. -0.4",
									"id" : "obj-94",
									"outlettype" : [ "", "" ],
									"fontsize" : 11.595187,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 22.0, 43.0, 411.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "name keydisplay",
									"id" : "obj-6",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 170.0, 185.0, 100.0, 18.0 ],
									"fontname" : "Arial"
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
					"maxclass" : "jit.pwindow",
					"id" : "obj-5",
					"outlettype" : [ "", "" ],
					"presentation_rect" : [ 690.0, 30.0, 115.0, 50.0 ],
					"numinlets" : 1,
					"dstrect" : [ 0, 0, 0, 0 ],
					"numoutlets" : 2,
					"patching_rect" : [ 560.0, 50.0, 115.0, 50.0 ],
					"presentation" : 1,
					"name" : "keydisplay"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "p test_seq",
					"id" : "obj-44",
					"outlettype" : [ "int" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 740.0, 190.0, 66.0, 20.0 ],
					"fontname" : "Arial",
					"patcher" : 					{
						"fileversion" : 1,
						"rect" : [ 3.0, 370.0, 453.0, 463.0 ],
						"bglocked" : 0,
						"defrect" : [ 3.0, 370.0, 453.0, 463.0 ],
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
									"text" : "route pipe",
									"hidden" : 1,
									"id" : "obj-29",
									"outlettype" : [ "", "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 320.0, 40.0, 64.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "r thum_msg_2",
									"hidden" : 1,
									"id" : "obj-28",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 320.0, 20.0, 87.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "offset from C4",
									"id" : "obj-27",
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 90.0, 330.0, 87.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "hi hat",
									"id" : "obj-23",
									"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
									"fontface" : 1,
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 340.0, 90.0, 42.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "harmonic\n sequence",
									"linecount" : 2,
									"id" : "obj-7",
									"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
									"fontface" : 1,
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 70.0, 50.0, 69.0, 34.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"id" : "obj-16",
									"outlettype" : [ "int" ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 100.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "metro speed",
									"id" : "obj-21",
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 230.0, 20.0, 75.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"id" : "obj-22",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 180.0, 20.0, 50.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "delay",
									"id" : "obj-19",
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 370.0, 130.0, 38.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "comment",
									"text" : "note #",
									"id" : "obj-17",
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 330.0, 190.0, 42.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "80",
									"id" : "obj-10",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 350.0, 270.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "gswitch2",
									"int" : 1,
									"id" : "obj-9",
									"outlettype" : [ "", "" ],
									"numinlets" : 2,
									"numoutlets" : 2,
									"patching_rect" : [ 310.0, 230.0, 59.0, 33.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"id" : "obj-26",
									"outlettype" : [ "bang" ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 20.0, 150.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"id" : "obj-24",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 320.0, 130.0, 45.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "delay",
									"id" : "obj-18",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 170.0, 39.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "loadmess 10",
									"id" : "obj-14",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 290.0, 380.0, 79.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"id" : "obj-12",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 280.0, 190.0, 50.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 8n",
									"id" : "obj-6",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 120.0, 58.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "button",
									"id" : "obj-15",
									"outlettype" : [ "bang" ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 200.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "500",
									"id" : "obj-13",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 370.0, 320.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "100",
									"id" : "obj-11",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 310.0, 270.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "42",
									"id" : "obj-8",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 240.0, 320.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "makenote",
									"id" : "obj-5",
									"outlettype" : [ "float", "float" ],
									"fontsize" : 12.0,
									"numinlets" : 3,
									"numoutlets" : 2,
									"patching_rect" : [ 240.0, 350.0, 149.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "noteout",
									"id" : "obj-2",
									"fontsize" : 12.0,
									"numinlets" : 3,
									"numoutlets" : 0,
									"patching_rect" : [ 240.0, 420.0, 69.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "metro 1n",
									"id" : "obj-4",
									"outlettype" : [ "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 110.0, 58.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "toggle",
									"id" : "obj-3",
									"outlettype" : [ "int" ],
									"numinlets" : 1,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 50.0, 20.0, 20.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "inlet",
									"id" : "obj-1",
									"outlettype" : [ "int" ],
									"numinlets" : 0,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 0.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "0",
									"id" : "obj-42",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 114.0, 203.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "-2",
									"id" : "obj-41",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 77.0, 203.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "number",
									"id" : "obj-37",
									"outlettype" : [ "int", "bang" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 2,
									"patching_rect" : [ 40.0, 330.0, 50.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "select 0 1 2",
									"id" : "obj-34",
									"outlettype" : [ "bang", "bang", "bang", "" ],
									"fontsize" : 12.0,
									"numinlets" : 1,
									"numoutlets" : 4,
									"patching_rect" : [ 40.0, 172.0, 130.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "newobj",
									"text" : "counter 2",
									"id" : "obj-32",
									"outlettype" : [ "int", "", "", "int" ],
									"fontsize" : 12.0,
									"numinlets" : 5,
									"numoutlets" : 4,
									"patching_rect" : [ 40.0, 150.0, 73.0, 20.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "message",
									"text" : "-5",
									"id" : "obj-20",
									"outlettype" : [ "" ],
									"fontsize" : 12.0,
									"numinlets" : 2,
									"numoutlets" : 1,
									"patching_rect" : [ 40.0, 203.0, 32.5, 18.0 ],
									"fontname" : "Arial"
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "outlet",
									"id" : "obj-43",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 40.0, 420.0, 25.0, 25.0 ],
									"comment" : ""
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"id" : "obj-64",
									"mode" : 1,
									"numinlets" : 1,
									"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ],
									"numoutlets" : 0,
									"patching_rect" : [ 10.0, 40.0, 172.0, 321.0 ],
									"rounded" : 50,
									"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ]
								}

							}
, 							{
								"box" : 								{
									"maxclass" : "panel",
									"id" : "obj-25",
									"mode" : 1,
									"numinlets" : 1,
									"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ],
									"numoutlets" : 0,
									"patching_rect" : [ 230.0, 50.0, 184.0, 399.0 ],
									"rounded" : 50,
									"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"source" : [ "obj-28", 0 ],
									"destination" : [ "obj-29", 0 ],
									"hidden" : 1,
									"midpoints" : [ 329.5, 42.0, 329.5, 42.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-29", 0 ],
									"destination" : [ "obj-24", 0 ],
									"hidden" : 1,
									"midpoints" : [ 329.5, 60.0, 329.5, 60.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-1", 0 ],
									"destination" : [ "obj-3", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 27.0, 49.5, 27.0 ]
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
									"source" : [ "obj-32", 0 ],
									"destination" : [ "obj-34", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 171.0, 49.5, 171.0 ]
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
									"source" : [ "obj-41", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 86.5, 315.0, 49.5, 315.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 2 ],
									"destination" : [ "obj-42", 0 ],
									"hidden" : 0,
									"midpoints" : [ 123.5, 192.0, 123.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 1 ],
									"destination" : [ "obj-41", 0 ],
									"hidden" : 0,
									"midpoints" : [ 86.5, 192.0, 86.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-34", 0 ],
									"destination" : [ "obj-20", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 192.0, 49.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-20", 0 ],
									"destination" : [ "obj-37", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 222.0, 49.5, 222.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-13", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 306.0, 379.5, 306.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-8", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 222.0, 249.5, 222.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-13", 0 ],
									"destination" : [ "obj-5", 2 ],
									"hidden" : 0,
									"midpoints" : [ 379.5, 339.0, 379.5, 339.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-11", 0 ],
									"destination" : [ "obj-5", 1 ],
									"hidden" : 0,
									"midpoints" : [ 319.5, 336.0, 314.5, 336.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-8", 0 ],
									"destination" : [ "obj-5", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 339.0, 249.5, 339.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 1 ],
									"destination" : [ "obj-2", 1 ],
									"hidden" : 0,
									"midpoints" : [ 379.5, 417.0, 274.5, 417.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-5", 0 ],
									"destination" : [ "obj-2", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 372.0, 249.5, 372.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-12", 0 ],
									"destination" : [ "obj-8", 1 ],
									"hidden" : 0,
									"midpoints" : [ 289.5, 306.0, 263.0, 306.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-14", 0 ],
									"destination" : [ "obj-2", 2 ],
									"hidden" : 0,
									"midpoints" : [ 299.5, 402.0, 299.5, 402.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-18", 0 ],
									"destination" : [ "obj-15", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 192.0, 249.5, 192.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-24", 0 ],
									"destination" : [ "obj-18", 1 ],
									"hidden" : 0,
									"midpoints" : [ 329.5, 150.0, 269.5, 150.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 0 ],
									"destination" : [ "obj-11", 0 ],
									"hidden" : 0,
									"midpoints" : [ 319.5, 264.0, 319.5, 264.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-9", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 222.0, 319.5, 222.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-9", 1 ],
									"destination" : [ "obj-10", 0 ],
									"hidden" : 0,
									"midpoints" : [ 359.5, 264.0, 359.5, 264.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-15", 0 ],
									"destination" : [ "obj-9", 1 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 222.0, 359.5, 222.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-10", 0 ],
									"destination" : [ "obj-5", 1 ],
									"hidden" : 0,
									"midpoints" : [ 359.5, 336.0, 314.5, 336.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-16", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 96.0, 249.5, 96.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-3", 0 ],
									"destination" : [ "obj-4", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 72.0, 49.5, 72.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-32", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 132.0, 49.5, 132.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-4", 0 ],
									"destination" : [ "obj-26", 0 ],
									"hidden" : 0,
									"midpoints" : [ 49.5, 132.0, 29.5, 132.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-4", 1 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 96.0, 88.5, 96.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-16", 0 ],
									"destination" : [ "obj-6", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 120.0, 249.5, 120.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-22", 0 ],
									"destination" : [ "obj-6", 1 ],
									"hidden" : 0,
									"midpoints" : [ 189.5, 51.0, 288.5, 51.0 ]
								}

							}
, 							{
								"patchline" : 								{
									"source" : [ "obj-6", 0 ],
									"destination" : [ "obj-18", 0 ],
									"hidden" : 0,
									"midpoints" : [ 249.5, 141.0, 249.5, 141.0 ]
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
					"text" : "loadmess 5",
					"hidden" : 1,
					"id" : "obj-72",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 770.0, 230.0, 72.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "loadbang",
					"id" : "obj-71",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 670.0, 370.0, 60.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "key $1",
					"id" : "obj-62",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 770.0, 320.0, 46.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "player_report",
					"id" : "obj-49",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 14.0,
					"presentation_rect" : [ 850.0, 230.0, 102.0, 21.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 670.0, 430.0, 98.0, 21.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear_players",
					"id" : "obj-10",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 14.0,
					"presentation_rect" : [ 980.0, 230.0, 102.0, 21.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 670.0, 400.0, 98.0, 21.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-30",
					"outlettype" : [ "int", "bang" ],
					"fontsize" : 12.0,
					"presentation_rect" : [ 790.0, 130.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 770.0, 300.0, 50.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "On Mac: en0 for ethernet",
					"id" : "obj-19",
					"fontface" : 1,
					"fontsize" : 10.0,
					"presentation_rect" : [ 250.0, 40.0, 126.0, 18.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 190.0, 70.0, 126.0, 18.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Select an interface FIRST",
					"id" : "obj-11",
					"bgcolor" : [ 1.0, 0.501961, 0.501961, 1.0 ],
					"fontsize" : 12.0,
					"presentation_rect" : [ 220.0, 20.0, 153.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 130.0, 50.0, 155.0, 20.0 ],
					"fontname" : "Arial Bold",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"id" : "obj-12",
					"outlettype" : [ "int", "", "" ],
					"bgcolor" : [ 1.0, 0.301961, 0.301961, 1.0 ],
					"fontsize" : 16.0,
					"framecolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"presentation_rect" : [ 140.0, 20.0, 78.0, 25.0 ],
					"numinlets" : 1,
					"items" : [ "en1", ",", "en0", ",", "lo0" ],
					"types" : [  ],
					"bgcolor2" : [ 1.0, 0.501961, 0.501961, 1.0 ],
					"numoutlets" : 3,
					"patching_rect" : [ 50.0, 50.0, 78.0, 25.0 ],
					"fontname" : "Arial Bold",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "open $1",
					"id" : "obj-26",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 60.0, 280.0, 54.0, 18.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"id" : "obj-27",
					"outlettype" : [ "int", "bang" ],
					"minimum" : 0,
					"fontsize" : 12.0,
					"maximum" : 20,
					"presentation_rect" : [ 130.0, 320.0, 50.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 2,
					"patching_rect" : [ 60.0, 260.0, 50.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r thum_msg_2",
					"id" : "obj-24",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 230.0, 310.0, 87.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "poly~ Thumbafon_Poly",
					"id" : "obj-23",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.678431, 0.819608, 0.819608, 1.0 ],
					"fontsize" : 12.0,
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 60.0, 350.0, 133.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r thum_msg_1",
					"id" : "obj-18",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 0,
					"numoutlets" : 1,
					"patching_rect" : [ 140.0, 310.0, 87.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend parse",
					"id" : "obj-4",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 630.0, 340.0, 88.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js Thumbafon.js",
					"id" : "obj-3",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 630.0, 520.0, 95.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 1337",
					"id" : "obj-1",
					"outlettype" : [ "" ],
					"fontsize" : 12.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"patching_rect" : [ 630.0, 320.0, 99.0, 20.0 ],
					"fontname" : "Arial"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "key offset slider",
					"id" : "obj-74",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 700.0, 110.0, 100.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 800.0, 260.0, 100.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "change mode slider",
					"id" : "obj-13",
					"bgcolor" : [ 0.439216, 0.65098, 0.964706, 0.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"presentation_rect" : [ 700.0, 170.0, 125.0, 20.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 810.0, 370.0, 125.0, 20.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"id" : "obj-41",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"presentation_rect" : [ 680.0, 170.0, 160.0, 20.0 ],
					"size" : 6.0,
					"numinlets" : 1,
					"knobcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"numoutlets" : 1,
					"patching_rect" : [ 790.0, 360.0, 160.0, 40.0 ],
					"presentation" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "slider",
					"id" : "obj-33",
					"outlettype" : [ "" ],
					"bgcolor" : [ 0.662745, 0.662745, 0.733333, 1.0 ],
					"presentation_rect" : [ 660.0, 110.0, 179.0, 20.0 ],
					"size" : 13.0,
					"numinlets" : 1,
					"knobcolor" : [ 0.0, 1.0, 1.0, 1.0 ],
					"numoutlets" : 1,
					"patching_rect" : [ 770.0, 250.0, 184.0, 40.0 ],
					"presentation" : 1,
					"min" : -5.0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"id" : "obj-64",
					"mode" : 1,
					"presentation_rect" : [ 20.0, 90.0, 271.0, 149.0 ],
					"numinlets" : 1,
					"grad1" : [ 0.662745, 0.662745, 0.721569, 1.0 ],
					"numoutlets" : 0,
					"patching_rect" : [ 190.0, 130.0, 255.0, 165.0 ],
					"presentation" : 1,
					"rounded" : 50,
					"grad2" : [ 0.74902, 0.792157, 0.929412, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "clear",
					"id" : "obj-82",
					"outlettype" : [ "" ],
					"fontface" : 1,
					"fontsize" : 14.0,
					"presentation_rect" : [ 370.0, 260.0, 46.0, 21.0 ],
					"numinlets" : 2,
					"numoutlets" : 1,
					"patching_rect" : [ 460.0, 210.0, 48.0, 21.0 ],
					"fontname" : "Arial",
					"presentation" : 1
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-92", 0 ],
					"destination" : [ "obj-94", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 323.0, 561.0, 449.5, 561.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-85", 0 ],
					"destination" : [ "obj-86", 0 ],
					"hidden" : 0,
					"midpoints" : [ 309.5, 561.0, 309.5, 561.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-23", 1 ],
					"hidden" : 0,
					"midpoints" : [ 239.5, 345.0, 183.5, 345.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 300.0, 69.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-18", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 149.5, 330.0, 69.5, 330.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-23", 0 ],
					"hidden" : 0,
					"midpoints" : [ 129.5, 309.0, 69.5, 309.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 372.0, 69.5, 372.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 679.5, 390.0, 639.5, 390.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-49", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 679.5, 465.0, 639.5, 465.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-10", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 679.5, 423.0, 639.5, 423.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 639.5, 360.0, 639.5, 360.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-3", 0 ],
					"hidden" : 0,
					"midpoints" : [ 679.5, 501.0, 639.5, 501.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 1,
					"midpoints" : [ 199.5, 402.0, 199.5, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 93.0, 450.0, 449.5, 450.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-39", 0 ],
					"hidden" : 0,
					"midpoints" : [ 79.5, 426.0, 79.5, 426.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-56", 0 ],
					"hidden" : 0,
					"midpoints" : [ 79.5, 450.0, 79.5, 450.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-75", 0 ],
					"hidden" : 0,
					"midpoints" : [ 199.5, 432.0, 199.5, 432.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 213.0, 450.0, 449.5, 450.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-75", 0 ],
					"destination" : [ "obj-68", 0 ],
					"hidden" : 0,
					"midpoints" : [ 199.5, 450.0, 199.5, 450.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 0 ],
					"destination" : [ "obj-54", 0 ],
					"hidden" : 0,
					"midpoints" : [ 309.5, 450.0, 309.5, 450.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-73", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 323.0, 450.0, 449.5, 450.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"midpoints" : [ 309.5, 432.0, 309.5, 432.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 779.5, 465.0, 679.5, 465.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 799.5, 465.0, 679.5, 465.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 549.5, 387.0, 657.0, 387.0, 657.0, 465.0, 679.5, 465.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-59", 0 ],
					"destination" : [ "obj-28", 0 ],
					"hidden" : 0,
					"midpoints" : [ 549.5, 300.0, 549.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"midpoints" : [ 799.5, 420.0, 799.5, 420.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-6", 1 ],
					"hidden" : 1,
					"midpoints" : [ 379.5, 57.0, 450.5, 57.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 1,
					"midpoints" : [ 779.5, 252.0, 779.5, 252.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-62", 0 ],
					"hidden" : 0,
					"midpoints" : [ 779.5, 321.0, 779.5, 321.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 779.5, 291.0, 779.5, 291.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"midpoints" : [ 639.5, 342.0, 639.5, 342.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 282.0, 69.5, 282.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-30", 0 ],
					"hidden" : 0,
					"midpoints" : [ 749.5, 297.0, 779.5, 297.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"midpoints" : [ 569.5, 51.0, 569.5, 51.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-12", 0 ],
					"hidden" : 1,
					"midpoints" : [ 89.5, 102.0, 66.0, 102.0, 66.0, 87.0, 36.0, 87.0, 36.0, 45.0, 59.5, 45.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 1 ],
					"destination" : [ "obj-36", 0 ],
					"hidden" : 1,
					"midpoints" : [ 89.0, 75.0, 89.5, 75.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"midpoints" : [ 799.5, 402.0, 799.5, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-27", 0 ],
					"hidden" : 0,
					"midpoints" : [ 69.5, 261.0, 69.5, 261.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-20", 0 ],
					"destination" : [ "obj-25", 0 ],
					"hidden" : 0,
					"midpoints" : [ 129.5, 264.0, 129.5, 264.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-25", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"midpoints" : [ 129.5, 282.0, 129.5, 282.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-59", 0 ],
					"hidden" : 0,
					"midpoints" : [ 549.5, 282.0, 549.5, 282.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-44", 0 ],
					"hidden" : 0,
					"midpoints" : [ 749.5, 192.0, 749.5, 192.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-35", 0 ],
					"hidden" : 0,
					"midpoints" : [ 209.5, 231.0, 209.5, 231.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 499.5, 465.0, 679.5, 465.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-38", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"midpoints" : [ 499.5, 420.0, 499.5, 420.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-106", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 1,
					"midpoints" : [ 209.5, 192.0, 209.5, 192.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-119", 0 ],
					"destination" : [ "obj-129", 0 ],
					"hidden" : 0,
					"midpoints" : [ 469.5, 252.0, 469.5, 252.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-129", 0 ],
					"destination" : [ "obj-122", 0 ],
					"hidden" : 0,
					"midpoints" : [ 469.5, 282.0, 469.5, 282.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-133", 0 ],
					"destination" : [ "obj-21", 0 ],
					"hidden" : 0,
					"midpoints" : [ 469.5, 465.0, 679.5, 465.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-122", 0 ],
					"destination" : [ "obj-133", 0 ],
					"hidden" : 0,
					"midpoints" : [ 469.5, 300.0, 469.5, 300.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-53", 0 ],
					"hidden" : 0,
					"midpoints" : [ 349.5, 222.0, 349.5, 222.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-60", 1 ],
					"hidden" : 0,
					"midpoints" : [ 349.5, 240.0, 319.5, 240.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"midpoints" : [ 209.5, 252.0, 209.5, 252.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"midpoints" : [ 479.5, 141.0, 479.5, 141.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-119", 0 ],
					"hidden" : 1,
					"midpoints" : [ 469.5, 231.0, 469.5, 231.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 1,
					"midpoints" : [ 359.5, 30.0, 359.5, 30.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 1,
					"midpoints" : [ 199.5, 402.0, 309.5, 402.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-87", 0 ],
					"destination" : [ "obj-85", 0 ],
					"hidden" : 0,
					"midpoints" : [ 309.5, 540.0, 309.5, 540.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-88", 0 ],
					"hidden" : 0,
					"midpoints" : [ 909.5, 122.0, 909.5, 122.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-88", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [ 909.5, 140.0, 869.5, 140.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-90", 0 ],
					"destination" : [ "obj-91", 0 ],
					"hidden" : 0,
					"midpoints" : [ 869.5, 40.0, 869.5, 40.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-79", 0 ],
					"destination" : [ "obj-91", 1 ],
					"hidden" : 0,
					"midpoints" : [ 999.5, 155.0, 999.5, 155.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-78", 0 ],
					"destination" : [ "obj-79", 0 ],
					"hidden" : 0,
					"midpoints" : [ 999.5, 131.0, 999.5, 131.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-90", 0 ],
					"destination" : [ "obj-78", 0 ],
					"hidden" : 0,
					"midpoints" : [ 869.5, 55.0, 999.5, 55.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-94", 1 ],
					"destination" : [ "obj-76", 0 ],
					"hidden" : 0,
					"midpoints" : [ 153.5, 561.0, 449.5, 561.0 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-101", 0 ],
					"destination" : [ "obj-94", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-99", 0 ],
					"destination" : [ "obj-94", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-97", 0 ],
					"destination" : [ "obj-94", 0 ],
					"hidden" : 0,
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-94", 0 ],
					"destination" : [ "obj-95", 0 ],
					"hidden" : 0,
					"midpoints" : [ 139.5, 561.0, 139.5, 561.0 ]
				}

			}
 ]
	}

}
