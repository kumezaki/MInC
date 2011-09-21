{
	"patcher" : 	{
		"fileversion" : 1,
		"rect" : [ -1264.0, -96.0, 881.0, 641.0 ],
		"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ -1264.0, -96.0, 881.0, 641.0 ],
		"openrect" : [ 0.0, 0.0, 0.0, 0.0 ],
		"openinpresentation" : 0,
		"default_fontsize" : 12.0,
		"default_fontface" : 0,
		"default_fontname" : "Arial",
		"gridonopen" : 0,
		"gridsize" : [ 15.0, 10.0 ],
		"gridsnaponopen" : 0,
		"toolbarvisible" : 1,
		"boxanimatetime" : 200,
		"imprint" : 1,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"boxes" : [ 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t en1 b",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "en1", "bang" ],
					"hidden" : 0,
					"patching_rect" : [ 135.0, 430.0, 47.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-58",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "For Testing...",
					"fontface" : 1,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patching_rect" : [ 705.0, 480.0, 83.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-38",
					"fontname" : "Arial",
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "buffer_set",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 495.0, 340.0, 64.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-27",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r saga_menu_msg",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"patching_rect" : [ 15.0, 30.0, 110.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-56",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 0,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"framecolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 3,
					"prefix_mode" : 0,
					"arrow" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"discolor" : [ 0.43, 0.43, 0.43, 1.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"pattrmode" : 0,
					"outlettype" : [ "int", "", "" ],
					"items" : [ "Off", ",", "ADC", ",", "External" ],
					"togcolor" : [ 0.55, 0.55, 0.55, 1.0 ],
					"truncate" : 1,
					"hidden" : 0,
					"arrowlink" : 1,
					"arrowframe" : 1,
					"bgcolor2" : [ 1.0, 1.0, 1.0, 1.0 ],
					"showdotfiles" : 0,
					"autopopulate" : 0,
					"types" : [  ],
					"textcolor2" : [ 0.15, 0.15, 0.15, 1.0 ],
					"patching_rect" : [ 15.0, 60.0, 100.0, 20.0 ],
					"arrowcolor" : [ 0.22, 0.22, 0.22, 1.0 ],
					"hltcolor" : [ 0.92, 0.92, 0.92, 1.0 ],
					"presentation" : 0,
					"id" : "obj-9",
					"labelclick" : 0,
					"fontname" : "Arial",
					"align" : 0,
					"rounded" : 8,
					"underline" : 0,
					"depth" : 0,
					"textcolor" : [ 0.15, 0.15, 0.15, 1.0 ],
					"numinlets" : 1,
					"prefix" : "",
					"menumode" : 0,
					"background" : 0,
					"arrowbgcolor" : [ 0.86, 0.86, 0.86, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "selector~ 2",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "signal" ],
					"hidden" : 0,
					"patching_rect" : [ 15.0, 150.0, 109.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-26",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 3,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"warmcolor" : [ 0.8545, 0.8545, 0.0, 1.0 ],
					"numoutlets" : 1,
					"dbperled" : 3,
					"ignoreclick" : 0,
					"hotcolor" : [ 1.0, 0.6, 0.0, 1.0 ],
					"bgcolor" : [ 0.4063, 0.4063, 0.4063, 1.0 ],
					"tepidcolor" : [ 0.6, 0.73243, 0.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "float" ],
					"ntepidleds" : 3,
					"bordercolor" : [ 0.2, 0.2, 0.2, 1.0 ],
					"hidden" : 0,
					"coldcolor" : [ 0.0, 0.6, 0.0, 1.0 ],
					"overloadcolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"nhotleds" : 3,
					"patching_rect" : [ 45.0, 180.0, 80.0, 13.0 ],
					"presentation" : 0,
					"id" : "obj-29",
					"numleds" : 12,
					"interval" : 50,
					"numinlets" : 1,
					"background" : 0,
					"nwarmleds" : 3
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ezadc~",
					"numoutlets" : 2,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.51, 0.51, 0.51, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal" ],
					"hidden" : 0,
					"patching_rect" : [ 60.0, 90.0, 45.0, 45.0 ],
					"offgradcolor1" : [ 0.87, 0.87, 0.87, 1.0 ],
					"ongradcolor1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"presentation" : 0,
					"id" : "obj-32",
					"local" : 0,
					"ongradcolor2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"offgradcolor2" : [ 0.7, 0.7, 0.73, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Server IP Heartbeat",
					"fontface" : 1,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patching_rect" : [ 255.0, 440.0, 123.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-77",
					"fontname" : "Arial",
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "get this machine's IP address\nOSX: en0 = ethernet | en1 = WiFi",
					"linecount" : 2,
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patching_rect" : [ 225.0, 470.0, 191.0, 34.0 ],
					"presentation" : 0,
					"id" : "obj-74",
					"fontname" : "Arial",
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s lb",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"patching_rect" : [ 795.0, 50.0, 29.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-73",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "bang" ],
					"hidden" : 0,
					"patching_rect" : [ 795.0, 20.0, 60.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-72",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r lb",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"patching_rect" : [ 135.0, 370.0, 27.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-71",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 0,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "route append",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"hidden" : 0,
					"patching_rect" : [ 135.0, 490.0, 81.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-69",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pack /fz/hb s",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"patching_rect" : [ 45.0, 530.0, 109.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-67",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "mxj net.local",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"hidden" : 0,
					"patching_rect" : [ 135.0, 460.0, 87.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-55",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "set to router's broadcast IP address\n10.0.1.255 for Airport only\n255.255.255.255 for all routers",
					"linecount" : 3,
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patching_rect" : [ 210.0, 560.0, 201.0, 48.0 ],
					"presentation" : 0,
					"id" : "obj-54",
					"fontname" : "Arial",
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "pack message",
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patching_rect" : [ 165.0, 530.0, 88.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-53",
					"fontname" : "Arial",
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend 10.0.1.255 31337",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"patching_rect" : [ 45.0, 570.0, 153.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-49",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numoutlets" : 1,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "int" ],
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"hidden" : 0,
					"patching_rect" : [ 45.0, 450.0, 20.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-47",
					"checkedcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 2000",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "bang" ],
					"hidden" : 0,
					"patching_rect" : [ 45.0, 490.0, 71.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-43",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i 0",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "int", "int" ],
					"hidden" : 0,
					"patching_rect" : [ 660.0, 515.0, 32.5, 20.0 ],
					"presentation" : 0,
					"id" : "obj-40",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t s 0",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "", "int" ],
					"hidden" : 0,
					"patching_rect" : [ 495.0, 480.0, 34.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-22",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "read $1",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 600.0, 560.0, 51.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-45",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "audsound_rev.aif",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 585.0, 440.0, 102.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-30",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "audsound.aif",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 495.0, 440.0, 79.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-28",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "exit_tcp_script",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 645.0, 360.0, 87.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-23",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "DISPLAY MESSAGE TO RETURN TO MAIN SCREEN",
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patching_rect" : [ 461.0, 177.0, 305.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-42",
					"fontname" : "Arial",
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "send_interstitial_msg 0 0 \"This is a message. Touch the screen to go back.\"",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 460.0, 194.0, 412.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-1",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "reset",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 660.0, 330.0, 37.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-12",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "PLAY",
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patching_rect" : [ 542.0, 36.0, 43.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-25",
					"fontname" : "Arial",
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "STOP",
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 1,
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"patching_rect" : [ 338.0, 36.0, 43.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-20",
					"fontname" : "Arial",
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numoutlets" : 1,
					"ignoreclick" : 0,
					"blinkcolor" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"bgcolor" : [ 0.91328, 0.91328, 0.91328, 0.75 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "bang" ],
					"hidden" : 0,
					"patching_rect" : [ 315.0, 36.0, 20.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-24",
					"fgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0,
					"outlinecolor" : [ 0.71328, 0.71328, 0.71328, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"numoutlets" : 1,
					"ignoreclick" : 0,
					"blinkcolor" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"bgcolor" : [ 0.91328, 0.91328, 0.91328, 0.75 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "bang" ],
					"hidden" : 0,
					"patching_rect" : [ 519.0, 36.0, 20.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-21",
					"fgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0,
					"outlinecolor" : [ 0.71328, 0.71328, 0.71328, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "send_interstitial_msg 0 -1 image_1",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 534.0, 134.0, 197.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-17",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "send_interstitial_msg 0 -1 image_0",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 330.0, 134.0, 197.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-15",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 315.0, 62.0, 32.5, 18.0 ],
					"presentation" : 0,
					"id" : "obj-6",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 519.0, 62.0, 32.5, 18.0 ],
					"presentation" : 0,
					"id" : "obj-5",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ezdac~",
					"numoutlets" : 0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.51, 0.51, 0.51, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"patching_rect" : [ 45.0, 313.0, 45.0, 45.0 ],
					"offgradcolor1" : [ 0.87, 0.87, 0.87, 1.0 ],
					"ongradcolor1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"presentation" : 0,
					"id" : "obj-2",
					"local" : 0,
					"ongradcolor2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"offgradcolor2" : [ 0.7, 0.7, 0.73, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"mouseup" : 0,
					"hbgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"triscale" : 1.0,
					"ignoreclick" : 0,
					"htextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "int", "bang" ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"cantchange" : 0,
					"hidden" : 0,
					"minimum" : "<none>",
					"outputonclick" : 0,
					"patching_rect" : [ 315.0, 86.0, 50.0, 20.0 ],
					"maximum" : "<none>",
					"presentation" : 0,
					"id" : "obj-64",
					"fontname" : "Arial",
					"format" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"numinlets" : 1,
					"background" : 0,
					"triangle" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"mouseup" : 0,
					"hbgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"triscale" : 1.0,
					"ignoreclick" : 0,
					"htextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "int", "bang" ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"cantchange" : 0,
					"hidden" : 0,
					"minimum" : "<none>",
					"outputonclick" : 0,
					"patching_rect" : [ 519.0, 86.0, 50.0, 20.0 ],
					"maximum" : "<none>",
					"presentation" : 0,
					"id" : "obj-63",
					"fontname" : "Arial",
					"format" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"numinlets" : 1,
					"background" : 0,
					"triangle" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "send_client_stop $1",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 315.0, 111.0, 117.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-61",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "send_client_play $1",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 519.0, 111.0, 117.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-60",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s fz_js_msg",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"patching_rect" : [ 315.0, 223.0, 102.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-18",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r fz_js_msg",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"patching_rect" : [ 585.0, 320.0, 72.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-39",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 0,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r fz_osc_out_msg",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"patching_rect" : [ 300.0, 290.0, 133.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-36",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 0,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend 127.0.0.1 31337",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"patching_rect" : [ 300.0, 320.0, 147.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-31",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend osc_msg",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"patching_rect" : [ 555.0, 290.0, 106.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-37",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "osc-route /fz",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "", "" ],
					"hidden" : 0,
					"patching_rect" : [ 555.0, 260.0, 77.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-33",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 1337",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"patching_rect" : [ 555.0, 230.0, 99.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-35",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s fz_poly_in_2_msg",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"patching_rect" : [ 660.0, 590.0, 145.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-13",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s fz_poly_in_1_msg",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 0,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"hidden" : 0,
					"patching_rect" : [ 510.0, 590.0, 145.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-10",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r fz_poly_in_1_msg",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"patching_rect" : [ 45.0, 220.0, 143.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-8",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 0,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r fz_poly_in_2_msg",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"patching_rect" : [ 142.0, 243.0, 143.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-3",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 0,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js ForZero.js",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"patching_rect" : [ 555.0, 390.0, 77.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-19",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"mouseup" : 0,
					"hbgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"triscale" : 1.0,
					"ignoreclick" : 0,
					"htextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "int", "bang" ],
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"cantchange" : 0,
					"hidden" : 0,
					"minimum" : "<none>",
					"outputonclick" : 0,
					"patching_rect" : [ 510.0, 530.0, 41.0, 20.0 ],
					"maximum" : "<none>",
					"presentation" : 0,
					"id" : "obj-16",
					"fontname" : "Arial",
					"format" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"numinlets" : 1,
					"background" : 0,
					"triangle" : 1
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "target $1",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 510.0, 560.0, 58.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-14",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"numoutlets" : 1,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "int" ],
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"hidden" : 0,
					"patching_rect" : [ 660.0, 470.0, 20.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-11",
					"checkedcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "play $1",
					"fontface" : 0,
					"numoutlets" : 1,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"hidden" : 0,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"patching_rect" : [ 660.0, 560.0, 49.0, 18.0 ],
					"presentation" : 0,
					"id" : "obj-7",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "poly~ ForZero_Poly",
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontface" : 0,
					"numoutlets" : 2,
					"fontsize" : 12.0,
					"ignoreclick" : 0,
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal" ],
					"hidden" : 0,
					"patching_rect" : [ 45.0, 267.0, 116.0, 20.0 ],
					"presentation" : 0,
					"id" : "obj-4",
					"fontname" : "Arial",
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"numinlets" : 2,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"shadow" : 0,
					"grad1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"numoutlets" : 0,
					"angle" : 0.0,
					"grad2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"ignoreclick" : 1,
					"bgcolor" : [ 0.66667, 0.66667, 0.66667, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"mode" : 0,
					"border" : 0,
					"patching_rect" : [ 30.0, 420.0, 421.0, 189.0 ],
					"presentation" : 0,
					"id" : "obj-75",
					"rounded" : 8,
					"numinlets" : 1,
					"background" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"shadow" : 0,
					"grad1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"numoutlets" : 0,
					"angle" : 0.0,
					"grad2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"ignoreclick" : 1,
					"bgcolor" : [ 0.66667, 0.66667, 0.66667, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"hidden" : 0,
					"mode" : 0,
					"border" : 0,
					"patching_rect" : [ 480.0, 420.0, 335.0, 196.0 ],
					"presentation" : 0,
					"id" : "obj-34",
					"rounded" : 8,
					"numinlets" : 1,
					"background" : 0
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 1 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-55", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-69", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-69", 0 ],
					"destination" : [ "obj-67", 1 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-67", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-56", 0 ],
					"destination" : [ "obj-9", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-29", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-9", 0 ],
					"destination" : [ "obj-26", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-32", 0 ],
					"destination" : [ "obj-26", 1 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-33", 0 ],
					"destination" : [ "obj-37", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-35", 0 ],
					"destination" : [ "obj-33", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-61", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-63", 0 ],
					"destination" : [ "obj-60", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-61", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-60", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-6", 0 ],
					"destination" : [ "obj-64", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-5", 0 ],
					"destination" : [ "obj-63", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-47", 0 ],
					"destination" : [ "obj-43", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-45", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 0 ],
					"destination" : [ "obj-7", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-40", 1 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-37", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-31", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-6", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-24", 0 ],
					"destination" : [ "obj-15", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [ 324.5, 59.5, 339.5, 59.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-5", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-21", 0 ],
					"destination" : [ "obj-17", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [ 528.5, 59.5, 543.5, 59.5 ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-16", 0 ],
					"destination" : [ "obj-14", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-15", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-10", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-12", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-40", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-1", 0 ],
					"destination" : [ "obj-18", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-43", 0 ],
					"destination" : [ "obj-67", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-72", 0 ],
					"destination" : [ "obj-73", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-27", 0 ],
					"destination" : [ "obj-19", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 1 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-22", 0 ],
					"destination" : [ "obj-45", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-3", 0 ],
					"destination" : [ "obj-4", 1 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 1 ],
					"destination" : [ "obj-2", 1 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-4", 0 ],
					"destination" : [ "obj-2", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
 ]
	}

}
