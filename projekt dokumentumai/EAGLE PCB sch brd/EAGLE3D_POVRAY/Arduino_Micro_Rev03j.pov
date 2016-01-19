//POVRay-File created by 3d41.ulp v20110101
//C:/Users/Rendszergazda/Documents/eagle/CoinSorter PCBs/arduino-micro-reference-design/Arduino_Micro_Rev03j.brd
//2016.01.19. 12:35

#version 3.5;

//Set to on if the file should be used as .inc
#local use_file_as_inc = off;
#if(use_file_as_inc=off)


//changes the apperance of resistors (1 Blob / 0 real)
#declare global_res_shape = 1;
//randomize color of resistors 1=random 0=same color
#declare global_res_colselect = 0;
//Number of the color for the resistors
//0=Green, 1="normal color" 2=Blue 3=Brown
#declare global_res_col = 1;
//Set to on if you want to render the PCB upside-down
#declare pcb_upsidedown = off;
//Set to x or z to rotate around the corresponding axis (referring to pcb_upsidedown)
#declare pcb_rotdir = x;
//Set the length off short pins over the PCB
#declare pin_length = 2.5;
#declare global_diode_bend_radius = 1;
#declare global_res_bend_radius = 1;
#declare global_solder = on;

#declare global_show_screws = on;
#declare global_show_washers = on;
#declare global_show_nuts = on;

#declare global_use_radiosity = on;

#declare global_ambient_mul = 1;
#declare global_ambient_mul_emit = 0;

//Animation
#declare global_anim = off;
#local global_anim_showcampath = no;

#declare global_fast_mode = off;

#declare col_preset = 2;
#declare pin_short = on;

#declare e3d_environment = on;

#local cam_x = 0;
#local cam_y = 207;
#local cam_z = -110;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -4;
#local cam_look_z = 0;

#local pcb_rotate_x = 0;
#local pcb_rotate_y = 0;
#local pcb_rotate_z = 0;

#local pcb_board = on;
#local pcb_parts = on;
#local pcb_wire_bridges = off;
#if(global_fast_mode=off)
	#local pcb_polygons = on;
	#local pcb_silkscreen = on;
	#local pcb_wires = on;
	#local pcb_pads_smds = on;
#else
	#local pcb_polygons = off;
	#local pcb_silkscreen = off;
	#local pcb_wires = off;
	#local pcb_pads_smds = off;
#end

#local lgt1_pos_x = 6;
#local lgt1_pos_y = 27;
#local lgt1_pos_z = 25;
#local lgt1_intense = 0.712258;
#local lgt2_pos_x = -6;
#local lgt2_pos_y = 27;
#local lgt2_pos_z = 25;
#local lgt2_intense = 0.712258;
#local lgt3_pos_x = 6;
#local lgt3_pos_y = 27;
#local lgt3_pos_z = -17;
#local lgt3_intense = 0.712258;
#local lgt4_pos_x = -6;
#local lgt4_pos_y = 27;
#local lgt4_pos_z = -17;
#local lgt4_intense = 0.712258;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 17.780000;
#declare pcb_y_size = 48.260000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(953);
#declare global_pcb_layer_dis = array[16]
{
	0.000000,
	0.500000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	0.000000,
	1.000000,
	1.535000,
}
#declare global_pcb_real_hole = 2.000000;

#include "e3d_tools.inc"
#include "e3d_user.inc"

global_settings{charset utf8}

#if(e3d_environment=on)
sky_sphere {pigment {Navy}
pigment {bozo turbulence 0.65 octaves 7 omega 0.7 lambda 2
color_map {
[0.0 0.1 color rgb <0.85, 0.85, 0.85> color rgb <0.75, 0.75, 0.75>]
[0.1 0.5 color rgb <0.75, 0.75, 0.75> color rgbt <1, 1, 1, 1>]
[0.5 1.0 color rgbt <1, 1, 1, 1> color rgbt <1, 1, 1, 1>]}
scale <0.1, 0.5, 0.1>} rotate -90*x}
plane{y, -10.0-max(pcb_x_size,pcb_y_size)*abs(max(sin((pcb_rotate_x/180)*pi),sin((pcb_rotate_z/180)*pi)))
texture{T_Chrome_2D
normal{waves 0.1 frequency 3000.0 scale 3000.0}} translate<0,0,0>}
#end

//Animation data
#if(global_anim=on)
#declare global_anim_showcampath = no;
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_flight=0;
#warning "No/not enough Animation Data available (min. 3 points) (Flight path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#declare global_anim_npoints_cam_view=0;
#warning "No/not enough Animation Data available (min. 3 points) (View path)"
#end

#if((global_anim=on)|(global_anim_showcampath=yes))
#end

#if((global_anim_showcampath=yes)&(global_anim=off))
#end
#if(global_anim=on)
camera
{
	location global_anim_spline_cam_flight(clock)
	#if(global_anim_npoints_cam_view>2)
		look_at global_anim_spline_cam_view(clock)
	#else
		look_at global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	angle 45
}
light_source
{
	global_anim_spline_cam_flight(clock)
	color rgb <1,1,1>
	spotlight point_at 
	#if(global_anim_npoints_cam_view>2)
		global_anim_spline_cam_view(clock)
	#else
		global_anim_spline_cam_flight(clock+0.01)-<0,-0.01,0>
	#end
	radius 35 falloff  40
}
#else
camera
{
	location <cam_x,cam_y,cam_z>
	look_at <cam_look_x,cam_look_y,cam_look_z>
	angle cam_a
	//translates the camera that <0,0,0> is over the Eagle <0,0>
	//translate<-8.890000,0,-24.130000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro ARDUINO_MICRO_REV03J(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
//Board
box{<17.780000,0,48.260000><0.000000,-1.500000,0.000000> texture{col_brd}}

//Holes(real)/Parts
//Holes(real)/Board
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_C1) #declare global_pack_C1=yes; object {CAP_SMD_CHIP_0402()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<10.795000,-1.500000,37.846000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0402 C1 100n C0402
#ifndef(pack_C2) #declare global_pack_C2=yes; object {CAP_SMD_CHIP_0402()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<9.779000,-1.500000,40.640000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0402 C2 100n C0402
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<12.573000,0,33.401000>}		//unbekanntes Bauteil C3 22u SMC_B
#ifndef(pack_C4) #declare global_pack_C4=yes; object {CAP_SMD_CHIP_0402()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<8.890000,-1.500000,1.016000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0402 C4 1uF C0402
#ifndef(pack_C5) #declare global_pack_C5=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<12.573000,0.000000,28.448000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C5 1uF C0402
#ifndef(pack_C6) #declare global_pack_C6=yes; object {CAP_SMD_CHIP_0402()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<14.224000,-1.500000,9.271000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0402 C6 100n C0402
#ifndef(pack_C7) #declare global_pack_C7=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<12.573000,0.000000,30.226000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C7 1uF C0402
#ifndef(pack_C9) #declare global_pack_C9=yes; object {CAP_SMD_CHIP_0402()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<10.795000,-1.500000,26.797000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0402 C9 100n C0402
#ifndef(pack_C10) #declare global_pack_C10=yes; object {CAP_SMD_CHIP_0402()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<8.890000,-1.500000,26.797000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0402 C10 100n C0402
#ifndef(pack_C11) #declare global_pack_C11=yes; object {CAP_SMD_CHIP_0402()translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-315.000000,0> rotate<0,0,180> translate<12.954000,-1.500000,22.225000>translate<0,-0.035000,0> }#end		//SMD Capacitor 0402 C11 100n C0402
#ifndef(pack_C12) #declare global_pack_C12=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<6.604000,0.000000,29.718000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C12 22pF C0402
#ifndef(pack_C13) #declare global_pack_C13=yes; object {CAP_SMD_CHIP_0402()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<3.556000,0.000000,32.385000>translate<0,0.035000,0> }#end		//SMD Capacitor 0402 C13 22pF C0402
cylinder{<0,0,0><0,7*-1.000000,0>0.5 pigment{Red filter 0.2} translate<4.191000,0,4.953000>}		//unbekanntes Bauteil C14 22u SMC_B
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_SMD_MINIMELF("CD1206-S01575",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<6.858000,-1.500000,42.291000>translate<0,-0.035000,0> }#end		//SMD-Diode MINIMELF-Outline D2 CD1206-S01575 MINIMELF
cylinder{<0,0,0><0,7*-1.000000,0>0.5 pigment{Red filter 0.2} translate<5.207000,0,12.700000>}		//unbekanntes Bauteil F1 MF-MSMF050-2 500mA L1812
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<8.890000,0,1.447800>}		//unbekanntes Bauteil J3 USB-MICRO!!! CON2_USB_MICRO_B_AT
#ifndef(pack_J4) #declare global_pack_J4=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<12.700000,0.000000,43.180000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) J4 3x2M 2X03
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<1.270000,0,44.450000>}		//unbekanntes Bauteil J5 HEAD17-NOSS HEAD17-NOSS
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<16.510000,0,44.450000>}		//unbekanntes Bauteil J6 HEAD17-NOSS-1 HEAD17-NOSS-1
#ifndef(pack_L) #declare global_pack_L=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<8.890000,0.000000,13.970000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 L green CHIPLED_0805
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<14.859000,0,30.480000>}		//unbekanntes Bauteil L2 MH2029-300Y 0805
#ifndef(pack_ON) #declare global_pack_ON=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,-0,0> rotate<0,90.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<8.890000,-1.500000,2.921000>translate<0,-0.035000,0> }#end		//SMD-LED im 0805 ON blue CHIPLED_0805
#ifndef(pack_R1) #declare global_pack_R1=yes; object {RES_SMD_CHIP_0402("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<14.859000,0.000000,33.401000>translate<0,0.035000,0> }#end		//SMD Resistor 0402 R1 10K R0402
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0402("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-135.000000,0> rotate<0,0,180> translate<10.350500,-1.500000,25.146000>translate<0,-0.035000,0> }#end		//SMD Resistor 0402 R2 10K R0402
#ifndef(pack_R4) #declare global_pack_R4=yes; object {RES_SMD_CHIP_0402("103",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<12.065000,0.000000,13.970000>translate<0,0.035000,0> }#end		//SMD Resistor 0402 R4 10K R0402
#ifndef(pack_R5) #declare global_pack_R5=yes; object {RES_SMD_CHIP_0402("102",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,180> translate<8.890000,-1.500000,4.318000>translate<0,-0.035000,0> }#end		//SMD Resistor 0402 R5 1K R0402
#ifndef(pack_R6) #declare global_pack_R6=yes; object {RES_SMD_CHIP_0402("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<6.985000,0.000000,33.655000>translate<0,0.035000,0> }#end		//SMD Resistor 0402 R6 1K R0402
#ifndef(pack_R7) #declare global_pack_R7=yes; object {RES_SMD_CHIP_0402("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<6.985000,0.000000,35.560000>translate<0,0.035000,0> }#end		//SMD Resistor 0402 R7 1K R0402
#ifndef(pack_R8) #declare global_pack_R8=yes; object {RES_SMD_CHIP_0402("102",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<5.715000,0.000000,13.970000>translate<0,0.035000,0> }#end		//SMD Resistor 0402 R8 1K R0402
#ifndef(pack_R9) #declare global_pack_R9=yes; object {RES_SMD_CHIP_0402("103",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,180> translate<10.795000,-1.500000,38.938200>translate<0,-0.035000,0> }#end		//SMD Resistor 0402 R9 10K R0402
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<6.223000,0,43.053000>}		//unbekanntes Bauteil RESET TS42 TS42
cylinder{<0,0,0><0,7*-1.000000,0>0.5 pigment{Red filter 0.2} translate<8.890000,0,11.176000>}		//unbekanntes Bauteil RP3 22R CAY16
#ifndef(pack_RX) #declare global_pack_RX=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<4.572000,0.000000,35.560000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 RX yellow CHIPLED_0805
cylinder{<0,0,0><0,7*-1.000000,0>0.5 pigment{Red filter 0.2} translate<13.398500,0,30.480000>}		//unbekanntes Bauteil T1 FDN340P/PMV48XP SOT-23
cylinder{<0,0,0><0,7*-1.000000,0>0.5 pigment{Red filter 0.2} translate<13.335000,0,37.719000>}		//unbekanntes Bauteil T2 PMV48XP SOT-23
#ifndef(pack_TX) #declare global_pack_TX=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.500000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<4.572000,0.000000,33.655000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 TX yellow CHIPLED_0805
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<-4.699000,0,-22.479000>}		//unbekanntes Bauteil U$3 DISCLAIMER DISCLAIMER
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<4.572000,0,43.942000>}		//unbekanntes Bauteil U$37 FIDUCIALMOUNT FIDUCIA-MOUNT
cylinder{<0,0,0><0,7*-1.000000,0>0.5 pigment{Red filter 0.2} translate<3.810000,0,46.736000>}		//unbekanntes Bauteil U$53 FIDUCIAL1X2 FIDUCIAL-1X2
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<8.890000,0,21.590000>}		//unbekanntes Bauteil U1 ATMEGA32U4-XUMU QFN44ML7X7
#ifndef(pack_U2) #declare global_pack_U2=yes; object {IC_SMD_SOT223("NCP1117-5","ATMEL",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,180> translate<7.493000,-1.500000,34.163000>translate<0,-0.035000,0> }#end		//SOT223 U2 NCP1117-5 SOT223
cylinder{<0,0,0><0,7*-1.000000,0>0.5 pigment{Red filter 0.2} translate<13.208000,0,4.699000>}		//unbekanntes Bauteil U4 LP2985-33DBVR SOT23-DBV
cylinder{<0,0,0><0,7*1.000000,0>0.5 pigment{Red filter 0.2} translate<4.318000,0,29.845000>}		//unbekanntes Bauteil Y3 16MHz KX-7 CRYSTAL-3.2-2.5
cylinder{<0,0,0><0,7*-1.000000,0>0.5 pigment{Red filter 0.2} translate<10.033000,0,7.874000>}		//unbekanntes Bauteil Z1 CG0603MLC-05E CT/CN0603
cylinder{<0,0,0><0,7*-1.000000,0>0.5 pigment{Red filter 0.2} translate<10.033000,0,6.223000>}		//unbekanntes Bauteil Z2 CG0603MLC-05E CT/CN0603
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<11.239500,-1.537000,37.846000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<10.350500,-1.537000,37.846000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<9.779000,-1.537000,41.084500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<9.779000,-1.537000,40.195500>}
object{TOOLS_PCB_SMD(1.600000,2.400000,0.037000,6) rotate<0,-90.000000,0> texture{col_pds} translate<12.573000,0.000000,31.901000>}
object{TOOLS_PCB_SMD(1.600000,2.400000,0.037000,6) rotate<0,-270.000000,0> texture{col_pds} translate<12.573000,0.000000,34.901000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<9.334500,-1.537000,1.016000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<8.445500,-1.537000,1.016000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-0.000000,0> texture{col_pds} translate<12.128500,0.000000,28.448000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-0.000000,0> texture{col_pds} translate<13.017500,0.000000,28.448000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<14.224000,-1.537000,9.715500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<14.224000,-1.537000,8.826500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<13.017500,0.000000,30.226000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<12.128500,0.000000,30.226000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<10.795000,-1.537000,27.241500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<10.795000,-1.537000,26.352500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<8.890000,-1.537000,27.241500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<8.890000,-1.537000,26.352500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-225.000000,0> texture{col_pds} translate<13.268309,-1.537000,22.539306>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-225.000000,0> texture{col_pds} translate<12.639694,-1.537000,21.910691>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<7.048500,0.000000,29.718000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<6.159500,0.000000,29.718000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<4.000500,0.000000,32.385000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<3.111500,0.000000,32.385000>}
object{TOOLS_PCB_SMD(1.600000,2.400000,0.037000,6) rotate<0,-270.000000,0> texture{col_pds} translate<4.191000,-1.537000,6.453000>}
object{TOOLS_PCB_SMD(1.600000,2.400000,0.037000,6) rotate<0,-90.000000,0> texture{col_pds} translate<4.191000,-1.537000,3.453000>}
object{TOOLS_PCB_SMD(1.400000,1.800000,0.037000,7) rotate<0,-90.000000,0> texture{col_pds} translate<6.858000,-1.537000,43.991000>}
object{TOOLS_PCB_SMD(1.400000,1.800000,0.037000,7) rotate<0,-90.000000,0> texture{col_pds} translate<6.858000,-1.537000,40.591000>}
object{TOOLS_PCB_SMD(1.900000,3.400000,0.037000,5) rotate<0,-90.000000,0> texture{col_pds} translate<5.207000,-1.537000,10.750000>}
object{TOOLS_PCB_SMD(1.900000,3.400000,0.037000,5) rotate<0,-90.000000,0> texture{col_pds} translate<5.207000,-1.537000,14.650000>}
object{TOOLS_PCB_SMD(0.406400,1.346200,0.037000,25) rotate<0,-0.000000,0> texture{col_pds} translate<7.569200,0.000000,4.140200>}
object{TOOLS_PCB_SMD(0.406400,1.346200,0.037000,25) rotate<0,-0.000000,0> texture{col_pds} translate<8.229600,0.000000,4.140200>}
object{TOOLS_PCB_SMD(0.406400,1.346200,0.037000,25) rotate<0,-0.000000,0> texture{col_pds} translate<8.890000,0.000000,4.140200>}
object{TOOLS_PCB_SMD(0.406400,1.346200,0.037000,25) rotate<0,-0.000000,0> texture{col_pds} translate<9.550400,0.000000,4.140200>}
object{TOOLS_PCB_SMD(0.406400,1.346200,0.037000,25) rotate<0,-0.000000,0> texture{col_pds} translate<10.210800,0.000000,4.140200>}
object{TOOLS_PCB_SMD(1.651000,1.549400,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<5.588000,0.000000,1.447800>}
object{TOOLS_PCB_SMD(1.651000,1.549400,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<12.192000,0.000000,1.447800>}
object{TOOLS_PCB_SMD(1.524000,1.016000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<6.400800,0.000000,4.140200>}
object{TOOLS_PCB_SMD(1.524000,1.016000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<11.379200,0.000000,4.140200>}
object{TOOLS_PCB_SMD(1.524000,1.524000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<7.874000,0.000000,1.447800>}
object{TOOLS_PCB_SMD(1.524000,1.524000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<9.906000,0.000000,1.447800>}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.559600,0.950000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<13.970000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.559600,0.950000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<11.430000,0,40.640000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.559600,0.950000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<13.970000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.559600,0.950000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<11.430000,0,43.180000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.559600,0.950000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<13.970000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.559600,0.950000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<11.430000,0,45.720000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,0+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_J5) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<1.270000,0,3.810000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,44.450000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,41.910000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,39.370000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,36.830000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,34.290000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,31.750000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,29.210000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,26.670000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,24.130000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,21.590000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,19.050000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,16.510000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,13.970000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,11.430000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,8.890000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,6.350000> texture{col_thl}}
#ifndef(global_pack_J6) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.574800,0.914400,1,16,1+global_tmp,0) rotate<0,-270.000000,0>translate<16.510000,0,3.810000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,8) rotate<0,-270.000000,0> texture{col_pds} translate<7.840000,0.000000,13.970000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,8) rotate<0,-270.000000,0> texture{col_pds} translate<9.940000,0.000000,13.970000>}
object{TOOLS_PCB_SMD(1.200000,1.000000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<14.859000,0.000000,31.580000>}
object{TOOLS_PCB_SMD(1.200000,1.000000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<14.859000,0.000000,29.380000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,8) rotate<0,-270.000000,0> texture{col_pds} translate<9.940000,-1.537000,2.921000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,8) rotate<0,-270.000000,0> texture{col_pds} translate<7.840000,-1.537000,2.921000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<14.859000,0.000000,32.956500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<14.859000,0.000000,33.845500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-45.000000,0> texture{col_pds} translate<10.036194,-1.537000,24.831691>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-45.000000,0> texture{col_pds} translate<10.664809,-1.537000,25.460306>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-0.000000,0> texture{col_pds} translate<11.620500,0.000000,13.970000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-0.000000,0> texture{col_pds} translate<12.509500,0.000000,13.970000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<9.334500,-1.537000,4.318000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-180.000000,0> texture{col_pds} translate<8.445500,-1.537000,4.318000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<6.985000,0.000000,33.210500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<6.985000,0.000000,34.099500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<6.985000,0.000000,36.004500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-270.000000,0> texture{col_pds} translate<6.985000,0.000000,35.115500>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-0.000000,0> texture{col_pds} translate<5.270500,0.000000,13.970000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-0.000000,0> texture{col_pds} translate<6.159500,0.000000,13.970000>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-0.000000,0> texture{col_pds} translate<10.350500,-1.537000,38.938200>}
object{TOOLS_PCB_SMD(0.508000,0.762000,0.037000,90) rotate<0,-0.000000,0> texture{col_pds} translate<11.239500,-1.537000,38.938200>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,15) rotate<0,-270.000000,0> texture{col_pds} translate<8.473000,0.000000,47.253000>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,15) rotate<0,-270.000000,0> texture{col_pds} translate<8.473000,0.000000,38.853000>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,15) rotate<0,-270.000000,0> texture{col_pds} translate<3.973000,0.000000,47.253000>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,15) rotate<0,-270.000000,0> texture{col_pds} translate<3.973000,0.000000,38.853000>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,15) rotate<0,-270.000000,0> texture{col_pds} translate<6.223000,0.000000,47.253000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<7.690000,-1.537000,11.851000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<8.490000,-1.537000,11.851000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<9.290000,-1.537000,11.851000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<10.090000,-1.537000,11.851000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<10.090000,-1.537000,10.501000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<9.290000,-1.537000,10.501000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<8.490000,-1.537000,10.501000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-0.000000,0> texture{col_pds} translate<7.690000,-1.537000,10.501000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,8) rotate<0,-90.000000,0> texture{col_pds} translate<5.622000,0.000000,35.560000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,8) rotate<0,-90.000000,0> texture{col_pds} translate<3.522000,0.000000,35.560000>}
object{TOOLS_PCB_SMD(0.787400,0.889000,0.037000,13) rotate<0,-180.000000,0> texture{col_pds} translate<13.373100,-1.537000,29.464000>}
object{TOOLS_PCB_SMD(0.787400,0.889000,0.037000,13) rotate<0,-180.000000,0> texture{col_pds} translate<14.338300,-1.537000,31.496000>}
object{TOOLS_PCB_SMD(0.787400,0.889000,0.037000,13) rotate<0,-180.000000,0> texture{col_pds} translate<12.407900,-1.537000,31.496000>}
object{TOOLS_PCB_SMD(0.787400,0.889000,0.037000,13) rotate<0,-0.000000,0> texture{col_pds} translate<13.360400,-1.537000,38.735000>}
object{TOOLS_PCB_SMD(0.787400,0.889000,0.037000,13) rotate<0,-0.000000,0> texture{col_pds} translate<12.395200,-1.537000,36.703000>}
object{TOOLS_PCB_SMD(0.787400,0.889000,0.037000,13) rotate<0,-0.000000,0> texture{col_pds} translate<14.325600,-1.537000,36.703000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,8) rotate<0,-90.000000,0> texture{col_pds} translate<5.622000,0.000000,33.655000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,8) rotate<0,-90.000000,0> texture{col_pds} translate<3.522000,0.000000,33.655000>}
object{TOOLS_PCB_SMD(1.016000,1.016000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<4.572000,0.000000,43.942000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<3.810000,-1.537000,46.736000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<12.973541,0.000000,22.138006>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<12.619988,0.000000,22.491559>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<12.266434,0.000000,22.845113>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<11.912881,0.000000,23.198666>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<11.559325,0.000000,23.552219>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<11.205772,0.000000,23.905772>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<10.852219,0.000000,24.259325>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<10.498666,0.000000,24.612881>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<10.145112,0.000000,24.966434>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<9.791559,0.000000,25.319987>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-225.000000,0> texture{col_pds} translate<9.438006,0.000000,25.673541>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<8.341991,0.000000,25.673541>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<7.988438,0.000000,25.319987>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<7.634884,0.000000,24.966434>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<7.281331,0.000000,24.612881>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<6.927778,0.000000,24.259325>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<6.574225,0.000000,23.905772>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<6.220672,0.000000,23.552219>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<5.867116,0.000000,23.198666>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<5.513562,0.000000,22.845113>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<5.160009,0.000000,22.491559>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-315.000000,0> texture{col_pds} translate<4.806456,0.000000,22.138006>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<4.806456,0.000000,21.041991>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<5.160009,0.000000,20.688438>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<5.513562,0.000000,20.334884>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<5.867116,0.000000,19.981331>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<6.220672,0.000000,19.627778>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<6.574225,0.000000,19.274225>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<6.927778,0.000000,18.920672>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<7.281331,0.000000,18.567116>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<7.634884,0.000000,18.213563>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<7.988438,0.000000,17.860009>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-45.000000,0> texture{col_pds} translate<8.341991,0.000000,17.506456>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<9.438006,0.000000,17.506456>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<9.791559,0.000000,17.860009>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<10.145112,0.000000,18.213563>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<10.498666,0.000000,18.567116>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<10.852219,0.000000,18.920672>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<11.205772,0.000000,19.274225>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<11.559325,0.000000,19.627778>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<11.912881,0.000000,19.981331>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<12.266434,0.000000,20.334884>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<12.619988,0.000000,20.688438>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-135.000000,0> texture{col_pds} translate<12.973541,0.000000,21.041991>}
object{TOOLS_PCB_SMD(4.826000,4.826000,0.037000,10) rotate<0,-225.000000,0> texture{col_pds} translate<8.890000,0.000000,21.590000>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,8) rotate<0,-270.000000,0> texture{col_pds} translate<10.591800,-1.537000,36.474400>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,8) rotate<0,-270.000000,0> texture{col_pds} translate<10.591800,-1.537000,34.163000>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,8) rotate<0,-270.000000,0> texture{col_pds} translate<10.591800,-1.537000,31.851600>}
object{TOOLS_PCB_SMD(3.600000,2.200000,0.037000,5) rotate<0,-270.000000,0> texture{col_pds} translate<4.394000,-1.537000,34.163000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,18) rotate<0,-0.000000,0> texture{col_pds} translate<12.258000,-1.537000,5.999000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,18) rotate<0,-0.000000,0> texture{col_pds} translate<13.208000,-1.537000,5.999000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,18) rotate<0,-0.000000,0> texture{col_pds} translate<14.158000,-1.537000,5.999000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,18) rotate<0,-0.000000,0> texture{col_pds} translate<14.158000,-1.537000,3.399000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,18) rotate<0,-0.000000,0> texture{col_pds} translate<12.258000,-1.537000,3.399000>}
object{TOOLS_PCB_SMD(1.050000,1.300000,0.037000,10) rotate<0,-180.000000,0> texture{col_pds} translate<5.243000,0.000000,28.695000>}
object{TOOLS_PCB_SMD(1.050000,1.300000,0.037000,10) rotate<0,-180.000000,0> texture{col_pds} translate<5.243000,0.000000,30.995000>}
object{TOOLS_PCB_SMD(1.050000,1.300000,0.037000,10) rotate<0,-180.000000,0> texture{col_pds} translate<3.393000,0.000000,30.995000>}
object{TOOLS_PCB_SMD(1.050000,1.300000,0.037000,10) rotate<0,-180.000000,0> texture{col_pds} translate<3.393000,0.000000,28.695000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<9.033000,-1.537000,7.874000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<11.033000,-1.537000,7.874000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<9.033000,-1.537000,6.223000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<11.033000,-1.537000,6.223000>}
//Pads/Vias
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<3.683000,0,20.828000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<6.477000,0,28.448000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<13.970000,0,23.304500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<10.033000,0,16.256000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<5.461000,0,36.957000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<15.176500,0,35.369500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<8.191500,0,34.163000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<13.970000,0,19.431000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<8.128000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<6.858000,0,7.366000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<3.302000,0,26.606500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<3.810000,0,24.384000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<4.127500,0,25.654000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<6.350000,0,16.383000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<2.794000,0,19.177000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<14.224000,0,28.067000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<11.684000,0,15.240000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<8.890000,0,24.511000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<11.684000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<6.705600,0,30.911800> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<5.969000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<8.890000,0,18.796000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<3.556000,0,1.270000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<14.224000,0,1.270000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<8.636000,0,40.640000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<6.350000,0,2.931159> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<13.081000,0,27.305000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<4.572000,0,40.957500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<3.365500,0,27.876500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<7.493000,0,26.733500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<3.556000,0,18.161000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<3.302000,0,8.509000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<13.462000,0,26.035000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<13.970000,0,24.765000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<3.556000,0,37.211000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<8.636000,0,43.688000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<8.636000,0,32.004000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<6.985000,0,37.465000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<10.350500,0,29.527500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<3.683000,0,22.098000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<6.718300,0,32.194500> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<10.858500,0,28.321000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.016000,0.609600,1,16,2,0) translate<6.096000,0,6.350000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,21.082000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,-90.000000,0> translate<1.270000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,28.321000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,29.210000>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,90.000000,0> translate<1.270000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,39.370000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,90.000000,0> translate<1.270000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.778000,0.000000,23.622000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.778000,0.000000,22.987000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,-90.000000,0> translate<1.778000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.778000,0.000000,23.622000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<1.270000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.778000,-1.535000,26.162000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<1.270000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.778000,-1.535000,25.336500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.778000,-1.535000,26.162000>}
box{<0,0,-0.127000><0.825500,0.035000,0.127000> rotate<0,90.000000,0> translate<1.778000,-1.535000,26.162000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,28.321000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,-1.535000,27.178000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,44.997030,0> translate<1.270000,-1.535000,28.321000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,-1.535000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,-1.535000,27.178000>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,90.000000,0> translate<2.413000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,-1.535000,35.433000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<1.270000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,-1.535000,35.433000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,-90.000000,0> translate<2.413000,-1.535000,35.433000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,39.116000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,0.000000,37.973000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,44.997030,0> translate<1.270000,0.000000,39.116000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,0.000000,23.304500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,0.000000,37.973000>}
box{<0,0,-0.127000><14.668500,0.035000,0.127000> rotate<0,90.000000,0> translate<2.413000,0.000000,37.973000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,5.080000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<1.270000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,-1.535000,7.620000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<1.270000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,7.620000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<2.540000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,-1.535000,16.256000>}
box{<0,0,-0.127000><7.366000,0.035000,0.127000> rotate<0,90.000000,0> translate<2.540000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,20.701000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,-90.000000,0> translate<2.540000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.778000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,22.225000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<1.778000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.667000,0.000000,12.827000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,-44.997030,0> translate<1.270000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.667000,0.000000,12.827000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.667000,0.000000,14.659900>}
box{<0,0,-0.127000><1.832900,0.035000,0.127000> rotate<0,90.000000,0> translate<2.667000,0.000000,14.659900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.667000,-1.535000,24.447500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.667000,-1.535000,24.257000>}
box{<0,0,-0.127000><0.190500,0.035000,0.127000> rotate<0,-90.000000,0> translate<2.667000,-1.535000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.778000,-1.535000,25.336500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.667000,-1.535000,24.447500>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,44.997030,0> translate<1.778000,-1.535000,25.336500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,0.000000,23.304500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.730500,0.000000,22.987000>}
box{<0,0,-0.127000><0.449013,0.035000,0.127000> rotate<0,44.997030,0> translate<2.413000,0.000000,23.304500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.794000,0.000000,19.558000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.794000,0.000000,19.177000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,-90.000000,0> translate<2.794000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.794000,0.000000,19.558000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,44.997030,0> translate<1.270000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.794000,-1.535000,38.354000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,-44.997030,0> translate<1.270000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.921000,0.000000,23.685500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.921000,0.000000,26.225500>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<2.921000,0.000000,26.225500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.921000,-1.535000,32.131000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.921000,-1.535000,36.131500>}
box{<0,0,-0.127000><4.000500,0.035000,0.127000> rotate<0,90.000000,0> translate<2.921000,-1.535000,36.131500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.048000,-1.535000,8.509000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,36.867464,0> translate<2.540000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.048000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.048000,-1.535000,15.875000>}
box{<0,0,-0.127000><6.223000,0.035000,0.127000> rotate<0,90.000000,0> translate<3.048000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.048000,-1.535000,37.211000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.413000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.921000,0.000000,23.685500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.111500,0.000000,23.495000>}
box{<0,0,-0.127000><0.269408,0.035000,0.127000> rotate<0,44.997030,0> translate<2.921000,0.000000,23.685500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.111500,0.000000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.111500,0.000000,30.967500>}
box{<0,0,-0.152400><1.417500,0.035000,0.152400> rotate<0,-90.000000,0> translate<3.111500,0.000000,30.967500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.921000,-1.535000,36.131500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.111500,-1.535000,36.322000>}
box{<0,0,-0.127000><0.269408,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.921000,-1.535000,36.131500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,17.145000>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,44.997030,0> translate<1.270000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.413000,-1.535000,25.527000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,-1.535000,24.765000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<2.413000,-1.535000,25.527000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,0.000000,8.509000>}
box{<0,0,-0.127000><1.170882,0.035000,0.127000> rotate<0,-49.395445,0> translate<2.540000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.048000,-1.535000,8.509000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,-1.535000,8.509000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.048000,-1.535000,8.509000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.048000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,-1.535000,9.398000>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<3.048000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,0.000000,10.922000>}
box{<0,0,-0.127000><2.873682,0.035000,0.127000> rotate<0,-44.997030,0> translate<1.270000,0.000000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,0.000000,14.587800>}
box{<0,0,-0.127000><3.665800,0.035000,0.127000> rotate<0,90.000000,0> translate<3.302000,0.000000,14.587800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.921000,0.000000,26.225500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,0.000000,26.606500>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.921000,0.000000,26.225500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.365500,0.000000,27.876500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.393000,0.000000,28.094500>}
box{<0,0,-0.304800><0.219728,0.035000,0.304800> rotate<0,-82.804832,0> translate<3.365500,0.000000,27.876500> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.393000,0.000000,28.695000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.393000,0.000000,28.094500>}
box{<0,0,-0.304800><0.600500,0.035000,0.304800> rotate<0,-90.000000,0> translate<3.393000,0.000000,28.094500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.111500,0.000000,30.967500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.393000,0.000000,30.995000>}
box{<0,0,-0.152400><0.282840,0.035000,0.152400> rotate<0,-5.579206,0> translate<3.111500,0.000000,30.967500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.429000,0.000000,19.812000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,44.997030,0> translate<2.540000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.667000,-1.535000,24.257000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.429000,-1.535000,23.495000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<2.667000,-1.535000,24.257000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.429000,-1.535000,24.765000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.175000,-1.535000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.429000,0.000000,30.861000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.458000,0.000000,30.832000>}
box{<0,0,-0.127000><0.041012,0.035000,0.127000> rotate<0,44.997030,0> translate<3.429000,0.000000,30.861000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.556000,-1.535000,17.272000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,-44.997030,0> translate<2.540000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.556000,-1.535000,17.272000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.556000,-1.535000,18.161000>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,90.000000,0> translate<3.556000,-1.535000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.393000,0.000000,30.995000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.556000,0.000000,30.832000>}
box{<0,0,-0.152400><0.230517,0.035000,0.152400> rotate<0,44.997030,0> translate<3.393000,0.000000,30.995000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.458000,0.000000,30.832000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.556000,0.000000,30.832000>}
box{<0,0,-0.127000><0.098000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.458000,0.000000,30.832000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.048000,-1.535000,37.211000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.556000,-1.535000,37.211000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.048000,-1.535000,37.211000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.683000,-1.535000,9.398000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.302000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,-1.535000,26.606500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.683000,-1.535000,26.606500>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.302000,-1.535000,26.606500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.175000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.737894,0.000000,17.145000>}
box{<0,0,-0.127000><0.562894,0.035000,0.127000> rotate<0,0.000000,0> translate<3.175000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.683000,0.000000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.770000,0.000000,22.138000>}
box{<0,0,-0.127000><0.095755,0.035000,0.127000> rotate<0,-24.689929,0> translate<3.683000,0.000000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.540000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.810000,-1.535000,7.620000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<2.540000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.429000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.810000,-1.535000,24.384000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,44.997030,0> translate<3.429000,-1.535000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.794000,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.810000,-1.535000,38.354000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<2.794000,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.683000,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.937000,-1.535000,22.098000>}
box{<0,0,-0.127000><0.254000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.683000,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.810000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.937000,0.000000,24.384000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.810000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.111500,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.937000,-1.535000,36.322000>}
box{<0,0,-0.127000><0.825500,0.035000,0.127000> rotate<0,0.000000,0> translate<3.111500,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.973000,0.000000,38.853000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.973000,0.000000,40.358500>}
box{<0,0,-0.304800><1.505500,0.035000,0.304800> rotate<0,90.000000,0> translate<3.973000,0.000000,40.358500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.556000,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.046800,0.000000,18.161000>}
box{<0,0,-0.127000><0.490800,0.035000,0.127000> rotate<0,0.000000,0> translate<3.556000,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.730500,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.064000,0.000000,22.987000>}
box{<0,0,-0.127000><1.333500,0.035000,0.127000> rotate<0,0.000000,0> translate<2.730500,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.088000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.191000,-1.535000,6.453000>}
box{<0,0,-0.203200><0.145664,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.088000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.810000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.191000,-1.535000,8.001000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<3.810000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.683000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.191000,-1.535000,8.890000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<3.683000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.191000,-1.535000,8.001000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.191000,-1.535000,8.890000>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,90.000000,0> translate<4.191000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.683000,0.000000,20.828000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.191000,0.000000,20.320000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<3.683000,0.000000,20.828000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.064000,0.000000,22.987000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.191000,0.000000,22.860000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,44.997030,0> translate<4.064000,0.000000,22.987000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.111500,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.191000,0.000000,23.495000>}
box{<0,0,-0.127000><1.079500,0.035000,0.127000> rotate<0,0.000000,0> translate<3.111500,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.191000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.318000,0.000000,23.368000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,44.997030,0> translate<4.191000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.458000,0.000000,30.832000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.318000,0.000000,29.972000>}
box{<0,0,-0.127000><1.216224,0.035000,0.127000> rotate<0,44.997030,0> translate<3.458000,0.000000,30.832000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.318000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.318000,0.000000,29.972000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,90.000000,0> translate<4.318000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.683000,-1.535000,26.606500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.381500,-1.535000,27.305000>}
box{<0,0,-0.127000><0.987828,0.035000,0.127000> rotate<0,-44.997030,0> translate<3.683000,-1.535000,26.606500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.921000,-1.535000,32.131000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.381500,-1.535000,30.670500>}
box{<0,0,-0.127000><2.065459,0.035000,0.127000> rotate<0,44.997030,0> translate<2.921000,-1.535000,32.131000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.381500,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.381500,-1.535000,30.670500>}
box{<0,0,-0.127000><3.365500,0.035000,0.127000> rotate<0,90.000000,0> translate<4.381500,-1.535000,30.670500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.429000,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.445000,-1.535000,23.495000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.429000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.937000,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.445000,0.000000,23.876000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<3.937000,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.937000,-1.535000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.445000,-1.535000,36.830000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<3.937000,-1.535000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.556000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.445000,0.000000,37.211000>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,0.000000,0> translate<3.556000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.810000,-1.535000,38.354000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.445000,-1.535000,37.719000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<3.810000,-1.535000,38.354000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.445000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.445000,-1.535000,37.719000>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,90.000000,0> translate<4.445000,-1.535000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.973000,0.000000,40.358500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.572000,0.000000,40.957500>}
box{<0,0,-0.304800><0.847114,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.973000,0.000000,40.358500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.699000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.699000,0.000000,4.191000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,-90.000000,0> translate<4.699000,0.000000,4.191000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.699000,0.000000,4.191000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.749800,0.000000,4.140200>}
box{<0,0,-0.203200><0.071842,0.035000,0.203200> rotate<0,44.997030,0> translate<4.699000,0.000000,4.191000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.191000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.791500,0.000000,22.860000>}
box{<0,0,-0.127000><0.600500,0.035000,0.127000> rotate<0,0.000000,0> translate<4.191000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.191000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.791600,0.000000,20.320000>}
box{<0,0,-0.127000><0.600600,0.035000,0.127000> rotate<0,0.000000,0> translate<4.191000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.770000,0.000000,22.138000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.806456,0.000000,22.138006>}
box{<0,0,-0.127000><1.036456,0.035000,0.127000> rotate<0,-0.000345,0> translate<3.770000,0.000000,22.138000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.445000,-1.535000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.826000,-1.535000,23.876000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<4.445000,-1.535000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.127500,-1.535000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.826000,-1.535000,24.955500>}
box{<0,0,-0.127000><0.987828,0.035000,0.127000> rotate<0,44.997030,0> translate<4.127500,-1.535000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.826000,-1.535000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.826000,-1.535000,24.955500>}
box{<0,0,-0.127000><1.079500,0.035000,0.127000> rotate<0,90.000000,0> translate<4.826000,-1.535000,24.955500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.191000,-1.535000,6.453000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.953000,-1.535000,7.215000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.191000,-1.535000,6.453000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.953000,-1.535000,7.215000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.953000,-1.535000,10.623000>}
box{<0,0,-0.203200><3.408000,0.035000,0.203200> rotate<0,90.000000,0> translate<4.953000,-1.535000,10.623000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.953000,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.953000,-1.535000,30.784800>}
box{<0,0,-0.127000><3.479800,0.035000,0.127000> rotate<0,90.000000,0> translate<4.953000,-1.535000,30.784800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.318000,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.990600,0.000000,23.368000>}
box{<0,0,-0.127000><0.672600,0.035000,0.127000> rotate<0,0.000000,0> translate<4.318000,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.429000,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.990700,0.000000,19.812000>}
box{<0,0,-0.127000><1.561700,0.035000,0.127000> rotate<0,0.000000,0> translate<3.429000,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.318000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.016500,0.000000,27.241500>}
box{<0,0,-0.127000><0.987828,0.035000,0.127000> rotate<0,44.997030,0> translate<4.318000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.016500,0.000000,25.463500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.016500,0.000000,27.241500>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.016500,0.000000,27.241500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.791600,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.160009,0.000000,20.688438>}
box{<0,0,-0.127000><0.521029,0.035000,0.127000> rotate<0,-44.999217,0> translate<4.791600,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.791500,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.160009,0.000000,22.491559>}
box{<0,0,-0.127000><0.521102,0.035000,0.127000> rotate<0,44.991685,0> translate<4.791500,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.445000,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.189700,0.000000,23.876000>}
box{<0,0,-0.127000><0.744700,0.035000,0.127000> rotate<0,0.000000,0> translate<4.445000,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.699000,0.000000,4.699000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207000,0.000000,5.207000>}
box{<0,0,-0.203200><0.718420,0.035000,0.203200> rotate<0,-44.997030,0> translate<4.699000,0.000000,4.699000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.953000,-1.535000,10.623000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207000,-1.535000,10.750000>}
box{<0,0,-0.203200><0.283981,0.035000,0.203200> rotate<0,-26.563298,0> translate<4.953000,-1.535000,10.623000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207000,-1.535000,14.650000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207000,-1.535000,16.891000>}
box{<0,0,-0.203200><2.241000,0.035000,0.203200> rotate<0,90.000000,0> translate<5.207000,-1.535000,16.891000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.207000,-1.535000,37.973000>}
box{<0,0,-0.127000><5.567759,0.035000,0.127000> rotate<0,44.997030,0> translate<1.270000,-1.535000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.207000,0.000000,28.702000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.214000,0.000000,28.695000>}
box{<0,0,-0.127000><0.009899,0.035000,0.127000> rotate<0,44.997030,0> translate<5.207000,0.000000,28.702000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.214000,0.000000,28.695000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.243000,0.000000,28.695000>}
box{<0,0,-0.127000><0.029000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.214000,0.000000,28.695000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.232000,0.000000,28.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.243000,0.000000,28.695000>}
box{<0,0,-0.127000><0.015556,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.232000,0.000000,28.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.270500,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.270500,0.000000,12.890500>}
box{<0,0,-0.127000><1.079500,0.035000,0.127000> rotate<0,-90.000000,0> translate<5.270500,0.000000,12.890500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.270500,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.270500,0.000000,14.541500>}
box{<0,0,-0.127000><0.571500,0.035000,0.127000> rotate<0,90.000000,0> translate<5.270500,0.000000,14.541500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.806456,0.000000,21.041991>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.354500,0.000000,21.590000>}
box{<0,0,-0.152400><0.775027,0.035000,0.152400> rotate<0,-44.995233,0> translate<4.806456,0.000000,21.041991> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.127500,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.397500,0.000000,24.384000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<4.127500,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.388800,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.397500,0.000000,24.384000>}
box{<0,0,-0.127000><0.008700,0.035000,0.127000> rotate<0,0.000000,0> translate<5.388800,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<4.394000,-1.535000,34.163000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<5.461000,-1.535000,35.230000>}
box{<0,0,-0.508000><1.508966,0.035000,0.508000> rotate<0,-44.997030,0> translate<4.394000,-1.535000,34.163000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<5.461000,-1.535000,36.957000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<5.461000,-1.535000,35.230000>}
box{<0,0,-0.508000><1.727000,0.035000,0.508000> rotate<0,-90.000000,0> translate<5.461000,-1.535000,35.230000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.990700,0.000000,19.812000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.513562,0.000000,20.334884>}
box{<0,0,-0.127000><0.739455,0.035000,0.127000> rotate<0,-44.998229,0> translate<4.990700,0.000000,19.812000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.990600,0.000000,23.368000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.513562,0.000000,22.845113>}
box{<0,0,-0.127000><0.739528,0.035000,0.127000> rotate<0,44.992922,0> translate<4.990600,0.000000,23.368000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.524500,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.524500,0.000000,25.717500>}
box{<0,0,-0.127000><0.063500,0.035000,0.127000> rotate<0,90.000000,0> translate<5.524500,0.000000,25.717500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.232000,0.000000,28.684000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.524500,0.000000,28.366500>}
box{<0,0,-0.127000><0.431697,0.035000,0.127000> rotate<0,47.343750,0> translate<5.232000,0.000000,28.684000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.524500,0.000000,25.717500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.524500,0.000000,28.366500>}
box{<0,0,-0.127000><2.649000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.524500,0.000000,28.366500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.270500,0.000000,14.541500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,0.000000,14.859000>}
box{<0,0,-0.127000><0.449013,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.270500,0.000000,14.541500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.937000,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,-1.535000,23.749000>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<3.937000,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.016500,0.000000,25.463500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,0.000000,24.892000>}
box{<0,0,-0.127000><0.808223,0.035000,0.127000> rotate<0,44.997030,0> translate<5.016500,0.000000,25.463500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.953000,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,-1.535000,26.670000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<4.953000,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,-1.535000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,-1.535000,26.670000>}
box{<0,0,-0.127000><2.921000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.588000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.243000,0.000000,28.695000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.588000,0.000000,29.040000>}
box{<0,0,-0.152400><0.487904,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.243000,0.000000,28.695000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.588000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.588000,0.000000,29.040000>}
box{<0,0,-0.152400><0.043000,0.035000,0.152400> rotate<0,-90.000000,0> translate<5.588000,0.000000,29.040000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.461000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.622000,0.000000,35.560000>}
box{<0,0,-0.127000><0.161000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.461000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.622000,0.000000,35.560000>}
box{<0,0,-0.127000><0.034000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.588000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.048000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,-1.535000,18.542000>}
box{<0,0,-0.127000><3.771708,0.035000,0.127000> rotate<0,-44.997030,0> translate<3.048000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,-1.535000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,-1.535000,19.685000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,90.000000,0> translate<5.715000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.524500,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.787000,0.000000,25.400000>}
box{<0,0,-0.127000><0.365270,0.035000,0.127000> rotate<0,44.054265,0> translate<5.524500,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.046800,0.000000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.867116,0.000000,19.981331>}
box{<0,0,-0.127000><2.574326,0.035000,0.127000> rotate<0,-44.997276,0> translate<4.046800,0.000000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.189700,0.000000,23.876000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.867116,0.000000,23.198666>}
box{<0,0,-0.127000><0.957953,0.035000,0.127000> rotate<0,44.993594,0> translate<5.189700,0.000000,23.876000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.461000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.905500,0.000000,35.115500>}
box{<0,0,-0.127000><0.628618,0.035000,0.127000> rotate<0,44.997030,0> translate<5.461000,0.000000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.445000,0.000000,37.211000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.960000,0.000000,38.726000>}
box{<0,0,-0.127000><2.142534,0.035000,0.127000> rotate<0,-44.997030,0> translate<4.445000,0.000000,37.211000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.032500,0.000000,25.844500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.032500,0.000000,27.495500>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.032500,0.000000,27.495500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.622000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.066500,0.000000,34.099500>}
box{<0,0,-0.127000><0.628618,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.622000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.088000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.096000,-1.535000,6.350000>}
box{<0,0,-0.203200><2.008000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.088000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.588000,0.000000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.159500,0.000000,29.654500>}
box{<0,0,-0.152400><0.808223,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.588000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.159500,0.000000,29.654500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.159500,0.000000,29.718000>}
box{<0,0,-0.152400><0.063500,0.035000,0.152400> rotate<0,90.000000,0> translate<6.159500,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.737894,0.000000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.220672,0.000000,19.627778>}
box{<0,0,-0.127000><3.511178,0.035000,0.127000> rotate<0,-44.997030,0> translate<3.737894,0.000000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.388800,0.000000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.220672,0.000000,23.552219>}
box{<0,0,-0.127000><1.176380,0.035000,0.127000> rotate<0,44.993909,0> translate<5.388800,0.000000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.223000,0.000000,3.048000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,2.931159>}
box{<0,0,-0.203200><0.172571,0.035000,0.203200> rotate<0,42.611396,0> translate<6.223000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.096000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,6.096000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<6.096000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,0.000000,16.928700>}
box{<0,0,-0.127000><0.545700,0.035000,0.127000> rotate<0,90.000000,0> translate<6.350000,0.000000,16.928700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<4.953000,-1.535000,30.784800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.362700,-1.535000,32.194500>}
box{<0,0,-0.127000><1.993617,0.035000,0.127000> rotate<0,-44.997030,0> translate<4.953000,-1.535000,30.784800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.749800,0.000000,4.140200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.400800,0.000000,4.140200>}
box{<0,0,-0.203200><1.651000,0.035000,0.203200> rotate<0,0.000000,0> translate<4.749800,0.000000,4.140200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,2.931159>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.477000,0.000000,3.048000>}
box{<0,0,-0.203200><0.172571,0.035000,0.203200> rotate<0,-42.611396,0> translate<6.350000,0.000000,2.931159> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.477000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.477000,0.000000,3.048000>}
box{<0,0,-0.203200><2.159000,0.035000,0.203200> rotate<0,-90.000000,0> translate<6.477000,0.000000,3.048000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207000,0.000000,5.207000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.477000,0.000000,5.207000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.207000,0.000000,5.207000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,0.000000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,0.000000,14.859000>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.588000,0.000000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.207000,-1.535000,16.891000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.477000,-1.535000,18.161000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<5.207000,-1.535000,16.891000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.477000,-1.535000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.477000,-1.535000,19.473200>}
box{<0,0,-0.203200><1.312200,0.035000,0.203200> rotate<0,90.000000,0> translate<6.477000,-1.535000,19.473200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.032500,0.000000,27.495500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,0.000000,27.940000>}
box{<0,0,-0.127000><0.628618,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.032500,0.000000,27.495500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,0.000000,28.448000>}
box{<0,0,-0.127000><0.508000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.477000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.207000,-1.535000,37.973000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,-1.535000,37.973000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.207000,-1.535000,37.973000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.540500,0.000000,26.098500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.540500,0.000000,27.241500>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.540500,0.000000,27.241500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<1.270000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.574225,0.000000,19.274225>}
box{<0,0,-0.127000><7.501307,0.035000,0.127000> rotate<0,-44.997030,0> translate<1.270000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.588000,0.000000,24.892000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.574225,0.000000,23.905772>}
box{<0,0,-0.127000><1.394735,0.035000,0.127000> rotate<0,44.997121,0> translate<5.588000,0.000000,24.892000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.032500,0.000000,25.844500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.604000,0.000000,25.273000>}
box{<0,0,-0.127000><0.808223,0.035000,0.127000> rotate<0,44.997030,0> translate<6.032500,0.000000,25.844500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.362700,-1.535000,32.194500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.718300,-1.535000,32.194500>}
box{<0,0,-0.127000><0.355600,0.035000,0.127000> rotate<0,0.000000,0> translate<6.362700,-1.535000,32.194500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.604000,-1.535000,19.621500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.829300,-1.535000,19.835500>}
box{<0,0,-0.203200><0.310735,0.035000,0.203200> rotate<0,-43.523648,0> translate<6.604000,-1.535000,19.621500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.350000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,0.000000,6.096000>}
box{<0,0,-0.203200><0.508000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.350000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.270500,0.000000,12.890500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,0.000000,11.303000>}
box{<0,0,-0.127000><2.245064,0.035000,0.127000> rotate<0,44.997030,0> translate<5.270500,0.000000,12.890500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.540500,0.000000,26.098500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,0.000000,25.781000>}
box{<0,0,-0.127000><0.449013,0.035000,0.127000> rotate<0,44.997030,0> translate<6.540500,0.000000,26.098500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,-1.535000,43.991000>}
box{<0,0,-0.127000><0.303000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.858000,-1.535000,43.991000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,-1.535000,43.991000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,-1.535000,44.069000>}
box{<0,0,-0.127000><0.078000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.858000,-1.535000,44.069000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<2.667000,0.000000,14.659900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.927778,0.000000,18.920672>}
box{<0,0,-0.127000><6.025646,0.035000,0.127000> rotate<0,-44.996988,0> translate<2.667000,0.000000,14.659900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.787000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.927778,0.000000,24.259325>}
box{<0,0,-0.127000><1.613231,0.035000,0.127000> rotate<0,44.994440,0> translate<5.787000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.718300,0.000000,32.194500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,32.461200>}
box{<0,0,-0.127000><0.377171,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.718300,0.000000,32.194500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,33.210500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,32.461200>}
box{<0,0,-0.127000><0.749300,0.035000,0.127000> rotate<0,-90.000000,0> translate<6.985000,0.000000,32.461200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.066500,0.000000,34.099500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,34.099500>}
box{<0,0,-0.127000><0.918500,0.035000,0.127000> rotate<0,0.000000,0> translate<6.066500,0.000000,34.099500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.905500,0.000000,35.115500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,35.115500>}
box{<0,0,-0.127000><1.079500,0.035000,0.127000> rotate<0,0.000000,0> translate<5.905500,0.000000,35.115500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,0.000000,36.004500>}
box{<0,0,-0.127000><1.460500,0.035000,0.127000> rotate<0,-90.000000,0> translate<6.985000,0.000000,36.004500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,-1.535000,37.973000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,-1.535000,37.465000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<6.477000,-1.535000,37.973000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,-1.535000,37.465000>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,90.000000,0> translate<6.985000,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.477000,-1.535000,19.473200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.029600,-1.535000,20.025800>}
box{<0,0,-0.203200><0.781494,0.035000,0.203200> rotate<0,-44.997030,0> translate<6.477000,-1.535000,19.473200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.829300,-1.535000,19.835500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.029600,-1.535000,20.025800>}
box{<0,0,-0.203200><0.276286,0.035000,0.203200> rotate<0,-43.530581,0> translate<6.829300,-1.535000,19.835500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,-1.535000,40.591000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.063000,-1.535000,40.591000>}
box{<0,0,-0.203200><0.205000,0.035000,0.203200> rotate<0,0.000000,0> translate<6.858000,-1.535000,40.591000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.239000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.239000,-1.535000,19.304000>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,90.000000,0> translate<7.239000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<3.302000,0.000000,14.587800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.281331,0.000000,18.567116>}
box{<0,0,-0.127000><5.627613,0.035000,0.127000> rotate<0,-44.996918,0> translate<3.302000,0.000000,14.587800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.477000,0.000000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,0.000000,15.621000>}
box{<0,0,-0.127000><1.170882,0.035000,0.127000> rotate<0,-40.598615,0> translate<6.477000,0.000000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,0.000000,17.237600>}
box{<0,0,-0.127000><1.616600,0.035000,0.127000> rotate<0,90.000000,0> translate<7.366000,0.000000,17.237600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.604000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,0.000000,25.273000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.604000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,0.000000,42.418000>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,90.000000,0> translate<7.366000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.715000,-1.535000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.493000,-1.535000,21.463000>}
box{<0,0,-0.127000><2.514472,0.035000,0.127000> rotate<0,-44.997030,0> translate<5.715000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.493000,0.000000,26.733500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.493000,0.000000,26.522400>}
box{<0,0,-0.127000><0.211100,0.035000,0.127000> rotate<0,-90.000000,0> translate<7.493000,0.000000,26.522400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.493000,-1.535000,21.463000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.493000,-1.535000,26.733500>}
box{<0,0,-0.127000><5.270500,0.035000,0.127000> rotate<0,90.000000,0> translate<7.493000,-1.535000,26.733500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.527300,0.000000,25.781000>}
box{<0,0,-0.127000><0.669300,0.035000,0.127000> rotate<0,0.000000,0> translate<6.858000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.569200,0.000000,5.384800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.569200,0.000000,4.140200>}
box{<0,0,-0.203200><1.244600,0.035000,0.203200> rotate<0,-90.000000,0> translate<7.569200,0.000000,4.140200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,0.000000,6.096000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.569200,0.000000,5.384800>}
box{<0,0,-0.203200><1.005789,0.035000,0.203200> rotate<0,44.997030,0> translate<6.858000,0.000000,6.096000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.350000,0.000000,16.928700>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.634884,0.000000,18.213563>}
box{<0,0,-0.127000><1.817085,0.035000,0.127000> rotate<0,-44.996542,0> translate<6.350000,0.000000,16.928700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,0.000000,25.273000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.634884,0.000000,24.966434>}
box{<0,0,-0.127000><0.407776,0.035000,0.127000> rotate<0,48.743240,0> translate<7.366000,0.000000,25.273000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.477000,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.683500,-1.535000,28.448000>}
box{<0,0,-0.203200><1.206500,0.035000,0.203200> rotate<0,0.000000,0> translate<6.477000,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.690000,-1.535000,10.501000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.690000,-1.535000,9.455000>}
box{<0,0,-0.152400><1.046000,0.035000,0.152400> rotate<0,-90.000000,0> translate<7.690000,-1.535000,9.455000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.690000,-1.535000,11.851000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,11.908000>}
box{<0,0,-0.127000><0.080610,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.690000,-1.535000,11.851000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.239000,-1.535000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,15.748000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<7.239000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,11.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,15.748000>}
box{<0,0,-0.127000><3.840000,0.035000,0.127000> rotate<0,90.000000,0> translate<7.747000,-1.535000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.540500,0.000000,27.241500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,0.000000,28.448000>}
box{<0,0,-0.127000><1.706249,0.035000,0.127000> rotate<0,-44.997030,0> translate<6.540500,0.000000,27.241500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,0.000000,31.115000>}
box{<0,0,-0.127000><2.667000,0.035000,0.127000> rotate<0,90.000000,0> translate<7.747000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.985000,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,33.020000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<6.985000,-1.535000,33.782000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,33.020000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,90.000000,0> translate<7.747000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.840000,-1.535000,1.416000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.840000,-1.535000,2.921000>}
box{<0,0,-0.152400><1.505000,0.035000,0.152400> rotate<0,90.000000,0> translate<7.840000,-1.535000,2.921000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.159500,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.840000,0.000000,13.970000>}
box{<0,0,-0.127000><1.680500,0.035000,0.127000> rotate<0,0.000000,0> translate<6.159500,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,0.000000,17.038500>}
box{<0,0,-0.127000><1.290500,0.035000,0.127000> rotate<0,90.000000,0> translate<7.874000,0.000000,17.038500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,-1.535000,19.050000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<7.874000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,0.000000,17.237600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.988438,0.000000,17.860009>}
box{<0,0,-0.127000><0.880240,0.035000,0.127000> rotate<0,-44.995736,0> translate<7.366000,0.000000,17.237600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.527300,0.000000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.988438,0.000000,25.319987>}
box{<0,0,-0.127000><0.652059,0.035000,0.127000> rotate<0,44.989264,0> translate<7.527300,0.000000,25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,-1.535000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.001000,-1.535000,6.223000>}
box{<0,0,-0.203200><1.616446,0.035000,0.203200> rotate<0,44.997030,0> translate<6.858000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<6.858000,0.000000,7.366000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.229600,0.000000,5.994400>}
box{<0,0,-0.203200><1.939735,0.035000,0.203200> rotate<0,44.997030,0> translate<6.858000,0.000000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.229600,0.000000,4.140200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.229600,0.000000,5.994400>}
box{<0,0,-0.203200><1.854200,0.035000,0.203200> rotate<0,90.000000,0> translate<8.229600,0.000000,5.994400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,0.000000,30.226000>}
box{<0,0,-0.127000><3.048000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.255000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.063000,-1.535000,40.591000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.255000,-1.535000,41.783000>}
box{<0,0,-0.203200><1.685743,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.063000,-1.535000,40.591000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,0.000000,17.038500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.341991,0.000000,17.506456>}
box{<0,0,-0.127000><0.661814,0.035000,0.127000> rotate<0,-44.994926,0> translate<7.874000,0.000000,17.038500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.493000,0.000000,26.522400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.341991,0.000000,25.673541>}
box{<0,0,-0.127000><1.200561,0.035000,0.127000> rotate<0,44.992601,0> translate<7.493000,0.000000,26.522400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.382000,-1.535000,16.002000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<7.874000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.382000,-1.535000,11.959000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.382000,-1.535000,16.002000>}
box{<0,0,-0.127000><4.043000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.382000,-1.535000,16.002000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.382000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.382000,0.000000,38.853000>}
box{<0,0,-0.127000><0.009000,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.382000,0.000000,38.853000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.840000,-1.535000,1.416000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.445500,-1.535000,1.016000>}
box{<0,0,-0.152400><0.725693,0.035000,0.152400> rotate<0,33.446985,0> translate<7.840000,-1.535000,1.416000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.445500,0.000000,38.825500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.445500,0.000000,38.925500>}
box{<0,0,-0.127000><0.100000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.445500,0.000000,38.925500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.445500,0.000000,38.925500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.771000>}
box{<0,0,-0.127000><0.156928,0.035000,0.127000> rotate<0,79.902146,0> translate<8.445500,0.000000,38.925500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.219000,0.000000,39.107000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.853000>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<8.219000,0.000000,39.107000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.445500,0.000000,38.825500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.853000>}
box{<0,0,-0.127000><0.038891,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.445500,0.000000,38.825500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.771000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.853000>}
box{<0,0,-0.127000><0.082000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.473000,0.000000,38.853000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.853000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.898000>}
box{<0,0,-0.127000><0.045000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.473000,0.000000,38.898000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.490000,-1.535000,10.501000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.490000,-1.535000,9.652000>}
box{<0,0,-0.127000><0.849000,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.490000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.382000,-1.535000,11.959000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.490000,-1.535000,11.851000>}
box{<0,0,-0.127000><0.152735,0.035000,0.127000> rotate<0,44.997030,0> translate<8.382000,-1.535000,11.959000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<5.960000,0.000000,38.726000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,38.726000>}
box{<0,0,-0.127000><2.549000,0.035000,0.127000> rotate<0,0.000000,0> translate<5.960000,0.000000,38.726000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.382000,0.000000,38.853000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,38.726000>}
box{<0,0,-0.127000><0.179605,0.035000,0.127000> rotate<0,44.997030,0> translate<8.382000,0.000000,38.853000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,38.735000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,0.000000,0> translate<7.366000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.771000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,38.735000>}
box{<0,0,-0.127000><0.050912,0.035000,0.127000> rotate<0,44.997030,0> translate<8.473000,0.000000,38.771000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.853000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,38.817000>}
box{<0,0,-0.127000><0.050912,0.035000,0.127000> rotate<0,44.997030,0> translate<8.473000,0.000000,38.853000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.382000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,38.862000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.382000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.898000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,38.862000>}
box{<0,0,-0.127000><0.050912,0.035000,0.127000> rotate<0,44.997030,0> translate<8.473000,0.000000,38.898000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,38.862000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.509000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,44.704000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.509000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.610600,-1.535000,31.394400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.610600,-1.535000,31.851600>}
box{<0,0,-0.127000><0.457200,0.035000,0.127000> rotate<0,90.000000,0> translate<8.610600,-1.535000,31.851600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,0.000000,32.004000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.747000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.610600,-1.535000,31.851600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,-1.535000,32.004000>}
box{<0,0,-0.127000><0.154502,0.035000,0.127000> rotate<0,-80.532363,0> translate<8.610600,-1.535000,31.851600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,0.000000,38.735000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.509000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,0.000000,38.853000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,0.000000,38.735000>}
box{<0,0,-0.127000><0.118000,0.035000,0.127000> rotate<0,-90.000000,0> translate<8.636000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.853000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,0.000000,38.853000>}
box{<0,0,-0.127000><0.163000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.473000,0.000000,38.853000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,-1.535000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,-1.535000,43.688000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.858000,-1.535000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.366000,0.000000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,0.000000,43.688000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.366000,0.000000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,43.688000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,0.000000,43.688000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<8.509000,0.000000,43.688000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.763000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.763000,0.000000,29.972000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.763000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,6.858000>}
box{<0,0,-0.203200><1.077631,0.035000,0.203200> rotate<0,44.997030,0> translate<8.128000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,4.140200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,6.858000>}
box{<0,0,-0.203200><2.717800,0.035000,0.203200> rotate<0,90.000000,0> translate<8.890000,0.000000,6.858000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,0.000000,15.748000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,0.000000,14.732000>}
box{<0,0,-0.127000><1.436841,0.035000,0.127000> rotate<0,44.997030,0> translate<7.874000,0.000000,15.748000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,0.000000,14.732000>}
box{<0,0,-0.127000><1.524000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.890000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.354500,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,21.590000>}
box{<0,0,-0.152400><3.535500,0.035000,0.152400> rotate<0,0.000000,0> translate<5.354500,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,18.761500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,21.590000>}
box{<0,0,-0.152400><2.828500,0.035000,0.152400> rotate<0,90.000000,0> translate<8.890000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.281331,0.000000,24.612881>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,23.004100>}
box{<0,0,-0.152400><2.275081,0.035000,0.152400> rotate<0,44.999033,0> translate<7.281331,0.000000,24.612881> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,23.004100>}
box{<0,0,-0.152400><1.414100,0.035000,0.152400> rotate<0,90.000000,0> translate<8.890000,0.000000,23.004100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,0.000000,24.511000>}
box{<0,0,-0.127000><2.921000,0.035000,0.127000> rotate<0,90.000000,0> translate<8.890000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.683500,-1.535000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,-1.535000,27.241500>}
box{<0,0,-0.203200><1.706249,0.035000,0.203200> rotate<0,44.997030,0> translate<7.683500,-1.535000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.001000,-1.535000,6.223000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.033000,-1.535000,6.223000>}
box{<0,0,-0.203200><1.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.001000,-1.535000,6.223000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.033000,-1.535000,6.223000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.033000,-1.535000,6.366000>}
box{<0,0,-0.127000><0.143000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.033000,-1.535000,6.366000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.128000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.033000,-1.535000,7.874000>}
box{<0,0,-0.203200><0.939969,0.035000,0.203200> rotate<0,-15.676430,0> translate<8.128000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.255000,-1.535000,41.783000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.080500,-1.535000,41.783000>}
box{<0,0,-0.203200><0.825500,0.035000,0.203200> rotate<0,0.000000,0> translate<8.255000,-1.535000,41.783000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.033000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,7.874000>}
box{<0,0,-0.203200><0.111000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.033000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.890000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.144000,0.000000,12.954000>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<8.890000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.029600,-1.535000,20.025800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,22.034500>}
box{<0,0,-0.203200><2.916430,0.035000,0.203200> rotate<0,-43.528611,0> translate<7.029600,-1.535000,20.025800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,22.034500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,22.606000>}
box{<0,0,-0.203200><0.571500,0.035000,0.203200> rotate<0,90.000000,0> translate<9.144000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.636000,0.000000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.144000,0.000000,32.512000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.636000,0.000000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.473000,0.000000,38.853000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.144000,0.000000,38.182000>}
box{<0,0,-0.127000><0.948937,0.035000,0.127000> rotate<0,44.997030,0> translate<8.473000,0.000000,38.853000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.144000,0.000000,32.512000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.144000,0.000000,38.182000>}
box{<0,0,-0.127000><5.670000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.144000,0.000000,38.182000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.490000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.252000,-1.535000,8.890000>}
box{<0,0,-0.127000><1.077631,0.035000,0.127000> rotate<0,44.997030,0> translate<8.490000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.445500,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,-1.535000,2.921000>}
box{<0,0,-0.127000><1.622670,0.035000,0.127000> rotate<0,59.416852,0> translate<8.445500,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.690000,-1.535000,9.455000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.271000,-1.535000,7.874000>}
box{<0,0,-0.152400><2.235872,0.035000,0.152400> rotate<0,44.997030,0> translate<7.690000,-1.535000,9.455000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.144000,-1.535000,7.874000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.271000,-1.535000,7.874000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,0.000000,0> translate<9.144000,-1.535000,7.874000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,0.000000,29.718000>}
box{<0,0,-0.127000><2.032000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.271000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.747000,-1.535000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.461500,-1.535000,29.527500>}
box{<0,0,-0.127000><2.424669,0.035000,0.127000> rotate<0,44.997030,0> translate<7.747000,-1.535000,31.242000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.438006,0.000000,25.673541>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.525000,0.000000,25.760500>}
box{<0,0,-0.127000><0.123003,0.035000,0.127000> rotate<0,-44.985709,0> translate<9.438006,0.000000,25.673541> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,0.000000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.525000,0.000000,25.908000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<8.255000,0.000000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.525000,0.000000,25.760500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.525000,0.000000,25.908000>}
box{<0,0,-0.127000><0.147500,0.035000,0.127000> rotate<0,90.000000,0> translate<9.525000,0.000000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.610600,-1.535000,31.394400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.525000,-1.535000,30.480000>}
box{<0,0,-0.127000><1.293157,0.035000,0.127000> rotate<0,44.997030,0> translate<8.610600,-1.535000,31.394400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.252000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,-1.535000,8.890000>}
box{<0,0,-0.127000><0.400000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.252000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.255000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,0.000000,31.623000>}
box{<0,0,-0.127000><1.975656,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.255000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,0.000000,31.623000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,0.000000,43.307000>}
box{<0,0,-0.127000><11.684000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.652000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.779000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.779000,0.000000,28.956000>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.779000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.080500,-1.535000,41.783000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.779000,-1.535000,41.084500>}
box{<0,0,-0.203200><0.987828,0.035000,0.203200> rotate<0,44.997030,0> translate<9.080500,-1.535000,41.783000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.890000,0.000000,18.761500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.791559,0.000000,17.860009>}
box{<0,0,-0.152400><1.274949,0.035000,0.152400> rotate<0,44.994846,0> translate<8.890000,0.000000,18.761500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.334500,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.906000,-1.535000,4.318000>}
box{<0,0,-0.152400><0.571500,0.035000,0.152400> rotate<0,0.000000,0> translate<9.334500,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.239000,-1.535000,19.304000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,21.971000>}
box{<0,0,-0.127000><3.771708,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.239000,-1.535000,19.304000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,21.971000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,22.352000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,90.000000,0> translate<9.906000,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,-1.535000,2.921000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.940000,-1.535000,2.921000>}
box{<0,0,-0.127000><0.669000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.271000,-1.535000,2.921000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.940000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.940000,0.000000,14.766000>}
box{<0,0,-0.152400><0.796000,0.035000,0.152400> rotate<0,90.000000,0> translate<9.940000,0.000000,14.766000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.953500,-1.535000,5.207000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.969500,-1.535000,5.207000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<8.953500,-1.535000,5.207000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.033000,-1.535000,6.366000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.033000,-1.535000,7.366000>}
box{<0,0,-0.127000><1.414214,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.033000,-1.535000,6.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.033000,-1.535000,8.509000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.033000,-1.535000,7.366000>}
box{<0,0,-0.127000><1.143000,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.033000,-1.535000,7.366000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,-1.535000,8.890000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.033000,-1.535000,8.509000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,44.997030,0> translate<9.652000,-1.535000,8.890000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,-1.535000,16.256000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,90.000000,0> translate<10.033000,-1.535000,16.256000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.438006,0.000000,17.506456>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.033000,0.000000,16.911400>}
box{<0,0,-0.127000><0.841492,0.035000,0.127000> rotate<0,45.000039,0> translate<9.438006,0.000000,17.506456> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.033000,0.000000,16.256000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.033000,0.000000,16.911400>}
box{<0,0,-0.127000><0.655400,0.035000,0.127000> rotate<0,90.000000,0> translate<10.033000,0.000000,16.911400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.791559,0.000000,25.319987>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.109200,0.000000,25.663000>}
box{<0,0,-0.127000><0.467497,0.035000,0.127000> rotate<0,-47.196205,0> translate<9.791559,0.000000,25.319987> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.763000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.109200,0.000000,26.085800>}
box{<0,0,-0.127000><1.903814,0.035000,0.127000> rotate<0,44.997030,0> translate<8.763000,0.000000,27.432000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.109200,0.000000,25.663000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.109200,0.000000,26.085800>}
box{<0,0,-0.127000><0.422800,0.035000,0.127000> rotate<0,90.000000,0> translate<10.109200,0.000000,26.085800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.763000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.223500,0.000000,31.432500>}
box{<0,0,-0.127000><2.065459,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.763000,0.000000,29.972000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.223500,0.000000,31.432500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.223500,0.000000,42.164000>}
box{<0,0,-0.127000><10.731500,0.035000,0.127000> rotate<0,90.000000,0> translate<10.223500,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.461500,-1.535000,29.527500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.350500,-1.535000,29.527500>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.461500,-1.535000,29.527500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.779000,0.000000,28.956000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.350500,0.000000,29.527500>}
box{<0,0,-0.127000><0.808223,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.779000,0.000000,28.956000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.334500,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.541000,-1.535000,1.016000>}
box{<0,0,-0.152400><1.206500,0.035000,0.152400> rotate<0,0.000000,0> translate<9.334500,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.906000,-1.535000,4.318000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.541000,-1.535000,4.953000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<9.906000,-1.535000,4.318000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<7.874000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.541000,-1.535000,21.717000>}
box{<0,0,-0.127000><3.771708,0.035000,0.127000> rotate<0,-44.997030,0> translate<7.874000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.541000,-1.535000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.541000,-1.535000,22.098000>}
box{<0,0,-0.127000><0.381000,0.035000,0.127000> rotate<0,90.000000,0> translate<10.541000,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.145112,0.000000,24.966434>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.591800,0.000000,25.413100>}
box{<0,0,-0.127000><0.631696,0.035000,0.127000> rotate<0,-44.995627,0> translate<10.145112,0.000000,24.966434> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,0.000000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.591800,0.000000,26.339800>}
box{<0,0,-0.127000><1.885939,0.035000,0.127000> rotate<0,45.542652,0> translate<9.271000,0.000000,27.686000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.591800,0.000000,25.413100>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.591800,0.000000,26.339800>}
box{<0,0,-0.127000><0.926700,0.035000,0.127000> rotate<0,90.000000,0> translate<10.591800,0.000000,26.339800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<8.191500,-1.535000,34.163000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<10.591800,-1.535000,34.163000>}
box{<0,0,-0.406400><2.400300,0.035000,0.406400> rotate<0,0.000000,0> translate<8.191500,-1.535000,34.163000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.664809,-1.535000,25.460306>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.664809,-1.535000,25.339691>}
box{<0,0,-0.152400><0.120616,0.035000,0.152400> rotate<0,-90.000000,0> translate<10.664809,-1.535000,25.339691> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.144000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.795000,0.000000,12.954000>}
box{<0,0,-0.127000><1.651000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.144000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.271000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.795000,0.000000,31.242000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.271000,0.000000,29.718000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.795000,0.000000,31.242000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.795000,0.000000,36.322000>}
box{<0,0,-0.127000><5.080000,0.035000,0.127000> rotate<0,90.000000,0> translate<10.795000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.652000,0.000000,43.307000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.795000,0.000000,44.450000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.652000,0.000000,43.307000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<8.509000,0.000000,44.704000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.795000,0.000000,46.990000>}
box{<0,0,-0.127000><3.232892,0.035000,0.127000> rotate<0,-44.997030,0> translate<8.509000,0.000000,44.704000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.858500,0.000000,28.321000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.858500,0.000000,27.749500>}
box{<0,0,-0.127000><0.571500,0.035000,0.127000> rotate<0,-90.000000,0> translate<10.858500,0.000000,27.749500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.795000,-1.535000,27.241500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.858500,-1.535000,28.321000>}
box{<0,0,-0.203200><1.081366,0.035000,0.203200> rotate<0,-86.627822,0> translate<10.795000,-1.535000,27.241500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.820400,-1.535000,28.422600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.858500,-1.535000,28.321000>}
box{<0,0,-0.203200><0.108509,0.035000,0.203200> rotate<0,69.439372,0> translate<10.820400,-1.535000,28.422600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.820400,-1.535000,28.422600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.896600,-1.535000,28.422600>}
box{<0,0,-0.203200><0.076200,0.035000,0.203200> rotate<0,0.000000,0> translate<10.820400,-1.535000,28.422600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.779000,-1.535000,41.084500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.985500,-1.535000,41.084500>}
box{<0,0,-0.203200><1.206500,0.035000,0.203200> rotate<0,0.000000,0> translate<9.779000,-1.535000,41.084500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.969500,-1.535000,5.207000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.049000,-1.535000,6.286500>}
box{<0,0,-0.203200><1.526644,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.969500,-1.535000,5.207000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.795000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.049000,0.000000,13.208000>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.795000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.791559,0.000000,17.860009>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.049000,0.000000,16.602500>}
box{<0,0,-0.152400><1.778338,0.035000,0.152400> rotate<0,44.998596,0> translate<9.791559,0.000000,17.860009> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.049000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.049000,0.000000,16.602500>}
box{<0,0,-0.152400><0.727500,0.035000,0.152400> rotate<0,90.000000,0> translate<11.049000,0.000000,16.602500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.498666,0.000000,24.612881>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.074400,0.000000,25.188600>}
box{<0,0,-0.127000><0.814200,0.035000,0.127000> rotate<0,-44.996253,0> translate<10.498666,0.000000,24.612881> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.779000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.074400,0.000000,26.644600>}
box{<0,0,-0.127000><1.831972,0.035000,0.127000> rotate<0,44.997030,0> translate<9.779000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.074400,0.000000,25.188600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.074400,0.000000,26.644600>}
box{<0,0,-0.127000><1.456000,0.035000,0.127000> rotate<0,90.000000,0> translate<11.074400,0.000000,26.644600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.144000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.271250,-1.535000,24.733250>}
box{<0,0,-0.203200><3.008386,0.035000,0.203200> rotate<0,-44.997030,0> translate<9.144000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.664809,-1.535000,25.339691>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.271250,-1.535000,24.733250>}
box{<0,0,-0.152400><0.857637,0.035000,0.152400> rotate<0,44.997030,0> translate<10.664809,-1.535000,25.339691> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.591800,-1.535000,31.851600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.341100,-1.535000,31.851600>}
box{<0,0,-0.304800><0.749300,0.035000,0.304800> rotate<0,0.000000,0> translate<10.591800,-1.535000,31.851600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.341100,-1.535000,31.851600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.341100,-1.535000,32.423100>}
box{<0,0,-0.304800><0.571500,0.035000,0.304800> rotate<0,90.000000,0> translate<11.341100,-1.535000,32.423100> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.379200,0.000000,2.895600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.379200,0.000000,4.140200>}
box{<0,0,-0.203200><1.244600,0.035000,0.203200> rotate<0,90.000000,0> translate<11.379200,0.000000,4.140200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.303000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.379200,0.000000,5.384800>}
box{<0,0,-0.203200><0.107763,0.035000,0.203200> rotate<0,44.997030,0> translate<11.303000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.379200,0.000000,4.140200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.379200,0.000000,5.384800>}
box{<0,0,-0.203200><1.244600,0.035000,0.203200> rotate<0,90.000000,0> translate<11.379200,0.000000,5.384800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.541000,-1.535000,1.016000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,1.905000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,-44.997030,0> translate<10.541000,-1.535000,1.016000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,1.905000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,2.540000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<11.430000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.379200,0.000000,4.140200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,4.191000>}
box{<0,0,-0.203200><0.071842,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.379200,0.000000,4.140200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.985500,-1.535000,41.084500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,-1.535000,40.640000>}
box{<0,0,-0.203200><0.628618,0.035000,0.203200> rotate<0,44.997030,0> translate<10.985500,-1.535000,41.084500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.223500,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.430000,0.000000,43.180000>}
box{<0,0,-0.127000><1.577307,0.035000,0.127000> rotate<0,-40.098261,0> translate<10.223500,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.049000,0.000000,13.208000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.557000,0.000000,13.731000>}
box{<0,0,-0.127000><0.729104,0.035000,0.127000> rotate<0,-45.830512,0> translate<11.049000,0.000000,13.208000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.852219,0.000000,24.259325>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.557000,0.000000,24.964100>}
box{<0,0,-0.127000><0.996707,0.035000,0.127000> rotate<0,-44.996776,0> translate<10.852219,0.000000,24.259325> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.557000,0.000000,27.051000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.557000,0.000000,24.964100>}
box{<0,0,-0.127000><2.086900,0.035000,0.127000> rotate<0,-90.000000,0> translate<11.557000,0.000000,24.964100> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.858500,0.000000,27.749500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.557000,0.000000,27.051000>}
box{<0,0,-0.127000><0.987828,0.035000,0.127000> rotate<0,44.997030,0> translate<10.858500,0.000000,27.749500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.557000,0.000000,13.731000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.620500,0.000000,13.970000>}
box{<0,0,-0.127000><0.247292,0.035000,0.127000> rotate<0,-75.115861,0> translate<11.557000,0.000000,13.731000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.684000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.718425,0.000000,21.590000>}
box{<0,0,-0.152400><0.034425,0.035000,0.152400> rotate<0,0.000000,0> translate<11.684000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,-1.535000,2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.811000,-1.535000,2.921000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,-44.997030,0> translate<11.430000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<6.858000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.811000,0.000000,11.303000>}
box{<0,0,-0.127000><4.953000,0.035000,0.127000> rotate<0,0.000000,0> translate<6.858000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.033000,-1.535000,14.478000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.811000,-1.535000,12.700000>}
box{<0,0,-0.203200><2.514472,0.035000,0.203200> rotate<0,44.997030,0> translate<10.033000,-1.535000,14.478000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.811000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.811000,-1.535000,12.700000>}
box{<0,0,-0.203200><3.048000,0.035000,0.203200> rotate<0,90.000000,0> translate<11.811000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.684000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.859300,-1.535000,21.765300>}
box{<0,0,-0.203200><0.247912,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.684000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.858500,-1.535000,28.321000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.001500,-1.535000,29.464000>}
box{<0,0,-0.304800><1.616446,0.035000,0.304800> rotate<0,-44.997030,0> translate<10.858500,-1.535000,28.321000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.271250,-1.535000,24.733250>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.039600,-1.535000,25.501600>}
box{<0,0,-0.203200><1.086611,0.035000,0.203200> rotate<0,-44.997030,0> translate<11.271250,-1.535000,24.733250> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.896600,-1.535000,28.422600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.039600,-1.535000,27.279600>}
box{<0,0,-0.203200><1.616446,0.035000,0.203200> rotate<0,44.997030,0> translate<10.896600,-1.535000,28.422600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.039600,-1.535000,25.501600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.039600,-1.535000,27.279600>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.039600,-1.535000,27.279600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.205772,0.000000,23.905772>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.065000,0.000000,24.765000>}
box{<0,0,-0.127000><1.215132,0.035000,0.127000> rotate<0,-44.997030,0> translate<11.205772,0.000000,23.905772> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.065000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.065000,0.000000,28.448000>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,90.000000,0> translate<12.065000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.065000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.080500,0.000000,28.432500>}
box{<0,0,-0.127000><0.021920,0.035000,0.127000> rotate<0,44.997030,0> translate<12.065000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.080500,0.000000,28.432500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.128500,0.000000,28.448000>}
box{<0,0,-0.127000><0.050441,0.035000,0.127000> rotate<0,-17.894952,0> translate<12.080500,0.000000,28.432500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.239500,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.141200,-1.535000,37.846000>}
box{<0,0,-0.203200><0.901700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.239500,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.811000,-1.535000,2.921000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.161000,-1.535000,2.921000>}
box{<0,0,-0.152400><0.350000,0.035000,0.152400> rotate<0,0.000000,0> translate<11.811000,-1.535000,2.921000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<5.588000,0.000000,1.447800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,0.000000,1.447800>}
box{<0,0,-0.203200><6.604000,0.035000,0.203200> rotate<0,0.000000,0> translate<5.588000,0.000000,1.447800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.379200,0.000000,2.895600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,0.000000,2.895600>}
box{<0,0,-0.203200><0.812800,0.035000,0.203200> rotate<0,0.000000,0> translate<11.379200,0.000000,2.895600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,0.000000,1.447800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.192000,0.000000,2.895600>}
box{<0,0,-0.203200><1.447800,0.035000,0.203200> rotate<0,90.000000,0> translate<12.192000,0.000000,2.895600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.161000,-1.535000,2.921000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.258000,-1.535000,3.399000>}
box{<0,0,-0.203200><0.487743,0.035000,0.203200> rotate<0,-78.523619,0> translate<12.161000,-1.535000,2.921000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.541000,-1.535000,4.953000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.258000,-1.535000,4.953000>}
box{<0,0,-0.152400><1.717000,0.035000,0.152400> rotate<0,0.000000,0> translate<10.541000,-1.535000,4.953000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.258000,-1.535000,5.999000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.258000,-1.535000,4.953000>}
box{<0,0,-0.152400><1.046000,0.035000,0.152400> rotate<0,-90.000000,0> translate<12.258000,-1.535000,4.953000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.811000,-1.535000,9.652000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.258000,-1.535000,9.205000>}
box{<0,0,-0.203200><0.632153,0.035000,0.203200> rotate<0,44.997030,0> translate<11.811000,-1.535000,9.652000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.258000,-1.535000,5.999000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.258000,-1.535000,9.205000>}
box{<0,0,-0.203200><3.206000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.258000,-1.535000,9.205000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.303000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.319000,0.000000,5.461000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.303000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<11.341100,-1.535000,32.423100>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.382500,-1.535000,33.464500>}
box{<0,0,-0.304800><1.472762,0.035000,0.304800> rotate<0,-44.997030,0> translate<11.341100,-1.535000,32.423100> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.382500,-1.535000,33.464500>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.382500,-1.535000,35.991800>}
box{<0,0,-0.304800><2.527300,0.035000,0.304800> rotate<0,90.000000,0> translate<12.382500,-1.535000,35.991800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.382500,-1.535000,35.991800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.395200,-1.535000,36.703000>}
box{<0,0,-0.304800><0.711313,0.035000,0.304800> rotate<0,-88.971098,0> translate<12.382500,-1.535000,35.991800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.395200,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.395200,-1.535000,36.703000>}
box{<0,0,-0.203200><0.889000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.395200,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.141200,-1.535000,37.846000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.395200,-1.535000,37.592000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<12.141200,-1.535000,37.846000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.407900,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.407900,-1.535000,32.092900>}
box{<0,0,-0.304800><0.596900,0.035000,0.304800> rotate<0,90.000000,0> translate<12.407900,-1.535000,32.092900> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.145112,0.000000,18.213563>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.446000,0.000000,15.875000>}
box{<0,0,-0.127000><3.280695,0.035000,0.127000> rotate<0,45.462264,0> translate<10.145112,0.000000,18.213563> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,4.191000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.573000,0.000000,4.191000>}
box{<0,0,-0.203200><1.143000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430000,0.000000,4.191000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.559325,0.000000,23.552219>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.573000,0.000000,24.565900>}
box{<0,0,-0.127000><1.433557,0.035000,0.127000> rotate<0,-44.997207,0> translate<11.559325,0.000000,23.552219> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.573000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.573000,0.000000,24.565900>}
box{<0,0,-0.127000><2.231100,0.035000,0.127000> rotate<0,-90.000000,0> translate<12.573000,0.000000,24.565900> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.573000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.573000,0.000000,31.901000>}
box{<0,0,-0.203200><0.151000,0.035000,0.203200> rotate<0,90.000000,0> translate<12.573000,0.000000,31.901000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.573000,0.000000,34.901000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.573000,0.000000,35.941000>}
box{<0,0,-0.406400><1.040000,0.035000,0.406400> rotate<0,90.000000,0> translate<12.573000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.718425,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.619988,0.000000,20.688438>}
box{<0,0,-0.152400><1.275002,0.035000,0.152400> rotate<0,44.997030,0> translate<11.718425,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.859300,-1.535000,21.765300>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.639694,-1.535000,21.910691>}
box{<0,0,-0.203200><0.793822,0.035000,0.203200> rotate<0,-10.552757,0> translate<11.859300,-1.535000,21.765300> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.573000,0.000000,4.191000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,4.064000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<12.573000,0.000000,4.191000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,4.191000>}
box{<0,0,-0.203200><0.889000,0.035000,0.203200> rotate<0,-90.000000,0> translate<12.700000,0.000000,4.191000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.319000,0.000000,5.461000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,5.080000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<12.319000,0.000000,5.461000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.498666,0.000000,18.567116>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,16.383000>}
box{<0,0,-0.127000><3.101005,0.035000,0.127000> rotate<0,44.772084,0> translate<10.498666,0.000000,18.567116> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.795000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,38.227000>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.795000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,38.227000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,41.910000>}
box{<0,0,-0.127000><3.683000,0.035000,0.127000> rotate<0,90.000000,0> translate<12.700000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.795000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,46.990000>}
box{<0,0,-0.127000><1.905000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.795000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,4.064000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.827000,0.000000,4.064000>}
box{<0,0,-0.203200><0.127000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.700000,0.000000,4.064000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.700000,0.000000,4.191000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.827000,0.000000,4.064000>}
box{<0,0,-0.203200><0.179605,0.035000,0.203200> rotate<0,44.997030,0> translate<12.700000,0.000000,4.191000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.525000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.827000,-1.535000,30.480000>}
box{<0,0,-0.127000><3.302000,0.035000,0.127000> rotate<0,0.000000,0> translate<9.525000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.881800,0.000000,16.891000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.881800,0.000000,16.887000>}
box{<0,0,-0.127000><0.004000,0.035000,0.127000> rotate<0,-90.000000,0> translate<12.881800,0.000000,16.887000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.852219,0.000000,18.920672>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.881800,0.000000,16.891000>}
box{<0,0,-0.127000><2.870325,0.035000,0.127000> rotate<0,44.998309,0> translate<10.852219,0.000000,18.920672> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.239500,-1.535000,38.938200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.903200,-1.535000,38.938200>}
box{<0,0,-0.203200><1.663700,0.035000,0.203200> rotate<0,0.000000,0> translate<11.239500,-1.535000,38.938200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.017500,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.043400,0.000000,28.194000>}
box{<0,0,-0.127000><0.255317,0.035000,0.127000> rotate<0,84.172203,0> translate<13.017500,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.205772,0.000000,19.274225>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.080900,0.000000,17.399000>}
box{<0,0,-0.127000><2.651900,0.035000,0.127000> rotate<0,44.998510,0> translate<11.205772,0.000000,19.274225> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.912881,0.000000,23.198666>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.081000,0.000000,24.366800>}
box{<0,0,-0.127000><1.651980,0.035000,0.127000> rotate<0,-44.997413,0> translate<11.912881,0.000000,23.198666> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.081000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.081000,0.000000,24.366800>}
box{<0,0,-0.127000><1.287200,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.081000,0.000000,24.366800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.573000,0.000000,26.797000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.081000,0.000000,27.305000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<12.573000,0.000000,26.797000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.043400,0.000000,28.194000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.081000,0.000000,28.283400>}
box{<0,0,-0.152400><0.096985,0.035000,0.152400> rotate<0,-67.184837,0> translate<13.043400,0.000000,28.194000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.081000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.081000,0.000000,28.283400>}
box{<0,0,-0.152400><0.978400,0.035000,0.152400> rotate<0,90.000000,0> translate<13.081000,0.000000,28.283400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.903200,-1.535000,38.938200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.081000,-1.535000,38.735000>}
box{<0,0,-0.203200><0.270006,0.035000,0.203200> rotate<0,48.810853,0> translate<12.903200,-1.535000,38.938200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.973541,0.000000,21.041991>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.167900,0.000000,21.041900>}
box{<0,0,-0.127000><0.194359,0.035000,0.127000> rotate<0,0.026714,0> translate<12.973541,0.000000,21.041991> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.266434,0.000000,20.334884>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.170200,0.000000,19.431000>}
box{<0,0,-0.127000><1.278202,0.035000,0.127000> rotate<0,45.000794,0> translate<12.266434,0.000000,20.334884> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,-1.535000,5.999000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.208000,-1.535000,7.621000>}
box{<0,0,-0.203200><1.622000,0.035000,0.203200> rotate<0,90.000000,0> translate<13.208000,-1.535000,7.621000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.541000,-1.535000,22.098000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,24.765000>}
box{<0,0,-0.127000><3.771708,0.035000,0.127000> rotate<0,-44.997030,0> translate<10.541000,-1.535000,22.098000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.258000,-1.535000,3.399000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.278600,-1.535000,4.419600>}
box{<0,0,-0.152400><1.443346,0.035000,0.152400> rotate<0,-44.997030,0> translate<12.258000,-1.535000,3.399000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.559325,0.000000,19.627778>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.280000,0.000000,17.907000>}
box{<0,0,-0.127000><2.433475,0.035000,0.127000> rotate<0,44.998747,0> translate<11.559325,0.000000,19.627778> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.827000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.335000,-1.535000,30.988000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.827000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.335000,-1.535000,31.877000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.335000,-1.535000,30.988000>}
box{<0,0,-0.127000><0.889000,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.335000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.407900,-1.535000,32.092900>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,33.020000>}
box{<0,0,-0.304800><1.311117,0.035000,0.304800> rotate<0,-44.997030,0> translate<12.407900,-1.535000,32.092900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,38.201600>}
box{<0,0,-0.304800><5.181600,0.035000,0.304800> rotate<0,90.000000,0> translate<13.335000,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.081000,-1.535000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.360400,-1.535000,38.735000>}
box{<0,0,-0.203200><0.279400,0.035000,0.203200> rotate<0,0.000000,0> translate<13.081000,-1.535000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.335000,-1.535000,38.201600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.360400,-1.535000,38.735000>}
box{<0,0,-0.304800><0.534004,0.035000,0.304800> rotate<0,-87.267929,0> translate<13.335000,-1.535000,38.201600> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<12.001500,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.373100,-1.535000,29.464000>}
box{<0,0,-0.304800><1.371600,0.035000,0.304800> rotate<0,0.000000,0> translate<12.001500,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.268309,-1.535000,22.539306>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.413700,-1.535000,22.748200>}
box{<0,0,-0.203200><0.254509,0.035000,0.203200> rotate<0,-55.158336,0> translate<13.268309,-1.535000,22.539306> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.619988,0.000000,22.491559>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,0.000000,23.333600>}
box{<0,0,-0.127000><1.190805,0.035000,0.127000> rotate<0,-44.997987,0> translate<12.619988,0.000000,22.491559> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<9.906000,-1.535000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,25.908000>}
box{<0,0,-0.127000><5.028943,0.035000,0.127000> rotate<0,-44.997030,0> translate<9.906000,-1.535000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.081000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,0.000000,26.035000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.081000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,-1.535000,26.035000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,90.000000,0> translate<13.462000,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<12.573000,0.000000,35.941000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.462000,0.000000,36.830000>}
box{<0,0,-0.406400><1.257236,0.035000,0.406400> rotate<0,-44.997030,0> translate<12.573000,0.000000,35.941000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.912881,0.000000,19.981331>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.479100,0.000000,18.415000>}
box{<0,0,-0.127000><2.215047,0.035000,0.127000> rotate<0,44.999088,0> translate<11.912881,0.000000,19.981331> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.167900,0.000000,21.041900>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.716000,0.000000,21.590000>}
box{<0,0,-0.127000><0.775130,0.035000,0.127000> rotate<0,-44.997030,0> translate<13.167900,0.000000,21.041900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.373100,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.716000,-1.535000,29.464000>}
box{<0,0,-0.304800><0.342900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.373100,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.446000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.843000,0.000000,15.875000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.446000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.373100,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.843000,-1.535000,29.464000>}
box{<0,0,-0.304800><0.469900,0.035000,0.304800> rotate<0,0.000000,0> translate<13.373100,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.716000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.843000,-1.535000,29.464000>}
box{<0,0,-0.127000><0.127000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.716000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.170200,0.000000,19.431000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,19.431000>}
box{<0,0,-0.127000><0.799800,0.035000,0.127000> rotate<0,0.000000,0> translate<13.170200,0.000000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,10.985500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,19.431000>}
box{<0,0,-0.127000><8.445500,0.035000,0.127000> rotate<0,90.000000,0> translate<13.970000,-1.535000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.413700,-1.535000,22.748200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.970000,-1.535000,23.304500>}
box{<0,0,-0.203200><0.786727,0.035000,0.203200> rotate<0,-44.997030,0> translate<13.413700,-1.535000,22.748200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.462000,0.000000,23.333600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,23.304500>}
box{<0,0,-0.127000><0.508833,0.035000,0.127000> rotate<0,3.278301,0> translate<13.462000,0.000000,23.333600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.266434,0.000000,22.845113>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,24.548700>}
box{<0,0,-0.127000><2.409221,0.035000,0.127000> rotate<0,-44.997398,0> translate<12.266434,0.000000,22.845113> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,24.548700>}
box{<0,0,-0.127000><0.216300,0.035000,0.127000> rotate<0,-90.000000,0> translate<13.970000,0.000000,24.548700> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.208000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,24.765000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.208000,-1.535000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,43.180000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<12.700000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,0.000000,45.720000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<12.700000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.007688,0.000000,40.677688>}
box{<0,0,-0.152400><0.053298,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.970000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.017500,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.013000,0.000000,30.226000>}
box{<0,0,-0.127000><0.995500,0.035000,0.127000> rotate<0,0.000000,0> translate<13.017500,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.973541,0.000000,22.138006>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.057000,0.000000,22.138000>}
box{<0,0,-0.127000><1.083459,0.035000,0.127000> rotate<0,0.000330,0> translate<12.973541,0.000000,22.138006> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.057000,0.000000,22.134200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.057000,0.000000,22.138000>}
box{<0,0,-0.127000><0.003800,0.035000,0.127000> rotate<0,90.000000,0> translate<14.057000,0.000000,22.138000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.700000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.097000,0.000000,16.383000>}
box{<0,0,-0.127000><1.397000,0.035000,0.127000> rotate<0,0.000000,0> translate<12.700000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.258000,-1.535000,4.953000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.158000,-1.535000,4.953000>}
box{<0,0,-0.152400><1.900000,0.035000,0.152400> rotate<0,0.000000,0> translate<12.258000,-1.535000,4.953000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.158000,-1.535000,5.999000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.158000,-1.535000,4.953000>}
box{<0,0,-0.152400><1.046000,0.035000,0.152400> rotate<0,-90.000000,0> translate<14.158000,-1.535000,4.953000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,10.985500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,-1.535000,10.731500>}
box{<0,0,-0.127000><0.359210,0.035000,0.127000> rotate<0,44.997030,0> translate<13.970000,-1.535000,10.985500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,-1.535000,9.715500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,-1.535000,10.731500>}
box{<0,0,-0.127000><1.016000,0.035000,0.127000> rotate<0,90.000000,0> translate<14.224000,-1.535000,10.731500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.716000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.236700,0.000000,21.590000>}
box{<0,0,-0.127000><0.520700,0.035000,0.127000> rotate<0,0.000000,0> translate<13.716000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<12.881800,0.000000,16.891000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.351000,0.000000,16.891000>}
box{<0,0,-0.127000><1.469200,0.035000,0.127000> rotate<0,0.000000,0> translate<12.881800,0.000000,16.891000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.479100,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,18.415000>}
box{<0,0,-0.127000><0.998900,0.035000,0.127000> rotate<0,0.000000,0> translate<13.479100,0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<11.811000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,8.509000>}
box{<0,0,-0.127000><3.951313,0.035000,0.127000> rotate<0,44.997030,0> translate<11.811000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,8.509000>}
box{<0,0,-0.127000><2.794000,0.035000,0.127000> rotate<0,90.000000,0> translate<14.605000,0.000000,8.509000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.351000,0.000000,16.891000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.732000,0.000000,16.510000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,44.997030,0> translate<14.351000,0.000000,16.891000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.280000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.732000,0.000000,17.907000>}
box{<0,0,-0.127000><1.452000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.280000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<12.573000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,0.000000,31.750000>}
box{<0,0,-0.203200><2.159000,0.035000,0.203200> rotate<0,0.000000,0> translate<12.573000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,0.000000,31.750000>}
box{<0,0,-0.203200><0.170000,0.035000,0.203200> rotate<0,90.000000,0> translate<14.732000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<10.795000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.732000,0.000000,44.450000>}
box{<0,0,-0.127000><3.937000,0.035000,0.127000> rotate<0,0.000000,0> translate<10.795000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.335000,-1.535000,31.877000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.795500,-1.535000,33.401000>}
box{<0,0,-0.127000><2.110838,0.035000,0.127000> rotate<0,-46.215825,0> translate<13.335000,-1.535000,31.877000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.478000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,18.796000>}
box{<0,0,-0.127000><0.538815,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.478000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,18.796000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,21.539200>}
box{<0,0,-0.127000><2.743200,0.035000,0.127000> rotate<0,90.000000,0> translate<14.859000,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.057000,0.000000,22.134200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,22.936200>}
box{<0,0,-0.127000><1.134199,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.057000,0.000000,22.134200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,22.936200>}
box{<0,0,-0.127000><4.495800,0.035000,0.127000> rotate<0,-90.000000,0> translate<14.859000,0.000000,22.936200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.224000,0.000000,28.067000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,27.432000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,44.997030,0> translate<14.224000,0.000000,28.067000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.013000,0.000000,30.226000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,29.380000>}
box{<0,0,-0.127000><1.196425,0.035000,0.127000> rotate<0,44.997030,0> translate<14.013000,0.000000,30.226000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.859000,0.000000,31.580000>}
box{<0,0,-0.203200><0.127000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.732000,0.000000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.859000,0.000000,32.956500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.859000,0.000000,31.580000>}
box{<0,0,-0.203200><1.376500,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.859000,0.000000,31.580000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.859000,0.000000,33.845500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.897100,0.000000,33.845500>}
box{<0,0,-0.152400><0.038100,0.035000,0.152400> rotate<0,0.000000,0> translate<14.859000,0.000000,33.845500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.922500,-1.535000,36.664900>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.922500,-1.535000,35.623500>}
box{<0,0,-0.203200><1.041400,0.035000,0.203200> rotate<0,-90.000000,0> translate<14.922500,-1.535000,35.623500> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.325600,-1.535000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.922500,-1.535000,36.664900>}
box{<0,0,-0.203200><0.598115,0.035000,0.203200> rotate<0,3.651982,0> translate<14.325600,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.897100,0.000000,33.845500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.947900,0.000000,33.845500>}
box{<0,0,-0.127000><0.050800,0.035000,0.127000> rotate<0,0.000000,0> translate<14.897100,0.000000,33.845500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,0.000000,12.954000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,-90.000000,0> translate<14.986000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.843000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,0.000000,14.732000>}
box{<0,0,-0.127000><1.616446,0.035000,0.127000> rotate<0,44.997030,0> translate<13.843000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.080900,0.000000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,0.000000,17.399000>}
box{<0,0,-0.127000><1.905100,0.035000,0.127000> rotate<0,0.000000,0> translate<13.080900,0.000000,17.399000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.278600,-1.535000,4.419600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.087600,-1.535000,4.419600>}
box{<0,0,-0.152400><1.809000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.278600,-1.535000,4.419600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.922500,-1.535000,35.623500>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.176500,-1.535000,35.369500>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,44.997030,0> translate<14.922500,-1.535000,35.623500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<13.970000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,43.180000>}
box{<0,0,-0.127000><1.270000,0.035000,0.127000> rotate<0,0.000000,0> translate<13.970000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,43.942000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,43.180000>}
box{<0,0,-0.127000><0.762000,0.035000,0.127000> rotate<0,-90.000000,0> translate<15.240000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.732000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,43.942000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,44.997030,0> translate<14.732000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.007688,0.000000,40.677688>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.277688,0.000000,40.677688>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<14.007688,0.000000,40.677688> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.732000,0.000000,17.907000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,18.542000>}
box{<0,0,-0.127000><0.898026,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.732000,0.000000,17.907000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,18.542000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,21.082000>}
box{<0,0,-0.127000><2.540000,0.035000,0.127000> rotate<0,90.000000,0> translate<15.367000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.236700,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,22.720300>}
box{<0,0,-0.127000><1.598486,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.236700,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,29.380000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,28.618000>}
box{<0,0,-0.127000><0.915810,0.035000,0.127000> rotate<0,56.306216,0> translate<14.859000,0.000000,29.380000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,22.720300>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,28.618000>}
box{<0,0,-0.127000><5.897700,0.035000,0.127000> rotate<0,90.000000,0> translate<15.367000,0.000000,28.618000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.947900,0.000000,33.845500>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.392400,0.000000,34.290000>}
box{<0,0,-0.127000><0.628618,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.947900,0.000000,33.845500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.795500,-1.535000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.621000,-1.535000,33.401000>}
box{<0,0,-0.127000><0.825500,0.035000,0.127000> rotate<0,0.000000,0> translate<14.795500,-1.535000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.224000,-1.535000,9.715500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.684500,-1.535000,9.715500>}
box{<0,0,-0.152400><1.460500,0.035000,0.152400> rotate<0,0.000000,0> translate<14.224000,-1.535000,9.715500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.367000,0.000000,21.082000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,0.000000,21.590000>}
box{<0,0,-0.127000><0.718420,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.367000,0.000000,21.082000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.360400,-1.535000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875000,-1.535000,38.735000>}
box{<0,0,-0.203200><2.514600,0.035000,0.203200> rotate<0,0.000000,0> translate<13.360400,-1.535000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,0.000000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.256000,0.000000,18.669000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.986000,0.000000,17.399000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.338300,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,-1.535000,31.496000>}
box{<0,0,-0.203200><1.917700,0.035000,0.203200> rotate<0,0.000000,0> translate<14.338300,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.605000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,3.810000>}
box{<0,0,-0.127000><2.694077,0.035000,0.127000> rotate<0,44.997030,0> translate<14.605000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.087600,-1.535000,4.419600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,5.842000>}
box{<0,0,-0.152400><2.011577,0.035000,0.152400> rotate<0,-44.997030,0> translate<15.087600,-1.535000,4.419600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,5.842000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,6.350000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,90.000000,0> translate<16.510000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.684500,-1.535000,9.715500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,8.890000>}
box{<0,0,-0.152400><1.167433,0.035000,0.152400> rotate<0,44.997030,0> translate<15.684500,-1.535000,9.715500> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.986000,0.000000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,11.430000>}
box{<0,0,-0.127000><2.155261,0.035000,0.127000> rotate<0,44.997030,0> translate<14.986000,0.000000,12.954000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.097000,0.000000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,13.970000>}
box{<0,0,-0.127000><3.412497,0.035000,0.127000> rotate<0,44.997030,0> translate<14.097000,0.000000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.732000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,16.510000>}
box{<0,0,-0.127000><1.778000,0.035000,0.127000> rotate<0,0.000000,0> translate<14.732000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.256000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,19.050000>}
box{<0,0,-0.127000><0.457905,0.035000,0.127000> rotate<0,-56.306216,0> translate<16.256000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.875000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,21.590000>}
box{<0,0,-0.127000><0.635000,0.035000,0.127000> rotate<0,0.000000,0> translate<15.875000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<14.859000,0.000000,21.539200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,23.190200>}
box{<0,0,-0.127000><2.334867,0.035000,0.127000> rotate<0,-44.997030,0> translate<14.859000,0.000000,21.539200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,23.190200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,24.130000>}
box{<0,0,-0.127000><0.939800,0.035000,0.127000> rotate<0,90.000000,0> translate<16.510000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<14.732000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,0.000000,31.750000>}
box{<0,0,-0.203200><1.778000,0.035000,0.203200> rotate<0,0.000000,0> translate<14.732000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.256000,-1.535000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,31.750000>}
box{<0,0,-0.203200><0.359210,0.035000,0.203200> rotate<0,-44.997030,0> translate<16.256000,-1.535000,31.496000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.392400,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,34.290000>}
box{<0,0,-0.127000><1.117600,0.035000,0.127000> rotate<0,0.000000,0> translate<15.392400,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.621000,-1.535000,33.401000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,34.290000>}
box{<0,0,-0.127000><1.257236,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.621000,-1.535000,33.401000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.462000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<16.510000,0.000000,36.830000>}
box{<0,0,-0.406400><3.048000,0.035000,0.406400> rotate<0,0.000000,0> translate<13.462000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<15.875000,-1.535000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<16.510000,-1.535000,39.370000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<15.875000,-1.535000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,0.000000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,0.000000,41.910000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,44.997030,0> translate<15.240000,0.000000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.277688,0.000000,40.677688>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,0.000000,41.910000>}
box{<0,0,-0.152400><1.742753,0.035000,0.152400> rotate<0,-44.997030,0> translate<15.277688,0.000000,40.677688> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<15.240000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<16.510000,-1.535000,44.450000>}
box{<0,0,-0.127000><1.796051,0.035000,0.127000> rotate<0,-44.997030,0> translate<15.240000,-1.535000,43.180000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.831672,-0.500000,47.181259>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.238500,-0.500000,47.181259>}
box{<0,0,-0.063500><0.593172,0.035000,0.063500> rotate<0,0.000000,0> translate<3.238500,-0.500000,47.181259> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.238500,-0.500000,47.181259>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.238500,-0.500000,46.736378>}
box{<0,0,-0.063500><0.444881,0.035000,0.063500> rotate<0,-90.000000,0> translate<3.238500,-0.500000,46.736378> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.238500,-0.500000,46.736378>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.535084,-0.500000,46.884672>}
box{<0,0,-0.063500><0.331592,0.035000,0.063500> rotate<0,-26.563539,0> translate<3.238500,-0.500000,46.736378> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.535084,-0.500000,46.884672>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.683378,-0.500000,46.884672>}
box{<0,0,-0.063500><0.148294,0.035000,0.063500> rotate<0,0.000000,0> translate<3.535084,-0.500000,46.884672> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.683378,-0.500000,46.884672>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.831672,-0.500000,46.736378>}
box{<0,0,-0.063500><0.209719,0.035000,0.063500> rotate<0,44.997030,0> translate<3.683378,-0.500000,46.884672> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.831672,-0.500000,46.736378>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.831672,-0.500000,46.439791>}
box{<0,0,-0.063500><0.296588,0.035000,0.063500> rotate<0,-90.000000,0> translate<3.831672,-0.500000,46.439791> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.831672,-0.500000,46.439791>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.683378,-0.500000,46.291500>}
box{<0,0,-0.063500><0.209717,0.035000,0.063500> rotate<0,-44.996427,0> translate<3.683378,-0.500000,46.291500> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.683378,-0.500000,46.291500>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.386791,-0.500000,46.291500>}
box{<0,0,-0.063500><0.296588,0.035000,0.063500> rotate<0,0.000000,0> translate<3.386791,-0.500000,46.291500> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.386791,-0.500000,46.291500>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.238500,-0.500000,46.439791>}
box{<0,0,-0.063500><0.209715,0.035000,0.063500> rotate<0,44.997030,0> translate<3.238500,-0.500000,46.439791> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.174019,-0.500000,47.181259>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.174019,-0.500000,46.588084>}
box{<0,0,-0.063500><0.593175,0.035000,0.063500> rotate<0,-90.000000,0> translate<4.174019,-0.500000,46.588084> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.174019,-0.500000,46.588084>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.470603,-0.500000,46.291500>}
box{<0,0,-0.063500><0.419434,0.035000,0.063500> rotate<0,44.997030,0> translate<4.174019,-0.500000,46.588084> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.470603,-0.500000,46.291500>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.767191,-0.500000,46.588084>}
box{<0,0,-0.063500><0.419436,0.035000,0.063500> rotate<0,-44.996728,0> translate<4.470603,-0.500000,46.291500> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.767191,-0.500000,46.588084>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.767191,-0.500000,47.181259>}
box{<0,0,-0.063500><0.593175,0.035000,0.063500> rotate<0,90.000000,0> translate<4.767191,-0.500000,47.181259> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.704672,-1.000000,47.032966>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.556378,-1.000000,47.181259>}
box{<0,0,-0.063500><0.209719,0.035000,0.063500> rotate<0,44.997030,0> translate<3.556378,-1.000000,47.181259> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.556378,-1.000000,47.181259>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.259791,-1.000000,47.181259>}
box{<0,0,-0.063500><0.296588,0.035000,0.063500> rotate<0,0.000000,0> translate<3.259791,-1.000000,47.181259> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.259791,-1.000000,47.181259>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.111500,-1.000000,47.032966>}
box{<0,0,-0.063500><0.209717,0.035000,0.063500> rotate<0,-44.997634,0> translate<3.111500,-1.000000,47.032966> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.111500,-1.000000,47.032966>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.111500,-1.000000,46.439791>}
box{<0,0,-0.063500><0.593175,0.035000,0.063500> rotate<0,-90.000000,0> translate<3.111500,-1.000000,46.439791> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.111500,-1.000000,46.439791>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.259791,-1.000000,46.291500>}
box{<0,0,-0.063500><0.209715,0.035000,0.063500> rotate<0,44.997030,0> translate<3.111500,-1.000000,46.439791> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.259791,-1.000000,46.291500>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.556378,-1.000000,46.291500>}
box{<0,0,-0.063500><0.296588,0.035000,0.063500> rotate<0,0.000000,0> translate<3.259791,-1.000000,46.291500> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.556378,-1.000000,46.291500>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.704672,-1.000000,46.439791>}
box{<0,0,-0.063500><0.209717,0.035000,0.063500> rotate<0,-44.996427,0> translate<3.556378,-1.000000,46.291500> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.704672,-1.000000,46.439791>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.704672,-1.000000,46.736378>}
box{<0,0,-0.063500><0.296588,0.035000,0.063500> rotate<0,90.000000,0> translate<3.704672,-1.000000,46.736378> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.704672,-1.000000,46.736378>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<3.408084,-1.000000,46.736378>}
box{<0,0,-0.063500><0.296588,0.035000,0.063500> rotate<0,0.000000,0> translate<3.408084,-1.000000,46.736378> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.047019,-1.000000,46.291500>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.047019,-1.000000,47.181259>}
box{<0,0,-0.063500><0.889759,0.035000,0.063500> rotate<0,90.000000,0> translate<4.047019,-1.000000,47.181259> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.047019,-1.000000,47.181259>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.640191,-1.000000,46.291500>}
box{<0,0,-0.063500><1.069357,0.035000,0.063500> rotate<0,56.306263,0> translate<4.047019,-1.000000,47.181259> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.640191,-1.000000,46.291500>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.640191,-1.000000,47.181259>}
box{<0,0,-0.063500><0.889759,0.035000,0.063500> rotate<0,90.000000,0> translate<4.640191,-1.000000,47.181259> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.982538,-1.000000,47.181259>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.982538,-1.000000,46.291500>}
box{<0,0,-0.063500><0.889759,0.035000,0.063500> rotate<0,-90.000000,0> translate<4.982538,-1.000000,46.291500> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.982538,-1.000000,46.291500>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<5.427416,-1.000000,46.291500>}
box{<0,0,-0.063500><0.444878,0.035000,0.063500> rotate<0,0.000000,0> translate<4.982538,-1.000000,46.291500> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<5.427416,-1.000000,46.291500>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<5.575709,-1.000000,46.439791>}
box{<0,0,-0.063500><0.209717,0.035000,0.063500> rotate<0,-44.996427,0> translate<5.427416,-1.000000,46.291500> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<5.575709,-1.000000,46.439791>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<5.575709,-1.000000,47.032966>}
box{<0,0,-0.063500><0.593175,0.035000,0.063500> rotate<0,90.000000,0> translate<5.575709,-1.000000,47.032966> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<5.575709,-1.000000,47.032966>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<5.427416,-1.000000,47.181259>}
box{<0,0,-0.063500><0.209719,0.035000,0.063500> rotate<0,44.997030,0> translate<5.427416,-1.000000,47.181259> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<5.427416,-1.000000,47.181259>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<4.982538,-1.000000,47.181259>}
box{<0,0,-0.063500><0.444878,0.035000,0.063500> rotate<0,0.000000,0> translate<4.982538,-1.000000,47.181259> }
//Rect
union{
texture{col_pds}
}
texture{col_wrs}
}
#end
#if(pcb_polygons=on)
union{
//Polygons
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-2.540000,0.000000,-2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-2.540000,0.000000,50.800000>}
box{<0,0,-0.076200><53.340000,0.035000,0.076200> rotate<0,90.000000,0> translate<-2.540000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-2.540000,0.000000,-2.540000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.320000,0.000000,-2.540000>}
box{<0,0,-0.076200><22.860000,0.035000,0.076200> rotate<0,0.000000,0> translate<-2.540000,0.000000,-2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<-2.540000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.320000,0.000000,50.800000>}
box{<0,0,-0.076200><22.860000,0.035000,0.076200> rotate<0,0.000000,0> translate<-2.540000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<-1.905000,-1.535000,-1.905000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.685000,-1.535000,-1.905000>}
box{<0,0,-0.101600><21.590000,0.035000,0.101600> rotate<0,0.000000,0> translate<-1.905000,-1.535000,-1.905000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<-1.905000,-1.535000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<-1.905000,-1.535000,-1.905000>}
box{<0,0,-0.101600><52.070000,0.035000,0.101600> rotate<0,-90.000000,0> translate<-1.905000,-1.535000,-1.905000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<-1.905000,-1.535000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.685000,-1.535000,50.165000>}
box{<0,0,-0.101600><21.590000,0.035000,0.101600> rotate<0,0.000000,0> translate<-1.905000,-1.535000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.685000,-1.535000,-1.905000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.685000,-1.535000,50.165000>}
box{<0,0,-0.101600><52.070000,0.035000,0.101600> rotate<0,90.000000,0> translate<19.685000,-1.535000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.320000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<20.320000,0.000000,-2.540000>}
box{<0,0,-0.076200><53.340000,0.035000,0.076200> rotate<0,-90.000000,0> translate<20.320000,0.000000,-2.540000> }
texture{col_pol}
}
#end
union{
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<5.384800,0.038000,1.701800><5.384800,-1.538000,1.701800>0.350000 }
cylinder{<5.384800,0.038000,1.193800><5.384800,-1.538000,1.193800>0.350000 }
cylinder{<12.395200,0.038000,1.701800><12.395200,-1.538000,1.701800>0.350000 }
cylinder{<12.395200,0.038000,1.193800><12.395200,-1.538000,1.193800>0.350000 }
cylinder{<6.273800,0.038000,4.140200><6.273800,-1.538000,4.140200>0.350000 }
cylinder{<6.527800,0.038000,4.140200><6.527800,-1.538000,4.140200>0.350000 }
cylinder{<11.252200,0.038000,4.140200><11.252200,-1.538000,4.140200>0.350000 }
cylinder{<11.506200,0.038000,4.140200><11.506200,-1.538000,4.140200>0.350000 }
cylinder{<13.970000,0.038000,40.640000><13.970000,-1.538000,40.640000>0.475000}
cylinder{<11.430000,0.038000,40.640000><11.430000,-1.538000,40.640000>0.475000}
cylinder{<13.970000,0.038000,43.180000><13.970000,-1.538000,43.180000>0.475000}
cylinder{<11.430000,0.038000,43.180000><11.430000,-1.538000,43.180000>0.475000}
cylinder{<13.970000,0.038000,45.720000><13.970000,-1.538000,45.720000>0.475000}
cylinder{<11.430000,0.038000,45.720000><11.430000,-1.538000,45.720000>0.475000}
cylinder{<1.270000,0.038000,44.450000><1.270000,-1.538000,44.450000>0.457200}
cylinder{<1.270000,0.038000,41.910000><1.270000,-1.538000,41.910000>0.457200}
cylinder{<1.270000,0.038000,39.370000><1.270000,-1.538000,39.370000>0.457200}
cylinder{<1.270000,0.038000,36.830000><1.270000,-1.538000,36.830000>0.457200}
cylinder{<1.270000,0.038000,34.290000><1.270000,-1.538000,34.290000>0.457200}
cylinder{<1.270000,0.038000,31.750000><1.270000,-1.538000,31.750000>0.457200}
cylinder{<1.270000,0.038000,29.210000><1.270000,-1.538000,29.210000>0.457200}
cylinder{<1.270000,0.038000,26.670000><1.270000,-1.538000,26.670000>0.457200}
cylinder{<1.270000,0.038000,24.130000><1.270000,-1.538000,24.130000>0.457200}
cylinder{<1.270000,0.038000,21.590000><1.270000,-1.538000,21.590000>0.457200}
cylinder{<1.270000,0.038000,19.050000><1.270000,-1.538000,19.050000>0.457200}
cylinder{<1.270000,0.038000,16.510000><1.270000,-1.538000,16.510000>0.457200}
cylinder{<1.270000,0.038000,13.970000><1.270000,-1.538000,13.970000>0.457200}
cylinder{<1.270000,0.038000,11.430000><1.270000,-1.538000,11.430000>0.457200}
cylinder{<1.270000,0.038000,8.890000><1.270000,-1.538000,8.890000>0.457200}
cylinder{<1.270000,0.038000,6.350000><1.270000,-1.538000,6.350000>0.457200}
cylinder{<1.270000,0.038000,3.810000><1.270000,-1.538000,3.810000>0.457200}
cylinder{<16.510000,0.038000,44.450000><16.510000,-1.538000,44.450000>0.457200}
cylinder{<16.510000,0.038000,41.910000><16.510000,-1.538000,41.910000>0.457200}
cylinder{<16.510000,0.038000,39.370000><16.510000,-1.538000,39.370000>0.457200}
cylinder{<16.510000,0.038000,36.830000><16.510000,-1.538000,36.830000>0.457200}
cylinder{<16.510000,0.038000,34.290000><16.510000,-1.538000,34.290000>0.457200}
cylinder{<16.510000,0.038000,31.750000><16.510000,-1.538000,31.750000>0.457200}
cylinder{<16.510000,0.038000,29.210000><16.510000,-1.538000,29.210000>0.457200}
cylinder{<16.510000,0.038000,26.670000><16.510000,-1.538000,26.670000>0.457200}
cylinder{<16.510000,0.038000,24.130000><16.510000,-1.538000,24.130000>0.457200}
cylinder{<16.510000,0.038000,21.590000><16.510000,-1.538000,21.590000>0.457200}
cylinder{<16.510000,0.038000,19.050000><16.510000,-1.538000,19.050000>0.457200}
cylinder{<16.510000,0.038000,16.510000><16.510000,-1.538000,16.510000>0.457200}
cylinder{<16.510000,0.038000,13.970000><16.510000,-1.538000,13.970000>0.457200}
cylinder{<16.510000,0.038000,11.430000><16.510000,-1.538000,11.430000>0.457200}
cylinder{<16.510000,0.038000,8.890000><16.510000,-1.538000,8.890000>0.457200}
cylinder{<16.510000,0.038000,6.350000><16.510000,-1.538000,6.350000>0.457200}
cylinder{<16.510000,0.038000,3.810000><16.510000,-1.538000,3.810000>0.457200}
//Holes(fast)/Vias
cylinder{<3.683000,0.038000,20.828000><3.683000,-1.538000,20.828000>0.304800 }
cylinder{<6.477000,0.038000,28.448000><6.477000,-1.538000,28.448000>0.304800 }
cylinder{<13.970000,0.038000,23.304500><13.970000,-1.538000,23.304500>0.304800 }
cylinder{<10.033000,0.038000,16.256000><10.033000,-1.538000,16.256000>0.304800 }
cylinder{<5.461000,0.038000,36.957000><5.461000,-1.538000,36.957000>0.304800 }
cylinder{<15.176500,0.038000,35.369500><15.176500,-1.538000,35.369500>0.304800 }
cylinder{<8.191500,0.038000,34.163000><8.191500,-1.538000,34.163000>0.304800 }
cylinder{<13.970000,0.038000,19.431000><13.970000,-1.538000,19.431000>0.304800 }
cylinder{<8.128000,0.038000,7.620000><8.128000,-1.538000,7.620000>0.304800 }
cylinder{<6.858000,0.038000,7.366000><6.858000,-1.538000,7.366000>0.304800 }
cylinder{<3.302000,0.038000,26.606500><3.302000,-1.538000,26.606500>0.304800 }
cylinder{<3.810000,0.038000,24.384000><3.810000,-1.538000,24.384000>0.304800 }
cylinder{<4.127500,0.038000,25.654000><4.127500,-1.538000,25.654000>0.304800 }
cylinder{<6.350000,0.038000,16.383000><6.350000,-1.538000,16.383000>0.304800 }
cylinder{<2.794000,0.038000,19.177000><2.794000,-1.538000,19.177000>0.304800 }
cylinder{<14.224000,0.038000,28.067000><14.224000,-1.538000,28.067000>0.304800 }
cylinder{<11.684000,0.038000,15.240000><11.684000,-1.538000,15.240000>0.304800 }
cylinder{<8.890000,0.038000,24.511000><8.890000,-1.538000,24.511000>0.304800 }
cylinder{<11.684000,0.038000,21.590000><11.684000,-1.538000,21.590000>0.304800 }
cylinder{<6.705600,0.038000,30.911800><6.705600,-1.538000,30.911800>0.304800 }
cylinder{<5.969000,0.038000,21.590000><5.969000,-1.538000,21.590000>0.304800 }
cylinder{<8.890000,0.038000,18.796000><8.890000,-1.538000,18.796000>0.304800 }
cylinder{<3.556000,0.038000,1.270000><3.556000,-1.538000,1.270000>0.304800 }
cylinder{<14.224000,0.038000,1.270000><14.224000,-1.538000,1.270000>0.304800 }
cylinder{<8.636000,0.038000,40.640000><8.636000,-1.538000,40.640000>0.304800 }
cylinder{<6.350000,0.038000,2.931159><6.350000,-1.538000,2.931159>0.304800 }
cylinder{<13.081000,0.038000,27.305000><13.081000,-1.538000,27.305000>0.304800 }
cylinder{<4.572000,0.038000,40.957500><4.572000,-1.538000,40.957500>0.304800 }
cylinder{<3.365500,0.038000,27.876500><3.365500,-1.538000,27.876500>0.304800 }
cylinder{<7.493000,0.038000,26.733500><7.493000,-1.538000,26.733500>0.304800 }
cylinder{<3.556000,0.038000,18.161000><3.556000,-1.538000,18.161000>0.304800 }
cylinder{<3.302000,0.038000,8.509000><3.302000,-1.538000,8.509000>0.304800 }
cylinder{<13.462000,0.038000,26.035000><13.462000,-1.538000,26.035000>0.304800 }
cylinder{<13.970000,0.038000,24.765000><13.970000,-1.538000,24.765000>0.304800 }
cylinder{<3.556000,0.038000,37.211000><3.556000,-1.538000,37.211000>0.304800 }
cylinder{<8.636000,0.038000,43.688000><8.636000,-1.538000,43.688000>0.304800 }
cylinder{<8.636000,0.038000,32.004000><8.636000,-1.538000,32.004000>0.304800 }
cylinder{<6.985000,0.038000,37.465000><6.985000,-1.538000,37.465000>0.304800 }
cylinder{<10.350500,0.038000,29.527500><10.350500,-1.538000,29.527500>0.304800 }
cylinder{<3.683000,0.038000,22.098000><3.683000,-1.538000,22.098000>0.304800 }
cylinder{<6.718300,0.038000,32.194500><6.718300,-1.538000,32.194500>0.304800 }
cylinder{<10.858500,0.038000,28.321000><10.858500,-1.538000,28.321000>0.304800 }
cylinder{<6.096000,0.038000,6.350000><6.096000,-1.538000,6.350000>0.304800 }
//Holes(fast)/Board
cylinder{<1.270000,0.038000,1.270000><1.270000,-1.538000,1.270000>0.600000 }
cylinder{<16.510000,0.038000,1.270000><16.510000,-1.538000,1.270000>0.600000 }
cylinder{<1.270000,0.038000,46.990000><1.270000,-1.538000,46.990000>0.600000 }
cylinder{<16.510000,0.038000,46.990000><16.510000,-1.538000,46.990000>0.600000 }
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.762172,0.000000,40.309800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.762172,0.000000,40.919919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<0.762172,0.000000,40.919919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,40.919919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,40.919919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<0.558800,0.000000,40.919919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,40.919919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,40.309800>}
box{<0,0,-0.050800><0.733272,0.036000,0.050800> rotate<0,56.306149,0> translate<1.213663,0.000000,40.919919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,40.919919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,40.309800>}
box{<0,0,-0.050800><0.733272,0.036000,0.050800> rotate<0,-56.306149,0> translate<1.213663,0.000000,40.309800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.868525,0.000000,40.716547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.071897,0.000000,40.919919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.868525,0.000000,40.716547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.071897,0.000000,40.919919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.071897,0.000000,40.309800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.071897,0.000000,40.309800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.868525,0.000000,40.309800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.275272,0.000000,40.309800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.868525,0.000000,40.309800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,37.769800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,38.379919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<0.558800,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,38.379919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,38.379919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.558800,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,38.379919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,38.278234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.863859,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,38.278234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,38.074859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.965547,0.000000,38.074859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,38.074859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,37.973172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,-44.997030,0> translate<0.863859,0.000000,37.973172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,37.973172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,37.973172>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.558800,0.000000,37.973172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.762172,0.000000,37.973172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,37.769800>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,44.996590,0> translate<0.762172,0.000000,37.973172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,38.379919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,37.769800>}
box{<0,0,-0.050800><0.733272,0.036000,0.050800> rotate<0,56.306149,0> translate<1.213663,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,38.379919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,37.769800>}
box{<0,0,-0.050800><0.733272,0.036000,0.050800> rotate<0,-56.306149,0> translate<1.213663,0.000000,37.769800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.868525,0.000000,38.176547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.071897,0.000000,38.379919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.868525,0.000000,38.176547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.071897,0.000000,38.379919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.071897,0.000000,37.769800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.071897,0.000000,37.769800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.868525,0.000000,37.769800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.275272,0.000000,37.769800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.868525,0.000000,37.769800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,35.839919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<0.558800,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,35.839919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,35.839919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.558800,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,35.839919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,35.738234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.863859,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,35.738234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,35.534859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.965547,0.000000,35.534859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,35.534859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,35.433172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,-44.997030,0> translate<0.863859,0.000000,35.433172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,35.433172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,35.433172>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.558800,0.000000,35.433172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.762172,0.000000,35.433172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,35.229800>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,44.996590,0> translate<0.762172,0.000000,35.433172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,35.738234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.518722,0.000000,35.839919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<1.518722,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.518722,0.000000,35.839919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.315347,0.000000,35.839919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.315347,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.315347,0.000000,35.839919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,35.738234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.213663,0.000000,35.738234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,35.738234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,35.636547>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.213663,0.000000,35.636547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,35.636547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.315347,0.000000,35.534859>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.997911,0> translate<1.213663,0.000000,35.636547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.315347,0.000000,35.534859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.518722,0.000000,35.534859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.315347,0.000000,35.534859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.518722,0.000000,35.534859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,35.433172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<1.518722,0.000000,35.534859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,35.433172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,35.331484>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.620409,0.000000,35.331484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,35.331484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.518722,0.000000,35.229800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<1.518722,0.000000,35.229800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.518722,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.315347,0.000000,35.229800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.315347,0.000000,35.229800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.315347,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,35.331484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<1.213663,0.000000,35.331484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.071897,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.071897,0.000000,35.839919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<2.071897,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.868525,0.000000,35.839919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.275272,0.000000,35.839919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.868525,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,33.198234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,33.299919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.863859,0.000000,33.299919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,33.299919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.660484,0.000000,33.299919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<0.660484,0.000000,33.299919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.660484,0.000000,33.299919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,33.198234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<0.558800,0.000000,33.198234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,33.198234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,32.791484>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.558800,0.000000,32.791484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.558800,0.000000,32.791484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.660484,0.000000,32.689800>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<0.558800,0.000000,32.791484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.660484,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,32.689800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<0.660484,0.000000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.863859,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,32.791484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.863859,0.000000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,32.791484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,32.994859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,90.000000,0> translate<0.965547,0.000000,32.994859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.965547,0.000000,32.994859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.762172,0.000000,32.994859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<0.762172,0.000000,32.994859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,33.299919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<1.213663,0.000000,33.299919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.213663,0.000000,33.299919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,32.689800>}
box{<0,0,-0.050800><0.733272,0.036000,0.050800> rotate<0,56.306149,0> translate<1.213663,0.000000,33.299919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.620409,0.000000,33.299919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<1.620409,0.000000,33.299919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.868525,0.000000,33.299919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.868525,0.000000,32.689800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.868525,0.000000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.868525,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.173584,0.000000,32.689800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<1.868525,0.000000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.173584,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.275272,0.000000,32.791484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<2.173584,0.000000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.275272,0.000000,32.791484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.275272,0.000000,33.198234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<2.275272,0.000000,33.198234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.275272,0.000000,33.198234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.173584,0.000000,33.299919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<2.173584,0.000000,33.299919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.173584,0.000000,33.299919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.868525,0.000000,33.299919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<1.868525,0.000000,33.299919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,30.632919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,30.022800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.685800,0.000000,30.022800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,30.022800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,30.022800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,30.022800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,30.022800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,30.124484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.990859,0.000000,30.022800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,30.124484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,30.531234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.092547,0.000000,30.531234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,30.531234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,30.632919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.990859,0.000000,30.632919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,30.632919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,30.632919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,30.632919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,30.022800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,30.022800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.340663,0.000000,30.022800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,30.022800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,30.429547>}
box{<0,0,-0.050800><0.575227,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.340663,0.000000,30.022800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,30.429547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,30.531234>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,90.000000,0> translate<1.747409,0.000000,30.531234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,30.531234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,30.632919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<1.645722,0.000000,30.632919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,30.632919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,30.632919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,30.632919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,30.632919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,30.531234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.340663,0.000000,30.531234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,28.092919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,27.482800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.685800,0.000000,27.482800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,27.482800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,27.482800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,27.482800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,27.482800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,27.584484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.990859,0.000000,27.482800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,27.584484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,27.991234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.092547,0.000000,27.991234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,27.991234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,28.092919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.990859,0.000000,28.092919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,28.092919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,28.092919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,28.092919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,27.991234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,28.092919>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.340663,0.000000,27.991234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,28.092919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,28.092919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,28.092919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,28.092919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,27.991234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<1.645722,0.000000,28.092919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,27.991234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,27.889547>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.747409,0.000000,27.889547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,27.889547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,27.787859>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.645722,0.000000,27.787859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,27.787859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.544034,0.000000,27.787859>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,0.000000,0> translate<1.544034,0.000000,27.787859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,27.787859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,27.686172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<1.645722,0.000000,27.787859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,27.686172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,27.584484>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.747409,0.000000,27.584484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,27.584484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,27.482800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<1.645722,0.000000,27.482800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,27.482800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,27.482800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,27.482800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,27.482800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,27.584484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<1.340663,0.000000,27.584484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,25.679919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,25.069800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.685800,0.000000,25.069800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,25.069800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,25.069800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,25.069800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,25.069800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,25.171484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.990859,0.000000,25.069800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,25.171484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,25.578234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.092547,0.000000,25.578234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,25.578234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,25.679919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.990859,0.000000,25.679919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,25.679919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,25.679919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,25.679919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,25.069800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,25.679919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<1.645722,0.000000,25.679919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,25.679919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,25.374859>}
box{<0,0,-0.050800><0.431419,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.340663,0.000000,25.374859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,25.374859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,25.374859>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.340663,0.000000,25.374859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,23.139919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,22.529800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.685800,0.000000,22.529800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,22.529800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,22.529800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,22.529800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,22.529800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,22.631484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.990859,0.000000,22.529800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,22.631484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,23.038234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.092547,0.000000,23.038234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,23.038234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,23.139919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.990859,0.000000,23.139919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,23.139919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,23.139919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,23.139919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,23.139919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,23.139919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.340663,0.000000,23.139919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,23.139919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,22.834859>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.340663,0.000000,22.834859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,22.834859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.544034,0.000000,22.936547>}
box{<0,0,-0.050800><0.227377,0.036000,0.050800> rotate<0,-26.563650,0> translate<1.340663,0.000000,22.834859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.544034,0.000000,22.936547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,22.936547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,0.000000,0> translate<1.544034,0.000000,22.936547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,22.936547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,22.834859>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<1.645722,0.000000,22.936547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,22.834859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,22.631484>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.747409,0.000000,22.631484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,22.631484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,22.529800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<1.645722,0.000000,22.529800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,22.529800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,22.529800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,22.529800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,22.529800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,22.631484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<1.340663,0.000000,22.631484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,20.599919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,19.989800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.685800,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,19.989800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,20.091484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.990859,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,20.091484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,20.498234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.092547,0.000000,20.498234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,20.498234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,20.599919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.990859,0.000000,20.599919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,20.599919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,20.599919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,20.599919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,20.599919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.544034,0.000000,20.498234>}
box{<0,0,-0.050800><0.227379,0.036000,0.050800> rotate<0,-26.562594,0> translate<1.544034,0.000000,20.498234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.544034,0.000000,20.498234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,20.294859>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,-44.997470,0> translate<1.340663,0.000000,20.294859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,20.294859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,20.091484>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.340663,0.000000,20.091484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,20.091484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,19.989800>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<1.340663,0.000000,20.091484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,19.989800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,20.091484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<1.645722,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,20.091484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,20.193172>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,90.000000,0> translate<1.747409,0.000000,20.193172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,20.193172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,20.294859>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<1.645722,0.000000,20.294859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,20.294859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,20.294859>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<1.340663,0.000000,20.294859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.812800,0.000000,18.059919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.812800,0.000000,17.449800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.812800,0.000000,17.449800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.812800,0.000000,17.449800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117859,0.000000,17.449800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.812800,0.000000,17.449800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117859,0.000000,17.449800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219547,0.000000,17.551484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<1.117859,0.000000,17.449800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219547,0.000000,17.551484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219547,0.000000,17.958234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.219547,0.000000,17.958234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.219547,0.000000,17.958234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117859,0.000000,18.059919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<1.117859,0.000000,18.059919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.117859,0.000000,18.059919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.812800,0.000000,18.059919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.812800,0.000000,18.059919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.467663,0.000000,18.059919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.874409,0.000000,18.059919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.467663,0.000000,18.059919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.874409,0.000000,18.059919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.874409,0.000000,17.958234>}
box{<0,0,-0.050800><0.101684,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.874409,0.000000,17.958234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.874409,0.000000,17.958234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.467663,0.000000,17.551484>}
box{<0,0,-0.050800><0.575229,0.036000,0.050800> rotate<0,-44.997250,0> translate<1.467663,0.000000,17.551484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.467663,0.000000,17.551484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.467663,0.000000,17.449800>}
box{<0,0,-0.050800><0.101684,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.467663,0.000000,17.449800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,15.519919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,14.909800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.685800,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,14.909800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,15.011484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.990859,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,15.011484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,15.418234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.092547,0.000000,15.418234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,15.418234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,15.519919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.990859,0.000000,15.519919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,15.519919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,15.519919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,15.519919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,15.418234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,15.519919>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.340663,0.000000,15.418234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,15.519919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,15.519919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,15.519919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,15.519919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,15.418234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<1.645722,0.000000,15.519919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,15.418234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,15.316547>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.747409,0.000000,15.316547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,15.316547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,15.214859>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.645722,0.000000,15.214859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,15.214859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,15.113172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<1.645722,0.000000,15.214859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,15.113172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,15.011484>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.747409,0.000000,15.011484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,15.011484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,14.909800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<1.645722,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,14.909800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,15.011484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<1.340663,0.000000,15.011484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,15.011484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,15.113172>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,90.000000,0> translate<1.340663,0.000000,15.113172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,15.113172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,15.214859>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.997911,0> translate<1.340663,0.000000,15.113172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,15.214859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,15.316547>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.997911,0> translate<1.340663,0.000000,15.316547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,15.316547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,15.418234>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,90.000000,0> translate<1.340663,0.000000,15.418234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,15.214859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,15.214859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,15.214859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,12.979919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,12.369800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.685800,0.000000,12.369800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,12.369800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,12.369800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,12.369800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,12.369800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,12.471484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.990859,0.000000,12.369800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,12.471484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,12.878234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.092547,0.000000,12.878234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,12.878234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,12.979919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.990859,0.000000,12.979919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,12.979919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,12.979919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.685800,0.000000,12.979919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,12.471484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,12.369800>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<1.340663,0.000000,12.471484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,12.369800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,12.369800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,12.369800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,12.369800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,12.471484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<1.645722,0.000000,12.369800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,12.471484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,12.878234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.747409,0.000000,12.878234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,12.878234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,12.979919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<1.645722,0.000000,12.979919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,12.979919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,12.979919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,12.979919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,12.979919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,12.878234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.340663,0.000000,12.878234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,12.878234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,12.776547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.340663,0.000000,12.776547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,12.776547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,12.674859>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.997911,0> translate<1.340663,0.000000,12.776547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,12.674859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,12.674859>}
box{<0,0,-0.050800><0.305063,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,12.674859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,10.439919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,9.829800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.431800,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,9.829800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.431800,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,9.931484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.736859,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,9.931484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,10.338234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<0.838547,0.000000,10.338234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,10.338234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,10.439919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.736859,0.000000,10.439919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,10.439919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,10.439919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.431800,0.000000,10.439919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.086663,0.000000,10.236547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.290034,0.000000,10.439919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.086663,0.000000,10.236547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.290034,0.000000,10.439919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.290034,0.000000,9.829800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.290034,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.086663,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.493409,0.000000,9.829800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.086663,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.741525,0.000000,9.931484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.741525,0.000000,10.338234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.741525,0.000000,10.338234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.741525,0.000000,10.338234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.843209,0.000000,10.439919>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.741525,0.000000,10.338234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.843209,0.000000,10.439919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.046584,0.000000,10.439919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.843209,0.000000,10.439919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.046584,0.000000,10.439919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,10.338234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<2.046584,0.000000,10.439919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,10.338234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,9.931484>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.148272,0.000000,9.931484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,9.931484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.046584,0.000000,9.829800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<2.046584,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.046584,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.843209,0.000000,9.829800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.843209,0.000000,9.829800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.843209,0.000000,9.829800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.741525,0.000000,9.931484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<1.741525,0.000000,9.931484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.741525,0.000000,9.931484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,10.338234>}
box{<0,0,-0.050800><0.575229,0.036000,0.050800> rotate<0,-44.997250,0> translate<1.741525,0.000000,9.931484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,7.899919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,7.289800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.431800,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,7.289800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,7.289800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.431800,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,7.289800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,7.391484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.736859,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,7.391484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,7.798234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<0.838547,0.000000,7.798234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,7.798234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,7.899919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.736859,0.000000,7.899919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,7.899919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,7.899919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.431800,0.000000,7.899919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.086663,0.000000,7.696547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.290034,0.000000,7.899919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.086663,0.000000,7.696547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.290034,0.000000,7.899919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.290034,0.000000,7.289800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.290034,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.086663,0.000000,7.289800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.493409,0.000000,7.289800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.086663,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.741525,0.000000,7.696547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.944897,0.000000,7.899919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.741525,0.000000,7.696547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.944897,0.000000,7.899919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.944897,0.000000,7.289800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.944897,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.741525,0.000000,7.289800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,7.289800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.741525,0.000000,7.289800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,5.359919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,4.749800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.431800,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,4.749800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,4.749800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.431800,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,4.749800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,4.851484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.736859,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,4.851484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,5.258234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<0.838547,0.000000,5.258234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.838547,0.000000,5.258234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,5.359919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.736859,0.000000,5.359919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.736859,0.000000,5.359919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.431800,0.000000,5.359919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<0.431800,0.000000,5.359919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.086663,0.000000,5.156547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.290034,0.000000,5.359919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.086663,0.000000,5.156547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.290034,0.000000,5.359919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.290034,0.000000,4.749800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.290034,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.086663,0.000000,4.749800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.493409,0.000000,4.749800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.086663,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,4.749800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.741525,0.000000,4.749800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<1.741525,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.741525,0.000000,4.749800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,5.156547>}
box{<0,0,-0.050800><0.575227,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.741525,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,5.156547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,5.258234>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,90.000000,0> translate<2.148272,0.000000,5.258234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.148272,0.000000,5.258234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.046584,0.000000,5.359919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<2.046584,0.000000,5.359919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.046584,0.000000,5.359919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.843209,0.000000,5.359919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.843209,0.000000,5.359919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.843209,0.000000,5.359919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.741525,0.000000,5.258234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.741525,0.000000,5.258234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.544800,0.000000,5.359919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.544800,0.000000,4.749800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.544800,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.544800,0.000000,4.749800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,4.749800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<15.544800,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,4.749800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,4.851484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<15.849859,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,4.851484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,5.258234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<15.951547,0.000000,5.258234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,5.258234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,5.359919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<15.849859,0.000000,5.359919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,5.359919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.544800,0.000000,5.359919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<15.544800,0.000000,5.359919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199663,0.000000,5.156547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.403034,0.000000,5.359919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.199663,0.000000,5.156547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.403034,0.000000,5.359919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.403034,0.000000,4.749800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.403034,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199663,0.000000,4.749800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.606409,0.000000,4.749800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<16.199663,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.854525,0.000000,5.258234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.956209,0.000000,5.359919>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.854525,0.000000,5.258234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.956209,0.000000,5.359919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,5.359919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.956209,0.000000,5.359919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,5.359919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,5.258234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<17.159584,0.000000,5.359919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,5.258234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,5.156547>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.261272,0.000000,5.156547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,5.156547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,5.054859>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,-44.997030,0> translate<17.159584,0.000000,5.054859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,5.054859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.057897,0.000000,5.054859>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,0.000000,0> translate<17.057897,0.000000,5.054859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,5.054859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,4.953172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<17.159584,0.000000,5.054859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,4.953172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,4.851484>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.261272,0.000000,4.851484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,4.851484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,4.749800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<17.159584,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,4.749800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.956209,0.000000,4.749800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.956209,0.000000,4.749800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.956209,0.000000,4.749800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.854525,0.000000,4.851484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<16.854525,0.000000,4.851484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.544800,0.000000,7.671234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.646484,0.000000,7.772919>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.544800,0.000000,7.671234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.646484,0.000000,7.772919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,7.772919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<15.646484,0.000000,7.772919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,7.772919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,7.671234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<15.849859,0.000000,7.772919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,7.671234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,7.569547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.951547,0.000000,7.569547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,7.569547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,7.467859>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.849859,0.000000,7.467859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,7.467859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.748172,0.000000,7.467859>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,0.000000,0> translate<15.748172,0.000000,7.467859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,7.467859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,7.366172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<15.849859,0.000000,7.467859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,7.366172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,7.264484>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.951547,0.000000,7.264484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,7.264484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,7.162800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<15.849859,0.000000,7.162800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,7.162800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.646484,0.000000,7.162800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<15.646484,0.000000,7.162800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.646484,0.000000,7.162800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.544800,0.000000,7.264484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<15.544800,0.000000,7.264484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199663,0.000000,7.772919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199663,0.000000,7.366172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.199663,0.000000,7.366172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199663,0.000000,7.366172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.403034,0.000000,7.162800>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,44.997030,0> translate<16.199663,0.000000,7.366172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.403034,0.000000,7.162800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.606409,0.000000,7.366172>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,-44.996590,0> translate<16.403034,0.000000,7.162800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.606409,0.000000,7.366172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.606409,0.000000,7.772919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,90.000000,0> translate<16.606409,0.000000,7.772919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.854525,0.000000,7.671234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.956209,0.000000,7.772919>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.854525,0.000000,7.671234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.956209,0.000000,7.772919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,7.772919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.956209,0.000000,7.772919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,7.772919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,7.671234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<17.159584,0.000000,7.772919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,7.671234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,7.569547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.261272,0.000000,7.569547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,7.569547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,7.467859>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,-44.997030,0> translate<17.159584,0.000000,7.467859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,7.467859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.057897,0.000000,7.467859>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,0.000000,0> translate<17.057897,0.000000,7.467859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,7.467859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,7.366172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<17.159584,0.000000,7.467859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,7.366172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,7.264484>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.261272,0.000000,7.264484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,7.264484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,7.162800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<17.159584,0.000000,7.162800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,7.162800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.956209,0.000000,7.162800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.956209,0.000000,7.162800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.956209,0.000000,7.162800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.854525,0.000000,7.264484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<16.854525,0.000000,7.264484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,9.702800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,10.312919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<15.671800,0.000000,10.312919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,10.312919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,10.312919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<15.671800,0.000000,10.312919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,10.312919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,10.211234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<15.976859,0.000000,10.312919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,10.211234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,10.007859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.078547,0.000000,10.007859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,10.007859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,9.906172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.976859,0.000000,9.906172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,9.906172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,9.906172>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<15.671800,0.000000,9.906172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.875172,0.000000,9.906172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,9.702800>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,44.996590,0> translate<15.875172,0.000000,9.906172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.733409,0.000000,10.312919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,10.312919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<16.326663,0.000000,10.312919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,10.312919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,9.702800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.326663,0.000000,9.702800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,9.702800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.733409,0.000000,9.702800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<16.326663,0.000000,9.702800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,10.007859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.530034,0.000000,10.007859>}
box{<0,0,-0.050800><0.203372,0.036000,0.050800> rotate<0,0.000000,0> translate<16.326663,0.000000,10.007859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.981525,0.000000,9.702800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.981525,0.000000,10.312919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<16.981525,0.000000,10.312919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.981525,0.000000,10.312919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.388272,0.000000,10.312919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<16.981525,0.000000,10.312919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.981525,0.000000,10.007859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.184897,0.000000,10.007859>}
box{<0,0,-0.050800><0.203372,0.036000,0.050800> rotate<0,0.000000,0> translate<16.981525,0.000000,10.007859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,12.369800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,12.776547>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,90.000000,0> translate<15.925800,0.000000,12.776547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,12.776547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,12.979919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.925800,0.000000,12.776547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,12.979919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,12.776547>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,44.996590,0> translate<16.129172,0.000000,12.979919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,12.776547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,12.369800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.332547,0.000000,12.369800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,12.674859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,12.674859>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<15.925800,0.000000,12.674859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,12.471484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,12.878234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<16.580663,0.000000,12.878234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,12.878234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,12.979919>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.580663,0.000000,12.878234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,12.979919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,12.979919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.682347,0.000000,12.979919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,12.979919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,12.878234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<16.885722,0.000000,12.979919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,12.878234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,12.471484>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.987409,0.000000,12.471484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,12.471484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,12.369800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<16.885722,0.000000,12.369800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,12.369800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,12.369800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.682347,0.000000,12.369800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,12.369800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,12.471484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<16.580663,0.000000,12.471484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,12.471484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,12.878234>}
box{<0,0,-0.050800><0.575229,0.036000,0.050800> rotate<0,-44.997250,0> translate<16.580663,0.000000,12.471484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,15.316547>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,90.000000,0> translate<15.925800,0.000000,15.316547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,15.316547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,15.519919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.925800,0.000000,15.316547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,15.519919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,15.316547>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,44.996590,0> translate<16.129172,0.000000,15.519919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,15.316547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,14.909800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.332547,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,15.214859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,15.214859>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<15.925800,0.000000,15.214859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,15.316547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.784034,0.000000,15.519919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.580663,0.000000,15.316547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.784034,0.000000,15.519919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.784034,0.000000,14.909800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.784034,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,14.909800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,14.909800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<16.580663,0.000000,14.909800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,17.449800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,17.856547>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,90.000000,0> translate<15.925800,0.000000,17.856547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,17.856547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,18.059919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.925800,0.000000,17.856547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,18.059919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,17.856547>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,44.996590,0> translate<16.129172,0.000000,18.059919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,17.856547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,17.449800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.332547,0.000000,17.449800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,17.754859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,17.754859>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<15.925800,0.000000,17.754859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,17.449800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,17.449800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<16.580663,0.000000,17.449800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,17.449800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,17.856547>}
box{<0,0,-0.050800><0.575227,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.580663,0.000000,17.449800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,17.856547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,17.958234>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,90.000000,0> translate<16.987409,0.000000,17.958234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,17.958234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,18.059919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<16.885722,0.000000,18.059919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,18.059919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,18.059919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.682347,0.000000,18.059919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,18.059919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,17.958234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.580663,0.000000,17.958234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,20.396547>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,90.000000,0> translate<15.925800,0.000000,20.396547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,20.396547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,20.599919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.925800,0.000000,20.396547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,20.599919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,20.396547>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,44.996590,0> translate<16.129172,0.000000,20.599919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,20.396547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,19.989800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.332547,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,20.294859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,20.294859>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<15.925800,0.000000,20.294859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,20.498234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,20.599919>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.580663,0.000000,20.498234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,20.599919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,20.599919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.682347,0.000000,20.599919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,20.599919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,20.498234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<16.885722,0.000000,20.599919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,20.498234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,20.396547>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.987409,0.000000,20.396547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,20.396547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,20.294859>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.885722,0.000000,20.294859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,20.294859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.784034,0.000000,20.294859>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,0.000000,0> translate<16.784034,0.000000,20.294859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,20.294859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,20.193172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<16.885722,0.000000,20.294859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,20.193172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,20.091484>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.987409,0.000000,20.091484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,20.091484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,19.989800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<16.885722,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,19.989800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.682347,0.000000,19.989800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,19.989800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,20.091484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<16.580663,0.000000,20.091484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.798800,0.000000,22.529800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.798800,0.000000,22.936547>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,90.000000,0> translate<15.798800,0.000000,22.936547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.798800,0.000000,22.936547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.002172,0.000000,23.139919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.798800,0.000000,22.936547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.002172,0.000000,23.139919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.205547,0.000000,22.936547>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,44.996590,0> translate<16.002172,0.000000,23.139919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.205547,0.000000,22.936547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.205547,0.000000,22.529800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.205547,0.000000,22.529800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.798800,0.000000,22.834859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.205547,0.000000,22.834859>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<15.798800,0.000000,22.834859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.758722,0.000000,22.529800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.758722,0.000000,23.139919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<16.758722,0.000000,23.139919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.758722,0.000000,23.139919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.453663,0.000000,22.834859>}
box{<0,0,-0.050800><0.431419,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.453663,0.000000,22.834859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.453663,0.000000,22.834859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.860409,0.000000,22.834859>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<16.453663,0.000000,22.834859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,25.069800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,25.476547>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,90.000000,0> translate<15.925800,0.000000,25.476547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,25.476547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,25.679919>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.925800,0.000000,25.476547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,25.679919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,25.476547>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,44.996590,0> translate<16.129172,0.000000,25.679919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,25.476547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,25.069800>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.332547,0.000000,25.069800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,25.374859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,25.374859>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<15.925800,0.000000,25.374859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,25.679919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,25.679919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<16.580663,0.000000,25.679919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,25.679919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,25.374859>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.580663,0.000000,25.374859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,25.374859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.784034,0.000000,25.476547>}
box{<0,0,-0.050800><0.227377,0.036000,0.050800> rotate<0,-26.563650,0> translate<16.580663,0.000000,25.374859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.784034,0.000000,25.476547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,25.476547>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,0.000000,0> translate<16.784034,0.000000,25.476547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,25.476547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,25.374859>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<16.885722,0.000000,25.476547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,25.374859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,25.171484>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.987409,0.000000,25.171484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,25.171484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,25.069800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<16.885722,0.000000,25.069800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,25.069800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,25.069800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.682347,0.000000,25.069800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,25.069800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,25.171484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<16.580663,0.000000,25.171484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,27.609800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,28.219919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<15.925800,0.000000,28.219919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,28.219919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,27.609800>}
box{<0,0,-0.050800><0.733272,0.036000,0.050800> rotate<0,56.306149,0> translate<15.925800,0.000000,28.219919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,27.609800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,28.219919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<16.332547,0.000000,28.219919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,28.118234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,28.219919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<16.885722,0.000000,28.219919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,28.219919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,28.219919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.682347,0.000000,28.219919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,28.219919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,28.118234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.580663,0.000000,28.118234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,28.118234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,27.711484>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.580663,0.000000,27.711484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,27.711484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,27.609800>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<16.580663,0.000000,27.711484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.682347,0.000000,27.609800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,27.609800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.682347,0.000000,27.609800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.885722,0.000000,27.609800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,27.711484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<16.885722,0.000000,27.609800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.052800,0.000000,30.149800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.052800,0.000000,30.759919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<16.052800,0.000000,30.759919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.052800,0.000000,30.759919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.459547,0.000000,30.149800>}
box{<0,0,-0.050800><0.733272,0.036000,0.050800> rotate<0,56.306149,0> translate<16.052800,0.000000,30.759919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.459547,0.000000,30.149800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.459547,0.000000,30.759919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<16.459547,0.000000,30.759919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.114409,0.000000,30.658234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.012722,0.000000,30.759919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<17.012722,0.000000,30.759919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.012722,0.000000,30.759919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.809347,0.000000,30.759919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.809347,0.000000,30.759919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.809347,0.000000,30.759919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.707663,0.000000,30.658234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.707663,0.000000,30.658234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.707663,0.000000,30.658234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.707663,0.000000,30.251484>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.707663,0.000000,30.251484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.707663,0.000000,30.251484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.809347,0.000000,30.149800>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<16.707663,0.000000,30.251484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.809347,0.000000,30.149800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.012722,0.000000,30.149800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.809347,0.000000,30.149800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.012722,0.000000,30.149800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.114409,0.000000,30.251484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<17.012722,0.000000,30.149800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,33.299919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,33.299919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<15.925800,0.000000,33.299919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,33.299919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,32.994859>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.925800,0.000000,32.994859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,32.994859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,33.096547>}
box{<0,0,-0.050800><0.227377,0.036000,0.050800> rotate<0,-26.563650,0> translate<15.925800,0.000000,32.994859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.129172,0.000000,33.096547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.230859,0.000000,33.096547>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,0.000000,0> translate<16.129172,0.000000,33.096547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.230859,0.000000,33.096547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,32.994859>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<16.230859,0.000000,33.096547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,32.994859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,32.791484>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.332547,0.000000,32.791484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.332547,0.000000,32.791484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.230859,0.000000,32.689800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<16.230859,0.000000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.230859,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.027484,0.000000,32.689800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.027484,0.000000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.027484,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.925800,0.000000,32.791484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<15.925800,0.000000,32.791484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,33.299919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,32.893172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.580663,0.000000,32.893172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.580663,0.000000,32.893172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.784034,0.000000,32.689800>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,44.997030,0> translate<16.580663,0.000000,32.893172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.784034,0.000000,32.689800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,32.893172>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,-44.996590,0> translate<16.784034,0.000000,32.689800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,32.893172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.987409,0.000000,33.299919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,90.000000,0> translate<16.987409,0.000000,33.299919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,35.839919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<15.671800,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,35.839919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,35.839919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<15.671800,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,35.839919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,35.738234>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<15.976859,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,35.738234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,35.534859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.078547,0.000000,35.534859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,35.534859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,35.433172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.976859,0.000000,35.433172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,35.433172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,35.433172>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<15.671800,0.000000,35.433172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.875172,0.000000,35.433172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,35.229800>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,44.996590,0> translate<15.875172,0.000000,35.433172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.733409,0.000000,35.738234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.631722,0.000000,35.839919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<16.631722,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.631722,0.000000,35.839919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,35.839919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.428347,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,35.839919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,35.738234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.326663,0.000000,35.738234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,35.738234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,35.636547>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.326663,0.000000,35.636547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,35.636547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,35.534859>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.997911,0> translate<16.326663,0.000000,35.636547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,35.534859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.631722,0.000000,35.534859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.428347,0.000000,35.534859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.631722,0.000000,35.534859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.733409,0.000000,35.433172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<16.631722,0.000000,35.534859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.733409,0.000000,35.433172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.733409,0.000000,35.331484>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.733409,0.000000,35.331484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.733409,0.000000,35.331484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.631722,0.000000,35.229800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<16.631722,0.000000,35.229800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.631722,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,35.229800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.428347,0.000000,35.229800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,35.331484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<16.326663,0.000000,35.331484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.184897,0.000000,35.229800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.184897,0.000000,35.839919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<17.184897,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.981525,0.000000,35.839919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.388272,0.000000,35.839919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<16.981525,0.000000,35.839919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,38.278234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,38.379919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<15.849859,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,38.379919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.646484,0.000000,38.379919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<15.646484,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.646484,0.000000,38.379919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.544800,0.000000,38.278234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.544800,0.000000,38.278234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.544800,0.000000,38.278234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.544800,0.000000,37.871484>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.544800,0.000000,37.871484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.544800,0.000000,37.871484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.646484,0.000000,37.769800>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<15.544800,0.000000,37.871484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.646484,0.000000,37.769800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,37.769800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<15.646484,0.000000,37.769800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.849859,0.000000,37.769800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,37.871484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<15.849859,0.000000,37.769800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,37.871484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,38.074859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,90.000000,0> translate<15.951547,0.000000,38.074859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.951547,0.000000,38.074859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.748172,0.000000,38.074859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<15.748172,0.000000,38.074859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199663,0.000000,37.769800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199663,0.000000,38.379919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<16.199663,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.199663,0.000000,38.379919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.606409,0.000000,37.769800>}
box{<0,0,-0.050800><0.733272,0.036000,0.050800> rotate<0,56.306149,0> translate<16.199663,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.606409,0.000000,37.769800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.606409,0.000000,38.379919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<16.606409,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.854525,0.000000,38.379919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.854525,0.000000,37.769800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.854525,0.000000,37.769800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.854525,0.000000,37.769800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,37.769800>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<16.854525,0.000000,37.769800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,37.769800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,37.871484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<17.159584,0.000000,37.769800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,37.871484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,38.278234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<17.261272,0.000000,38.278234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.261272,0.000000,38.278234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,38.379919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<17.159584,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.159584,0.000000,38.379919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.854525,0.000000,38.379919>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<16.854525,0.000000,38.379919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,40.919919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,40.513172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.671800,0.000000,40.513172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,40.513172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.875172,0.000000,40.309800>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,44.997030,0> translate<15.671800,0.000000,40.513172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.875172,0.000000,40.309800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,40.513172>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,-44.996590,0> translate<15.875172,0.000000,40.309800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,40.513172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,40.919919>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,90.000000,0> translate<16.078547,0.000000,40.919919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,40.309800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.530034,0.000000,40.309800>}
box{<0,0,-0.050800><0.203372,0.036000,0.050800> rotate<0,0.000000,0> translate<16.326663,0.000000,40.309800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,40.309800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,40.919919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<16.428347,0.000000,40.919919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,40.919919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.530034,0.000000,40.919919>}
box{<0,0,-0.050800><0.203372,0.036000,0.050800> rotate<0,0.000000,0> translate<16.326663,0.000000,40.919919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.763238,0.000000,40.309800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.763238,0.000000,40.919919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<16.763238,0.000000,40.919919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.763238,0.000000,40.919919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.169984,0.000000,40.309800>}
box{<0,0,-0.050800><0.733272,0.036000,0.050800> rotate<0,56.306149,0> translate<16.763238,0.000000,40.919919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.169984,0.000000,40.309800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.169984,0.000000,40.919919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<17.169984,0.000000,40.919919> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,42.003625>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.320113,0.000000,42.291738>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,-44.997030,0> translate<2.032000,0.000000,42.003625> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.320113,0.000000,42.291738>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.320113,0.000000,41.427400>}
box{<0,0,-0.076200><0.864338,0.036000,0.076200> rotate<0,-90.000000,0> translate<2.320113,0.000000,41.427400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.032000,0.000000,41.427400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.608225,0.000000,41.427400>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<2.032000,0.000000,41.427400> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.569700,0.000000,38.417500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.798494,0.000000,38.417500>}
box{<0,0,-0.063500><0.228794,0.036000,0.063500> rotate<0,0.000000,0> translate<11.569700,0.000000,38.417500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684097,0.000000,38.417500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684097,0.000000,39.103884>}
box{<0,0,-0.063500><0.686384,0.036000,0.063500> rotate<0,90.000000,0> translate<11.684097,0.000000,39.103884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.569700,0.000000,39.103884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.798494,0.000000,39.103884>}
box{<0,0,-0.063500><0.228794,0.036000,0.063500> rotate<0,0.000000,0> translate<11.569700,0.000000,39.103884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.526234,0.000000,38.989488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.411834,0.000000,39.103884>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,44.996248,0> translate<12.411834,0.000000,39.103884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.411834,0.000000,39.103884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.183041,0.000000,39.103884>}
box{<0,0,-0.063500><0.228794,0.036000,0.063500> rotate<0,0.000000,0> translate<12.183041,0.000000,39.103884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.183041,0.000000,39.103884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.068644,0.000000,38.989488>}
box{<0,0,-0.063500><0.161782,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.068644,0.000000,38.989488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.068644,0.000000,38.989488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.068644,0.000000,38.531897>}
box{<0,0,-0.063500><0.457591,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.068644,0.000000,38.531897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.068644,0.000000,38.531897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.183041,0.000000,38.417500>}
box{<0,0,-0.063500><0.161782,0.036000,0.063500> rotate<0,44.997030,0> translate<12.068644,0.000000,38.531897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.183041,0.000000,38.417500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.411834,0.000000,38.417500>}
box{<0,0,-0.063500><0.228794,0.036000,0.063500> rotate<0,0.000000,0> translate<12.183041,0.000000,38.417500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.411834,0.000000,38.417500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.526234,0.000000,38.531897>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,-44.996248,0> translate<12.411834,0.000000,38.417500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.274650,0.000000,38.989488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.160250,0.000000,39.103884>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,44.996248,0> translate<13.160250,0.000000,39.103884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.160250,0.000000,39.103884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.931456,0.000000,39.103884>}
box{<0,0,-0.063500><0.228794,0.036000,0.063500> rotate<0,0.000000,0> translate<12.931456,0.000000,39.103884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.931456,0.000000,39.103884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.817059,0.000000,38.989488>}
box{<0,0,-0.063500><0.161782,0.036000,0.063500> rotate<0,-44.997030,0> translate<12.817059,0.000000,38.989488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.817059,0.000000,38.989488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.817059,0.000000,38.875091>}
box{<0,0,-0.063500><0.114397,0.036000,0.063500> rotate<0,-90.000000,0> translate<12.817059,0.000000,38.875091> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.817059,0.000000,38.875091>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.931456,0.000000,38.760691>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,44.997813,0> translate<12.817059,0.000000,38.875091> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.931456,0.000000,38.760691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.160250,0.000000,38.760691>}
box{<0,0,-0.063500><0.228794,0.036000,0.063500> rotate<0,0.000000,0> translate<12.931456,0.000000,38.760691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.160250,0.000000,38.760691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.274650,0.000000,38.646294>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,44.996248,0> translate<13.160250,0.000000,38.760691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.274650,0.000000,38.646294>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.274650,0.000000,38.531897>}
box{<0,0,-0.063500><0.114397,0.036000,0.063500> rotate<0,-90.000000,0> translate<13.274650,0.000000,38.531897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.274650,0.000000,38.531897>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.160250,0.000000,38.417500>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,-44.996248,0> translate<13.160250,0.000000,38.417500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.160250,0.000000,38.417500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.931456,0.000000,38.417500>}
box{<0,0,-0.063500><0.228794,0.036000,0.063500> rotate<0,0.000000,0> translate<12.931456,0.000000,38.417500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.931456,0.000000,38.417500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<12.817059,0.000000,38.531897>}
box{<0,0,-0.063500><0.161782,0.036000,0.063500> rotate<0,44.997030,0> translate<12.817059,0.000000,38.531897> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.565475,0.000000,38.417500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.565475,0.000000,39.103884>}
box{<0,0,-0.063500><0.686384,0.036000,0.063500> rotate<0,90.000000,0> translate<13.565475,0.000000,39.103884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.565475,0.000000,39.103884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.908666,0.000000,39.103884>}
box{<0,0,-0.063500><0.343191,0.036000,0.063500> rotate<0,0.000000,0> translate<13.565475,0.000000,39.103884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.908666,0.000000,39.103884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.023066,0.000000,38.989488>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,44.996248,0> translate<13.908666,0.000000,39.103884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.023066,0.000000,38.989488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.023066,0.000000,38.760691>}
box{<0,0,-0.063500><0.228797,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.023066,0.000000,38.760691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.023066,0.000000,38.760691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.908666,0.000000,38.646294>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,-44.996248,0> translate<13.908666,0.000000,38.646294> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.908666,0.000000,38.646294>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.565475,0.000000,38.646294>}
box{<0,0,-0.063500><0.343191,0.036000,0.063500> rotate<0,0.000000,0> translate<13.565475,0.000000,38.646294> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.048500,0.000000,33.312294>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,33.312294>}
box{<0,0,-0.063500><0.686384,0.036000,0.063500> rotate<0,0.000000,0> translate<6.362116,0.000000,33.312294> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,33.083500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,33.541091>}
box{<0,0,-0.063500><0.457591,0.036000,0.063500> rotate<0,90.000000,0> translate<6.362116,0.000000,33.541091> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,33.831916>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.048500,0.000000,34.289506>}
box{<0,0,-0.063500><0.824932,0.036000,0.063500> rotate<0,-33.687904,0> translate<6.362116,0.000000,33.831916> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,34.289506>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.048500,0.000000,33.831916>}
box{<0,0,-0.063500><0.824932,0.036000,0.063500> rotate<0,33.687904,0> translate<6.362116,0.000000,34.289506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.048500,0.000000,34.988500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,34.988500>}
box{<0,0,-0.063500><0.686384,0.036000,0.063500> rotate<0,0.000000,0> translate<6.362116,0.000000,34.988500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,34.988500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,35.331691>}
box{<0,0,-0.063500><0.343191,0.036000,0.063500> rotate<0,90.000000,0> translate<6.362116,0.000000,35.331691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,35.331691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.476513,0.000000,35.446091>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,-44.997813,0> translate<6.362116,0.000000,35.331691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.476513,0.000000,35.446091>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.705309,0.000000,35.446091>}
box{<0,0,-0.063500><0.228797,0.036000,0.063500> rotate<0,0.000000,0> translate<6.476513,0.000000,35.446091> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.705309,0.000000,35.446091>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.819706,0.000000,35.331691>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,44.997813,0> translate<6.705309,0.000000,35.446091> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.819706,0.000000,35.331691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.819706,0.000000,34.988500>}
box{<0,0,-0.063500><0.343191,0.036000,0.063500> rotate<0,-90.000000,0> translate<6.819706,0.000000,34.988500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.819706,0.000000,35.217294>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.048500,0.000000,35.446091>}
box{<0,0,-0.063500><0.323565,0.036000,0.063500> rotate<0,-44.997421,0> translate<6.819706,0.000000,35.217294> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,35.736916>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.048500,0.000000,36.194506>}
box{<0,0,-0.063500><0.824932,0.036000,0.063500> rotate<0,-33.687904,0> translate<6.362116,0.000000,35.736916> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.362116,0.000000,36.194506>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.048500,0.000000,35.736916>}
box{<0,0,-0.063500><0.824932,0.036000,0.063500> rotate<0,33.687904,0> translate<6.362116,0.000000,36.194506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.969500,-1.536000,1.587500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.969500,-1.536000,2.273884>}
box{<0,0,-0.063500><0.686384,0.036000,0.063500> rotate<0,90.000000,0> translate<9.969500,-1.536000,2.273884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.969500,-1.536000,2.273884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.626309,-1.536000,2.273884>}
box{<0,0,-0.063500><0.343191,0.036000,0.063500> rotate<0,0.000000,0> translate<9.626309,-1.536000,2.273884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.626309,-1.536000,2.273884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.511909,-1.536000,2.159488>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,-44.996248,0> translate<9.511909,-1.536000,2.159488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.511909,-1.536000,2.159488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.511909,-1.536000,1.930691>}
box{<0,0,-0.063500><0.228797,0.036000,0.063500> rotate<0,-90.000000,0> translate<9.511909,-1.536000,1.930691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.511909,-1.536000,1.930691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.626309,-1.536000,1.816294>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,44.996248,0> translate<9.511909,-1.536000,1.930691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.626309,-1.536000,1.816294>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.969500,-1.536000,1.816294>}
box{<0,0,-0.063500><0.343191,0.036000,0.063500> rotate<0,0.000000,0> translate<9.626309,-1.536000,1.816294> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.221084,-1.536000,2.273884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.221084,-1.536000,1.587500>}
box{<0,0,-0.063500><0.686384,0.036000,0.063500> rotate<0,-90.000000,0> translate<9.221084,-1.536000,1.587500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.221084,-1.536000,1.587500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.992291,-1.536000,1.816294>}
box{<0,0,-0.063500><0.323563,0.036000,0.063500> rotate<0,44.997030,0> translate<8.992291,-1.536000,1.816294> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.992291,-1.536000,1.816294>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.763494,-1.536000,1.587500>}
box{<0,0,-0.063500><0.323565,0.036000,0.063500> rotate<0,-44.996639,0> translate<8.763494,-1.536000,1.587500> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.763494,-1.536000,1.587500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.763494,-1.536000,2.273884>}
box{<0,0,-0.063500><0.686384,0.036000,0.063500> rotate<0,90.000000,0> translate<8.763494,-1.536000,2.273884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.472669,-1.536000,1.587500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.472669,-1.536000,2.273884>}
box{<0,0,-0.063500><0.686384,0.036000,0.063500> rotate<0,90.000000,0> translate<8.472669,-1.536000,2.273884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.472669,-1.536000,2.273884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.129478,-1.536000,2.273884>}
box{<0,0,-0.063500><0.343191,0.036000,0.063500> rotate<0,0.000000,0> translate<8.129478,-1.536000,2.273884> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.129478,-1.536000,2.273884>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.015078,-1.536000,2.159488>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,-44.996248,0> translate<8.015078,-1.536000,2.159488> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.015078,-1.536000,2.159488>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.015078,-1.536000,1.930691>}
box{<0,0,-0.063500><0.228797,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.015078,-1.536000,1.930691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.015078,-1.536000,1.930691>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.129478,-1.536000,1.816294>}
box{<0,0,-0.063500><0.161784,0.036000,0.063500> rotate<0,44.996248,0> translate<8.015078,-1.536000,1.930691> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.129478,-1.536000,1.816294>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.472669,-1.536000,1.816294>}
box{<0,0,-0.063500><0.343191,0.036000,0.063500> rotate<0,0.000000,0> translate<8.129478,-1.536000,1.816294> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.243875,-1.536000,1.816294>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.015078,-1.536000,1.587500>}
box{<0,0,-0.063500><0.323565,0.036000,0.063500> rotate<0,-44.996639,0> translate<8.015078,-1.536000,1.587500> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.712200,0.000000,15.799538>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.712200,0.000000,14.935200>}
box{<0,0,-0.076200><0.864338,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.712200,0.000000,14.935200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.712200,0.000000,14.935200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.288425,0.000000,14.935200>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<8.712200,0.000000,14.935200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.071947,0.000000,1.879600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.665200,0.000000,1.879600>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<13.665200,0.000000,1.879600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.665200,0.000000,1.879600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.071947,0.000000,2.286347>}
box{<0,0,-0.050800><0.575227,0.036000,0.050800> rotate<0,-44.997030,0> translate<13.665200,0.000000,1.879600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.071947,0.000000,2.286347>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.071947,0.000000,2.388034>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,90.000000,0> translate<14.071947,0.000000,2.388034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.071947,0.000000,2.388034>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.970259,0.000000,2.489719>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<13.970259,0.000000,2.489719> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.970259,0.000000,2.489719>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.766884,0.000000,2.489719>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<13.766884,0.000000,2.489719> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.766884,0.000000,2.489719>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.665200,0.000000,2.388034>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<13.665200,0.000000,2.388034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.320063,0.000000,1.981284>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.320063,0.000000,2.388034>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<14.320063,0.000000,2.388034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.320063,0.000000,2.388034>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.421747,0.000000,2.489719>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.320063,0.000000,2.388034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.421747,0.000000,2.489719>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.625122,0.000000,2.489719>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<14.421747,0.000000,2.489719> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.625122,0.000000,2.489719>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.726809,0.000000,2.388034>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<14.625122,0.000000,2.489719> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.726809,0.000000,2.388034>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.726809,0.000000,1.981284>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.726809,0.000000,1.981284> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.726809,0.000000,1.981284>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.625122,0.000000,1.879600>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<14.625122,0.000000,1.879600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.625122,0.000000,1.879600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.421747,0.000000,1.879600>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<14.421747,0.000000,1.879600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.421747,0.000000,1.879600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.320063,0.000000,1.981284>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<14.320063,0.000000,1.981284> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.320063,0.000000,1.981284>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.726809,0.000000,2.388034>}
box{<0,0,-0.050800><0.575229,0.036000,0.050800> rotate<0,-44.997250,0> translate<14.320063,0.000000,1.981284> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.974925,0.000000,2.286347>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.178297,0.000000,2.489719>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,-44.997030,0> translate<14.974925,0.000000,2.286347> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.178297,0.000000,2.489719>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.178297,0.000000,1.879600>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.178297,0.000000,1.879600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.974925,0.000000,1.879600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.381672,0.000000,1.879600>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<14.974925,0.000000,1.879600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036534,0.000000,1.879600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.629788,0.000000,1.879600>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<15.629788,0.000000,1.879600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.629788,0.000000,1.879600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036534,0.000000,2.286347>}
box{<0,0,-0.050800><0.575227,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.629788,0.000000,1.879600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036534,0.000000,2.286347>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036534,0.000000,2.388034>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,90.000000,0> translate<16.036534,0.000000,2.388034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.036534,0.000000,2.388034>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.934847,0.000000,2.489719>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<15.934847,0.000000,2.489719> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.934847,0.000000,2.489719>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.731472,0.000000,2.489719>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<15.731472,0.000000,2.489719> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.731472,0.000000,2.489719>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.629788,0.000000,2.388034>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.629788,0.000000,2.388034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.386334,0.000000,1.879600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.386334,0.000000,2.388034>}
box{<0,0,-0.050800><0.508434,0.036000,0.050800> rotate<0,90.000000,0> translate<16.386334,0.000000,2.388034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.386334,0.000000,2.388034>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.488022,0.000000,2.489719>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<16.386334,0.000000,2.388034> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.284650,0.000000,2.184659>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.488022,0.000000,2.184659>}
box{<0,0,-0.050800><0.203372,0.036000,0.050800> rotate<0,0.000000,0> translate<16.284650,0.000000,2.184659> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.064500,0.000000,37.689503>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.581488,0.000000,37.689503>}
box{<0,0,-0.063500><0.483013,0.036000,0.063500> rotate<0,0.000000,0> translate<7.581488,0.000000,37.689503> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.581488,0.000000,37.528500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.581488,0.000000,37.850506>}
box{<0,0,-0.063500><0.322006,0.036000,0.063500> rotate<0,90.000000,0> translate<7.581488,0.000000,37.850506> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.064500,0.000000,38.089809>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.581488,0.000000,38.089809>}
box{<0,0,-0.063500><0.483013,0.036000,0.063500> rotate<0,0.000000,0> translate<7.581488,0.000000,38.089809> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.581488,0.000000,38.089809>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.742494,0.000000,38.250813>}
box{<0,0,-0.063500><0.227695,0.036000,0.063500> rotate<0,-44.996474,0> translate<7.581488,0.000000,38.089809> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.742494,0.000000,38.250813>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.581488,0.000000,38.411816>}
box{<0,0,-0.063500><0.227695,0.036000,0.063500> rotate<0,44.996474,0> translate<7.581488,0.000000,38.411816> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.581488,0.000000,38.411816>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.064500,0.000000,38.411816>}
box{<0,0,-0.063500><0.483013,0.036000,0.063500> rotate<0,0.000000,0> translate<7.581488,0.000000,38.411816> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,31.330900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,31.330900>}
box{<0,0,-0.088900><0.940603,0.036000,0.088900> rotate<0,0.000000,0> translate<9.511497,0.000000,31.330900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,31.330900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.825031,0.000000,31.644434>}
box{<0,0,-0.088900><0.443405,0.036000,0.088900> rotate<0,-44.997030,0> translate<9.511497,0.000000,31.330900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.825031,0.000000,31.644434>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,31.957969>}
box{<0,0,-0.088900><0.443405,0.036000,0.088900> rotate<0,44.997030,0> translate<9.511497,0.000000,31.957969> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,31.957969>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,31.957969>}
box{<0,0,-0.088900><0.940603,0.036000,0.088900> rotate<0,0.000000,0> translate<9.511497,0.000000,31.957969> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,32.359969>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,32.673503>}
box{<0,0,-0.088900><0.313534,0.036000,0.088900> rotate<0,90.000000,0> translate<10.452100,0.000000,32.673503> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,32.516734>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,32.516734>}
box{<0,0,-0.088900><0.940603,0.036000,0.088900> rotate<0,0.000000,0> translate<9.511497,0.000000,32.516734> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,32.359969>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,32.673503>}
box{<0,0,-0.088900><0.313534,0.036000,0.088900> rotate<0,90.000000,0> translate<9.511497,0.000000,32.673503> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.668266,0.000000,33.673084>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,33.516316>}
box{<0,0,-0.088900><0.221704,0.036000,0.088900> rotate<0,-44.997030,0> translate<9.511497,0.000000,33.516316> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,33.516316>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,33.202781>}
box{<0,0,-0.088900><0.313534,0.036000,0.088900> rotate<0,-90.000000,0> translate<9.511497,0.000000,33.202781> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,33.202781>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.668266,0.000000,33.046016>}
box{<0,0,-0.088900><0.221702,0.036000,0.088900> rotate<0,44.996459,0> translate<9.511497,0.000000,33.202781> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.668266,0.000000,33.046016>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.295334,0.000000,33.046016>}
box{<0,0,-0.088900><0.627069,0.036000,0.088900> rotate<0,0.000000,0> translate<9.668266,0.000000,33.046016> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.295334,0.000000,33.046016>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,33.202781>}
box{<0,0,-0.088900><0.221700,0.036000,0.088900> rotate<0,-44.997030,0> translate<10.295334,0.000000,33.046016> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,33.202781>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,33.516316>}
box{<0,0,-0.088900><0.313534,0.036000,0.088900> rotate<0,90.000000,0> translate<10.452100,0.000000,33.516316> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,33.516316>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.295334,0.000000,33.673084>}
box{<0,0,-0.088900><0.221702,0.036000,0.088900> rotate<0,44.997601,0> translate<10.295334,0.000000,33.673084> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,34.075084>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,34.075084>}
box{<0,0,-0.088900><0.940603,0.036000,0.088900> rotate<0,0.000000,0> translate<9.511497,0.000000,34.075084> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,34.075084>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,34.545384>}
box{<0,0,-0.088900><0.470300,0.036000,0.088900> rotate<0,90.000000,0> translate<9.511497,0.000000,34.545384> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,34.545384>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.668266,0.000000,34.702153>}
box{<0,0,-0.088900><0.221704,0.036000,0.088900> rotate<0,-44.997030,0> translate<9.511497,0.000000,34.545384> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.668266,0.000000,34.702153>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.981800,0.000000,34.702153>}
box{<0,0,-0.088900><0.313534,0.036000,0.088900> rotate<0,0.000000,0> translate<9.668266,0.000000,34.702153> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.981800,0.000000,34.702153>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.138566,0.000000,34.545384>}
box{<0,0,-0.088900><0.221702,0.036000,0.088900> rotate<0,44.997601,0> translate<9.981800,0.000000,34.702153> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.138566,0.000000,34.545384>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.138566,0.000000,34.075084>}
box{<0,0,-0.088900><0.470300,0.036000,0.088900> rotate<0,-90.000000,0> translate<10.138566,0.000000,34.075084> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.138566,0.000000,34.388619>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,34.702153>}
box{<0,0,-0.088900><0.443405,0.036000,0.088900> rotate<0,-44.997030,0> translate<10.138566,0.000000,34.388619> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,35.574453>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,35.260919>}
box{<0,0,-0.088900><0.313534,0.036000,0.088900> rotate<0,-90.000000,0> translate<9.511497,0.000000,35.260919> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,35.260919>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.668266,0.000000,35.104153>}
box{<0,0,-0.088900><0.221702,0.036000,0.088900> rotate<0,44.996459,0> translate<9.511497,0.000000,35.260919> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.668266,0.000000,35.104153>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.295334,0.000000,35.104153>}
box{<0,0,-0.088900><0.627069,0.036000,0.088900> rotate<0,0.000000,0> translate<9.668266,0.000000,35.104153> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.295334,0.000000,35.104153>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,35.260919>}
box{<0,0,-0.088900><0.221700,0.036000,0.088900> rotate<0,-44.997030,0> translate<10.295334,0.000000,35.104153> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,35.260919>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,35.574453>}
box{<0,0,-0.088900><0.313534,0.036000,0.088900> rotate<0,90.000000,0> translate<10.452100,0.000000,35.574453> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.452100,0.000000,35.574453>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.295334,0.000000,35.731222>}
box{<0,0,-0.088900><0.221702,0.036000,0.088900> rotate<0,44.997601,0> translate<10.295334,0.000000,35.731222> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<10.295334,0.000000,35.731222>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.668266,0.000000,35.731222>}
box{<0,0,-0.088900><0.627069,0.036000,0.088900> rotate<0,0.000000,0> translate<9.668266,0.000000,35.731222> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.668266,0.000000,35.731222>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<9.511497,0.000000,35.574453>}
box{<0,0,-0.088900><0.221704,0.036000,0.088900> rotate<0,-44.997030,0> translate<9.511497,0.000000,35.574453> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.692484,0.000000,10.337800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.692484,0.000000,10.947919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<2.692484,0.000000,10.947919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.895859,0.000000,10.947919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.895859,0.000000,10.337800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.895859,0.000000,10.337800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.590800,0.000000,10.744547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.895859,0.000000,10.744547>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<2.590800,0.000000,10.744547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.895859,0.000000,10.744547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.997547,0.000000,10.744547>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,0.000000,0> translate<2.895859,0.000000,10.744547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.590800,0.000000,10.541172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.997547,0.000000,10.541172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<2.590800,0.000000,10.541172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.565484,0.000000,7.670800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.565484,0.000000,8.280919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<2.565484,0.000000,8.280919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.768859,0.000000,8.280919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.768859,0.000000,7.670800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.768859,0.000000,7.670800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.463800,0.000000,8.077547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.768859,0.000000,8.077547>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<2.463800,0.000000,8.077547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.768859,0.000000,8.077547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.870547,0.000000,8.077547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,0.000000,0> translate<2.768859,0.000000,8.077547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.463800,0.000000,7.874172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.870547,0.000000,7.874172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<2.463800,0.000000,7.874172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.692484,0.000000,5.130800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.692484,0.000000,5.740919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<2.692484,0.000000,5.740919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.895859,0.000000,5.740919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.895859,0.000000,5.130800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.895859,0.000000,5.130800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.590800,0.000000,5.537547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.895859,0.000000,5.537547>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<2.590800,0.000000,5.537547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.895859,0.000000,5.537547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.997547,0.000000,5.537547>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,0.000000,0> translate<2.895859,0.000000,5.537547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.590800,0.000000,5.334172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.997547,0.000000,5.334172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<2.590800,0.000000,5.334172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.311484,0.000000,20.497800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.311484,0.000000,21.107919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<2.311484,0.000000,21.107919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,21.107919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,20.497800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.514859,0.000000,20.497800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.209800,0.000000,20.904547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,20.904547>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<2.209800,0.000000,20.904547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,20.904547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.616547,0.000000,20.904547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,0.000000,0> translate<2.514859,0.000000,20.904547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.209800,0.000000,20.701172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.616547,0.000000,20.701172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<2.209800,0.000000,20.701172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.311484,0.000000,22.910800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.311484,0.000000,23.520919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<2.311484,0.000000,23.520919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,23.520919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,22.910800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.514859,0.000000,22.910800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.209800,0.000000,23.317547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,23.317547>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<2.209800,0.000000,23.317547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,23.317547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.616547,0.000000,23.317547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,0.000000,0> translate<2.514859,0.000000,23.317547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.209800,0.000000,23.114172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.616547,0.000000,23.114172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<2.209800,0.000000,23.114172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.311484,0.000000,12.750800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.311484,0.000000,13.360919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<2.311484,0.000000,13.360919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,13.360919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,12.750800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.514859,0.000000,12.750800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.209800,0.000000,13.157547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,13.157547>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<2.209800,0.000000,13.157547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,13.157547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.616547,0.000000,13.157547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,0.000000,0> translate<2.514859,0.000000,13.157547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.209800,0.000000,12.954172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.616547,0.000000,12.954172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<2.209800,0.000000,12.954172> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,17.619256>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,17.907369>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<14.714575,0.000000,17.907369> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,17.907369>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,18.051425>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.714575,0.000000,17.907369> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,18.051425>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,18.051425>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,0.000000,0> translate<14.858631,0.000000,18.051425> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,18.051425>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,17.619256>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.290800,0.000000,17.619256> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,17.619256>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,17.475200>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.146744,0.000000,17.475200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,17.475200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.002688,0.000000,17.619256>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<15.002688,0.000000,17.619256> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.002688,0.000000,17.619256>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.002688,0.000000,18.051425>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<15.002688,0.000000,18.051425> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,18.410719>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,18.410719>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<14.714575,0.000000,18.410719> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.002688,0.000000,18.410719>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,18.698831>}
box{<0,0,-0.076200><0.407453,0.036000,0.076200> rotate<0,44.997030,0> translate<14.714575,0.000000,18.698831> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,18.698831>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,18.842887>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<14.714575,0.000000,18.842887> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.426463,0.000000,19.766541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,19.766541>}
box{<0,0,-0.076200><0.864337,0.036000,0.076200> rotate<0,0.000000,0> translate<14.426463,0.000000,19.766541> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,19.766541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,19.334372>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.290800,0.000000,19.334372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,19.334372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,19.190316>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.146744,0.000000,19.190316> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,19.190316>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,19.190316>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<14.858631,0.000000,19.190316> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,19.190316>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,19.334372>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<14.714575,0.000000,19.334372> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,19.334372>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,19.766541>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<14.714575,0.000000,19.766541> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,20.125834>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,20.125834>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,0.000000,0> translate<14.714575,0.000000,20.125834> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,20.125834>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,20.269891>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.146744,0.000000,20.125834> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,20.269891>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,20.702059>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<15.290800,0.000000,20.702059> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,20.702059>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,20.702059>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<14.714575,0.000000,20.702059> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,21.061353>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,21.205409>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<14.714575,0.000000,21.205409> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,21.205409>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,21.205409>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<14.714575,0.000000,21.205409> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,21.061353>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,21.349466>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<15.290800,0.000000,21.349466> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.282406,0.000000,21.205409>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.426463,0.000000,21.205409>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<14.282406,0.000000,21.205409> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,21.685031>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,21.685031>}
box{<0,0,-0.076200><0.576225,0.036000,0.076200> rotate<0,0.000000,0> translate<14.714575,0.000000,21.685031> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,21.685031>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,22.117200>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<14.714575,0.000000,22.117200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,22.117200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,22.261256>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.714575,0.000000,22.117200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,22.261256>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,22.261256>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,0.000000,0> translate<14.858631,0.000000,22.261256> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,22.764606>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,23.052719>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,90.000000,0> translate<15.290800,0.000000,23.052719> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,23.052719>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,23.196775>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<15.146744,0.000000,23.196775> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,23.196775>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,23.196775>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<14.858631,0.000000,23.196775> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,23.196775>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,23.052719>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.714575,0.000000,23.052719> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,23.052719>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,22.764606>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.714575,0.000000,22.764606> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,22.764606>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,22.620550>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<14.714575,0.000000,22.764606> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,22.620550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,22.620550>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<14.858631,0.000000,22.620550> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,22.620550>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,22.764606>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.146744,0.000000,22.620550> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,23.556069>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,23.556069>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<15.146744,0.000000,23.556069> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,23.556069>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,23.700125>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,90.000000,0> translate<15.146744,0.000000,23.700125> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,23.700125>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,23.700125>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,0.000000,0> translate<15.146744,0.000000,23.700125> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,23.700125>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,23.556069>}
box{<0,0,-0.076200><0.144056,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.290800,0.000000,23.556069> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,24.600053>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,24.167884>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.714575,0.000000,24.167884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,24.167884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,24.023828>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<14.714575,0.000000,24.167884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,24.023828>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,24.023828>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<14.858631,0.000000,24.023828> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,24.023828>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,24.167884>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.146744,0.000000,24.023828> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,24.167884>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,24.600053>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<15.290800,0.000000,24.600053> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,25.535572>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,25.103403>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.714575,0.000000,25.103403> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.714575,0.000000,25.103403>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,24.959347>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,44.997030,0> translate<14.714575,0.000000,25.103403> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.858631,0.000000,24.959347>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,24.959347>}
box{<0,0,-0.076200><0.288113,0.036000,0.076200> rotate<0,0.000000,0> translate<14.858631,0.000000,24.959347> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.146744,0.000000,24.959347>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,25.103403>}
box{<0,0,-0.076200><0.203726,0.036000,0.076200> rotate<0,-44.997030,0> translate<15.146744,0.000000,24.959347> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,25.103403>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.290800,0.000000,25.535572>}
box{<0,0,-0.076200><0.432169,0.036000,0.076200> rotate<0,90.000000,0> translate<15.290800,0.000000,25.535572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,29.311600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,29.311600>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,0.000000,0> translate<8.228906,0.000000,29.311600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,29.311600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.822159,0.000000,29.718347>}
box{<0,0,-0.101600><0.575227,0.036000,0.101600> rotate<0,44.997030,0> translate<7.822159,0.000000,29.718347> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.822159,0.000000,29.718347>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,30.125094>}
box{<0,0,-0.101600><0.575227,0.036000,0.101600> rotate<0,-44.997030,0> translate<7.822159,0.000000,29.718347> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,30.125094>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,30.125094>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,0.000000,0> translate<8.228906,0.000000,30.125094> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.432281,0.000000,29.311600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.432281,0.000000,30.125094>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<8.432281,0.000000,30.125094> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,30.621325>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,30.621325>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,0.000000,0> translate<8.228906,0.000000,30.621325> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.635653,0.000000,30.621325>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,31.028072>}
box{<0,0,-0.101600><0.575227,0.036000,0.101600> rotate<0,44.997030,0> translate<8.228906,0.000000,31.028072> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,31.028072>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,31.231444>}
box{<0,0,-0.101600><0.203372,0.036000,0.101600> rotate<0,90.000000,0> translate<8.228906,0.000000,31.231444> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.822159,0.000000,32.526256>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,32.526256>}
box{<0,0,-0.101600><1.220241,0.036000,0.101600> rotate<0,0.000000,0> translate<7.822159,0.000000,32.526256> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,32.526256>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,31.916134>}
box{<0,0,-0.101600><0.610122,0.036000,0.101600> rotate<0,-90.000000,0> translate<9.042400,0.000000,31.916134> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,31.916134>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.839028,0.000000,31.712763>}
box{<0,0,-0.101600><0.287611,0.036000,0.101600> rotate<0,-44.997030,0> translate<8.839028,0.000000,31.712763> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.839028,0.000000,31.712763>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.432281,0.000000,31.712763>}
box{<0,0,-0.101600><0.406747,0.036000,0.101600> rotate<0,0.000000,0> translate<8.432281,0.000000,31.712763> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.432281,0.000000,31.712763>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,31.916134>}
box{<0,0,-0.101600><0.287613,0.036000,0.101600> rotate<0,44.996590,0> translate<8.228906,0.000000,31.916134> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,31.916134>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,32.526256>}
box{<0,0,-0.101600><0.610122,0.036000,0.101600> rotate<0,90.000000,0> translate<8.228906,0.000000,32.526256> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,33.022488>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.839028,0.000000,33.022488>}
box{<0,0,-0.101600><0.610122,0.036000,0.101600> rotate<0,0.000000,0> translate<8.228906,0.000000,33.022488> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.839028,0.000000,33.022488>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,33.225859>}
box{<0,0,-0.101600><0.287611,0.036000,0.101600> rotate<0,-44.997030,0> translate<8.839028,0.000000,33.022488> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,33.225859>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,33.835981>}
box{<0,0,-0.101600><0.610122,0.036000,0.101600> rotate<0,90.000000,0> translate<9.042400,0.000000,33.835981> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,33.835981>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,33.835981>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,0.000000,0> translate<8.228906,0.000000,33.835981> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,34.332213>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,34.535584>}
box{<0,0,-0.101600><0.203372,0.036000,0.101600> rotate<0,90.000000,0> translate<8.228906,0.000000,34.535584> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,34.535584>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,34.535584>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,0.000000,0> translate<8.228906,0.000000,34.535584> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,34.332213>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,34.738959>}
box{<0,0,-0.101600><0.406747,0.036000,0.101600> rotate<0,90.000000,0> translate<9.042400,0.000000,34.738959> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.618784,0.000000,34.535584>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.822159,0.000000,34.535584>}
box{<0,0,-0.101600><0.203375,0.036000,0.101600> rotate<0,0.000000,0> translate<7.618784,0.000000,34.535584> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,35.205362>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,35.205362>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,0.000000,0> translate<8.228906,0.000000,35.205362> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,35.205362>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,35.815481>}
box{<0,0,-0.101600><0.610119,0.036000,0.101600> rotate<0,90.000000,0> translate<8.228906,0.000000,35.815481> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,35.815481>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.432281,0.000000,36.018856>}
box{<0,0,-0.101600><0.287616,0.036000,0.101600> rotate<0,-44.997030,0> translate<8.228906,0.000000,35.815481> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.432281,0.000000,36.018856>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,36.018856>}
box{<0,0,-0.101600><0.610119,0.036000,0.101600> rotate<0,0.000000,0> translate<8.432281,0.000000,36.018856> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,36.718459>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,37.125206>}
box{<0,0,-0.101600><0.406747,0.036000,0.101600> rotate<0,90.000000,0> translate<9.042400,0.000000,37.125206> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,37.125206>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.839028,0.000000,37.328581>}
box{<0,0,-0.101600><0.287613,0.036000,0.101600> rotate<0,44.997470,0> translate<8.839028,0.000000,37.328581> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.839028,0.000000,37.328581>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.432281,0.000000,37.328581>}
box{<0,0,-0.101600><0.406747,0.036000,0.101600> rotate<0,0.000000,0> translate<8.432281,0.000000,37.328581> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.432281,0.000000,37.328581>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,37.125206>}
box{<0,0,-0.101600><0.287616,0.036000,0.101600> rotate<0,-44.997030,0> translate<8.228906,0.000000,37.125206> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,37.125206>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,36.718459>}
box{<0,0,-0.101600><0.406747,0.036000,0.101600> rotate<0,-90.000000,0> translate<8.228906,0.000000,36.718459> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.228906,0.000000,36.718459>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.432281,0.000000,36.515087>}
box{<0,0,-0.101600><0.287613,0.036000,0.101600> rotate<0,44.996590,0> translate<8.228906,0.000000,36.718459> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.432281,0.000000,36.515087>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.839028,0.000000,36.515087>}
box{<0,0,-0.101600><0.406747,0.036000,0.101600> rotate<0,0.000000,0> translate<8.432281,0.000000,36.515087> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.839028,0.000000,36.515087>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.042400,0.000000,36.718459>}
box{<0,0,-0.101600><0.287611,0.036000,0.101600> rotate<0,-44.997030,0> translate<8.839028,0.000000,36.515087> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.011484,0.000000,5.003800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.011484,0.000000,5.613919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<15.011484,0.000000,5.613919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.214859,0.000000,5.613919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.214859,0.000000,5.003800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.214859,0.000000,5.003800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.909800,0.000000,5.410547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.214859,0.000000,5.410547>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<14.909800,0.000000,5.410547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.214859,0.000000,5.410547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.316547,0.000000,5.410547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,0.000000,0> translate<15.214859,0.000000,5.410547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.909800,0.000000,5.207172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.316547,0.000000,5.207172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<14.909800,0.000000,5.207172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.311484,0.000000,25.450800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.311484,0.000000,26.060919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<2.311484,0.000000,26.060919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,26.060919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,25.450800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.514859,0.000000,25.450800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.209800,0.000000,25.857547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,25.857547>}
box{<0,0,-0.050800><0.305059,0.036000,0.050800> rotate<0,0.000000,0> translate<2.209800,0.000000,25.857547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.514859,0.000000,25.857547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.616547,0.000000,25.857547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,0.000000,0> translate<2.514859,0.000000,25.857547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.209800,0.000000,25.654172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.616547,0.000000,25.654172>}
box{<0,0,-0.050800><0.406747,0.036000,0.050800> rotate<0,0.000000,0> translate<2.209800,0.000000,25.654172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,43.358234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,43.459919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<0.990859,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.787484,0.000000,43.459919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<0.787484,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.787484,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,43.358234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<0.685800,0.000000,43.358234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,43.358234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,43.256547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.685800,0.000000,43.256547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,43.256547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.787484,0.000000,43.154859>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.997911,0> translate<0.685800,0.000000,43.256547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.787484,0.000000,43.154859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,43.154859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<0.787484,0.000000,43.154859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,43.154859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,43.053172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<0.990859,0.000000,43.154859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,43.053172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,42.951484>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.092547,0.000000,42.951484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.092547,0.000000,42.951484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,42.849800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<0.990859,0.000000,42.849800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.990859,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.787484,0.000000,42.849800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<0.787484,0.000000,42.849800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.787484,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.685800,0.000000,42.951484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<0.685800,0.000000,42.951484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,43.358234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,43.459919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<1.645722,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,43.459919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,43.358234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.340663,0.000000,43.358234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,43.358234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,43.256547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.340663,0.000000,43.256547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,43.256547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,43.154859>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.997911,0> translate<1.340663,0.000000,43.256547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,43.154859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,43.154859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,43.154859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,43.154859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,43.053172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<1.645722,0.000000,43.154859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,43.053172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,42.951484>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.747409,0.000000,42.951484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.747409,0.000000,42.951484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,42.849800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<1.645722,0.000000,42.849800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.645722,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,42.849800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.442347,0.000000,42.849800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.442347,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.340663,0.000000,42.951484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<1.340663,0.000000,42.951484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.304800,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.304800,0.000000,45.999919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<0.304800,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.304800,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.508172,0.000000,45.796547>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,44.997030,0> translate<0.304800,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.508172,0.000000,45.796547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.711547,0.000000,45.999919>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,-44.996590,0> translate<0.508172,0.000000,45.796547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.711547,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.711547,0.000000,45.389800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.711547,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.264722,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.061347,0.000000,45.999919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.061347,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.061347,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.959663,0.000000,45.898234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<0.959663,0.000000,45.898234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.959663,0.000000,45.898234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.959663,0.000000,45.491484>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,-90.000000,0> translate<0.959663,0.000000,45.491484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<0.959663,0.000000,45.491484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.061347,0.000000,45.389800>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<0.959663,0.000000,45.491484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.061347,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.264722,0.000000,45.389800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.061347,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.264722,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.366409,0.000000,45.491484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<1.264722,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.366409,0.000000,45.491484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.366409,0.000000,45.898234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<1.366409,0.000000,45.898234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.366409,0.000000,45.898234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.264722,0.000000,45.999919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<1.264722,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.021272,0.000000,45.898234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.919584,0.000000,45.999919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<1.919584,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.919584,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.716209,0.000000,45.999919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.716209,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.716209,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.614525,0.000000,45.898234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<1.614525,0.000000,45.898234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.614525,0.000000,45.898234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.614525,0.000000,45.796547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<1.614525,0.000000,45.796547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.614525,0.000000,45.796547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.716209,0.000000,45.694859>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.997911,0> translate<1.614525,0.000000,45.796547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.716209,0.000000,45.694859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.919584,0.000000,45.694859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.716209,0.000000,45.694859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.919584,0.000000,45.694859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.021272,0.000000,45.593172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<1.919584,0.000000,45.694859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.021272,0.000000,45.593172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.021272,0.000000,45.491484>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.021272,0.000000,45.491484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.021272,0.000000,45.491484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.919584,0.000000,45.389800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<1.919584,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.919584,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.716209,0.000000,45.389800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<1.716209,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.716209,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<1.614525,0.000000,45.491484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<1.614525,0.000000,45.491484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.269388,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.472759,0.000000,45.389800>}
box{<0,0,-0.050800><0.203372,0.036000,0.050800> rotate<0,0.000000,0> translate<2.269388,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.371072,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.371072,0.000000,45.999919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<2.371072,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.269388,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.472759,0.000000,45.999919>}
box{<0,0,-0.050800><0.203372,0.036000,0.050800> rotate<0,0.000000,0> translate<2.269388,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,45.898234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,45.999919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<15.976859,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.773484,0.000000,45.999919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<15.773484,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.773484,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,45.898234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<15.671800,0.000000,45.898234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,45.898234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,45.796547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.671800,0.000000,45.796547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,45.796547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.773484,0.000000,45.694859>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.997911,0> translate<15.671800,0.000000,45.796547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.773484,0.000000,45.694859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,45.694859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<15.773484,0.000000,45.694859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,45.694859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,45.593172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<15.976859,0.000000,45.694859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,45.593172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,45.491484>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.078547,0.000000,45.491484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.078547,0.000000,45.491484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,45.389800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<15.976859,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.976859,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.773484,0.000000,45.389800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<15.773484,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.773484,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.671800,0.000000,45.491484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<15.671800,0.000000,45.491484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.733409,0.000000,45.898234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.631722,0.000000,45.999919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<16.631722,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.631722,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,45.999919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.428347,0.000000,45.999919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,45.898234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.326663,0.000000,45.898234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,45.898234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,45.491484>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.326663,0.000000,45.491484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.326663,0.000000,45.491484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,45.389800>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<16.326663,0.000000,45.491484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.428347,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.631722,0.000000,45.389800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.428347,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.631722,0.000000,45.389800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.733409,0.000000,45.491484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<16.631722,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.981525,0.000000,45.999919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.981525,0.000000,45.389800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.981525,0.000000,45.389800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.981525,0.000000,45.593172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.388272,0.000000,45.999919>}
box{<0,0,-0.050800><0.575227,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.981525,0.000000,45.593172> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.083209,0.000000,45.694859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.388272,0.000000,45.389800>}
box{<0,0,-0.050800><0.431421,0.036000,0.050800> rotate<0,44.996737,0> translate<17.083209,0.000000,45.694859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.417800,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.417800,0.000000,43.459919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<15.417800,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.417800,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.621172,0.000000,43.256547>}
box{<0,0,-0.050800><0.287611,0.036000,0.050800> rotate<0,44.997030,0> translate<15.417800,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.621172,0.000000,43.256547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.824547,0.000000,43.459919>}
box{<0,0,-0.050800><0.287613,0.036000,0.050800> rotate<0,-44.996590,0> translate<15.621172,0.000000,43.256547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.824547,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<15.824547,0.000000,42.849800>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,-90.000000,0> translate<15.824547,0.000000,42.849800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.072662,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.276034,0.000000,42.849800>}
box{<0,0,-0.050800><0.203372,0.036000,0.050800> rotate<0,0.000000,0> translate<16.072662,0.000000,42.849800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.174347,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.174347,0.000000,43.459919>}
box{<0,0,-0.050800><0.610119,0.036000,0.050800> rotate<0,90.000000,0> translate<16.174347,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.072662,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.276034,0.000000,43.459919>}
box{<0,0,-0.050800><0.203372,0.036000,0.050800> rotate<0,0.000000,0> translate<16.072662,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.915984,0.000000,43.358234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.814297,0.000000,43.459919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<16.814297,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.814297,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.610922,0.000000,43.459919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.610922,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.610922,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.509238,0.000000,43.358234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<16.509238,0.000000,43.358234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.509238,0.000000,43.358234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.509238,0.000000,43.256547>}
box{<0,0,-0.050800><0.101687,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.509238,0.000000,43.256547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.509238,0.000000,43.256547>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.610922,0.000000,43.154859>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.997911,0> translate<16.509238,0.000000,43.256547> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.610922,0.000000,43.154859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.814297,0.000000,43.154859>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.610922,0.000000,43.154859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.814297,0.000000,43.154859>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.915984,0.000000,43.053172>}
box{<0,0,-0.050800><0.143808,0.036000,0.050800> rotate<0,44.997030,0> translate<16.814297,0.000000,43.154859> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.915984,0.000000,43.053172>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.915984,0.000000,42.951484>}
box{<0,0,-0.050800><0.101688,0.036000,0.050800> rotate<0,-90.000000,0> translate<16.915984,0.000000,42.951484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.915984,0.000000,42.951484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.814297,0.000000,42.849800>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<16.814297,0.000000,42.849800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.814297,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.610922,0.000000,42.849800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<16.610922,0.000000,42.849800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.610922,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.509238,0.000000,42.951484>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<16.509238,0.000000,42.951484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.469159,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.265784,0.000000,43.459919>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<17.265784,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.265784,0.000000,43.459919>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.164100,0.000000,43.358234>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,-44.997030,0> translate<17.164100,0.000000,43.358234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.164100,0.000000,43.358234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.164100,0.000000,42.951484>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,-90.000000,0> translate<17.164100,0.000000,42.951484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.164100,0.000000,42.951484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.265784,0.000000,42.849800>}
box{<0,0,-0.050800><0.143803,0.036000,0.050800> rotate<0,44.997030,0> translate<17.164100,0.000000,42.951484> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.265784,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.469159,0.000000,42.849800>}
box{<0,0,-0.050800><0.203375,0.036000,0.050800> rotate<0,0.000000,0> translate<17.265784,0.000000,42.849800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.469159,0.000000,42.849800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.570847,0.000000,42.951484>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,-44.996150,0> translate<17.469159,0.000000,42.849800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.570847,0.000000,42.951484>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.570847,0.000000,43.358234>}
box{<0,0,-0.050800><0.406750,0.036000,0.050800> rotate<0,90.000000,0> translate<17.570847,0.000000,43.358234> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.570847,0.000000,43.358234>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<17.469159,0.000000,43.459919>}
box{<0,0,-0.050800><0.143806,0.036000,0.050800> rotate<0,44.996150,0> translate<17.469159,0.000000,43.459919> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<3.048000,0.000000,38.862000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<2.286000,0.000000,39.370000>}
box{<0,0,-0.152400><0.915810,0.036000,0.152400> rotate<0,33.687844,0> translate<2.286000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<2.286000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<3.048000,0.000000,39.878000>}
box{<0,0,-0.152400><0.915810,0.036000,0.152400> rotate<0,-33.687844,0> translate<2.286000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<3.048000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<3.048000,0.000000,38.862000>}
box{<0,0,-0.152400><1.016000,0.036000,0.152400> rotate<0,-90.000000,0> translate<3.048000,0.000000,38.862000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<2.286000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<3.022600,0.000000,36.830000>}
box{<0,0,-0.152400><0.894787,0.036000,0.152400> rotate<0,34.590006,0> translate<2.286000,0.000000,37.338000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<2.286000,0.000000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<2.286000,0.000000,36.322000>}
box{<0,0,-0.152400><1.016000,0.036000,0.152400> rotate<0,-90.000000,0> translate<2.286000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<2.286000,0.000000,36.322000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<3.022600,0.000000,36.830000>}
box{<0,0,-0.152400><0.894787,0.036000,0.152400> rotate<0,-34.590006,0> translate<2.286000,0.000000,36.322000> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<2.743200,0.000000,39.268400>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<2.743200,0.000000,39.471600>}
box{<0,0,-0.203200><0.203200,0.036000,0.203200> rotate<0,90.000000,0> translate<2.743200,0.000000,39.471600> }
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<2.590800,0.000000,36.753800>}
cylinder{<0,0,0><0,0.036000,0>0.203200 translate<2.590800,0.000000,36.931600>}
box{<0,0,-0.203200><0.177800,0.036000,0.203200> rotate<0,90.000000,0> translate<2.590800,0.000000,36.931600> }
difference{
cylinder{<15.240000,0,39.370000><15.240000,0.036000,39.370000>0.382800 translate<0,0.000000,0>}
cylinder{<15.240000,-0.1,39.370000><15.240000,0.135000,39.370000>0.000000 translate<0,0.000000,0>}}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.913000,-1.536000,38.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.677000,-1.536000,38.070000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.677000,-1.536000,38.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.677000,-1.536000,37.622000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.913000,-1.536000,37.622000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.677000,-1.536000,37.622000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<11.176000,-1.536000,37.846000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<10.414000,-1.536000,37.846000>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.555000,-1.536000,40.758000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.555000,-1.536000,40.522000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,-90.000000,0> translate<9.555000,-1.536000,40.522000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.003000,-1.536000,40.522000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.003000,-1.536000,40.758000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.003000,-1.536000,40.758000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<9.779000,-1.536000,41.021000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<9.779000,-1.536000,40.259000>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.223000,0.000000,31.801000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.223000,0.000000,35.001000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.223000,0.000000,35.001000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.223000,0.000000,35.001000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.923000,0.000000,35.001000>}
box{<0,0,-0.050800><2.700000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.223000,0.000000,35.001000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.923000,0.000000,35.001000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.923000,0.000000,31.801000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.923000,0.000000,31.801000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.923000,0.000000,31.801000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.223000,0.000000,31.801000>}
box{<0,0,-0.050800><2.700000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.223000,0.000000,31.801000> }
box{<-0.100000,0,-1.100000><0.100000,0.036000,1.100000> rotate<0,-90.000000,0> translate<12.573000,0.000000,31.751000>}
box{<-0.100000,0,-1.100000><0.100000,0.036000,1.100000> rotate<0,-270.000000,0> translate<12.573000,0.000000,35.051000>}
box{<-0.325000,0,-1.350000><0.325000,0.036000,1.350000> rotate<0,-90.000000,0> translate<12.573000,0.000000,32.126000>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.008000,-1.536000,1.240000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.772000,-1.536000,1.240000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.772000,-1.536000,1.240000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.772000,-1.536000,0.792000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.008000,-1.536000,0.792000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.772000,-1.536000,0.792000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<9.271000,-1.536000,1.016000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<8.509000,-1.536000,1.016000>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.455000,0.000000,28.672000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.691000,0.000000,28.672000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.455000,0.000000,28.672000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.691000,0.000000,28.224000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.455000,0.000000,28.224000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.455000,0.000000,28.224000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<12.192000,0.000000,28.448000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<12.954000,0.000000,28.448000>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.000000,-1.536000,9.389000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.000000,-1.536000,9.153000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,-90.000000,0> translate<14.000000,-1.536000,9.153000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.448000,-1.536000,9.153000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.448000,-1.536000,9.389000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.448000,-1.536000,9.389000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<14.224000,-1.536000,9.652000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<14.224000,-1.536000,8.890000>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.691000,0.000000,30.002000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.455000,0.000000,30.002000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.455000,0.000000,30.002000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.455000,0.000000,30.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.691000,0.000000,30.450000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.455000,0.000000,30.450000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<12.954000,0.000000,30.226000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<12.192000,0.000000,30.226000>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.571000,-1.536000,26.915000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.571000,-1.536000,26.679000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,-90.000000,0> translate<10.571000,-1.536000,26.679000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.019000,-1.536000,26.679000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.019000,-1.536000,26.915000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,90.000000,0> translate<11.019000,-1.536000,26.915000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<10.795000,-1.536000,27.178000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<10.795000,-1.536000,26.416000>}
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.666000,-1.536000,26.915000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.666000,-1.536000,26.679000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,-90.000000,0> translate<8.666000,-1.536000,26.679000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.114000,-1.536000,26.679000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.114000,-1.536000,26.915000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,90.000000,0> translate<9.114000,-1.536000,26.915000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<8.890000,-1.536000,27.178000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<8.890000,-1.536000,26.416000>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.879047,-1.536000,22.466828>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.712172,-1.536000,22.299953>}
box{<0,0,-0.076200><0.235997,0.036000,0.076200> rotate<0,-44.997030,0> translate<12.712172,-1.536000,22.299953> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.028956,-1.536000,21.983169>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.195831,-1.536000,22.150044>}
box{<0,0,-0.076200><0.235997,0.036000,0.076200> rotate<0,-44.997030,0> translate<13.028956,-1.536000,21.983169> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-225.000000,0> translate<13.223409,-1.536000,22.494406>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-225.000000,0> translate<12.684594,-1.536000,21.955591>}
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.722000,0.000000,29.494000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.486000,0.000000,29.494000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.486000,0.000000,29.494000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.486000,0.000000,29.942000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.722000,0.000000,29.942000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<6.486000,0.000000,29.942000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<6.985000,0.000000,29.718000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<6.223000,0.000000,29.718000>}
//C13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.674000,0.000000,32.161000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.438000,0.000000,32.161000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.438000,0.000000,32.161000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.438000,0.000000,32.609000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.674000,0.000000,32.609000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<3.438000,0.000000,32.609000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<3.937000,0.000000,32.385000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<3.175000,0.000000,32.385000>}
//C14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.841000,-1.536000,6.553000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.841000,-1.536000,3.353000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,-90.000000,0> translate<2.841000,-1.536000,3.353000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.841000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.541000,-1.536000,3.353000>}
box{<0,0,-0.050800><2.700000,0.036000,0.050800> rotate<0,0.000000,0> translate<2.841000,-1.536000,3.353000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.541000,-1.536000,3.353000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.541000,-1.536000,6.553000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,90.000000,0> translate<5.541000,-1.536000,6.553000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.541000,-1.536000,6.553000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<2.841000,-1.536000,6.553000>}
box{<0,0,-0.050800><2.700000,0.036000,0.050800> rotate<0,0.000000,0> translate<2.841000,-1.536000,6.553000> }
box{<-0.100000,0,-1.100000><0.100000,0.036000,1.100000> rotate<0,-270.000000,0> translate<4.191000,-1.536000,6.603000>}
box{<-0.100000,0,-1.100000><0.100000,0.036000,1.100000> rotate<0,-90.000000,0> translate<4.191000,-1.536000,3.303000>}
box{<-0.325000,0,-1.350000><0.325000,0.036000,1.350000> rotate<0,-270.000000,0> translate<4.191000,-1.536000,6.228000>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.645400,-1.536000,43.611800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.645400,-1.536000,40.970200>}
box{<0,0,-0.076200><2.641600,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.645400,-1.536000,40.970200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.070600,-1.536000,43.611800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.070600,-1.536000,40.970200>}
box{<0,0,-0.076200><2.641600,0.036000,0.076200> rotate<0,-90.000000,0> translate<6.070600,-1.536000,40.970200> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.358000,-1.536000,42.791000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.858000,-1.536000,41.791000>}
box{<0,0,-0.101600><1.118034,0.036000,0.101600> rotate<0,-63.430762,0> translate<6.858000,-1.536000,41.791000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.858000,-1.536000,41.791000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.358000,-1.536000,42.791000>}
box{<0,0,-0.101600><1.118034,0.036000,0.101600> rotate<0,63.430762,0> translate<6.358000,-1.536000,42.791000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<6.358000,-1.536000,42.791000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<7.358000,-1.536000,42.791000>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<6.358000,-1.536000,42.791000> }
box{<-0.279400,0,-0.863600><0.279400,0.036000,0.863600> rotate<0,-90.000000,0> translate<6.858000,-1.536000,40.716200>}
box{<-0.279400,0,-0.863600><0.279400,0.036000,0.863600> rotate<0,-90.000000,0> translate<6.858000,-1.536000,43.865800>}
box{<-0.304800,0,-0.787400><0.304800,0.036000,0.787400> rotate<0,-90.000000,0> translate<6.858000,-1.536000,41.732200>}
//F1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.807200,-1.536000,11.226800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<6.807200,-1.536000,14.173200>}
box{<0,0,-0.050800><2.946400,0.036000,0.050800> rotate<0,90.000000,0> translate<6.807200,-1.536000,14.173200> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.606800,-1.536000,11.252200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.606800,-1.536000,14.173200>}
box{<0,0,-0.050800><2.921000,0.036000,0.050800> rotate<0,90.000000,0> translate<3.606800,-1.536000,14.173200> }
box{<-0.475000,0,-1.650000><0.475000,0.036000,1.650000> rotate<0,-90.000000,0> translate<5.206000,-1.536000,10.787400>}
box{<-0.475000,0,-1.650000><0.475000,0.036000,1.650000> rotate<0,-90.000000,0> translate<5.206000,-1.536000,14.622800>}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<4.826000,0.000000,0.000000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<16.256000,0.000000,0.000000>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,0.000000,0> translate<4.826000,0.000000,0.000000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.334000,0.000000,4.241800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.446000,0.000000,4.241800>}
box{<0,0,-0.127000><7.112000,0.036000,0.127000> rotate<0,0.000000,0> translate<5.334000,0.000000,4.241800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.446000,0.000000,4.241800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.446000,0.000000,2.463800>}
box{<0,0,-0.127000><1.778000,0.036000,0.127000> rotate<0,-90.000000,0> translate<12.446000,0.000000,2.463800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.446000,0.000000,2.463800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.208000,0.000000,2.463800>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.446000,0.000000,2.463800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.208000,0.000000,2.463800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.208000,0.000000,0.431800>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,-90.000000,0> translate<13.208000,0.000000,0.431800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<13.208000,0.000000,0.431800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<12.446000,0.000000,0.431800>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<12.446000,0.000000,0.431800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.334000,0.000000,0.431800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.572000,0.000000,0.431800>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.572000,0.000000,0.431800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.572000,0.000000,0.431800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.572000,0.000000,2.463800>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,90.000000,0> translate<4.572000,0.000000,2.463800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.572000,0.000000,2.463800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.334000,0.000000,2.463800>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,0.000000,0> translate<4.572000,0.000000,2.463800> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.334000,0.000000,2.463800>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<5.334000,0.000000,4.241800>}
box{<0,0,-0.127000><1.778000,0.036000,0.127000> rotate<0,90.000000,0> translate<5.334000,0.000000,4.241800> }
//J4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,40.005000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.605000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,41.910000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.605000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,42.545000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.605000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,44.450000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.605000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,39.370000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,39.370000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,40.005000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<10.160000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,41.275000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.160000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,41.275000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,41.910000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.160000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,42.545000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<10.160000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,43.815000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.160000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,44.450000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.160000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,41.910000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,41.910000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,41.910000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,44.450000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,43.815000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.240000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,40.005000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,41.275000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.240000,0.000000,41.275000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,45.085000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<14.605000,0.000000,44.450000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,46.990000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<14.605000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,44.450000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,45.085000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<10.160000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,46.355000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<10.160000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.160000,0.000000,46.355000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,46.990000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.160000,0.000000,46.355000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.795000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.605000,0.000000,46.990000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.795000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.240000,0.000000,46.355000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<15.240000,0.000000,46.355000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<13.970000,0.000000,40.640000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<11.430000,0.000000,40.640000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<11.430000,0.000000,43.180000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<13.970000,0.000000,43.180000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<11.430000,0.000000,45.720000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-90.000000,0> translate<13.970000,0.000000,45.720000>}
//J5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.540000,0.000000,45.720000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.000000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.540000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.540000,0.000000,2.540000>}
box{<0,0,-0.063500><43.180000,0.036000,0.063500> rotate<0,-90.000000,0> translate<2.540000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<2.540000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,2.540000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<0.000000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<0.000000,0.000000,45.720000>}
box{<0,0,-0.063500><43.180000,0.036000,0.063500> rotate<0,90.000000,0> translate<0.000000,0.000000,45.720000> }
//J6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.240000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,45.720000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.240000,0.000000,45.720000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,45.720000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,2.540000>}
box{<0,0,-0.063500><43.180000,0.036000,0.063500> rotate<0,-90.000000,0> translate<17.780000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<17.780000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.240000,0.000000,2.540000>}
box{<0,0,-0.063500><2.540000,0.036000,0.063500> rotate<0,0.000000,0> translate<15.240000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.240000,0.000000,2.540000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<15.240000,0.000000,45.720000>}
box{<0,0,-0.063500><43.180000,0.036000,0.063500> rotate<0,90.000000,0> translate<15.240000,0.000000,45.720000> }
//L silk screen
object{ARC(0.354172,0.101600,98.802740,261.197260,0.036000) translate<9.869200,0.000000,13.970000>}
object{ARC(0.354172,0.101600,278.802740,441.197260,0.036000) translate<7.910800,0.000000,13.970000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.415000,0.000000,13.395000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.365000,0.000000,13.395000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<8.365000,0.000000,13.395000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.390000,0.000000,14.545000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.815000,0.000000,14.545000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<8.390000,0.000000,14.545000> }
difference{
cylinder{<9.740000,0,14.420000><9.740000,0.036000,14.420000>0.153800 translate<0,0.000000,0>}
cylinder{<9.740000,-0.1,14.420000><9.740000,0.135000,14.420000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-270.000000,0> translate<9.640000,0.000000,13.507500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<9.515000,0.000000,14.220000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<9.515000,0.000000,13.720000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-270.000000,0> translate<9.477500,0.000000,13.970000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-270.000000,0> translate<8.140000,0.000000,13.507500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-270.000000,0> translate<8.140000,0.000000,14.432500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<8.265000,0.000000,13.720000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<8.265000,0.000000,14.220000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-270.000000,0> translate<8.302500,0.000000,13.970000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-270.000000,0> translate<8.990000,0.000000,13.970000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-270.000000,0> translate<9.540000,0.000000,14.420000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-270.000000,0> translate<9.852500,0.000000,14.432500>}
//L2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.859000,0.000000,31.780000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.859000,0.000000,29.280000>}
box{<0,0,-0.063500><2.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.859000,0.000000,29.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.859000,0.000000,31.580000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<14.859000,0.000000,29.380000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<14.859000,0.000000,29.380000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<15.484000,0.000000,31.480000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<15.484000,0.000000,29.480000>}
box{<0,0,-0.035000><2.000000,0.036000,0.035000> rotate<0,-90.000000,0> translate<15.484000,0.000000,29.480000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<15.484000,0.000000,29.480000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<14.234000,0.000000,29.480000>}
box{<0,0,-0.035000><1.250000,0.036000,0.035000> rotate<0,0.000000,0> translate<14.234000,0.000000,29.480000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<14.234000,0.000000,29.480000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<14.234000,0.000000,31.480000>}
box{<0,0,-0.035000><2.000000,0.036000,0.035000> rotate<0,90.000000,0> translate<14.234000,0.000000,31.480000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<14.234000,0.000000,31.480000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<15.484000,0.000000,31.480000>}
box{<0,0,-0.035000><1.250000,0.036000,0.035000> rotate<0,0.000000,0> translate<14.234000,0.000000,31.480000> }
box{<-0.350000,0,-0.150000><0.350000,0.036000,0.150000> rotate<0,-270.000000,0> translate<14.859000,0.000000,30.480000>}
//ON silk screen
object{ARC(0.354172,0.101600,278.802740,441.197260,0.036000) translate<7.910800,-1.536000,2.921000>}
object{ARC(0.354172,0.101600,98.802740,261.197260,0.036000) translate<9.869200,-1.536000,2.921000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.365000,-1.536000,2.346000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.415000,-1.536000,2.346000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<8.365000,-1.536000,2.346000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.390000,-1.536000,3.496000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.965000,-1.536000,3.496000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<7.965000,-1.536000,3.496000> }
difference{
cylinder{<8.040000,0,3.371000><8.040000,0.036000,3.371000>0.153800 translate<0,-1.536000,0>}
cylinder{<8.040000,-0.1,3.371000><8.040000,0.135000,3.371000>0.052200 translate<0,-1.536000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-270.000000,0> translate<8.140000,-1.536000,2.458500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<8.265000,-1.536000,3.171000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<8.265000,-1.536000,2.671000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-270.000000,0> translate<8.302500,-1.536000,2.921000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-270.000000,0> translate<9.640000,-1.536000,2.458500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-270.000000,0> translate<9.640000,-1.536000,3.383500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<9.515000,-1.536000,2.671000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-270.000000,0> translate<9.515000,-1.536000,3.171000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-270.000000,0> translate<9.477500,-1.536000,2.921000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-270.000000,0> translate<8.790000,-1.536000,2.921000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-270.000000,0> translate<8.240000,-1.536000,3.371000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-270.000000,0> translate<7.927500,-1.536000,3.383500>}
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.635000,0.000000,33.283000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.635000,0.000000,33.519000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.635000,0.000000,33.519000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.083000,0.000000,33.519000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.083000,0.000000,33.283000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,-90.000000,0> translate<15.083000,0.000000,33.283000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-90.000000,0> translate<14.859000,0.000000,33.020000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-90.000000,0> translate<14.859000,0.000000,33.782000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.425456,-1.536000,24.904169>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.592331,-1.536000,25.071044>}
box{<0,0,-0.076200><0.235997,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.425456,-1.536000,24.904169> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.275547,-1.536000,25.387828>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.108672,-1.536000,25.220953>}
box{<0,0,-0.076200><0.235997,0.036000,0.076200> rotate<0,-44.997030,0> translate<10.108672,-1.536000,25.220953> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-45.000000,0> translate<10.081094,-1.536000,24.876591>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-45.000000,0> translate<10.619909,-1.536000,25.415406>}
//R4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.947000,0.000000,14.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.183000,0.000000,14.194000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.947000,0.000000,14.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.183000,0.000000,13.746000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.947000,0.000000,13.746000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.947000,0.000000,13.746000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<11.684000,0.000000,13.970000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<12.446000,0.000000,13.970000>}
//R5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.008000,-1.536000,4.542000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.772000,-1.536000,4.542000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.772000,-1.536000,4.542000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<8.772000,-1.536000,4.094000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<9.008000,-1.536000,4.094000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<8.772000,-1.536000,4.094000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<9.271000,-1.536000,4.318000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-180.000000,0> translate<8.509000,-1.536000,4.318000>}
//R6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.761000,0.000000,33.537000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.761000,0.000000,33.773000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.761000,0.000000,33.773000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.209000,0.000000,33.773000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.209000,0.000000,33.537000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.209000,0.000000,33.537000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-90.000000,0> translate<6.985000,0.000000,33.274000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-90.000000,0> translate<6.985000,0.000000,34.036000>}
//R7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.209000,0.000000,35.678000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<7.209000,0.000000,35.442000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,-90.000000,0> translate<7.209000,0.000000,35.442000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.761000,0.000000,35.442000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<6.761000,0.000000,35.678000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,90.000000,0> translate<6.761000,0.000000,35.678000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<6.985000,0.000000,35.941000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-270.000000,0> translate<6.985000,0.000000,35.179000>}
//R8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.597000,0.000000,14.194000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.833000,0.000000,14.194000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.597000,0.000000,14.194000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.833000,0.000000,13.746000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<5.597000,0.000000,13.746000>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<5.597000,0.000000,13.746000> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<5.334000,0.000000,13.970000>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<6.096000,0.000000,13.970000>}
//R9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.677000,-1.536000,38.714200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.913000,-1.536000,38.714200>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.677000,-1.536000,38.714200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.913000,-1.536000,39.162200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<10.677000,-1.536000,39.162200>}
box{<0,0,-0.076200><0.236000,0.036000,0.076200> rotate<0,0.000000,0> translate<10.677000,-1.536000,39.162200> }
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<10.414000,-1.536000,38.938200>}
box{<-0.127000,0,-0.254000><0.127000,0.036000,0.254000> rotate<0,-0.000000,0> translate<11.176000,-1.536000,38.938200>}
//RESET silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,40.076000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,40.076000>}
box{<0,0,-0.063500><5.778000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.334000,0.000000,40.076000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,46.030000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.723000,0.000000,46.030000>}
box{<0,0,-0.063500><2.389000,0.036000,0.063500> rotate<0,0.000000,0> translate<6.723000,0.000000,46.030000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.723000,0.000000,46.030000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,46.030000>}
box{<0,0,-0.063500><2.389000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.334000,0.000000,46.030000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.723000,0.000000,46.030000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.723000,0.000000,46.280000>}
box{<0,0,-0.063500><0.250000,0.036000,0.063500> rotate<0,90.000000,0> translate<6.723000,0.000000,46.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<6.723000,0.000000,46.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.723000,0.000000,46.280000>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.723000,0.000000,46.280000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.723000,0.000000,46.280000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.723000,0.000000,46.030000>}
box{<0,0,-0.063500><0.250000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.723000,0.000000,46.030000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.912000,0.000000,44.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.912000,0.000000,42.053000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<8.912000,0.000000,42.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.912000,0.000000,42.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,42.053000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.912000,0.000000,42.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,42.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.312000,0.000000,42.053000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.112000,0.000000,42.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.312000,0.000000,42.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.312000,0.000000,44.053000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<9.312000,0.000000,44.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.312000,0.000000,44.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,44.053000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.112000,0.000000,44.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,44.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<8.912000,0.000000,44.053000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<8.912000,0.000000,44.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.134000,0.000000,44.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.134000,0.000000,42.053000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.134000,0.000000,42.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.134000,0.000000,42.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,42.053000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.134000,0.000000,42.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,42.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.534000,0.000000,42.053000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.334000,0.000000,42.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.534000,0.000000,42.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.534000,0.000000,44.053000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.534000,0.000000,44.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.534000,0.000000,44.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,44.053000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.334000,0.000000,44.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,44.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.134000,0.000000,44.053000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.134000,0.000000,44.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,46.030000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,44.053000>}
box{<0,0,-0.063500><1.977000,0.036000,0.063500> rotate<0,-90.000000,0> translate<9.112000,0.000000,44.053000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,42.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.112000,0.000000,40.076000>}
box{<0,0,-0.063500><1.977000,0.036000,0.063500> rotate<0,-90.000000,0> translate<9.112000,0.000000,40.076000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,42.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,40.076000>}
box{<0,0,-0.063500><1.977000,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.334000,0.000000,40.076000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,44.053000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.334000,0.000000,46.030000>}
box{<0,0,-0.063500><1.977000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.334000,0.000000,46.030000> }
difference{
cylinder{<6.223000,0,43.053000><6.223000,0.036000,43.053000>1.563500 translate<0,0.000000,0>}
cylinder{<6.223000,-0.1,43.053000><6.223000,0.135000,43.053000>1.436500 translate<0,0.000000,0>}}
difference{
cylinder{<6.223000,0,43.053000><6.223000,0.036000,43.053000>1.263500 translate<0,0.000000,0>}
cylinder{<6.223000,-0.1,43.053000><6.223000,0.135000,43.053000>1.136500 translate<0,0.000000,0>}}
//RP3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.340000,-1.536000,10.426000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.890000,-1.536000,10.426000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,0.000000,0> translate<7.340000,-1.536000,10.426000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.290000,-1.536000,10.426000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.690000,-1.536000,10.426000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,0.000000,0> translate<8.290000,-1.536000,10.426000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.090000,-1.536000,10.426000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.490000,-1.536000,10.426000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.090000,-1.536000,10.426000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.890000,-1.536000,10.426000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.440000,-1.536000,10.426000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.890000,-1.536000,10.426000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.440000,-1.536000,10.426000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.440000,-1.536000,11.926000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,90.000000,0> translate<10.440000,-1.536000,11.926000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.340000,-1.536000,11.926000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.340000,-1.536000,10.426000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,-90.000000,0> translate<7.340000,-1.536000,10.426000> }
object{ARC(0.200000,0.101600,0.000000,180.000000,0.036000) translate<8.090000,-1.536000,10.426000>}
object{ARC(0.200000,0.101600,0.000000,180.000000,0.036000) translate<8.890000,-1.536000,10.426000>}
object{ARC(0.200000,0.101600,0.000000,180.000000,0.036000) translate<9.690000,-1.536000,10.426000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.440000,-1.536000,11.926000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.890000,-1.536000,11.926000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.890000,-1.536000,11.926000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.490000,-1.536000,11.926000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.090000,-1.536000,11.926000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.090000,-1.536000,11.926000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.690000,-1.536000,11.926000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<8.290000,-1.536000,11.926000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,0.000000,0> translate<8.290000,-1.536000,11.926000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.890000,-1.536000,11.926000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<7.340000,-1.536000,11.926000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,0.000000,0> translate<7.340000,-1.536000,11.926000> }
object{ARC(0.200000,0.101600,180.000000,360.000000,0.036000) translate<9.690000,-1.536000,11.926000>}
object{ARC(0.200000,0.101600,180.000000,360.000000,0.036000) translate<8.890000,-1.536000,11.926000>}
object{ARC(0.200000,0.101600,180.000000,360.000000,0.036000) translate<8.090000,-1.536000,11.926000>}
//RX silk screen
object{ARC(0.354172,0.101600,278.802740,441.197260,0.036000) translate<3.592800,0.000000,35.560000>}
object{ARC(0.354172,0.101600,98.802740,261.197260,0.036000) translate<5.551200,0.000000,35.560000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.047000,0.000000,36.135000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.097000,0.000000,36.135000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.047000,0.000000,36.135000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.072000,0.000000,34.985000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.647000,0.000000,34.985000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<3.647000,0.000000,34.985000> }
difference{
cylinder{<3.722000,0,35.110000><3.722000,0.036000,35.110000>0.153800 translate<0,0.000000,0>}
cylinder{<3.722000,-0.1,35.110000><3.722000,0.135000,35.110000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<3.822000,0.000000,36.022500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.947000,0.000000,35.310000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.947000,0.000000,35.810000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<3.984500,0.000000,35.560000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.322000,0.000000,36.022500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.322000,0.000000,35.097500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.197000,0.000000,35.810000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.197000,0.000000,35.310000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<5.159500,0.000000,35.560000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-90.000000,0> translate<4.472000,0.000000,35.560000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-90.000000,0> translate<3.922000,0.000000,35.110000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-90.000000,0> translate<3.609500,0.000000,35.097500>}
//T1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.820900,-1.536000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.925300,-1.536000,30.861000>}
box{<0,0,-0.076200><2.895600,0.036000,0.076200> rotate<0,0.000000,0> translate<11.925300,-1.536000,30.861000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.925300,-1.536000,30.861000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.925300,-1.536000,30.099000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.925300,-1.536000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.925300,-1.536000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.820900,-1.536000,30.099000>}
box{<0,0,-0.076200><2.895600,0.036000,0.076200> rotate<0,0.000000,0> translate<11.925300,-1.536000,30.099000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.820900,-1.536000,30.099000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.820900,-1.536000,30.861000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.820900,-1.536000,30.861000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<12.420600,-1.536000,31.165800>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<14.351000,-1.536000,31.165800>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-180.000000,0> translate<13.385800,-1.536000,29.794200>}
//T2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.912600,-1.536000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,-1.536000,37.338000>}
box{<0,0,-0.076200><2.895600,0.036000,0.076200> rotate<0,0.000000,0> translate<11.912600,-1.536000,37.338000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,-1.536000,37.338000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,-1.536000,38.100000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.808200,-1.536000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.808200,-1.536000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.912600,-1.536000,38.100000>}
box{<0,0,-0.076200><2.895600,0.036000,0.076200> rotate<0,0.000000,0> translate<11.912600,-1.536000,38.100000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.912600,-1.536000,38.100000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.912600,-1.536000,37.338000>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.912600,-1.536000,37.338000> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<14.312900,-1.536000,37.033200>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<12.382500,-1.536000,37.033200>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-0.000000,0> translate<13.347700,-1.536000,38.404800>}
//TX silk screen
object{ARC(0.354172,0.101600,278.802740,441.197260,0.036000) translate<3.592800,0.000000,33.655000>}
object{ARC(0.354172,0.101600,98.802740,261.197260,0.036000) translate<5.551200,0.000000,33.655000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.047000,0.000000,34.230000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.097000,0.000000,34.230000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<4.047000,0.000000,34.230000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<5.072000,0.000000,33.080000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.647000,0.000000,33.080000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<3.647000,0.000000,33.080000> }
difference{
cylinder{<3.722000,0,33.205000><3.722000,0.036000,33.205000>0.153800 translate<0,0.000000,0>}
cylinder{<3.722000,-0.1,33.205000><3.722000,0.135000,33.205000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<3.822000,0.000000,34.117500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.947000,0.000000,33.405000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.947000,0.000000,33.905000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<3.984500,0.000000,33.655000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.322000,0.000000,34.117500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.322000,0.000000,33.192500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.197000,0.000000,33.905000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.197000,0.000000,33.405000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<5.159500,0.000000,33.655000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-90.000000,0> translate<4.472000,0.000000,33.655000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-90.000000,0> translate<3.922000,0.000000,33.205000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-90.000000,0> translate<3.609500,0.000000,33.192500>}
//U$3 silk screen
//U$37 silk screen
//U$53 silk screen
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.890000,0.000000,26.539747>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.940250,0.000000,21.590000>}
box{<0,0,-0.101600><7.000001,0.036000,0.101600> rotate<0,-44.997012,0> translate<3.940250,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<3.940250,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.890000,0.000000,16.640250>}
box{<0,0,-0.101600><7.000004,0.036000,0.101600> rotate<0,44.997030,0> translate<3.940250,0.000000,21.590000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.890000,0.000000,16.640250>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.839747,0.000000,21.590000>}
box{<0,0,-0.101600><7.000001,0.036000,0.101600> rotate<0,-44.997048,0> translate<8.890000,0.000000,16.640250> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<13.839747,0.000000,21.590000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<8.890000,0.000000,26.539747>}
box{<0,0,-0.101600><6.999999,0.036000,0.101600> rotate<0,44.997030,0> translate<8.890000,0.000000,26.539747> }
box{<-1.750000,0,-1.750000><1.750000,0.036000,1.750000> rotate<0,-225.000000,0> translate<11.364872,0.000000,21.590000>}
//U2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.715000,-1.536000,30.886400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.271000,-1.536000,30.886400>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.715000,-1.536000,30.886400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.271000,-1.536000,30.886400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.271000,-1.536000,37.439600>}
box{<0,0,-0.101600><6.553200,0.036000,0.101600> rotate<0,90.000000,0> translate<9.271000,-1.536000,37.439600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<9.271000,-1.536000,37.439600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.715000,-1.536000,37.439600>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<5.715000,-1.536000,37.439600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.715000,-1.536000,37.439600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<5.715000,-1.536000,30.886400>}
box{<0,0,-0.101600><6.553200,0.036000,0.101600> rotate<0,-90.000000,0> translate<5.715000,-1.536000,30.886400> }
box{<-1.600200,0,-0.927100><1.600200,0.036000,0.927100> rotate<0,-270.000000,0> translate<4.762500,-1.536000,34.163000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-270.000000,0> translate<10.223500,-1.536000,34.163000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-270.000000,0> translate<10.223500,-1.536000,36.474400>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-270.000000,0> translate<10.223500,-1.536000,31.851600>}
box{<-1.600200,0,-0.927100><1.600200,0.036000,0.927100> rotate<0,-270.000000,0> translate<4.762500,-1.536000,34.163000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-270.000000,0> translate<10.223500,-1.536000,34.163000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-270.000000,0> translate<10.223500,-1.536000,36.474400>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-270.000000,0> translate<10.223500,-1.536000,31.851600>}
//U4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.630000,-1.536000,3.889000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.630000,-1.536000,5.509000>}
box{<0,0,-0.076200><1.620000,0.036000,0.076200> rotate<0,90.000000,0> translate<14.630000,-1.536000,5.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.630000,-1.536000,5.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.786000,-1.536000,5.509000>}
box{<0,0,-0.076200><2.844000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.786000,-1.536000,5.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.786000,-1.536000,5.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.786000,-1.536000,3.889000>}
box{<0,0,-0.076200><1.620000,0.036000,0.076200> rotate<0,-90.000000,0> translate<11.786000,-1.536000,3.889000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.786000,-1.536000,3.889000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.630000,-1.536000,3.889000>}
box{<0,0,-0.076200><2.844000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.786000,-1.536000,3.889000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.686000,-1.536000,3.889000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.730000,-1.536000,3.889000>}
box{<0,0,-0.076200><1.044000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.686000,-1.536000,3.889000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.780000,-1.536000,5.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<12.686000,-1.536000,5.509000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<12.686000,-1.536000,5.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.730000,-1.536000,5.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<13.636000,-1.536000,5.509000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<13.636000,-1.536000,5.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.880000,-1.536000,5.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.786000,-1.536000,5.509000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.786000,-1.536000,5.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.630000,-1.536000,5.509000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.536000,-1.536000,5.509000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.536000,-1.536000,5.509000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.536000,-1.536000,3.889000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<14.630000,-1.536000,3.889000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<14.536000,-1.536000,3.889000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.786000,-1.536000,3.889000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<11.880000,-1.536000,3.889000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,0.000000,0> translate<11.786000,-1.536000,3.889000> }
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-0.000000,0> translate<12.258000,-1.536000,5.874000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-0.000000,0> translate<13.208000,-1.536000,5.874000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-0.000000,0> translate<14.158000,-1.536000,5.874000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-0.000000,0> translate<14.158000,-1.536000,3.524000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-0.000000,0> translate<12.258000,-1.536000,3.524000>}
//Y3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.068000,0.000000,31.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.568000,0.000000,31.445000>}
box{<0,0,-0.063500><2.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.068000,0.000000,31.445000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.568000,0.000000,31.445000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.568000,0.000000,28.245000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.568000,0.000000,28.245000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.568000,0.000000,28.245000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.068000,0.000000,28.245000>}
box{<0,0,-0.063500><2.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.068000,0.000000,28.245000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.068000,0.000000,28.245000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.068000,0.000000,31.445000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<3.068000,0.000000,31.445000> }
//Z1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.283000,-1.536000,7.524000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.783000,-1.536000,7.524000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.283000,-1.536000,7.524000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.783000,-1.536000,7.524000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.783000,-1.536000,8.224000>}
box{<0,0,-0.050800><0.700000,0.036000,0.050800> rotate<0,90.000000,0> translate<10.783000,-1.536000,8.224000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.783000,-1.536000,8.224000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.283000,-1.536000,8.224000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.283000,-1.536000,8.224000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.283000,-1.536000,8.224000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.283000,-1.536000,7.524000>}
box{<0,0,-0.050800><0.700000,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.283000,-1.536000,7.524000> }
box{<-0.175000,0,-0.350000><0.175000,0.036000,0.350000> rotate<0,-0.000000,0> translate<9.458000,-1.536000,7.874000>}
box{<-0.175000,0,-0.350000><0.175000,0.036000,0.350000> rotate<0,-180.000000,0> translate<10.608000,-1.536000,7.874000>}
//Z2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.283000,-1.536000,5.873000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.783000,-1.536000,5.873000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.283000,-1.536000,5.873000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.783000,-1.536000,5.873000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.783000,-1.536000,6.573000>}
box{<0,0,-0.050800><0.700000,0.036000,0.050800> rotate<0,90.000000,0> translate<10.783000,-1.536000,6.573000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<10.783000,-1.536000,6.573000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.283000,-1.536000,6.573000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<9.283000,-1.536000,6.573000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.283000,-1.536000,6.573000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<9.283000,-1.536000,5.873000>}
box{<0,0,-0.050800><0.700000,0.036000,0.050800> rotate<0,-90.000000,0> translate<9.283000,-1.536000,5.873000> }
box{<-0.175000,0,-0.350000><0.175000,0.036000,0.350000> rotate<0,-0.000000,0> translate<9.458000,-1.536000,6.223000>}
box{<-0.175000,0,-0.350000><0.175000,0.036000,0.350000> rotate<0,-180.000000,0> translate<10.608000,-1.536000,6.223000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  ARDUINO_MICRO_REV03J(-8.890000,0,-24.130000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//C3	22u	SMC_B
//C14	22u	SMC_B
//F1	MF-MSMF050-2 500mA	L1812
//J3	USB-MICRO!!!	CON2_USB_MICRO_B_AT
//J5	HEAD17-NOSS	HEAD17-NOSS
//J6	HEAD17-NOSS-1	HEAD17-NOSS-1
//L2	MH2029-300Y	0805
//RESET	TS42	TS42
//RP3	22R	CAY16
//T1	FDN340P/PMV48XP	SOT-23
//T2	PMV48XP	SOT-23
//U$3	DISCLAIMER	DISCLAIMER
//U$37	FIDUCIALMOUNT	FIDUCIA-MOUNT
//U$53	FIDUCIAL1X2	FIDUCIAL-1X2
//U1	ATMEGA32U4-XUMU	QFN44ML7X7
//U4	LP2985-33DBVR	SOT23-DBV
//Y3	16MHz KX-7	CRYSTAL-3.2-2.5
//Z1	CG0603MLC-05E	CT/CN0603
//Z2	CG0603MLC-05E	CT/CN0603
