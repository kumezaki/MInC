{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 5,
			"minor" : 1,
			"revision" : 9
		}
,
		"rect" : [ 0.0, 44.0, 885.0, 826.0 ],
		"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
		"bglocked" : 0,
		"defrect" : [ 0.0, 44.0, 885.0, 826.0 ],
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
					"text" : "change",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 201.0, 256.0, 50.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-53",
					"background" : 0,
					"numoutlets" : 3,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "", "int", "int" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js ForZeroMeter.js",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 171.0, 229.0, 108.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-44",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 512.0, 145.0, 20.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"id" : "obj-86",
					"background" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"ignoreclick" : 0,
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0,
					"checkedcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "audio $1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 512.0, 169.0, 57.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-88",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s fz_js_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 731.0, 465.0, 74.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-85",
					"background" : 0,
					"numoutlets" : 0,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "exit_tcp_script",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 731.0, 441.0, 87.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-23",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 1.0,
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 171.0, 163.0, 50.0, 20.0 ],
					"cantchange" : 0,
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-82",
					"outputonclick" : 0,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"background" : 0,
					"triangle" : 1,
					"numoutlets" : 2,
					"mouseup" : 0,
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"hbgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"ignoreclick" : 0,
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"minimum" : 50,
					"format" : 0,
					"htextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0,
					"maximum" : "<none>"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "interval $1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 171.0, 189.0, 66.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-58",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "audio_in $1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 201.0, 281.0, 73.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-52",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s fz_js_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 201.0, 302.0, 74.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-16",
					"background" : 0,
					"numoutlets" : 0,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "OSC Messages Out",
					"linecount" : 3,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 328.0, 262.0, 74.0, 48.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-69",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "/Users/main_brain/minc_minc/ForZero/ForZero_MaxMSP/fz_download_script1.sh",
					"linecount" : 2,
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 421.0, 444.0, 289.0, 32.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-55",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js ForZero_DownloadScript.js",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 473.0, 418.0, 168.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-51",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "path",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 423.0, 370.0, 34.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-54",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "thispatcher",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 423.0, 392.0, 69.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-57",
					"background" : 0,
					"numoutlets" : 2,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "", "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0,
					"save" : [ "#N", "thispatcher", ";", "#Q", "end", ";" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "receive~ fz_extern_audio_in",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 128.0, 132.0, 161.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-42",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "signal" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 351.0, 450.0, 20.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"id" : "obj-41",
					"background" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"ignoreclick" : 0,
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0,
					"checkedcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "gate",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 351.0, 474.0, 34.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-66",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "print shell",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 351.0, 497.0, 62.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-59",
					"background" : 0,
					"numoutlets" : 0,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Download MP3 Shell Script",
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 514.0, 382.0, 217.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-94",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "OSC Messages In",
					"linecount" : 3,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 328.0, 54.0, 74.0, 48.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-92",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Audio Processing",
					"linecount" : 2,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 168.0, 76.0, 74.0, 34.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-91",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "host $1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 736.0, 273.0, 50.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-90",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 713.0, 153.0, 20.0, 20.0 ],
					"presentation" : 0,
					"outlinecolor" : [ 0.71328, 0.71328, 0.71328, 1.0 ],
					"numinlets" : 1,
					"id" : "obj-87",
					"blinkcolor" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"background" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"ignoreclick" : 0,
					"fgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.91328, 0.91328, 0.91328, 0.75 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js ForZero_IPAddress.js",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 713.0, 233.0, 138.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-84",
					"background" : 0,
					"numoutlets" : 2,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "", "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t en1 b",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 713.0, 178.0, 47.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-81",
					"background" : 0,
					"numoutlets" : 2,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "en1", "bang" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "mxj net.local",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 713.0, 208.0, 87.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-83",
					"background" : 0,
					"numoutlets" : 2,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "", "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "For Testing Interstitial Messages",
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 24.0, 553.0, 197.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-80",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "play/stop",
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 712.0, 646.0, 59.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-79",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "shell",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 373.0, 449.0, 35.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-62",
					"background" : 0,
					"numoutlets" : 2,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "", "bang" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 1.0,
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 646.0, 191.0, 50.0, 20.0 ],
					"cantchange" : 0,
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-48",
					"outputonclick" : 0,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"background" : 0,
					"triangle" : 1,
					"numoutlets" : 2,
					"mouseup" : 0,
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"hbgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"ignoreclick" : 0,
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"minimum" : "<none>",
					"format" : 0,
					"htextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0,
					"maximum" : "<none>"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 452.0, 145.0, 20.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"id" : "obj-50",
					"background" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"ignoreclick" : 0,
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0,
					"checkedcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "dump $1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 452.0, 169.0, 57.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-46",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "For Testing Different Pre-recorded Sound Files",
					"linecount" : 2,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 525.0, 583.0, 203.0, 34.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-38",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "buffer_set",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 373.0, 161.0, 64.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-27",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r fz_menu_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 38.0, 48.0, 93.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-56",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "umenu",
					"labelclick" : 0,
					"align" : 0,
					"arrowcolor" : [ 0.22, 0.22, 0.22, 1.0 ],
					"arrowbgcolor" : [ 0.86, 0.86, 0.86, 1.0 ],
					"fontface" : 0,
					"types" : [  ],
					"fontsize" : 12.0,
					"framecolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"patching_rect" : [ 38.0, 78.0, 100.0, 20.0 ],
					"prefix" : "",
					"presentation" : 0,
					"menumode" : 0,
					"arrow" : 1,
					"numinlets" : 1,
					"rounded" : 8,
					"discolor" : [ 0.43, 0.43, 0.43, 1.0 ],
					"underline" : 0,
					"depth" : 0,
					"textcolor" : [ 0.15, 0.15, 0.15, 1.0 ],
					"id" : "obj-9",
					"prefix_mode" : 0,
					"togcolor" : [ 0.55, 0.55, 0.55, 1.0 ],
					"background" : 0,
					"numoutlets" : 3,
					"arrowlink" : 1,
					"bgcolor2" : [ 1.0, 1.0, 1.0, 1.0 ],
					"arrowframe" : 1,
					"pattrmode" : 0,
					"truncate" : 1,
					"textcolor2" : [ 0.15, 0.15, 0.15, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "int", "", "" ],
					"ignoreclick" : 0,
					"showdotfiles" : 0,
					"autopopulate" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hltcolor" : [ 0.92, 0.92, 0.92, 1.0 ],
					"hidden" : 0,
					"items" : [ "Off", ",", "ADC", ",", "External" ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "selector~ 2",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 38.0, 168.0, 109.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 3,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-26",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "signal" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "meter~",
					"warmcolor" : [ 0.8545, 0.8545, 0.0, 1.0 ],
					"numleds" : 12,
					"patching_rect" : [ 171.0, 212.0, 80.0, 13.0 ],
					"tepidcolor" : [ 0.6, 0.73243, 0.0, 1.0 ],
					"presentation" : 0,
					"nwarmleds" : 3,
					"hotcolor" : [ 1.0, 0.6, 0.0, 1.0 ],
					"numinlets" : 1,
					"id" : "obj-29",
					"dbperled" : 3,
					"background" : 0,
					"numoutlets" : 1,
					"interval" : 200,
					"coldcolor" : [ 0.0, 0.6, 0.0, 1.0 ],
					"overloadcolor" : [ 1.0, 0.0, 0.0, 1.0 ],
					"nhotleds" : 3,
					"outlettype" : [ "float" ],
					"ignoreclick" : 0,
					"bordercolor" : [ 0.2, 0.2, 0.2, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"ntepidleds" : 3,
					"bgcolor" : [ 0.4063, 0.4063, 0.4063, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ezadc~",
					"ongradcolor2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"patching_rect" : [ 83.0, 108.0, 45.0, 45.0 ],
					"offgradcolor2" : [ 0.7, 0.7, 0.73, 1.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"id" : "obj-32",
					"local" : 0,
					"background" : 0,
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.51, 0.51, 0.51, 1.0 ],
					"hidden" : 0,
					"offgradcolor1" : [ 0.87, 0.87, 0.87, 1.0 ],
					"ongradcolor1" : [ 0.75, 0.79, 0.93, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Server IP Heartbeat",
					"linecount" : 2,
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 1,
					"fontsize" : 12.0,
					"patching_rect" : [ 621.0, 144.0, 67.0, 34.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-77",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "OSX: en0 = ethernet | en1 = WiFi",
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 630.0, 100.0, 189.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-74",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s lb",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 630.0, 60.0, 29.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-73",
					"background" : 0,
					"numoutlets" : 0,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "loadbang",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 630.0, 30.0, 60.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-72",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "bang" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r lb",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 713.0, 126.0, 27.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-71",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "pack /fz/hb s",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 623.0, 271.0, 109.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-67",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend 255.255.255.255 31337",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 623.0, 311.0, 187.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-49",
					"background" : 0,
					"numoutlets" : 0,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 623.0, 191.0, 20.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"id" : "obj-47",
					"background" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"ignoreclick" : 0,
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0,
					"checkedcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "metro 1000",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 623.0, 231.0, 71.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-43",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "bang" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t i 0",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 689.0, 670.0, 32.5, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-40",
					"background" : 0,
					"numoutlets" : 2,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "int", "int" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "t s 0",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 524.0, 670.0, 34.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-22",
					"background" : 0,
					"numoutlets" : 2,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "", "int" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "read $1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 629.0, 715.0, 51.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-45",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "audsound_rev.aif",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 540.0, 645.0, 102.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-30",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "audsound.aif",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 524.0, 625.0, 79.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-28",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "send_interstitial_msg 0 0 \"This is a message.\"",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 170.0, 745.0, 255.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-1",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "reset",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 371.0, 136.0, 37.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-12",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "PLAY",
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 252.0, 587.0, 43.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-25",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "STOP",
					"frgb" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 48.0, 587.0, 43.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"underline" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-20",
					"background" : 0,
					"numoutlets" : 0,
					"fontname" : "Arial",
					"ignoreclick" : 1,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 0.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 25.0, 587.0, 20.0, 20.0 ],
					"presentation" : 0,
					"outlinecolor" : [ 0.71328, 0.71328, 0.71328, 1.0 ],
					"numinlets" : 1,
					"id" : "obj-24",
					"blinkcolor" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"background" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"ignoreclick" : 0,
					"fgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.91328, 0.91328, 0.91328, 0.75 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "button",
					"patching_rect" : [ 229.0, 587.0, 20.0, 20.0 ],
					"presentation" : 0,
					"outlinecolor" : [ 0.71328, 0.71328, 0.71328, 1.0 ],
					"numinlets" : 1,
					"id" : "obj-21",
					"blinkcolor" : [ 1.0, 0.890196, 0.090196, 1.0 ],
					"background" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"ignoreclick" : 0,
					"fgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.91328, 0.91328, 0.91328, 0.75 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "send_interstitial_msg 0 -1 image_1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 244.0, 685.0, 197.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-17",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "send_interstitial_msg 0 -1 image_0",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 40.0, 685.0, 197.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-15",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 25.0, 613.0, 32.5, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-6",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "0",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 229.0, 613.0, 32.5, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-5",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "ezdac~",
					"ongradcolor2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"patching_rect" : [ 38.0, 384.0, 45.0, 45.0 ],
					"offgradcolor2" : [ 0.7, 0.7, 0.73, 1.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"id" : "obj-2",
					"local" : 0,
					"background" : 0,
					"numoutlets" : 0,
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.51, 0.51, 0.51, 1.0 ],
					"hidden" : 0,
					"offgradcolor1" : [ 0.87, 0.87, 0.87, 1.0 ],
					"ongradcolor1" : [ 0.75, 0.79, 0.93, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 1.0,
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 25.0, 637.0, 50.0, 20.0 ],
					"cantchange" : 0,
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-64",
					"outputonclick" : 0,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"background" : 0,
					"triangle" : 1,
					"numoutlets" : 2,
					"mouseup" : 0,
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"hbgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"ignoreclick" : 0,
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"minimum" : "<none>",
					"format" : 0,
					"htextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0,
					"maximum" : "<none>"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "number",
					"triscale" : 1.0,
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 229.0, 637.0, 50.0, 20.0 ],
					"cantchange" : 0,
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-63",
					"outputonclick" : 0,
					"htricolor" : [ 0.87, 0.82, 0.24, 1.0 ],
					"background" : 0,
					"triangle" : 1,
					"numoutlets" : 2,
					"mouseup" : 0,
					"tricolor" : [ 0.75, 0.75, 0.75, 1.0 ],
					"hbgcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "int", "bang" ],
					"ignoreclick" : 0,
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"minimum" : "<none>",
					"format" : 0,
					"htextcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0,
					"maximum" : "<none>"
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "send_client_stop $1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 25.0, 662.0, 117.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-61",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "send_client_play $1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 229.0, 662.0, 117.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-60",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s fz_js_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 25.0, 774.0, 74.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-18",
					"background" : 0,
					"numoutlets" : 0,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r fz_js_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 356.0, 210.0, 72.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-39",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r fz_osc_out_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 403.0, 269.0, 105.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-36",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpsend 127.0.0.1 31337",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 403.0, 299.0, 147.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-31",
					"background" : 0,
					"numoutlets" : 0,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "prepend osc_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 433.0, 111.0, 106.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-37",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "osc-route /fz",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 433.0, 81.0, 77.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-33",
					"background" : 0,
					"numoutlets" : 2,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "", "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "udpreceive 1337",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 433.0, 51.0, 99.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-35",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s fz_poly_in_2_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 689.0, 745.0, 117.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-13",
					"background" : 0,
					"numoutlets" : 0,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "s fz_poly_in_1_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 539.0, 745.0, 117.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-10",
					"background" : 0,
					"numoutlets" : 0,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r fz_poly_in_1_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 68.0, 308.0, 115.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-8",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "r fz_poly_in_2_msg",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 135.0, 331.0, 115.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 0,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-3",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js ForZero.js",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 433.0, 211.0, 77.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-19",
					"background" : 0,
					"numoutlets" : 1,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "target $1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 539.0, 715.0, 58.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-14",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "toggle",
					"patching_rect" : [ 689.0, 645.0, 20.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"id" : "obj-11",
					"background" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"ignoreclick" : 0,
					"bordercolor" : [ 0.5, 0.5, 0.5, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0,
					"checkedcolor" : [ 0.0, 0.0, 0.0, 1.0 ]
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "message",
					"text" : "play $1",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 689.0, 715.0, 49.0, 18.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-7",
					"background" : 0,
					"numoutlets" : 1,
					"bgcolor2" : [ 0.867, 0.867, 0.867, 1.0 ],
					"gradient" : 0,
					"fontname" : "Arial",
					"outlettype" : [ "" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.867, 0.867, 0.867, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "poly~ ForZero_Poly",
					"fontface" : 0,
					"fontsize" : 12.0,
					"patching_rect" : [ 38.0, 355.0, 116.0, 20.0 ],
					"presentation" : 0,
					"numinlets" : 2,
					"textcolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"id" : "obj-4",
					"background" : 0,
					"numoutlets" : 2,
					"color" : [ 0.8, 0.84, 0.71, 1.0 ],
					"fontname" : "Arial",
					"outlettype" : [ "signal", "signal" ],
					"ignoreclick" : 0,
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"mode" : 0,
					"border" : 0,
					"patching_rect" : [ 615.0, 90.0, 242.0, 249.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"rounded" : 8,
					"id" : "obj-75",
					"grad1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"angle" : 0.0,
					"background" : 0,
					"numoutlets" : 0,
					"grad2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"shadow" : 0,
					"ignoreclick" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.66667, 0.66667, 0.66667, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"mode" : 0,
					"border" : 0,
					"patching_rect" : [ 509.0, 568.0, 311.0, 219.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"rounded" : 8,
					"id" : "obj-34",
					"grad1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"angle" : 0.0,
					"background" : 0,
					"numoutlets" : 0,
					"grad2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"shadow" : 0,
					"ignoreclick" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.66667, 0.66667, 0.66667, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"mode" : 0,
					"border" : 0,
					"patching_rect" : [ 11.0, 538.0, 442.0, 280.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"rounded" : 8,
					"id" : "obj-68",
					"grad1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"angle" : 0.0,
					"background" : 0,
					"numoutlets" : 0,
					"grad2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"shadow" : 0,
					"ignoreclick" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.66667, 0.66667, 0.66667, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"mode" : 0,
					"border" : 0,
					"patching_rect" : [ 27.0, 36.0, 270.0, 402.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"rounded" : 8,
					"id" : "obj-70",
					"grad1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"angle" : 0.0,
					"background" : 0,
					"numoutlets" : 0,
					"grad2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"shadow" : 0,
					"ignoreclick" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.66667, 0.66667, 0.66667, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"mode" : 0,
					"border" : 0,
					"patching_rect" : [ 317.0, 36.0, 288.0, 207.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"rounded" : 8,
					"id" : "obj-76",
					"grad1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"angle" : 0.0,
					"background" : 0,
					"numoutlets" : 0,
					"grad2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"shadow" : 0,
					"ignoreclick" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.66667, 0.66667, 0.66667, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"mode" : 0,
					"border" : 0,
					"patching_rect" : [ 341.0, 356.0, 494.0, 173.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"rounded" : 8,
					"id" : "obj-93",
					"grad1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"angle" : 0.0,
					"background" : 0,
					"numoutlets" : 0,
					"grad2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"shadow" : 0,
					"ignoreclick" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.66667, 0.66667, 0.66667, 1.0 ],
					"hidden" : 0
				}

			}
, 			{
				"box" : 				{
					"maxclass" : "panel",
					"mode" : 0,
					"border" : 0,
					"patching_rect" : [ 317.0, 254.0, 288.0, 81.0 ],
					"presentation" : 0,
					"numinlets" : 1,
					"rounded" : 8,
					"id" : "obj-65",
					"grad1" : [ 0.75, 0.79, 0.93, 1.0 ],
					"angle" : 0.0,
					"background" : 0,
					"numoutlets" : 0,
					"grad2" : [ 0.66, 0.66, 0.72, 1.0 ],
					"shadow" : 0,
					"ignoreclick" : 1,
					"bordercolor" : [ 0.0, 0.0, 0.0, 1.0 ],
					"presentation_rect" : [ 0.0, 0.0, 0.0, 0.0 ],
					"bgcolor" : [ 0.66667, 0.66667, 0.66667, 1.0 ],
					"hidden" : 0
				}

			}
 ],
		"lines" : [ 			{
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
					"source" : [ "obj-11", 0 ],
					"destination" : [ "obj-40", 0 ],
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
					"source" : [ "obj-14", 0 ],
					"destination" : [ "obj-10", 0 ],
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
					"source" : [ "obj-17", 0 ],
					"destination" : [ "obj-18", 0 ],
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
					"midpoints" : [ 238.5, 610.5, 253.5, 610.5 ]
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
					"source" : [ "obj-22", 1 ],
					"destination" : [ "obj-14", 0 ],
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
					"source" : [ "obj-23", 0 ],
					"destination" : [ "obj-85", 0 ],
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
					"midpoints" : [ 34.5, 610.5, 49.5, 610.5 ]
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
					"source" : [ "obj-26", 0 ],
					"destination" : [ "obj-29", 0 ],
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
					"source" : [ "obj-28", 0 ],
					"destination" : [ "obj-22", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-29", 0 ],
					"destination" : [ "obj-44", 0 ],
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
					"source" : [ "obj-30", 0 ],
					"destination" : [ "obj-22", 0 ],
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
					"source" : [ "obj-36", 0 ],
					"destination" : [ "obj-31", 0 ],
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
					"source" : [ "obj-39", 0 ],
					"destination" : [ "obj-19", 0 ],
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
					"source" : [ "obj-40", 1 ],
					"destination" : [ "obj-14", 0 ],
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
					"source" : [ "obj-41", 0 ],
					"destination" : [ "obj-66", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-42", 0 ],
					"destination" : [ "obj-26", 2 ],
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
					"source" : [ "obj-44", 0 ],
					"destination" : [ "obj-53", 0 ],
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
					"source" : [ "obj-46", 0 ],
					"destination" : [ "obj-19", 0 ],
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
					"source" : [ "obj-48", 0 ],
					"destination" : [ "obj-43", 1 ],
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
					"source" : [ "obj-50", 0 ],
					"destination" : [ "obj-46", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-51", 0 ],
					"destination" : [ "obj-55", 1 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-52", 0 ],
					"destination" : [ "obj-16", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-53", 0 ],
					"destination" : [ "obj-52", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-54", 0 ],
					"destination" : [ "obj-57", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-55", 0 ],
					"destination" : [ "obj-62", 0 ],
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
					"source" : [ "obj-57", 1 ],
					"destination" : [ "obj-51", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-58", 0 ],
					"destination" : [ "obj-29", 0 ],
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
					"source" : [ "obj-60", 0 ],
					"destination" : [ "obj-18", 0 ],
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
					"source" : [ "obj-62", 0 ],
					"destination" : [ "obj-66", 1 ],
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
					"source" : [ "obj-64", 0 ],
					"destination" : [ "obj-61", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-66", 0 ],
					"destination" : [ "obj-59", 0 ],
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
					"source" : [ "obj-7", 0 ],
					"destination" : [ "obj-13", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-71", 0 ],
					"destination" : [ "obj-87", 0 ],
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
					"source" : [ "obj-8", 0 ],
					"destination" : [ "obj-4", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 1 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-81", 0 ],
					"destination" : [ "obj-83", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-82", 0 ],
					"destination" : [ "obj-58", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-83", 0 ],
					"destination" : [ "obj-84", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 0 ],
					"destination" : [ "obj-67", 1 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-84", 1 ],
					"destination" : [ "obj-90", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-86", 0 ],
					"destination" : [ "obj-88", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-87", 0 ],
					"destination" : [ "obj-81", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
, 			{
				"patchline" : 				{
					"source" : [ "obj-88", 0 ],
					"destination" : [ "obj-19", 0 ],
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
					"source" : [ "obj-90", 0 ],
					"destination" : [ "obj-49", 0 ],
					"hidden" : 0,
					"color" : [ 0.0, 0.0, 0.0, 1.0 ],
					"midpoints" : [  ]
				}

			}
 ]
	}

}
