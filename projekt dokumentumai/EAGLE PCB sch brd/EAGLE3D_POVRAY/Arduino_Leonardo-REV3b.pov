//POVRay-File created by 3d41.ulp v20110101
//C:/Users/Rendszergazda/Documents/eagle/CoinSorter PCBs/Arduino_Leonardo-REV3b/Arduino_Leonardo-REV3b.brd
//2016.01.19. 14:09

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
#local cam_y = 229;
#local cam_z = -122;
#local cam_a = 20;
#local cam_look_x = 0;
#local cam_look_y = -5;
#local cam_look_z = 0;

#local pcb_rotate_x = -18;
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

#local lgt1_pos_x = 26;
#local lgt1_pos_y = 39;
#local lgt1_pos_z = 28;
#local lgt1_intense = 0.752258;
#local lgt2_pos_x = -26;
#local lgt2_pos_y = 39;
#local lgt2_pos_z = 28;
#local lgt2_intense = 0.752258;
#local lgt3_pos_x = 26;
#local lgt3_pos_y = 39;
#local lgt3_pos_z = -19;
#local lgt3_intense = 0.752258;
#local lgt4_pos_x = -26;
#local lgt4_pos_y = 39;
#local lgt4_pos_z = -19;
#local lgt4_intense = 0.752258;

//Do not change these values
#declare pcb_height = 1.500000;
#declare pcb_cuheight = 0.035000;
#declare pcb_x_size = 68.580000;
#declare pcb_y_size = 53.340000;
#declare pcb_layer1_used = 1;
#declare pcb_layer16_used = 1;
#declare inc_testmode = off;
#declare global_seed=seed(600);
#declare global_pcb_layer_dis = array[16]
{
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
	0.000000,
	0.000000,
	0.000000,
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
	//translate<-34.290000,0,-26.670000>
}
#end

background{col_bgr}
light_source{<lgt1_pos_x,lgt1_pos_y,lgt1_pos_z> White*lgt1_intense}
light_source{<lgt2_pos_x,lgt2_pos_y,lgt2_pos_z> White*lgt2_intense}
light_source{<lgt3_pos_x,lgt3_pos_y,lgt3_pos_z> White*lgt3_intense}
light_source{<lgt4_pos_x,lgt4_pos_y,lgt4_pos_z> White*lgt4_intense}
#end


#macro ARDUINO_LEONARDO_REV3B(mac_x_ver,mac_y_ver,mac_z_ver,mac_x_rot,mac_y_rot,mac_z_rot)
union{
#if(pcb_board = on)
difference{
union{
//Board
prism{-1.500000,0.000000,51
<1.000000,0.000000><65.040000,0.000000>
<(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-0.000000,0>)+<65.040000,0,1.000000>).x,(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-0.000000,0>)+<65.040000,0,1.000000>).z>
<(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-10.001111,0>)+<65.040000,0,1.000000>).x,(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-10.001111,0>)+<65.040000,0,1.000000>).z>
<(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-20.002222,0>)+<65.040000,0,1.000000>).x,(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-20.002222,0>)+<65.040000,0,1.000000>).z>
<(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-30.003334,0>)+<65.040000,0,1.000000>).x,(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-30.003334,0>)+<65.040000,0,1.000000>).z>
<(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-40.004445,0>)+<65.040000,0,1.000000>).x,(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-40.004445,0>)+<65.040000,0,1.000000>).z>
<(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-50.005556,0>)+<65.040000,0,1.000000>).x,(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-50.005556,0>)+<65.040000,0,1.000000>).z>
<(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-60.006667,0>)+<65.040000,0,1.000000>).x,(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-60.006667,0>)+<65.040000,0,1.000000>).z>
<(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-70.007779,0>)+<65.040000,0,1.000000>).x,(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-70.007779,0>)+<65.040000,0,1.000000>).z>
<(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-80.008890,0>)+<65.040000,0,1.000000>).x,(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-80.008890,0>)+<65.040000,0,1.000000>).z>
<(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-90.010001,0>)+<65.040000,0,1.000000>).x,(vrotate(<65.040000,0,0.000000>-<65.040000,0,1.000000>,<0,-90.010001,0>)+<65.040000,0,1.000000>).z>
<66.040000,1.000000>
<66.040000,1.000000><66.040000,2.540000>
<66.040000,2.540000><68.580000,5.080000>
<68.580000,5.080000><68.580000,37.846000>
<68.580000,37.846000><66.040000,40.386000>
<66.040000,40.386000><66.040000,51.816000>
<66.040000,51.816000><64.516000,53.340000>
<64.516000,53.340000><1.000000,53.340000>
<(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-0.000000,0>)+<1.000000,0,52.340000>).x,(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-0.000000,0>)+<1.000000,0,52.340000>).z>
<(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-10.001111,0>)+<1.000000,0,52.340000>).x,(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-10.001111,0>)+<1.000000,0,52.340000>).z>
<(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-20.002222,0>)+<1.000000,0,52.340000>).x,(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-20.002222,0>)+<1.000000,0,52.340000>).z>
<(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-30.003334,0>)+<1.000000,0,52.340000>).x,(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-30.003334,0>)+<1.000000,0,52.340000>).z>
<(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-40.004445,0>)+<1.000000,0,52.340000>).x,(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-40.004445,0>)+<1.000000,0,52.340000>).z>
<(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-50.005556,0>)+<1.000000,0,52.340000>).x,(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-50.005556,0>)+<1.000000,0,52.340000>).z>
<(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-60.006667,0>)+<1.000000,0,52.340000>).x,(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-60.006667,0>)+<1.000000,0,52.340000>).z>
<(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-70.007779,0>)+<1.000000,0,52.340000>).x,(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-70.007779,0>)+<1.000000,0,52.340000>).z>
<(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-80.008890,0>)+<1.000000,0,52.340000>).x,(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-80.008890,0>)+<1.000000,0,52.340000>).z>
<(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-90.010001,0>)+<1.000000,0,52.340000>).x,(vrotate(<1.000000,0,53.340000>-<1.000000,0,52.340000>,<0,-90.010001,0>)+<1.000000,0,52.340000>).z>
<0.000000,52.340000>
<0.000000,52.340000><0.000000,1.000000>
<(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-0.000000,0>)+<1.000000,0,1.000000>).x,(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-0.000000,0>)+<1.000000,0,1.000000>).z>
<(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-10.001111,0>)+<1.000000,0,1.000000>).x,(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-10.001111,0>)+<1.000000,0,1.000000>).z>
<(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-20.002222,0>)+<1.000000,0,1.000000>).x,(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-20.002222,0>)+<1.000000,0,1.000000>).z>
<(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-30.003334,0>)+<1.000000,0,1.000000>).x,(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-30.003334,0>)+<1.000000,0,1.000000>).z>
<(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-40.004445,0>)+<1.000000,0,1.000000>).x,(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-40.004445,0>)+<1.000000,0,1.000000>).z>
<(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-50.005556,0>)+<1.000000,0,1.000000>).x,(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-50.005556,0>)+<1.000000,0,1.000000>).z>
<(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-60.006667,0>)+<1.000000,0,1.000000>).x,(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-60.006667,0>)+<1.000000,0,1.000000>).z>
<(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-70.007779,0>)+<1.000000,0,1.000000>).x,(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-70.007779,0>)+<1.000000,0,1.000000>).z>
<(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-80.008890,0>)+<1.000000,0,1.000000>).x,(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-80.008890,0>)+<1.000000,0,1.000000>).z>
<(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-90.010001,0>)+<1.000000,0,1.000000>).x,(vrotate(<0.000000,0,1.000000>-<1.000000,0,1.000000>,<0,-90.010001,0>)+<1.000000,0,1.000000>).z>
<1.000000,0.000000>
texture{col_brd}}
}//End union(PCB)
//Holes(real)/Parts
//Holes(real)/Board
cylinder{<66.040000,1,35.560000><66.040000,-5,35.560000>1.600000 texture{col_hls}}
cylinder{<66.040000,1,7.620000><66.040000,-5,7.620000>1.600000 texture{col_hls}}
cylinder{<15.240000,1,50.800000><15.240000,-5,50.800000>1.600000 texture{col_hls}}
cylinder{<13.970000,1,2.540000><13.970000,-5,2.540000>1.600000 texture{col_hls}}
//Holes(real)/Vias
}//End difference(reale Bohrungen/Durchbrüche)
#end
#if(pcb_parts=on)//Parts
union{
#ifndef(pack_D1) #declare global_pack_D1=yes; object {DIODE_SMD_SMB()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<21.590000,0.000000,7.620000>translate<0,0.035000,0> }#end		//DO214 AA D1 M7 SMB
#ifndef(pack_D2) #declare global_pack_D2=yes; object {DIODE_SMD_MINIMELF("CD1206-S01575",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<58.928000,0.000000,26.670000>translate<0,0.035000,0> }#end		//SMD-Diode MINIMELF-Outline D2 CD1206-S01575 MINIMELF
#ifndef(pack_IC1) #declare global_pack_IC1=yes; object {IC_SMD_SOT223("NCP1117ST50T3G","ATMEL",)translate<0,0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<16.510000,0.000000,17.145000>translate<0,0.035000,0> }#end		//SOT223 IC1 NCP1117ST50T3G SOT223
#ifndef(pack_ICSP) #declare global_pack_ICSP=yes; object {CON_PH_2X3()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-270.000000,0> rotate<0,0,0> translate<64.897000,0.000000,27.940000>}#end		//Header 2,54mm Grid 3Pin 2Row (jumper.lib) ICSP ICSP 2X03
#ifndef(pack_J2) #declare global_pack_J2=yes; object {CON_PH_1X8()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<54.610000,0.000000,50.800000>}#end		//Header 2,54mm Grid 8Pin 1Row (jumper.lib) J2 8x1F-H8.5 1X08
#ifndef(pack_J3) #declare global_pack_J3=yes; object {CON_PH_1X8()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<36.830000,0.000000,2.540000>}#end		//Header 2,54mm Grid 8Pin 1Row (jumper.lib) J3 8x1F-H8.5 1X08
#ifndef(pack_J4) #declare global_pack_J4=yes; object {CON_PH_1X6()translate<0,0,0> rotate<0,0.000000,0>rotate<0,0.000000,0> rotate<0,0,0> translate<57.150000,0.000000,2.540000>}#end		//Header 2,54mm Grid 6Pin 1Row (jumper.lib) J4 6x1F-H8.5 1X06
#ifndef(pack_JP1) #declare global_pack_JP1=yes; object {CON_PH_1X10()translate<0,0,0> rotate<0,0.000000,0>rotate<0,-180.000000,0> rotate<0,0,0> translate<30.226000,0.000000,50.800000>}#end		//Header 2,54mm Grid 10Pin 1Row (jumper.lib) JP1 10x1F-H8.5 1X10
#ifndef(pack_L) #declare global_pack_L=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.300000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<4.445000,0.000000,20.320000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 L Yellow CHIPLED_0805
#ifndef(pack_ON) #declare global_pack_ON=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.300000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<4.445000,0.000000,16.510000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 ON Green CHIPLED_0805
#ifndef(pack_R2) #declare global_pack_R2=yes; object {RES_SMD_CHIP_0402("00x",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<55.880000,-1.500000,14.325600>translate<0,-0.035000,0> }#end		//SMD Resistor 0402 R2 NM R0402
#ifndef(pack_R3) #declare global_pack_R3=yes; object {RES_SMD_CHIP_0402("00x",)translate<0,-0,0> rotate<0,0.000000,0>rotate<0,-90.000000,0> rotate<0,0,180> translate<55.880000,-1.500000,14.960600>translate<0,-0.035000,0> }#end		//SMD Resistor 0402 R3 NM R0402
#ifndef(pack_RX) #declare global_pack_RX=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.300000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<4.445000,0.000000,27.940000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 RX Yellow CHIPLED_0805
#ifndef(pack_TX) #declare global_pack_TX=yes; object {DIODE_SMD_LED_CHIP_0805(Red,0.300000,0.000000,)translate<0,0,0> rotate<0,90.000000,0>rotate<0,-90.000000,0> rotate<0,0,0> translate<4.445000,0.000000,24.130000>translate<0,0.035000,0> }#end		//SMD-LED im 0805 TX Yellow CHIPLED_0805
}//End union
#end
#if(pcb_pads_smds=on)
//Pads&SMD/Parts
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<39.624000,0.000000,9.525000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<37.846000,0.000000,9.525000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<53.340000,0.000000,25.781000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<53.340000,0.000000,27.559000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<51.435000,0.000000,25.781000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<51.435000,0.000000,27.559000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<47.371000,0.000000,31.750000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<49.149000,0.000000,31.750000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<57.150000,0.000000,27.559000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<57.150000,0.000000,25.781000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<57.150000,0.000000,10.414000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<57.150000,0.000000,8.636000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<56.261000,0.000000,16.510000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<58.039000,0.000000,16.510000>}
object{TOOLS_PCB_SMD(1.600000,2.400000,0.037000,10) rotate<0,-180.000000,0> texture{col_pds} translate<14.200000,0.000000,28.575000>}
object{TOOLS_PCB_SMD(1.600000,2.400000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<11.200000,0.000000,28.575000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<58.039000,0.000000,18.034000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<56.261000,0.000000,18.034000>}
object{TOOLS_PCB_SMD(1.600000,2.400000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<17.780000,0.000000,9.120000>}
object{TOOLS_PCB_SMD(1.600000,2.400000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<17.780000,0.000000,6.120000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<25.654000,0.000000,19.685000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<23.876000,0.000000,19.685000>}
object{TOOLS_PCB_SMD(1.600000,2.400000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<25.400000,0.000000,9.120000>}
object{TOOLS_PCB_SMD(1.600000,2.400000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<25.400000,0.000000,6.120000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<21.971000,0.000000,30.480000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<23.749000,0.000000,30.480000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<23.876000,0.000000,14.605000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<25.654000,0.000000,14.605000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<23.749000,0.000000,38.100000>}
object{TOOLS_PCB_SMD(1.100000,0.898400,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<21.971000,0.000000,38.100000>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<21.590000,0.000000,5.420000>}
object{TOOLS_PCB_SMD(2.400000,2.400000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<21.590000,0.000000,9.820000>}
object{TOOLS_PCB_SMD(1.400000,1.800000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<58.928000,0.000000,24.970000>}
object{TOOLS_PCB_SMD(1.400000,1.800000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<58.928000,0.000000,28.370000>}
#ifndef(global_pack_EXTPOWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.000000,1.300000,1,16,2+global_tmp,0) rotate<0,-180.000000,0>translate<8.686800,0,3.302000> texture{col_thl}}
#ifndef(global_pack_EXTPOWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.000000,1.300000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<11.684000,0,8.305800> texture{col_thl}}
#ifndef(global_pack_EXTPOWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(4.000000,1.300000,1,16,2+global_tmp,0) rotate<0,-90.000000,0>translate<5.689600,0,8.305800> texture{col_thl}}
#ifndef(global_pack_EXTPOWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<9.448800,0,3.302000> texture{col_thl}}
#ifndef(global_pack_EXTPOWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<7.924800,0,3.302000> texture{col_thl}}
#ifndef(global_pack_EXTPOWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<5.689600,0,7.543800> texture{col_thl}}
#ifndef(global_pack_EXTPOWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<5.689600,0,9.067800> texture{col_thl}}
#ifndef(global_pack_EXTPOWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.684000,0,7.543800> texture{col_thl}}
#ifndef(global_pack_EXTPOWER) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.950000,1.300000,1,16,1+global_tmp,0) rotate<0,-90.000000,0>translate<11.684000,0,9.067800> texture{col_thl}}
object{TOOLS_PCB_SMD(1.900000,3.400000,0.037000,10) rotate<0,-180.000000,0> texture{col_pds} translate<14.650000,0.000000,43.815000>}
object{TOOLS_PCB_SMD(1.900000,3.400000,0.037000,10) rotate<0,-180.000000,0> texture{col_pds} translate<10.750000,0.000000,43.815000>}
object{TOOLS_PCB_SMD(1.016000,1.016000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<6.350000,0.000000,49.911000>}
object{TOOLS_PCB_SMD(1.016000,1.016000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<71.120000,0.000000,35.560000>}
object{TOOLS_PCB_SMD(1.016000,1.016000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<1.905000,0.000000,5.080000>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<19.608800,0.000000,14.833600>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<19.608800,0.000000,17.145000>}
object{TOOLS_PCB_SMD(1.219200,2.235200,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<19.608800,0.000000,19.456400>}
object{TOOLS_PCB_SMD(3.600000,2.200000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<13.411000,0.000000,17.145000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,34) rotate<0,-0.000000,0> texture{col_pds} translate<19.979000,0.000000,32.177000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,34) rotate<0,-0.000000,0> texture{col_pds} translate<20.629000,0.000000,32.177000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,34) rotate<0,-0.000000,0> texture{col_pds} translate<21.279000,0.000000,32.177000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,34) rotate<0,-0.000000,0> texture{col_pds} translate<21.929000,0.000000,32.177000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,34) rotate<0,-0.000000,0> texture{col_pds} translate<21.929000,0.000000,36.402000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,34) rotate<0,-0.000000,0> texture{col_pds} translate<21.279000,0.000000,36.402000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,34) rotate<0,-0.000000,0> texture{col_pds} translate<20.629000,0.000000,36.402000>}
object{TOOLS_PCB_SMD(0.300000,1.200000,0.037000,34) rotate<0,-0.000000,0> texture{col_pds} translate<19.979000,0.000000,36.402000>}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.550000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<63.627000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.550000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<66.167000,0,30.480000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.550000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<63.627000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.550000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<66.167000,0,27.940000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.550000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<63.627000,0,25.400000> texture{col_thl}}
#ifndef(global_pack_ICSP) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.550000,0.950000,1,16,2+global_tmp,0) rotate<0,-270.000000,0>translate<66.167000,0,25.400000> texture{col_thl}}
object{TOOLS_PCB_SMD(0.406400,1.346200,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<4.140200,0.000000,39.420800>}
object{TOOLS_PCB_SMD(0.406400,1.346200,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<4.140200,0.000000,38.760400>}
object{TOOLS_PCB_SMD(0.406400,1.346200,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<4.140200,0.000000,38.100000>}
object{TOOLS_PCB_SMD(0.406400,1.346200,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<4.140200,0.000000,37.439600>}
object{TOOLS_PCB_SMD(0.406400,1.346200,0.037000,25) rotate<0,-270.000000,0> texture{col_pds} translate<4.140200,0.000000,36.779200>}
object{TOOLS_PCB_SMD(1.651000,1.549400,0.037000,20) rotate<0,-270.000000,0> texture{col_pds} translate<1.447800,0.000000,41.402000>}
object{TOOLS_PCB_SMD(1.651000,1.549400,0.037000,20) rotate<0,-270.000000,0> texture{col_pds} translate<1.447800,0.000000,34.798000>}
object{TOOLS_PCB_SMD(1.524000,1.016000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<4.140200,0.000000,40.589200>}
object{TOOLS_PCB_SMD(1.524000,1.016000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<4.140200,0.000000,35.610800>}
object{TOOLS_PCB_SMD(1.524000,1.524000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<1.447800,0.000000,39.116000>}
object{TOOLS_PCB_SMD(1.524000,1.524000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<1.447800,0.000000,37.084000>}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<63.500000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<60.960000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<58.420000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<55.880000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<53.340000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<50.800000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<48.260000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J2) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<45.720000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<27.940000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<30.480000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<33.020000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<35.560000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<38.100000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<40.640000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<43.180000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J3) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<45.720000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<50.800000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<53.340000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<55.880000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<58.420000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<60.960000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_J4) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-90.000000,0>translate<63.500000,0,2.540000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<41.656000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<39.116000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<36.576000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<34.036000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<31.496000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<28.956000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<26.416000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<23.876000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<21.336000,0,50.800000> texture{col_thl}}
#ifndef(global_pack_JP1) #local global_tmp=0; #else #local global_tmp=100; #end object{TOOLS_PCB_VIA(1.422400,0.850000,1,16,3+global_tmp,50) rotate<0,-270.000000,0>translate<18.796000,0,50.800000> texture{col_thl}}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<5.495000,0.000000,20.320000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<3.395000,0.000000,20.320000>}
object{TOOLS_PCB_SMD(1.200000,1.000000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<55.245000,0.000000,27.770000>}
object{TOOLS_PCB_SMD(1.200000,1.000000,0.037000,10) rotate<0,-270.000000,0> texture{col_pds} translate<55.245000,0.000000,25.570000>}
object{TOOLS_PCB_SMD(1.200000,1.000000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<11.600000,0.000000,32.385000>}
object{TOOLS_PCB_SMD(1.200000,1.000000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<13.800000,0.000000,32.385000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<5.495000,0.000000,16.510000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<3.395000,0.000000,16.510000>}
object{TOOLS_PCB_SMD(0.800000,0.800000,0.037000,100) rotate<0,-0.000000,0> texture{col_pds} translate<0.000000,-1.537000,0.000000>}
object{TOOLS_PCB_SMD(0.898400,1.100000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<47.371000,0.000000,25.400000>}
object{TOOLS_PCB_SMD(0.898400,1.100000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<49.149000,0.000000,25.400000>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<55.880000,-1.537000,13.675600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<55.880000,-1.537000,14.975600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<55.880000,-1.537000,14.310600>}
object{TOOLS_PCB_SMD(0.700000,0.900000,0.037000,90) rotate<0,-90.000000,0> texture{col_pds} translate<55.880000,-1.537000,15.610600>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,15) rotate<0,-180.000000,0> texture{col_pds} translate<10.550000,0.000000,47.153000>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,15) rotate<0,-180.000000,0> texture{col_pds} translate<2.150000,0.000000,47.153000>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,15) rotate<0,-180.000000,0> texture{col_pds} translate<10.550000,0.000000,51.653000>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,15) rotate<0,-180.000000,0> texture{col_pds} translate<2.150000,0.000000,51.653000>}
object{TOOLS_PCB_SMD(1.600000,1.400000,0.037000,15) rotate<0,-180.000000,0> texture{col_pds} translate<10.550000,0.000000,49.403000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-270.000000,0> texture{col_pds} translate<29.805000,0.000000,19.615000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-270.000000,0> texture{col_pds} translate<29.805000,0.000000,18.815000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-270.000000,0> texture{col_pds} translate<29.805000,0.000000,18.015000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-270.000000,0> texture{col_pds} translate<29.805000,0.000000,17.215000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-270.000000,0> texture{col_pds} translate<31.155000,0.000000,17.215000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-270.000000,0> texture{col_pds} translate<31.155000,0.000000,18.015000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-270.000000,0> texture{col_pds} translate<31.155000,0.000000,18.815000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-270.000000,0> texture{col_pds} translate<31.155000,0.000000,19.615000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<13.375000,0.000000,23.565000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<13.375000,0.000000,24.365000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<13.375000,0.000000,25.165000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<13.375000,0.000000,25.965000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<12.025000,0.000000,25.965000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<12.025000,0.000000,25.165000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<12.025000,0.000000,24.365000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<12.025000,0.000000,23.565000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<13.375000,0.000000,36.265000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<13.375000,0.000000,37.065000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<13.375000,0.000000,37.865000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<13.375000,0.000000,38.665000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<12.025000,0.000000,38.665000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<12.025000,0.000000,37.865000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<12.025000,0.000000,37.065000>}
object{TOOLS_PCB_SMD(0.500000,0.650000,0.037000,20) rotate<0,-90.000000,0> texture{col_pds} translate<12.025000,0.000000,36.265000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<5.495000,0.000000,27.940000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<3.395000,0.000000,27.940000>}
object{TOOLS_PCB_SMD(0.787400,0.889000,0.037000,13) rotate<0,-270.000000,0> texture{col_pds} translate<16.764000,0.000000,28.549600>}
object{TOOLS_PCB_SMD(0.787400,0.889000,0.037000,13) rotate<0,-270.000000,0> texture{col_pds} translate<18.796000,0.000000,29.514800>}
object{TOOLS_PCB_SMD(0.787400,0.889000,0.037000,13) rotate<0,-270.000000,0> texture{col_pds} translate<18.796000,0.000000,27.584400>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<5.495000,0.000000,24.130000>}
object{TOOLS_PCB_SMD(1.200000,1.200000,0.037000,10) rotate<0,-90.000000,0> texture{col_pds} translate<3.395000,0.000000,24.130000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,14.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,14.510000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,15.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,15.510000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,16.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,16.510000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,17.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,17.510000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,18.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,18.510000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.265000,0.000000,19.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<49.490000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<48.990000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<48.490000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<47.990000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<47.490000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<46.990000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<46.490000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<45.990000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<45.490000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<44.990000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-270.000000,0> texture{col_pds} translate<44.490000,0.000000,19.785000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,19.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,18.510000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,18.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,17.510000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,17.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,16.510000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,16.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,15.510000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,15.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,14.510000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-0.000000,0> texture{col_pds} translate<43.715000,0.000000,14.010000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<44.490000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<44.990000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<45.490000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<45.990000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<46.490000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<46.990000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<47.490000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<47.990000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<48.490000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<48.990000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(0.750000,0.275000,0.037000,80) rotate<0,-90.000000,0> texture{col_pds} translate<49.490000,0.000000,13.235000>}
object{TOOLS_PCB_SMD(4.826000,4.826000,0.037000,10) rotate<0,-180.000000,0> texture{col_pds} translate<46.990000,0.000000,16.510000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,12.510000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,13.310000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,14.110000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,14.910000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,15.710000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,16.510000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,17.310000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,18.110000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,18.910000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,19.710000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<52.790000,0.000000,20.510000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.990000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.190000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<49.390000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<48.590000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<47.790000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<46.990000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<46.190000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<45.390000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<44.590000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<43.790000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<42.990000,0.000000,22.310000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,20.510000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,19.710000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,18.910000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,18.110000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,17.310000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,16.510000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,15.710000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,14.910000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,14.110000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,13.310000>}
object{TOOLS_PCB_SMD(1.400000,0.450000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<41.190000,0.000000,12.510000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<42.990000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<43.790000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<44.590000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<45.390000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<46.190000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<46.990000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<47.790000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<48.590000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<49.390000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.190000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(0.450000,1.400000,0.037000,80) rotate<0,-180.000000,0> texture{col_pds} translate<50.990000,0.000000,10.710000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,100) rotate<0,-180.000000,0> texture{col_pds} translate<46.990000,0.000000,16.510000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,18) rotate<0,-270.000000,0> texture{col_pds} translate<23.465000,0.000000,18.095000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,18) rotate<0,-270.000000,0> texture{col_pds} translate<23.465000,0.000000,17.145000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,18) rotate<0,-270.000000,0> texture{col_pds} translate<23.465000,0.000000,16.195000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,18) rotate<0,-270.000000,0> texture{col_pds} translate<26.065000,0.000000,16.195000>}
object{TOOLS_PCB_SMD(0.550000,1.200000,0.037000,18) rotate<0,-270.000000,0> texture{col_pds} translate<26.065000,0.000000,18.095000>}
object{TOOLS_PCB_SMD(1.050000,1.300000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<47.970000,0.000000,29.725000>}
object{TOOLS_PCB_SMD(1.050000,1.300000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<47.970000,0.000000,27.425000>}
object{TOOLS_PCB_SMD(1.050000,1.300000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<49.820000,0.000000,27.425000>}
object{TOOLS_PCB_SMD(1.050000,1.300000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<49.820000,0.000000,29.725000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<11.700000,0.000000,34.290000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<13.700000,0.000000,34.290000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<11.700000,0.000000,40.640000>}
object{TOOLS_PCB_SMD(1.000000,1.000000,0.037000,10) rotate<0,-0.000000,0> texture{col_pds} translate<13.700000,0.000000,40.640000>}
//Pads/Vias
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<27.686000,0,19.939000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<27.305000,0,13.335000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<17.780000,0,32.131000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2,0) translate<8.890000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2,0) translate<14.605000,0,13.335000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2,0) translate<10.795000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2,0) translate<12.700000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2,0) translate<14.605000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2,0) translate<15.875000,0,17.145000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2,0) translate<8.890000,0,13.335000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2,0) translate<10.795000,0,13.335000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.320800,0.812800,1,16,2,0) translate<12.700000,0,13.335000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<22.987000,0,32.385000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<19.090000,0,36.830000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<55.245000,0,29.845000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<62.230000,0,6.350000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<41.910000,0,9.525000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<57.150000,0,11.785600> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<21.336000,0,24.130000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<55.880000,0,9.525000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<50.393600,0,12.700000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<40.513000,0,22.860000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<54.102000,0,24.511000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<63.500000,0,18.415000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<63.500000,0,13.335000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<43.815000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<42.545000,0,26.035000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<21.590000,0,42.545000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<27.940000,0,30.480000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<41.910000,0,30.480000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<18.415000,0,42.545000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<28.194000,0,32.385000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<41.910000,0,33.020000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<40.640000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<31.115000,0,26.670000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<38.100000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<36.830000,0,26.670000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<53.975000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<37.465000,0,17.145000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<41.783000,0,11.303000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<48.895000,0,14.605000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<60.096400,0,12.141200> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<41.783000,0,23.749000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<56.515000,0,24.511000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<24.257000,0,39.624000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<33.020000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<29.972000,0,13.081000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<41.910000,0,7.620000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<66.040000,0,13.335000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<66.040000,0,18.415000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<48.260000,0,2.540000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<43.688000,0,50.800000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<32.639000,0,22.352000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<4.445000,0,42.545000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<4.445000,0,33.655000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<25.908000,0,2.540000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<1.143000,0,40.259000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<1.143000,0,35.941000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<2.540000,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<1.143000,0,42.926000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<1.016000,0,33.274000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<64.770000,0,40.640000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<35.560000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<34.290000,0,26.670000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<33.020000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<52.070000,0,22.225000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<38.735000,0,25.400000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<30.480000,0,31.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<33.020000,0,31.750000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<29.210000,0,27.940000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<21.844000,0,34.417000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<17.780000,0,30.607000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<9.525000,0,29.210000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<55.880000,0,21.590000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<14.605000,0,36.195000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<59.055000,0,14.859000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<14.605000,0,38.100000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<59.055000,0,13.335000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<1.905000,0,49.530000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<60.833000,0,9.271000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<29.210000,0,14.605000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<1.905000,0,30.480000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<60.833000,0,10.795000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<1.905000,0,28.575000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<23.495000,0,24.130000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<10.160000,0,33.655000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<59.055000,0,16.510000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<19.685000,0,20.701000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<24.130000,0,11.430000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<59.055000,0,19.685000> texture{col_thl}}
object{TOOLS_PCB_VIA(1.117600,0.609600,1,16,2,0) translate<17.780000,0,40.005000> texture{col_thl}}
#end
#if(pcb_wires=on)
union{
//Signals
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.889000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.889000,-1.535000,31.369000>}
box{<0,0,-0.152400><4.191000,0.035000,0.152400> rotate<0,90.000000,0> translate<0.889000,-1.535000,31.369000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,48.895000>}
box{<0,0,-0.152400><4.445000,0.035000,0.152400> rotate<0,90.000000,0> translate<1.270000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.889000,-1.535000,27.178000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.397000,-1.535000,26.670000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,44.997030,0> translate<0.889000,-1.535000,27.178000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,0.000000,28.575000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,90.000000,0> translate<1.905000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,0.000000,47.906000>}
box{<0,0,-0.152400><1.624000,0.035000,0.152400> rotate<0,-90.000000,0> translate<1.905000,0.000000,47.906000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,-1.535000,49.530000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<1.270000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,0.000000,47.906000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.150000,0.000000,47.153000>}
box{<0,0,-0.152400><0.791855,0.035000,0.152400> rotate<0,71.972165,0> translate<1.905000,0.000000,47.906000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.540000,0.000000,24.130000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<1.905000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.540000,0.000000,30.480000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,0.000000,0> translate<1.905000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.921000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<2.921000,0.000000,39.878000>}
box{<0,0,-0.203200><3.683000,0.035000,0.203200> rotate<0,90.000000,0> translate<2.921000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<0.889000,-1.535000,31.369000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.048000,-1.535000,33.528000>}
box{<0,0,-0.152400><3.053287,0.035000,0.152400> rotate<0,-44.997030,0> translate<0.889000,-1.535000,31.369000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.048000,-1.535000,33.528000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.048000,-1.535000,36.703000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,90.000000,0> translate<3.048000,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.270000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.048000,-1.535000,42.672000>}
box{<0,0,-0.152400><2.514472,0.035000,0.152400> rotate<0,44.997030,0> translate<1.270000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.048000,-1.535000,39.497000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.048000,-1.535000,42.672000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,90.000000,0> translate<3.048000,-1.535000,42.672000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,-1.535000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,-1.535000,27.305000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<1.905000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.447800,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.327400,0.000000,34.798000>}
box{<0,0,-0.304800><1.879600,0.035000,0.304800> rotate<0,0.000000,0> translate<1.447800,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<1.447800,0.000000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.327400,0.000000,41.402000>}
box{<0,0,-0.304800><1.879600,0.035000,0.304800> rotate<0,0.000000,0> translate<1.447800,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.540000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.395000,0.000000,24.130000>}
box{<0,0,-0.152400><0.855000,0.035000,0.152400> rotate<0,0.000000,0> translate<2.540000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<2.540000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.395000,0.000000,29.625000>}
box{<0,0,-0.152400><1.209153,0.035000,0.152400> rotate<0,44.997030,0> translate<2.540000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.395000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.395000,0.000000,29.625000>}
box{<0,0,-0.152400><1.685000,0.035000,0.152400> rotate<0,90.000000,0> translate<3.395000,0.000000,29.625000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.921000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.429000,0.000000,35.687000>}
box{<0,0,-0.304800><0.718420,0.035000,0.304800> rotate<0,44.997030,0> translate<2.921000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.921000,0.000000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.632200,0.000000,40.589200>}
box{<0,0,-0.304800><1.005789,0.035000,0.304800> rotate<0,-44.997030,0> translate<2.921000,0.000000,39.878000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.048000,-1.535000,36.703000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,37.465000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,-44.997030,0> translate<3.048000,-1.535000,36.703000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.048000,-1.535000,39.497000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,38.735000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,44.997030,0> translate<3.048000,-1.535000,39.497000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.810000,-1.535000,38.735000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<3.810000,-1.535000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.150000,0.000000,51.653000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.028000,0.000000,51.653000>}
box{<0,0,-0.304800><1.878000,0.035000,0.304800> rotate<0,0.000000,0> translate<2.150000,0.000000,51.653000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.429000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.064000,0.000000,35.687000>}
box{<0,0,-0.304800><0.635000,0.035000,0.304800> rotate<0,0.000000,0> translate<3.429000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.327400,0.000000,34.798000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.140200,0.000000,35.610800>}
box{<0,0,-0.304800><1.149473,0.035000,0.304800> rotate<0,-44.997030,0> translate<3.327400,0.000000,34.798000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.064000,0.000000,35.687000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.140200,0.000000,35.610800>}
box{<0,0,-0.152400><0.107763,0.035000,0.152400> rotate<0,44.997030,0> translate<4.064000,0.000000,35.687000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.327400,0.000000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.140200,0.000000,40.589200>}
box{<0,0,-0.304800><1.149473,0.035000,0.304800> rotate<0,44.997030,0> translate<3.327400,0.000000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<3.632200,0.000000,40.589200>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.140200,0.000000,40.589200>}
box{<0,0,-0.304800><0.508000,0.035000,0.304800> rotate<0,0.000000,0> translate<3.632200,0.000000,40.589200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.905000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.445000,-1.535000,27.940000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<1.905000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.028000,0.000000,51.653000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.445000,0.000000,52.070000>}
box{<0,0,-0.304800><0.589727,0.035000,0.304800> rotate<0,-44.997030,0> translate<4.028000,0.000000,51.653000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<2.150000,0.000000,47.153000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.917000,0.000000,47.153000>}
box{<0,0,-0.304800><2.767000,0.035000,0.304800> rotate<0,0.000000,0> translate<2.150000,0.000000,47.153000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.917000,0.000000,47.153000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,0.000000,46.990000>}
box{<0,0,-0.304800><0.230517,0.035000,0.304800> rotate<0,44.997030,0> translate<4.917000,0.000000,47.153000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.495000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.495000,0.000000,24.165000>}
box{<0,0,-0.152400><0.035000,0.035000,0.152400> rotate<0,90.000000,0> translate<5.495000,0.000000,24.165000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.495000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.715000,0.000000,20.320000>}
box{<0,0,-0.152400><0.220000,0.035000,0.152400> rotate<0,0.000000,0> translate<5.495000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.715000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.715000,0.000000,22.225000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<5.715000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.495000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,0.000000,16.510000>}
box{<0,0,-0.152400><0.855000,0.035000,0.152400> rotate<0,0.000000,0> translate<5.495000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.495000,0.000000,24.165000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.495000,0.000000,25.165000>}
box{<0,0,-0.152400><1.414214,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.495000,0.000000,24.165000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.140200,0.000000,35.610800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.934200,0.000000,35.610800>}
box{<0,0,-0.304800><2.794000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.140200,0.000000,35.610800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.985000,0.000000,17.145000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<6.350000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.985000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.985000,0.000000,22.352000>}
box{<0,0,-0.152400><5.207000,0.035000,0.152400> rotate<0,90.000000,0> translate<6.985000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.495000,0.000000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.470000,0.000000,25.965000>}
box{<0,0,-0.152400><2.793072,0.035000,0.152400> rotate<0,44.997030,0> translate<5.495000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,34.290000>}
box{<0,0,-0.304800><0.635000,0.035000,0.304800> rotate<0,-90.000000,0> translate<7.620000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<6.934200,0.000000,35.610800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,34.925000>}
box{<0,0,-0.304800><0.969868,0.035000,0.304800> rotate<0,44.997030,0> translate<6.934200,0.000000,35.610800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,36.779200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.670800,0.000000,36.779200>}
box{<0,0,-0.203200><3.530600,0.035000,0.203200> rotate<0,0.000000,0> translate<4.140200,0.000000,36.779200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.670800,0.000000,39.420800>}
box{<0,0,-0.203200><3.530600,0.035000,0.203200> rotate<0,0.000000,0> translate<4.140200,0.000000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<5.715000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.855000,0.000000,24.365000>}
box{<0,0,-0.152400><3.026417,0.035000,0.152400> rotate<0,-44.997030,0> translate<5.715000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,38.100000>}
box{<0,0,-0.203200><3.733800,0.035000,0.203200> rotate<0,0.000000,0> translate<4.140200,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.985000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.198000,0.000000,23.565000>}
box{<0,0,-0.152400><1.715441,0.035000,0.152400> rotate<0,-44.997030,0> translate<6.985000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<5.080000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.255000,0.000000,46.990000>}
box{<0,0,-0.304800><3.175000,0.035000,0.304800> rotate<0,0.000000,0> translate<5.080000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<4.445000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.255000,0.000000,52.070000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,0.000000,0> translate<4.445000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.255000,0.000000,46.990000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.418000,0.000000,47.153000>}
box{<0,0,-0.304800><0.230517,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.255000,0.000000,46.990000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.255000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.672000,0.000000,51.653000>}
box{<0,0,-0.304800><0.589727,0.035000,0.304800> rotate<0,44.997030,0> translate<8.255000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,34.925000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,-90.000000,0> translate<8.890000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.670800,0.000000,36.779200>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,35.560000>}
box{<0,0,-0.203200><1.724209,0.035000,0.203200> rotate<0,44.997030,0> translate<7.670800,0.000000,36.779200> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.670800,0.000000,39.420800>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,40.640000>}
box{<0,0,-0.203200><1.724209,0.035000,0.203200> rotate<0,-44.997030,0> translate<7.670800,0.000000,39.420800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.026000,0.000000,39.776000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,0.000000,40.640000>}
box{<0,0,-0.304800><1.221881,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.026000,0.000000,39.776000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,0.000000,29.210000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<9.525000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<7.874000,0.000000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.779000,0.000000,36.195000>}
box{<0,0,-0.203200><2.694077,0.035000,0.203200> rotate<0,44.997030,0> translate<7.874000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.779000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.795000,0.000000,36.195000>}
box{<0,0,-0.203200><0.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<9.779000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,0.000000,26.670000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<9.525000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<8.890000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,0.000000,33.655000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<8.890000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<4.140200,0.000000,38.760400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.455400,0.000000,38.760400>}
box{<0,0,-0.203200><6.315200,0.035000,0.203200> rotate<0,0.000000,0> translate<4.140200,0.000000,38.760400> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.418000,0.000000,47.153000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.550000,0.000000,47.153000>}
box{<0,0,-0.304800><2.132000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.418000,0.000000,47.153000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.672000,0.000000,51.653000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.550000,0.000000,51.653000>}
box{<0,0,-0.304800><1.878000,0.035000,0.304800> rotate<0,0.000000,0> translate<8.672000,0.000000,51.653000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<7.620000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.795000,0.000000,31.115000>}
box{<0,0,-0.304800><4.490128,0.035000,0.304800> rotate<0,44.997030,0> translate<7.620000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<8.890000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.795000,0.000000,42.545000>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,-44.997030,0> translate<8.890000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.750000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.795000,0.000000,43.225000>}
box{<0,0,-0.304800><0.591714,0.035000,0.304800> rotate<0,85.632776,0> translate<10.750000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.795000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.795000,0.000000,43.225000>}
box{<0,0,-0.304800><0.680000,0.035000,0.304800> rotate<0,90.000000,0> translate<10.795000,0.000000,43.225000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,32.385000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<10.160000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,34.655000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,36.195000>}
box{<0,0,-0.152400><1.540000,0.035000,0.152400> rotate<0,90.000000,0> translate<11.430000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,40.275000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,38.735000>}
box{<0,0,-0.152400><1.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<11.430000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.500000,0.000000,36.265000>}
box{<0,0,-0.152400><0.098995,0.035000,0.152400> rotate<0,-44.997030,0> translate<11.430000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.500000,0.000000,38.665000>}
box{<0,0,-0.152400><0.098995,0.035000,0.152400> rotate<0,44.997030,0> translate<11.430000,0.000000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.430000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.600000,0.000000,32.385000>}
box{<0,0,-0.203200><0.170000,0.035000,0.203200> rotate<0,0.000000,0> translate<11.430000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<9.795000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.700000,0.000000,34.290000>}
box{<0,0,-0.203200><2.694077,0.035000,0.203200> rotate<0,44.997030,0> translate<9.795000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,34.655000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.700000,0.000000,34.290000>}
box{<0,0,-0.152400><0.454010,0.035000,0.152400> rotate<0,53.505172,0> translate<11.430000,0.000000,34.655000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.455400,0.000000,38.760400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<11.700000,0.000000,40.640000>}
box{<0,0,-0.203200><2.254313,0.035000,0.203200> rotate<0,-56.485253,0> translate<10.455400,0.000000,38.760400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.430000,0.000000,40.275000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.700000,0.000000,40.640000>}
box{<0,0,-0.152400><0.454010,0.035000,0.152400> rotate<0,-53.505172,0> translate<11.430000,0.000000,40.275000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<8.198000,0.000000,23.565000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.025000,0.000000,23.565000>}
box{<0,0,-0.152400><3.827000,0.035000,0.152400> rotate<0,0.000000,0> translate<8.198000,0.000000,23.565000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.855000,0.000000,24.365000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.025000,0.000000,24.365000>}
box{<0,0,-0.152400><4.170000,0.035000,0.152400> rotate<0,0.000000,0> translate<7.855000,0.000000,24.365000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.495000,0.000000,25.165000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.025000,0.000000,25.165000>}
box{<0,0,-0.152400><5.530000,0.035000,0.152400> rotate<0,0.000000,0> translate<6.495000,0.000000,25.165000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.470000,0.000000,25.965000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.025000,0.000000,25.965000>}
box{<0,0,-0.152400><4.555000,0.035000,0.152400> rotate<0,0.000000,0> translate<7.470000,0.000000,25.965000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.500000,0.000000,36.265000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.025000,0.000000,36.265000>}
box{<0,0,-0.152400><0.525000,0.035000,0.152400> rotate<0,0.000000,0> translate<11.500000,0.000000,36.265000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<11.500000,0.000000,38.665000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<12.025000,0.000000,38.665000>}
box{<0,0,-0.152400><0.525000,0.035000,0.152400> rotate<0,0.000000,0> translate<11.500000,0.000000,38.665000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<11.684000,0.000000,8.305800>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.484100,0.000000,9.105900>}
box{<0,0,-0.508000><1.131512,0.035000,0.508000> rotate<0,-44.997030,0> translate<11.684000,0.000000,8.305800> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.700000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.700000,0.000000,25.165000>}
box{<0,0,-0.101600><1.670000,0.035000,0.101600> rotate<0,90.000000,0> translate<12.700000,0.000000,25.165000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.700000,0.000000,25.165000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.700000,0.000000,25.965000>}
box{<0,0,-0.101600><0.800000,0.035000,0.101600> rotate<0,90.000000,0> translate<12.700000,0.000000,25.965000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<10.795000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.165000,0.000000,31.115000>}
box{<0,0,-0.304800><2.370000,0.035000,0.304800> rotate<0,0.000000,0> translate<10.795000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.700000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.305000,0.000000,23.495000>}
box{<0,0,-0.101600><0.605000,0.035000,0.101600> rotate<0,0.000000,0> translate<12.700000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.305000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.375000,0.000000,23.565000>}
box{<0,0,-0.152400><0.098995,0.035000,0.152400> rotate<0,-44.997030,0> translate<13.305000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.375000,0.000000,22.820000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.375000,0.000000,23.565000>}
box{<0,0,-0.152400><0.745000,0.035000,0.152400> rotate<0,90.000000,0> translate<13.375000,0.000000,23.565000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.700000,0.000000,25.165000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.375000,0.000000,25.165000>}
box{<0,0,-0.101600><0.675000,0.035000,0.101600> rotate<0,0.000000,0> translate<12.700000,0.000000,25.165000> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<12.700000,0.000000,25.965000>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<13.375000,0.000000,25.965000>}
box{<0,0,-0.101600><0.675000,0.035000,0.101600> rotate<0,0.000000,0> translate<12.700000,0.000000,25.965000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<11.684000,-1.535000,8.305800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.538200,-1.535000,10.160000>}
box{<0,0,-0.406400><2.622235,0.035000,0.406400> rotate<0,-44.997030,0> translate<11.684000,-1.535000,8.305800> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<12.484100,0.000000,9.105900>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.740000,0.000000,9.120000>}
box{<0,0,-0.508000><1.255979,0.035000,0.508000> rotate<0,-0.643191,0> translate<12.484100,0.000000,9.105900> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.165000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.800000,0.000000,32.385000>}
box{<0,0,-0.304800><1.419903,0.035000,0.304800> rotate<0,-63.430762,0> translate<13.165000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.700000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.800000,0.000000,34.190000>}
box{<0,0,-0.203200><0.141421,0.035000,0.203200> rotate<0,44.997030,0> translate<13.700000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.800000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<13.800000,0.000000,34.190000>}
box{<0,0,-0.203200><1.805000,0.035000,0.203200> rotate<0,90.000000,0> translate<13.800000,0.000000,34.190000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<10.160000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,26.670000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<10.160000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.375000,0.000000,38.665000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.040000,0.000000,38.665000>}
box{<0,0,-0.152400><0.665000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.375000,0.000000,38.665000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.375000,0.000000,24.365000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.205000,0.000000,24.365000>}
box{<0,0,-0.152400><0.830000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.375000,0.000000,24.365000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.375000,0.000000,36.265000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.535000,0.000000,36.265000>}
box{<0,0,-0.152400><1.160000,0.035000,0.152400> rotate<0,0.000000,0> translate<13.375000,0.000000,36.265000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.375000,0.000000,22.820000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.605000,0.000000,21.590000>}
box{<0,0,-0.152400><1.739483,0.035000,0.152400> rotate<0,44.997030,0> translate<13.375000,0.000000,22.820000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.205000,0.000000,24.365000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.605000,0.000000,24.765000>}
box{<0,0,-0.152400><0.565685,0.035000,0.152400> rotate<0,-44.997030,0> translate<14.205000,0.000000,24.365000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.605000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.605000,0.000000,24.765000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,-90.000000,0> translate<14.605000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<13.970000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.605000,0.000000,26.035000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<13.970000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.700000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,34.290000>}
box{<0,0,-0.304800><0.905000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.700000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.535000,0.000000,36.265000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.605000,0.000000,36.195000>}
box{<0,0,-0.152400><0.098995,0.035000,0.152400> rotate<0,44.997030,0> translate<14.535000,0.000000,36.265000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.040000,0.000000,38.665000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.605000,0.000000,38.100000>}
box{<0,0,-0.152400><0.799031,0.035000,0.152400> rotate<0,44.997030,0> translate<14.040000,0.000000,38.665000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<13.700000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,40.640000>}
box{<0,0,-0.304800><0.905000,0.035000,0.304800> rotate<0,0.000000,0> translate<13.700000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.200000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.835000,0.000000,29.440000>}
box{<0,0,-0.304800><1.073056,0.035000,0.304800> rotate<0,-53.713912,0> translate<14.200000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.200000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.860400,0.000000,28.549600>}
box{<0,0,-0.304800><0.660888,0.035000,0.304800> rotate<0,2.202453,0> translate<14.200000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.650000,0.000000,43.815000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.285000,0.000000,42.500000>}
box{<0,0,-0.304800><1.460291,0.035000,0.304800> rotate<0,64.220342,0> translate<14.650000,0.000000,43.815000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.605000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.367000,-1.535000,38.100000>}
box{<0,0,-0.152400><0.762000,0.035000,0.152400> rotate<0,0.000000,0> translate<14.605000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.835000,0.000000,29.440000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.875000,0.000000,30.480000>}
box{<0,0,-0.304800><1.470782,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.835000,0.000000,29.440000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.875000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.875000,0.000000,33.020000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,90.000000,0> translate<15.875000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.875000,0.000000,35.560000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.605000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,40.640000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.875000,0.000000,39.370000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<14.605000,0.000000,40.640000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.875000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.875000,0.000000,39.370000>}
box{<0,0,-0.304800><3.810000,0.035000,0.304800> rotate<0,90.000000,0> translate<15.875000,0.000000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<14.605000,-1.535000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,-1.535000,36.195000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,0.000000,0> translate<14.605000,-1.535000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.525000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,29.210000>}
box{<0,0,-0.152400><6.985000,0.035000,0.152400> rotate<0,0.000000,0> translate<9.525000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,39.370000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,-90.000000,0> translate<16.510000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.860400,0.000000,28.549600>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<16.764000,0.000000,28.549600>}
box{<0,0,-0.304800><1.903600,0.035000,0.304800> rotate<0,0.000000,0> translate<14.860400,0.000000,28.549600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,0.000000,32.639000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,90.000000,0> translate<16.764000,0.000000,32.639000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,39.370000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.145000,-1.535000,38.735000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<16.510000,-1.535000,39.370000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<13.740000,0.000000,9.120000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.780000,0.000000,9.120000>}
box{<0,0,-0.508000><4.040000,0.035000,0.508000> rotate<0,0.000000,0> translate<13.740000,0.000000,9.120000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.210000,0.000000,9.120000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.780000,0.000000,9.120000>}
box{<0,0,-0.508000><0.570000,0.035000,0.508000> rotate<0,0.000000,0> translate<17.210000,0.000000,9.120000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<1.397000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,26.670000>}
box{<0,0,-0.152400><16.383000,0.035000,0.152400> rotate<0,0.000000,0> translate<1.397000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,0.000000,30.099000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,29.083000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,44.997030,0> translate<16.764000,0.000000,30.099000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,29.083000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,90.000000,0> translate<17.780000,0.000000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,30.607000>}
box{<0,0,-0.152400><1.887991,0.035000,0.152400> rotate<0,-47.723161,0> translate<16.510000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<10.160000,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,33.655000>}
box{<0,0,-0.203200><7.620000,0.035000,0.203200> rotate<0,0.000000,0> translate<10.160000,-1.535000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.875000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,34.925000>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,-44.997030,0> translate<15.875000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<15.285000,0.000000,42.500000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,40.005000>}
box{<0,0,-0.304800><3.528463,0.035000,0.304800> rotate<0,44.997030,0> translate<15.285000,0.000000,42.500000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<17.780000,0.000000,40.005000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,90.000000,0> translate<17.780000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.510000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,44.450000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<16.510000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,32.131000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.907000,-1.535000,32.131000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.780000,-1.535000,32.131000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.907000,-1.535000,32.131000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,-1.535000,32.004000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<17.907000,-1.535000,32.131000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.034000,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,-1.535000,32.004000>}
box{<0,0,-0.152400><0.254000,0.035000,0.152400> rotate<0,0.000000,0> translate<18.034000,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<13.538200,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.415000,-1.535000,10.160000>}
box{<0,0,-0.406400><4.876800,0.035000,0.406400> rotate<0,0.000000,0> translate<13.538200,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<17.780000,0.000000,9.120000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.480000,0.000000,9.820000>}
box{<0,0,-0.508000><0.989949,0.035000,0.508000> rotate<0,-44.997030,0> translate<17.780000,0.000000,9.120000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.770600,0.000000,27.584400>}
box{<0,0,-0.152400><1.400920,0.035000,0.152400> rotate<0,44.997030,0> translate<17.780000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.770600,0.000000,27.584400>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,0.000000,27.584400>}
box{<0,0,-0.152400><0.025400,0.035000,0.152400> rotate<0,0.000000,0> translate<18.770600,0.000000,27.584400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.415000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,0.000000,42.926000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.415000,0.000000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,0.000000,42.926000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.796000,0.000000,50.800000>}
box{<0,0,-0.152400><7.874000,0.035000,0.152400> rotate<0,90.000000,0> translate<18.796000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.764000,0.000000,32.639000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,34.925000>}
box{<0,0,-0.152400><3.232892,0.035000,0.152400> rotate<0,-44.997030,0> translate<16.764000,0.000000,32.639000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,36.536000>}
box{<0,0,-0.203200><0.976000,0.035000,0.203200> rotate<0,90.000000,0> translate<19.050000,-1.535000,36.536000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.145000,-1.535000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,-1.535000,38.735000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.145000,-1.535000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,40.005000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<17.780000,-1.535000,40.005000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,36.536000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.090000,-1.535000,36.830000>}
box{<0,0,-0.203200><0.296709,0.035000,0.203200> rotate<0,-82.246800,0> translate<19.050000,-1.535000,36.536000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.217000,0.000000,30.607000>}
box{<0,0,-0.152400><1.437000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.780000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,0.000000,32.131000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.304000,0.000000,33.655000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,-44.997030,0> translate<17.780000,0.000000,32.131000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.304000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.558000,0.000000,33.655000>}
box{<0,0,-0.152400><0.254000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.304000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.608800,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.608800,0.000000,19.456400>}
box{<0,0,-0.406400><1.422400,0.035000,0.406400> rotate<0,-90.000000,0> translate<19.608800,0.000000,19.456400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<18.415000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.685000,-1.535000,11.430000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<18.415000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.608800,0.000000,19.456400>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,0.000000,19.532600>}
box{<0,0,-0.203200><0.107763,0.035000,0.203200> rotate<0,-44.997030,0> translate<19.608800,0.000000,19.456400> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.685000,0.000000,19.532600>}
box{<0,0,-0.203200><1.168400,0.035000,0.203200> rotate<0,-90.000000,0> translate<19.685000,0.000000,19.532600> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.608800,0.000000,20.878800>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.685000,0.000000,20.701000>}
box{<0,0,-0.406400><0.193441,0.035000,0.406400> rotate<0,66.797001,0> translate<19.608800,0.000000,20.878800> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.685000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<19.685000,-1.535000,20.701000>}
box{<0,0,-0.406400><9.271000,0.035000,0.406400> rotate<0,90.000000,0> translate<19.685000,-1.535000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.415000,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.685000,-1.535000,43.815000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<18.415000,-1.535000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.608800,0.000000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.928800,0.000000,17.465000>}
box{<0,0,-0.304800><0.452548,0.035000,0.304800> rotate<0,-44.997030,0> translate<19.608800,0.000000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.217000,0.000000,30.607000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.979000,0.000000,31.369000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.217000,0.000000,30.607000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.979000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.979000,0.000000,32.177000>}
box{<0,0,-0.152400><0.808000,0.035000,0.152400> rotate<0,90.000000,0> translate<19.979000,0.000000,32.177000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.979000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.979000,0.000000,36.402000>}
box{<0,0,-0.152400><0.428000,0.035000,0.152400> rotate<0,-90.000000,0> translate<19.979000,0.000000,36.402000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.090000,0.000000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.979000,0.000000,36.830000>}
box{<0,0,-0.152400><0.889000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.090000,0.000000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.994000,0.000000,34.925000>}
box{<0,0,-0.152400><0.944000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.050000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,-1.535000,23.749000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.066000,-1.535000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,-1.535000,24.384000>}
box{<0,0,-0.152400><3.232892,0.035000,0.152400> rotate<0,44.997030,0> translate<17.780000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<18.796000,0.000000,29.514800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.066000,0.000000,29.514800>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<18.796000,0.000000,29.514800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.193000,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.193000,-1.535000,36.068000>}
box{<0,0,-0.152400><1.524000,0.035000,0.152400> rotate<0,-90.000000,0> translate<20.193000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.050000,-1.535000,38.735000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.193000,-1.535000,37.592000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,44.997030,0> translate<19.050000,-1.535000,38.735000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,24.638000>}
box{<0,0,-0.152400><1.524000,0.035000,0.152400> rotate<0,90.000000,0> translate<20.320000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<3.175000,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,-1.535000,27.305000>}
box{<0,0,-0.152400><17.145000,0.035000,0.152400> rotate<0,0.000000,0> translate<3.175000,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<14.605000,0.000000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,0.000000,27.305000>}
box{<0,0,-0.304800><8.082231,0.035000,0.304800> rotate<0,-44.997030,0> translate<14.605000,0.000000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.066000,0.000000,29.514800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,0.000000,29.260800>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,44.997030,0> translate<20.066000,0.000000,29.514800> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.320000,0.000000,29.260800>}
box{<0,0,-0.304800><1.955800,0.035000,0.304800> rotate<0,90.000000,0> translate<20.320000,0.000000,29.260800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.979000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.629000,0.000000,31.369000>}
box{<0,0,-0.152400><0.650000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.979000,0.000000,31.369000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.629000,0.000000,31.369000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.629000,0.000000,32.177000>}
box{<0,0,-0.152400><0.808000,0.035000,0.152400> rotate<0,90.000000,0> translate<20.629000,0.000000,32.177000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.994000,0.000000,34.925000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.629000,0.000000,35.560000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.994000,0.000000,34.925000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.629000,0.000000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.629000,0.000000,36.402000>}
box{<0,0,-0.152400><0.842000,0.035000,0.152400> rotate<0,90.000000,0> translate<20.629000,0.000000,36.402000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.685000,0.000000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.701000,0.000000,21.717000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.685000,0.000000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.955000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.955000,-1.535000,36.830000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<20.955000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,40.005000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.955000,-1.535000,38.100000>}
box{<0,0,-0.203200><2.694077,0.035000,0.203200> rotate<0,44.997030,0> translate<19.050000,-1.535000,40.005000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<20.066000,0.000000,29.514800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.005800,0.000000,29.514800>}
box{<0,0,-0.304800><0.939800,0.035000,0.304800> rotate<0,0.000000,0> translate<20.066000,0.000000,29.514800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,23.114000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,0.000000,22.352000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,44.997030,0> translate<20.320000,0.000000,23.114000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<4.445000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.209000,-1.535000,27.940000>}
box{<0,0,-0.152400><16.764000,0.035000,0.152400> rotate<0,0.000000,0> translate<4.445000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.279000,0.000000,33.725000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.279000,0.000000,32.177000>}
box{<0,0,-0.152400><1.548000,0.035000,0.152400> rotate<0,-90.000000,0> translate<21.279000,0.000000,32.177000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.558000,0.000000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.279000,0.000000,35.376000>}
box{<0,0,-0.152400><2.433862,0.035000,0.152400> rotate<0,-44.997030,0> translate<19.558000,0.000000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.279000,0.000000,35.376000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.279000,0.000000,36.402000>}
box{<0,0,-0.152400><1.026000,0.035000,0.152400> rotate<0,90.000000,0> translate<21.279000,0.000000,36.402000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,-1.535000,23.749000>}
box{<0,0,-0.152400><0.381000,0.035000,0.152400> rotate<0,-90.000000,0> translate<21.336000,-1.535000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,0.000000,24.638000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,90.000000,0> translate<21.336000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<18.480000,0.000000,9.820000>}
cylinder{<0,0,0><0,0.035000,0>0.508000 translate<21.590000,0.000000,9.820000>}
box{<0,0,-0.508000><3.110000,0.035000,0.508000> rotate<0,0.000000,0> translate<18.480000,0.000000,9.820000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,0.000000,9.820000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,0.000000,10.160000>}
box{<0,0,-0.406400><0.340000,0.035000,0.406400> rotate<0,90.000000,0> translate<21.590000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,42.545000>}
box{<0,0,-0.152400><0.127000,0.035000,0.152400> rotate<0,90.000000,0> translate<21.590000,-1.535000,42.545000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,0.000000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,0.000000,50.546000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,44.997030,0> translate<21.336000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,0.000000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,0.000000,50.546000>}
box{<0,0,-0.152400><8.001000,0.035000,0.152400> rotate<0,90.000000,0> translate<21.590000,0.000000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.590000,-1.535000,42.418000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.717000,-1.535000,42.291000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,44.997030,0> translate<21.590000,-1.535000,42.418000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.717000,-1.535000,37.211000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.717000,-1.535000,42.291000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,90.000000,0> translate<21.717000,-1.535000,42.291000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.193000,-1.535000,36.068000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.844000,-1.535000,34.417000>}
box{<0,0,-0.152400><2.334867,0.035000,0.152400> rotate<0,44.997030,0> translate<20.193000,-1.535000,36.068000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.279000,0.000000,33.725000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.844000,0.000000,34.417000>}
box{<0,0,-0.152400><0.893358,0.035000,0.152400> rotate<0,-50.765906,0> translate<21.279000,0.000000,33.725000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.929000,0.000000,32.177000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.929000,0.000000,32.978000>}
box{<0,0,-0.152400><0.801000,0.035000,0.152400> rotate<0,90.000000,0> translate<21.929000,0.000000,32.978000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.929000,0.000000,36.402000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.929000,0.000000,37.926000>}
box{<0,0,-0.152400><1.524000,0.035000,0.152400> rotate<0,90.000000,0> translate<21.929000,0.000000,37.926000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.005800,0.000000,29.514800>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.971000,0.000000,30.480000>}
box{<0,0,-0.304800><1.364999,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.005800,0.000000,29.514800> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.929000,0.000000,37.926000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.971000,0.000000,37.968000>}
box{<0,0,-0.152400><0.059397,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.929000,0.000000,37.926000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.971000,0.000000,37.968000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.971000,0.000000,38.100000>}
box{<0,0,-0.152400><0.132000,0.035000,0.152400> rotate<0,90.000000,0> translate<21.971000,0.000000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,-1.535000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,-1.535000,10.287000>}
box{<0,0,-0.152400><2.286000,0.035000,0.152400> rotate<0,-90.000000,0> translate<22.098000,-1.535000,10.287000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.929000,0.000000,36.402000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.136000,0.000000,36.195000>}
box{<0,0,-0.152400><0.292742,0.035000,0.152400> rotate<0,44.997030,0> translate<21.929000,0.000000,36.402000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.225000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.225000,0.000000,16.129000>}
box{<0,0,-0.304800><2.159000,0.035000,0.304800> rotate<0,90.000000,0> translate<22.225000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<19.928800,0.000000,17.465000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.225000,0.000000,17.465000>}
box{<0,0,-0.304800><2.296200,0.035000,0.304800> rotate<0,0.000000,0> translate<19.928800,0.000000,17.465000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.225000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.225000,0.000000,17.465000>}
box{<0,0,-0.304800><1.336000,0.035000,0.304800> rotate<0,90.000000,0> translate<22.225000,0.000000,17.465000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,0.000000,17.465000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,0.000000,18.095000>}
box{<0,0,-0.203200><0.630000,0.035000,0.203200> rotate<0,90.000000,0> translate<22.225000,0.000000,18.095000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<19.050000,-1.535000,35.560000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,-1.535000,32.385000>}
box{<0,0,-0.203200><4.490128,0.035000,0.203200> rotate<0,44.997030,0> translate<19.050000,-1.535000,35.560000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<19.685000,-1.535000,43.815000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.225000,-1.535000,43.815000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<19.685000,-1.535000,43.815000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.479000,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.479000,-1.535000,41.402000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,90.000000,0> translate<22.479000,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,10.795000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<22.860000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<21.590000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,0.000000,11.430000>}
box{<0,0,-0.406400><1.796051,0.035000,0.406400> rotate<0,-44.997030,0> translate<21.590000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,-1.535000,12.573000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,13.335000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,-44.997030,0> translate<22.098000,-1.535000,12.573000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.225000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,13.335000>}
box{<0,0,-0.304800><0.898026,0.035000,0.304800> rotate<0,44.997030,0> translate<22.225000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.479000,-1.535000,41.402000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,41.910000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-53.126596,0> translate<22.479000,-1.535000,41.402000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.225000,-1.535000,43.815000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,43.180000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<22.225000,-1.535000,43.815000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,41.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,43.180000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<22.860000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.098000,-1.535000,10.287000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.987000,-1.535000,9.398000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,44.997030,0> translate<22.098000,-1.535000,10.287000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<21.971000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.987000,0.000000,31.496000>}
box{<0,0,-0.304800><1.436841,0.035000,0.304800> rotate<0,-44.997030,0> translate<21.971000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,-1.535000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.987000,-1.535000,32.385000>}
box{<0,0,-0.203200><0.762000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.225000,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.987000,0.000000,31.496000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.987000,0.000000,32.385000>}
box{<0,0,-0.304800><0.889000,0.035000,0.304800> rotate<0,90.000000,0> translate<22.987000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.929000,0.000000,32.978000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,34.163000>}
box{<0,0,-0.152400><1.675843,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.929000,0.000000,32.978000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,-1.535000,40.894000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,90.000000,0> translate<23.114000,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.465000,0.000000,16.195000>}
box{<0,0,-0.203200><1.241755,0.035000,0.203200> rotate<0,-3.046538,0> translate<22.225000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.225000,0.000000,18.095000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.465000,0.000000,18.095000>}
box{<0,0,-0.203200><1.240000,0.035000,0.203200> rotate<0,0.000000,0> translate<22.225000,0.000000,18.095000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.465000,0.000000,18.095000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.465000,0.000000,19.670000>}
box{<0,0,-0.203200><1.575000,0.035000,0.203200> rotate<0,90.000000,0> translate<23.465000,0.000000,19.670000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,-1.535000,10.160000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,44.997030,0> translate<22.860000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<22.860000,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,-1.535000,12.700000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<22.860000,-1.535000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,-1.535000,24.130000>}
box{<0,0,-0.152400><4.490128,0.035000,0.152400> rotate<0,44.997030,0> translate<20.320000,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,0.000000,34.163000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,0.000000,34.163000>}
box{<0,0,-0.152400><0.381000,0.035000,0.152400> rotate<0,0.000000,0> translate<23.114000,0.000000,34.163000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.136000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,0.000000,36.195000>}
box{<0,0,-0.152400><1.359000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.136000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,-1.535000,40.894000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,-1.535000,41.275000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.114000,-1.535000,40.894000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,-1.535000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,-1.535000,43.180000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<23.495000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.465000,0.000000,19.670000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,0.000000,19.685000>}
box{<0,0,-0.203200><0.411274,0.035000,0.203200> rotate<0,-2.090021,0> translate<23.465000,0.000000,19.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.876000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.876000,0.000000,50.800000>}
box{<0,0,-0.152400><8.636000,0.035000,0.152400> rotate<0,90.000000,0> translate<23.876000,0.000000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<22.860000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.130000,0.000000,11.430000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,0.000000,0> translate<22.860000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<22.860000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,0.000000,13.335000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,0.000000,0> translate<22.860000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.876000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.765000,0.000000,15.890000>}
box{<0,0,-0.203200><1.562545,0.035000,0.203200> rotate<0,-55.319748,0> translate<23.876000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.780000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.765000,-1.535000,44.450000>}
box{<0,0,-0.152400><6.985000,0.035000,0.152400> rotate<0,0.000000,0> translate<17.780000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.765000,-1.535000,44.450000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.495000,-1.535000,43.180000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<24.995000,0.000000,9.120000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.400000,0.000000,9.120000>}
box{<0,0,-0.203200><0.405000,0.035000,0.203200> rotate<0,0.000000,0> translate<24.995000,0.000000,9.120000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.860000,-1.535000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,-1.535000,13.335000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.860000,-1.535000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.320000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,29.718000>}
box{<0,0,-0.152400><7.184205,0.035000,0.152400> rotate<0,-44.997030,0> translate<20.320000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,0.000000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,34.290000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<23.495000,0.000000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,29.718000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,0.000000,34.290000>}
box{<0,0,-0.152400><4.572000,0.035000,0.152400> rotate<0,90.000000,0> translate<25.400000,0.000000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.995000,0.000000,9.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.035000,0.000000,10.160000>}
box{<0,0,-0.304800><1.470782,0.035000,0.304800> rotate<0,-44.997030,0> translate<24.995000,0.000000,9.120000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<24.130000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.035000,0.000000,11.430000>}
box{<0,0,-0.304800><2.694077,0.035000,0.304800> rotate<0,44.997030,0> translate<24.130000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.035000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<26.035000,0.000000,11.430000>}
box{<0,0,-0.304800><1.270000,0.035000,0.304800> rotate<0,90.000000,0> translate<26.035000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.035000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.035000,-1.535000,28.575000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,-90.000000,0> translate<26.035000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,0.000000,24.638000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.035000,0.000000,29.337000>}
box{<0,0,-0.152400><6.645390,0.035000,0.152400> rotate<0,-44.997030,0> translate<21.336000,0.000000,24.638000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<20.955000,-1.535000,36.830000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.035000,-1.535000,31.750000>}
box{<0,0,-0.203200><7.184205,0.035000,0.203200> rotate<0,44.997030,0> translate<20.955000,-1.535000,36.830000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.876000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.035000,0.000000,40.005000>}
box{<0,0,-0.152400><3.053287,0.035000,0.152400> rotate<0,44.997030,0> translate<23.876000,0.000000,42.164000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.035000,0.000000,29.337000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.035000,0.000000,40.005000>}
box{<0,0,-0.152400><10.668000,0.035000,0.152400> rotate<0,90.000000,0> translate<26.035000,0.000000,40.005000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.543000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.543000,-1.535000,19.685000>}
box{<0,0,-0.152400><2.921000,0.035000,0.152400> rotate<0,-90.000000,0> translate<26.543000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.209000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.543000,-1.535000,22.606000>}
box{<0,0,-0.152400><7.543415,0.035000,0.152400> rotate<0,44.997030,0> translate<21.209000,-1.535000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.065000,0.000000,18.095000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.604000,0.000000,18.095000>}
box{<0,0,-0.152400><0.539000,0.035000,0.152400> rotate<0,0.000000,0> translate<26.065000,0.000000,18.095000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,12.700000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.495000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<25.400000,-1.535000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.670000,-1.535000,14.605000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<25.400000,-1.535000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.114000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.924000,-1.535000,34.290000>}
box{<0,0,-0.152400><5.388154,0.035000,0.152400> rotate<0,44.997030,0> translate<23.114000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.670000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,-1.535000,13.335000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<26.670000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<25.654000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,0.000000,14.605000>}
box{<0,0,-0.203200><1.651000,0.035000,0.203200> rotate<0,0.000000,0> translate<25.654000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,0.000000,14.605000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.305000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.604000,0.000000,18.095000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,0.000000,19.050000>}
box{<0,0,-0.152400><1.443173,0.035000,0.152400> rotate<0,-41.429687,0> translate<26.604000,0.000000,18.095000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,19.939000>}
box{<0,0,-0.203200><0.889000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.686000,0.000000,19.939000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<18.288000,-1.535000,32.004000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,22.606000>}
box{<0,0,-0.152400><13.290779,0.035000,0.152400> rotate<0,44.997030,0> translate<18.288000,-1.535000,32.004000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,19.939000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,22.606000>}
box{<0,0,-0.152400><2.667000,0.035000,0.152400> rotate<0,90.000000,0> translate<27.686000,-1.535000,22.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.479000,-1.535000,37.592000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,32.385000>}
box{<0,0,-0.152400><7.363810,0.035000,0.152400> rotate<0,44.997030,0> translate<22.479000,-1.535000,37.592000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.305000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,15.240000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<27.305000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.686000,0.000000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,18.923000>}
box{<0,0,-0.203200><0.283981,0.035000,0.203200> rotate<0,26.563298,0> translate<27.686000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<27.940000,0.000000,18.923000>}
box{<0,0,-0.203200><3.683000,0.035000,0.203200> rotate<0,90.000000,0> translate<27.940000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.717000,-1.535000,37.211000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,-1.535000,30.988000>}
box{<0,0,-0.152400><8.800651,0.035000,0.152400> rotate<0,44.997030,0> translate<21.717000,-1.535000,37.211000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,-1.535000,30.988000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,90.000000,0> translate<27.940000,-1.535000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.924000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,-1.535000,34.290000>}
box{<0,0,-0.152400><1.016000,0.035000,0.152400> rotate<0,0.000000,0> translate<26.924000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.686000,-1.535000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.194000,-1.535000,32.385000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,0.000000,0> translate<27.686000,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.336000,-1.535000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.321000,-1.535000,16.764000>}
box{<0,0,-0.152400><9.878282,0.035000,0.152400> rotate<0,44.997030,0> translate<21.336000,-1.535000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.543000,-1.535000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.448000,-1.535000,17.780000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<26.543000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<23.495000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.575000,0.000000,29.210000>}
box{<0,0,-0.152400><7.184205,0.035000,0.152400> rotate<0,-44.997030,0> translate<23.495000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.575000,0.000000,29.845000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<27.940000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<22.987000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.702000,-1.535000,9.398000>}
box{<0,0,-0.152400><5.715000,0.035000,0.152400> rotate<0,0.000000,0> translate<22.987000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.701000,0.000000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.702000,0.000000,21.717000>}
box{<0,0,-0.152400><8.001000,0.035000,0.152400> rotate<0,0.000000,0> translate<20.701000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.829000,-1.535000,22.606000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.829000,-1.535000,19.431000>}
box{<0,0,-0.203200><3.175000,0.035000,0.203200> rotate<0,-90.000000,0> translate<28.829000,-1.535000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<17.780000,-1.535000,33.655000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.829000,-1.535000,22.606000>}
box{<0,0,-0.203200><15.625646,0.035000,0.203200> rotate<0,44.997030,0> translate<17.780000,-1.535000,33.655000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<21.082000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.956000,0.000000,22.352000>}
box{<0,0,-0.152400><7.874000,0.035000,0.152400> rotate<0,0.000000,0> translate<21.082000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<23.495000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,10.160000>}
box{<0,0,-0.203200><5.715000,0.035000,0.203200> rotate<0,0.000000,0> translate<23.495000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<20.066000,-1.535000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,14.605000>}
box{<0,0,-0.152400><12.931569,0.035000,0.152400> rotate<0,44.997030,0> translate<20.066000,-1.535000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<26.670000,-1.535000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,14.605000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<26.670000,-1.535000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,17.145000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,90.000000,0> translate<29.210000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,27.940000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<29.210000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<27.940000,-1.535000,34.290000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,33.020000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<27.940000,-1.535000,34.290000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,33.020000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,90.000000,0> translate<29.210000,-1.535000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<24.765000,-1.535000,44.450000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,48.895000>}
box{<0,0,-0.152400><6.286179,0.035000,0.152400> rotate<0,-44.997030,0> translate<24.765000,-1.535000,44.450000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.956000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,50.546000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,44.997030,0> translate<28.956000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,50.546000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,90.000000,0> translate<29.210000,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.280000,0.000000,17.215000>}
box{<0,0,-0.152400><0.098995,0.035000,0.152400> rotate<0,-44.997030,0> translate<29.210000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.464000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.464000,0.000000,19.685000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,-90.000000,0> translate<29.464000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.702000,0.000000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.464000,0.000000,20.955000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,44.997030,0> translate<28.702000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.464000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.534000,0.000000,19.615000>}
box{<0,0,-0.152400><0.098995,0.035000,0.152400> rotate<0,44.997030,0> translate<29.464000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.256000,-1.535000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.591000,-1.535000,22.860000>}
box{<0,0,-0.152400><18.858538,0.035000,0.152400> rotate<0,44.997030,0> translate<16.256000,-1.535000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.591000,-1.535000,19.939000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.591000,-1.535000,22.860000>}
box{<0,0,-0.152400><2.921000,0.035000,0.152400> rotate<0,90.000000,0> translate<29.591000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.280000,0.000000,17.215000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.805000,0.000000,17.215000>}
box{<0,0,-0.152400><0.525000,0.035000,0.152400> rotate<0,0.000000,0> translate<29.280000,0.000000,17.215000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.534000,0.000000,19.615000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.805000,0.000000,19.615000>}
box{<0,0,-0.152400><0.271000,0.035000,0.152400> rotate<0,0.000000,0> translate<29.534000,0.000000,19.615000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<24.130000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.845000,-1.535000,11.430000>}
box{<0,0,-0.406400><5.715000,0.035000,0.406400> rotate<0,0.000000,0> translate<24.130000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<28.829000,-1.535000,19.431000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.845000,-1.535000,18.415000>}
box{<0,0,-0.203200><1.436841,0.035000,0.203200> rotate<0,44.997030,0> translate<28.829000,-1.535000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-1.535000,27.305000>}
box{<0,0,-0.152400><1.397000,0.035000,0.152400> rotate<0,90.000000,0> translate<30.099000,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.194000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,0.000000,30.480000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<28.194000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.367000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.226000,-1.535000,23.241000>}
box{<0,0,-0.152400><21.013799,0.035000,0.152400> rotate<0,44.997030,0> translate<15.367000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.226000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.226000,-1.535000,23.241000>}
box{<0,0,-0.152400><2.667000,0.035000,0.152400> rotate<0,90.000000,0> translate<30.226000,-1.535000,23.241000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,0.000000,9.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,0.000000,2.540000>}
box{<0,0,-0.304800><6.580000,0.035000,0.304800> rotate<0,-90.000000,0> translate<30.480000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<25.400000,0.000000,9.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,0.000000,9.120000>}
box{<0,0,-0.304800><5.080000,0.035000,0.304800> rotate<0,0.000000,0> translate<25.400000,0.000000,9.120000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,0.000000,9.120000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,0.000000,9.525000>}
box{<0,0,-0.152400><0.405000,0.035000,0.152400> rotate<0,90.000000,0> translate<30.480000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,-1.535000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,15.875000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<29.210000,-1.535000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.591000,-1.535000,19.939000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,19.050000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,44.997030,0> translate<29.591000,-1.535000,19.939000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-1.535000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,27.686000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,-44.997030,0> translate<30.099000,-1.535000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,27.686000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,29.845000>}
box{<0,0,-0.152400><2.159000,0.035000,0.152400> rotate<0,90.000000,0> translate<30.480000,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,32.385000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<30.480000,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,21.209000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,-90.000000,0> translate<30.861000,-1.535000,21.209000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<26.035000,-1.535000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,23.749000>}
box{<0,0,-0.203200><6.824995,0.035000,0.203200> rotate<0,44.997030,0> translate<26.035000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.988000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.988000,0.000000,19.782000>}
box{<0,0,-0.152400><0.538000,0.035000,0.152400> rotate<0,-90.000000,0> translate<30.988000,0.000000,19.782000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.956000,0.000000,22.352000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.988000,0.000000,20.320000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,44.997030,0> translate<28.956000,0.000000,22.352000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.226000,-1.535000,20.574000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.115000,-1.535000,19.685000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,44.997030,0> translate<30.226000,-1.535000,20.574000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.155000,0.000000,10.200000>}
box{<0,0,-0.152400><0.954594,0.035000,0.152400> rotate<0,-44.997030,0> translate<30.480000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.155000,0.000000,10.200000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.155000,0.000000,17.215000>}
box{<0,0,-0.152400><7.015000,0.035000,0.152400> rotate<0,90.000000,0> translate<31.155000,0.000000,17.215000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.988000,0.000000,19.782000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.155000,0.000000,19.615000>}
box{<0,0,-0.152400><0.236174,0.035000,0.152400> rotate<0,44.997030,0> translate<30.988000,0.000000,19.782000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.045000,0.000000,19.615000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.155000,0.000000,19.615000>}
box{<0,0,-0.152400><0.110000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.045000,0.000000,19.615000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.496000,-1.535000,49.784000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.496000,-1.535000,50.800000>}
box{<0,0,-0.152400><1.016000,0.035000,0.152400> rotate<0,90.000000,0> translate<31.496000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,-1.535000,25.908000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.623000,-1.535000,24.384000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,44.997030,0> translate<30.099000,-1.535000,25.908000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.623000,-1.535000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.623000,-1.535000,24.384000>}
box{<0,0,-0.152400><2.667000,0.035000,0.152400> rotate<0,90.000000,0> translate<31.623000,-1.535000,24.384000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,15.875000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<30.480000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<30.861000,-1.535000,21.209000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,20.320000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,44.997030,0> translate<30.861000,-1.535000,21.209000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<29.210000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,0.000000,23.495000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<29.210000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,29.210000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,90.000000,0> translate<31.750000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,31.115000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<30.480000,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,32.385000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<31.750000,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.155000,0.000000,19.615000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.820000,0.000000,19.615000>}
box{<0,0,-0.152400><0.665000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.155000,0.000000,19.615000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.155000,0.000000,18.815000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.896000,0.000000,18.815000>}
box{<0,0,-0.152400><0.741000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.155000,0.000000,18.815000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.896000,0.000000,18.815000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,0.000000,18.923000>}
box{<0,0,-0.152400><0.152735,0.035000,0.152400> rotate<0,-44.997030,0> translate<31.896000,0.000000,18.815000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,0.000000,19.431000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,0.000000,18.923000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,-90.000000,0> translate<32.004000,0.000000,18.923000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.820000,0.000000,19.615000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.004000,0.000000,19.431000>}
box{<0,0,-0.152400><0.260215,0.035000,0.152400> rotate<0,44.997030,0> translate<31.820000,0.000000,19.615000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.321000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.131000,-1.535000,16.764000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<28.321000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.155000,0.000000,18.015000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.150000,0.000000,18.015000>}
box{<0,0,-0.152400><0.995000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.155000,0.000000,18.015000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.258000,-1.535000,34.163000>}
box{<0,0,-0.152400><2.514472,0.035000,0.152400> rotate<0,-44.997030,0> translate<30.480000,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.258000,-1.535000,34.163000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.258000,-1.535000,40.386000>}
box{<0,0,-0.152400><6.223000,0.035000,0.152400> rotate<0,90.000000,0> translate<32.258000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.385000,-1.535000,15.240000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<31.750000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.623000,-1.535000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.385000,-1.535000,20.955000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,44.997030,0> translate<31.623000,-1.535000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.258000,-1.535000,40.386000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.893000,-1.535000,41.021000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<32.258000,-1.535000,40.386000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.496000,-1.535000,49.784000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.893000,-1.535000,48.387000>}
box{<0,0,-0.152400><1.975656,0.035000,0.152400> rotate<0,44.997030,0> translate<31.496000,-1.535000,49.784000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.893000,-1.535000,41.021000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.893000,-1.535000,48.387000>}
box{<0,0,-0.152400><7.366000,0.035000,0.152400> rotate<0,90.000000,0> translate<32.893000,-1.535000,48.387000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,2.540000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<33.020000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.702000,-1.535000,9.398000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,5.080000>}
box{<0,0,-0.152400><6.106574,0.035000,0.152400> rotate<0,44.997030,0> translate<28.702000,-1.535000,9.398000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.131000,-1.535000,16.764000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,15.875000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,44.997030,0> translate<32.131000,-1.535000,16.764000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.150000,0.000000,18.015000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,17.145000>}
box{<0,0,-0.152400><1.230366,0.035000,0.152400> rotate<0,44.997030,0> translate<32.150000,0.000000,18.015000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,17.145000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,90.000000,0> translate<33.020000,0.000000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,23.495000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.750000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.115000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,24.765000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<31.115000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,27.940000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<33.020000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,28.575000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<33.020000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,30.480000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<31.750000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,31.750000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<30.480000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,31.750000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<33.020000,-1.535000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.147000,-1.535000,33.782000>}
box{<0,0,-0.152400><1.975656,0.035000,0.152400> rotate<0,-44.997030,0> translate<31.750000,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.147000,-1.535000,33.782000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.147000,-1.535000,39.243000>}
box{<0,0,-0.152400><5.461000,0.035000,0.152400> rotate<0,90.000000,0> translate<33.147000,-1.535000,39.243000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.385000,-1.535000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.655000,-1.535000,20.955000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<32.385000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.655000,0.000000,22.860000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<33.020000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.655000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.655000,0.000000,22.860000>}
box{<0,0,-0.152400><8.255000,0.035000,0.152400> rotate<0,90.000000,0> translate<33.655000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.147000,-1.535000,39.243000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.782000,-1.535000,39.878000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<33.147000,-1.535000,39.243000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.782000,-1.535000,39.878000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.782000,-1.535000,48.387000>}
box{<0,0,-0.152400><8.509000,0.035000,0.152400> rotate<0,90.000000,0> translate<33.782000,-1.535000,48.387000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.750000,-1.535000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.909000,-1.535000,25.400000>}
box{<0,0,-0.152400><3.053287,0.035000,0.152400> rotate<0,44.997030,0> translate<31.750000,-1.535000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,29.591000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,-44.997030,0> translate<33.020000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,29.591000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,38.481000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,90.000000,0> translate<34.036000,-1.535000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<30.480000,0.000000,9.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.060000,0.000000,9.120000>}
box{<0,0,-0.304800><3.580000,0.035000,0.304800> rotate<0,0.000000,0> translate<30.480000,0.000000,9.120000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<31.750000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.163000,-1.535000,20.320000>}
box{<0,0,-0.203200><2.413000,0.035000,0.203200> rotate<0,0.000000,0> translate<31.750000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.115000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,0.000000,23.495000>}
box{<0,0,-0.152400><4.490128,0.035000,0.152400> rotate<0,44.997030,0> translate<31.115000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,0.000000,23.495000>}
box{<0,0,-0.152400><8.382000,0.035000,0.152400> rotate<0,90.000000,0> translate<34.290000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,0.000000,26.670000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<34.290000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,28.575000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<34.290000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.782000,-1.535000,48.387000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,48.895000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<33.782000,-1.535000,48.387000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,50.546000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,44.997030,0> translate<34.036000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,50.546000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,90.000000,0> translate<34.290000,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.655000,-1.535000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.417000,-1.535000,21.717000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,-44.997030,0> translate<33.655000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<31.115000,-1.535000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.671000,-1.535000,19.685000>}
box{<0,0,-0.152400><3.556000,0.035000,0.152400> rotate<0,0.000000,0> translate<31.115000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.163000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,20.955000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<34.163000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<29.845000,-1.535000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.925000,-1.535000,6.350000>}
box{<0,0,-0.406400><7.184205,0.035000,0.406400> rotate<0,44.997030,0> translate<29.845000,-1.535000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,0.000000,24.130000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<33.020000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,0.000000,24.130000>}
box{<0,0,-0.152400><8.509000,0.035000,0.152400> rotate<0,90.000000,0> translate<34.925000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,-1.535000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,-1.535000,29.210000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<34.290000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,-1.535000,38.100000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,90.000000,0> translate<34.925000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.480000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.052000,-1.535000,19.050000>}
box{<0,0,-0.152400><4.572000,0.035000,0.152400> rotate<0,0.000000,0> translate<30.480000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,0.000000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.115000,0.000000,11.875000>}
box{<0,0,-0.152400><2.962777,0.035000,0.152400> rotate<0,44.997030,0> translate<33.020000,0.000000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.671000,-1.535000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.306000,-1.535000,20.320000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<34.671000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,2.540000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,-90.000000,0> translate<35.560000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.210000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,3.810000>}
box{<0,0,-0.203200><8.980256,0.035000,0.203200> rotate<0,44.997030,0> translate<29.210000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<29.845000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,18.415000>}
box{<0,0,-0.203200><5.715000,0.035000,0.203200> rotate<0,0.000000,0> translate<29.845000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,0.000000,24.765000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<34.290000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,0.000000,24.765000>}
box{<0,0,-0.152400><8.636000,0.035000,0.152400> rotate<0,90.000000,0> translate<35.560000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,0.000000,27.940000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<35.560000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,28.575000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<35.560000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.655000,0.000000,14.605000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.585000,0.000000,12.675000>}
box{<0,0,-0.152400><2.729432,0.035000,0.152400> rotate<0,44.997030,0> translate<33.655000,0.000000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.052000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.687000,-1.535000,19.685000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<35.052000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,-1.535000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.814000,-1.535000,28.829000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,-44.997030,0> translate<35.560000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.814000,-1.535000,28.829000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.814000,-1.535000,37.719000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,90.000000,0> translate<35.814000,-1.535000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.290000,0.000000,15.113000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.928000,0.000000,13.475000>}
box{<0,0,-0.152400><2.316482,0.035000,0.152400> rotate<0,44.997030,0> translate<34.290000,0.000000,15.113000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.448000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.195000,-1.535000,17.780000>}
box{<0,0,-0.152400><7.747000,0.035000,0.152400> rotate<0,0.000000,0> translate<28.448000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<35.560000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.195000,-1.535000,19.050000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<35.560000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.195000,0.000000,25.400000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<35.560000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.195000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.195000,0.000000,25.400000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.195000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,0.000000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.271000,0.000000,14.275000>}
box{<0,0,-0.152400><1.903531,0.035000,0.152400> rotate<0,44.997030,0> translate<34.925000,0.000000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.576000,-1.535000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.576000,-1.535000,49.784000>}
box{<0,0,-0.152400><0.381000,0.035000,0.152400> rotate<0,-90.000000,0> translate<36.576000,-1.535000,49.784000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.576000,-1.535000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.576000,-1.535000,50.800000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.576000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.560000,0.000000,16.129000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.614000,0.000000,15.075000>}
box{<0,0,-0.152400><1.490581,0.035000,0.152400> rotate<0,44.997030,0> translate<35.560000,0.000000,16.129000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,37.338000>}
box{<0,0,-0.152400><8.255000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.703000,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.195000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,0.000000,15.875000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<36.195000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.195000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,18.415000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<36.195000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,0.000000,26.670000>}
box{<0,0,-0.152400><8.890000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.830000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,29.083000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,28.575000>}
box{<0,0,-0.152400><0.523634,0.035000,0.152400> rotate<0,75.958743,0> translate<36.703000,-1.535000,29.083000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,28.575000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.830000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.036000,-1.535000,38.481000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,41.275000>}
box{<0,0,-0.152400><3.951313,0.035000,0.152400> rotate<0,-44.997030,0> translate<34.036000,-1.535000,38.481000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.576000,-1.535000,49.784000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,49.530000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,44.997030,0> translate<36.576000,-1.535000,49.784000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.576000,-1.535000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,49.911000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,44.997030,0> translate<36.576000,-1.535000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,41.275000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,49.911000>}
box{<0,0,-0.152400><8.636000,0.035000,0.152400> rotate<0,90.000000,0> translate<36.830000,-1.535000,49.911000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,0.000000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.465000,0.000000,17.145000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<36.830000,0.000000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.465000,-1.535000,24.765000>}
box{<0,0,-0.152400><4.445000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.020000,-1.535000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.465000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.465000,0.000000,25.654000>}
box{<0,0,-0.152400><6.985000,0.035000,0.152400> rotate<0,90.000000,0> translate<37.465000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.592000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.592000,-1.535000,36.957000>}
box{<0,0,-0.152400><7.493000,0.035000,0.152400> rotate<0,90.000000,0> translate<37.592000,-1.535000,36.957000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,0.000000,2.540000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,-90.000000,0> translate<38.100000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<34.060000,0.000000,9.120000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,0.000000,5.080000>}
box{<0,0,-0.304800><5.713423,0.035000,0.304800> rotate<0,44.997030,0> translate<34.060000,0.000000,9.120000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,0.000000,5.715000>}
box{<0,0,-0.304800><0.635000,0.035000,0.304800> rotate<0,90.000000,0> translate<38.100000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,15.875000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<36.830000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.830000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,18.415000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<36.830000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,19.177000>}
box{<0,0,-0.152400><5.588000,0.035000,0.152400> rotate<0,-90.000000,0> translate<38.100000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.465000,-1.535000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,24.130000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<37.465000,-1.535000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.465000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,26.289000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<37.465000,0.000000,25.654000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,26.289000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,27.940000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,90.000000,0> translate<38.100000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.592000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,28.575000>}
box{<0,0,-0.152400><1.023907,0.035000,0.152400> rotate<0,60.251142,0> translate<37.592000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,28.575000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<38.100000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.481000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.481000,-1.535000,36.576000>}
box{<0,0,-0.152400><7.112000,0.035000,0.152400> rotate<0,90.000000,0> translate<38.481000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.614000,0.000000,15.075000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.570000,0.000000,15.075000>}
box{<0,0,-0.152400><1.956000,0.035000,0.152400> rotate<0,0.000000,0> translate<36.614000,0.000000,15.075000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.608000,-1.535000,17.907000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,44.997030,0> translate<38.100000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,0.000000,16.510000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<38.100000,0.000000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<36.195000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.735000,-1.535000,19.050000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<36.195000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,0.000000,23.749000>}
box{<0,0,-0.152400><4.064000,0.035000,0.152400> rotate<0,90.000000,0> translate<38.735000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.909000,-1.535000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,-1.535000,25.400000>}
box{<0,0,-0.152400><4.826000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.909000,-1.535000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,0.000000,25.400000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<38.100000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.465000,0.000000,18.669000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.824000,0.000000,17.310000>}
box{<0,0,-0.152400><1.921916,0.035000,0.152400> rotate<0,44.997030,0> translate<37.465000,0.000000,18.669000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.271000,0.000000,14.275000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.040000,0.000000,14.275000>}
box{<0,0,-0.152400><2.769000,0.035000,0.152400> rotate<0,0.000000,0> translate<36.271000,0.000000,14.275000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<38.735000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,18.669000>}
box{<0,0,-0.203200><0.538815,0.035000,0.203200> rotate<0,44.997030,0> translate<38.735000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.116000,-1.535000,24.130000>}
box{<0,0,-0.152400><1.016000,0.035000,0.152400> rotate<0,0.000000,0> translate<38.100000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.100000,0.000000,19.177000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.167000,0.000000,18.110000>}
box{<0,0,-0.152400><1.508966,0.035000,0.152400> rotate<0,44.997030,0> translate<38.100000,0.000000,19.177000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.570000,0.000000,15.075000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.205000,0.000000,15.710000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<38.570000,0.000000,15.075000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<33.020000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,15.875000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,0.000000,0> translate<33.020000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.687000,-1.535000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,19.685000>}
box{<0,0,-0.152400><3.683000,0.035000,0.152400> rotate<0,0.000000,0> translate<35.687000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,0.000000,21.717000>}
box{<0,0,-0.152400><1.397000,0.035000,0.152400> rotate<0,90.000000,0> translate<39.370000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.481000,-1.535000,29.464000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,28.575000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,44.997030,0> translate<38.481000,-1.535000,29.464000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,28.575000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<39.370000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<30.099000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,0.000000,30.480000>}
box{<0,0,-0.152400><9.271000,0.035000,0.152400> rotate<0,0.000000,0> translate<30.099000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,36.195000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,90.000000,0> translate<39.370000,-1.535000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.925000,-1.535000,38.100000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,42.545000>}
box{<0,0,-0.152400><6.286179,0.035000,0.152400> rotate<0,-44.997030,0> translate<34.925000,-1.535000,38.100000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.116000,-1.535000,50.800000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,50.546000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,44.997030,0> translate<39.116000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,42.545000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,50.546000>}
box{<0,0,-0.152400><8.001000,0.035000,0.152400> rotate<0,90.000000,0> translate<39.370000,-1.535000,50.546000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.928000,0.000000,13.475000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.383000,0.000000,13.475000>}
box{<0,0,-0.152400><3.455000,0.035000,0.152400> rotate<0,0.000000,0> translate<35.928000,0.000000,13.475000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.510000,0.000000,18.910000>}
box{<0,0,-0.152400><1.096016,0.035000,0.152400> rotate<0,44.997030,0> translate<38.735000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.624000,-1.535000,19.431000>}
box{<0,0,-0.152400><0.359210,0.035000,0.152400> rotate<0,44.997030,0> translate<39.370000,-1.535000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.040000,0.000000,14.275000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.675000,0.000000,14.910000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.040000,0.000000,14.275000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.585000,0.000000,12.675000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.726000,0.000000,12.675000>}
box{<0,0,-0.152400><4.141000,0.035000,0.152400> rotate<0,0.000000,0> translate<35.585000,0.000000,12.675000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.878000,-1.535000,16.383000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.370000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,0.000000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.980000,0.000000,19.710000>}
box{<0,0,-0.152400><0.862670,0.035000,0.152400> rotate<0,44.997030,0> translate<39.370000,0.000000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<32.385000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.005000,-1.535000,15.240000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,0.000000,0> translate<32.385000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.306000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.005000,-1.535000,20.320000>}
box{<0,0,-0.152400><4.699000,0.035000,0.152400> rotate<0,0.000000,0> translate<35.306000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.116000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.005000,-1.535000,25.019000>}
box{<0,0,-0.152400><1.257236,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.116000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.005000,-1.535000,26.035000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<39.370000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.005000,-1.535000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.005000,-1.535000,26.035000>}
box{<0,0,-0.152400><1.016000,0.035000,0.152400> rotate<0,90.000000,0> translate<40.005000,-1.535000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.383000,0.000000,13.475000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.018000,0.000000,14.110000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.383000,0.000000,13.475000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.005000,-1.535000,20.320000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.259000,-1.535000,20.193000>}
box{<0,0,-0.152400><0.283981,0.035000,0.152400> rotate<0,26.563298,0> translate<40.005000,-1.535000,20.320000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.726000,0.000000,12.675000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.361000,0.000000,13.310000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.726000,0.000000,12.675000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.005000,-1.535000,15.240000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,-1.535000,15.621000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,-44.997030,0> translate<40.005000,-1.535000,15.240000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.115000,0.000000,11.875000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.450000,0.000000,11.875000>}
box{<0,0,-0.152400><5.335000,0.035000,0.152400> rotate<0,0.000000,0> translate<35.115000,0.000000,11.875000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,0.000000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.513000,0.000000,22.860000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.370000,0.000000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.450000,0.000000,11.875000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,0.000000,12.065000>}
box{<0,0,-0.152400><0.268701,0.035000,0.152400> rotate<0,-44.997030,0> translate<40.450000,0.000000,11.875000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,0.000000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,0.000000,25.654000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,-44.997030,0> translate<38.735000,0.000000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,0.000000,25.654000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,0.000000,27.940000>}
box{<0,0,-0.152400><2.286000,0.035000,0.152400> rotate<0,90.000000,0> translate<40.640000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,-1.535000,28.575000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<39.370000,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,-1.535000,28.575000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<40.640000,-1.535000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.640000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.085000,0.000000,12.510000>}
box{<0,0,-0.152400><0.629325,0.035000,0.152400> rotate<0,-44.997030,0> translate<40.640000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.085000,0.000000,12.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.190000,0.000000,12.510000>}
box{<0,0,-0.152400><0.105000,0.035000,0.152400> rotate<0,0.000000,0> translate<41.085000,0.000000,12.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.361000,0.000000,13.310000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.190000,0.000000,13.310000>}
box{<0,0,-0.152400><0.829000,0.035000,0.152400> rotate<0,0.000000,0> translate<40.361000,0.000000,13.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.018000,0.000000,14.110000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.190000,0.000000,14.110000>}
box{<0,0,-0.152400><1.172000,0.035000,0.152400> rotate<0,0.000000,0> translate<40.018000,0.000000,14.110000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.675000,0.000000,14.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.190000,0.000000,14.910000>}
box{<0,0,-0.152400><1.515000,0.035000,0.152400> rotate<0,0.000000,0> translate<39.675000,0.000000,14.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.205000,0.000000,15.710000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.190000,0.000000,15.710000>}
box{<0,0,-0.152400><1.985000,0.035000,0.152400> rotate<0,0.000000,0> translate<39.205000,0.000000,15.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.735000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.190000,0.000000,16.510000>}
box{<0,0,-0.152400><2.455000,0.035000,0.152400> rotate<0,0.000000,0> translate<38.735000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.824000,0.000000,17.310000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.190000,0.000000,17.310000>}
box{<0,0,-0.152400><2.366000,0.035000,0.152400> rotate<0,0.000000,0> translate<38.824000,0.000000,17.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.167000,0.000000,18.110000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.190000,0.000000,18.110000>}
box{<0,0,-0.152400><2.023000,0.035000,0.152400> rotate<0,0.000000,0> translate<39.167000,0.000000,18.110000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.510000,0.000000,18.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.190000,0.000000,18.910000>}
box{<0,0,-0.152400><1.680000,0.035000,0.152400> rotate<0,0.000000,0> translate<39.510000,0.000000,18.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.980000,0.000000,19.710000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.190000,0.000000,19.710000>}
box{<0,0,-0.152400><1.210000,0.035000,0.152400> rotate<0,0.000000,0> translate<39.980000,0.000000,19.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,19.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.215000,0.000000,19.685000>}
box{<0,0,-0.127000><0.035355,0.035000,0.127000> rotate<0,44.997030,0> translate<41.190000,0.000000,19.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.513000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,-1.535000,22.860000>}
box{<0,0,-0.152400><0.762000,0.035000,0.152400> rotate<0,0.000000,0> translate<40.513000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,0.000000,25.781000>}
box{<0,0,-0.152400><0.889000,0.035000,0.152400> rotate<0,-90.000000,0> translate<41.275000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.575000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,0.000000,29.210000>}
box{<0,0,-0.152400><12.700000,0.035000,0.152400> rotate<0,0.000000,0> translate<28.575000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<28.575000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,0.000000,29.845000>}
box{<0,0,-0.152400><12.700000,0.035000,0.152400> rotate<0,0.000000,0> translate<28.575000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<35.814000,-1.535000,37.719000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,-1.535000,43.180000>}
box{<0,0,-0.152400><7.723020,0.035000,0.152400> rotate<0,-44.997030,0> translate<35.814000,-1.535000,37.719000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,-1.535000,43.180000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,-1.535000,50.419000>}
box{<0,0,-0.152400><7.239000,0.035000,0.152400> rotate<0,90.000000,0> translate<41.275000,-1.535000,50.419000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,-1.535000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.656000,-1.535000,22.479000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,44.997030,0> translate<41.275000,-1.535000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,-1.535000,50.419000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.656000,-1.535000,50.800000>}
box{<0,0,-0.152400><0.538815,0.035000,0.152400> rotate<0,-44.997030,0> translate<41.275000,-1.535000,50.419000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,12.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.872400,0.000000,12.510000>}
box{<0,0,-0.127000><0.682400,0.035000,0.127000> rotate<0,0.000000,0> translate<41.190000,0.000000,12.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,13.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.885000,0.000000,13.310000>}
box{<0,0,-0.127000><0.695000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.190000,0.000000,13.310000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<38.100000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,0.000000,9.525000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,-44.997030,0> translate<38.100000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.624000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,9.525000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.624000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,0.000000,27.305000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<41.275000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,0.000000,27.305000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,-90.000000,0> translate<41.910000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,0.000000,28.575000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<41.275000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,0.000000,30.480000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<41.275000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,0.000000,33.020000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.370000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,37.465000>}
box{<0,0,-0.152400><4.445000,0.035000,0.152400> rotate<0,90.000000,0> translate<41.910000,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,14.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.910200,0.000000,14.910000>}
box{<0,0,-0.127000><0.720200,0.035000,0.127000> rotate<0,0.000000,0> translate<41.190000,0.000000,14.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,15.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.922800,0.000000,15.710000>}
box{<0,0,-0.127000><0.732800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.190000,0.000000,15.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,17.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.922800,0.000000,17.310000>}
box{<0,0,-0.127000><0.732800,0.035000,0.127000> rotate<0,0.000000,0> translate<41.190000,0.000000,17.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,14.110000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.923000,0.000000,14.110000>}
box{<0,0,-0.127000><0.733000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.190000,0.000000,14.110000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,18.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.948400,0.000000,18.910000>}
box{<0,0,-0.127000><0.758400,0.035000,0.127000> rotate<0,0.000000,0> translate<41.190000,0.000000,18.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,18.110000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.961000,0.000000,18.110000>}
box{<0,0,-0.127000><0.771000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.190000,0.000000,18.110000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.215000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.011600,0.000000,19.685000>}
box{<0,0,-0.127000><0.796600,0.035000,0.127000> rotate<0,0.000000,0> translate<41.215000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,20.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.215000,0.000000,20.510000>}
box{<0,0,-0.127000><1.025000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.190000,0.000000,20.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.922800,0.000000,15.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.222800,0.000000,16.010000>}
box{<0,0,-0.127000><0.424264,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.922800,0.000000,15.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.922800,0.000000,17.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.222800,0.000000,17.010000>}
box{<0,0,-0.127000><0.424264,0.035000,0.127000> rotate<0,44.997030,0> translate<41.922800,0.000000,17.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.910200,0.000000,14.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.510200,0.000000,15.510000>}
box{<0,0,-0.127000><0.848528,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.910200,0.000000,14.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.545000,-1.535000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.545000,-1.535000,29.210000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,90.000000,0> translate<42.545000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.545000,0.000000,29.845000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<41.910000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.545000,-1.535000,30.480000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,0.000000,0> translate<41.910000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.961000,0.000000,18.110000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.561000,0.000000,17.510000>}
box{<0,0,-0.127000><0.848528,0.035000,0.127000> rotate<0,44.997030,0> translate<41.961000,0.000000,18.110000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.923000,0.000000,14.110000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.823000,0.000000,15.010000>}
box{<0,0,-0.127000><1.272792,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.923000,0.000000,14.110000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.948400,0.000000,18.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.848400,0.000000,18.010000>}
box{<0,0,-0.127000><1.272792,0.035000,0.127000> rotate<0,44.997030,0> translate<41.948400,0.000000,18.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<41.910000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.990000,0.000000,10.605000>}
box{<0,0,-0.203200><1.527351,0.035000,0.203200> rotate<0,-44.997030,0> translate<41.910000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.990000,0.000000,10.605000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<42.990000,0.000000,10.710000>}
box{<0,0,-0.203200><0.105000,0.035000,0.203200> rotate<0,90.000000,0> translate<42.990000,0.000000,10.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.990000,0.000000,10.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.990000,0.000000,11.392400>}
box{<0,0,-0.127000><0.682400,0.035000,0.127000> rotate<0,90.000000,0> translate<42.990000,0.000000,11.392400> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<42.990000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<42.990000,0.000000,21.399000>}
box{<0,0,-0.139700><0.911000,0.035000,0.139700> rotate<0,-90.000000,0> translate<42.990000,0.000000,21.399000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.990000,0.000000,24.066000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.990000,0.000000,22.310000>}
box{<0,0,-0.152400><1.756000,0.035000,0.152400> rotate<0,-90.000000,0> translate<42.990000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.275000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.990000,0.000000,24.066000>}
box{<0,0,-0.152400><2.425376,0.035000,0.152400> rotate<0,44.997030,0> translate<41.275000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.885000,0.000000,13.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.085000,0.000000,14.510000>}
box{<0,0,-0.127000><1.697056,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.885000,0.000000,13.310000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<34.925000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.180000,-1.535000,6.350000>}
box{<0,0,-0.406400><8.255000,0.035000,0.406400> rotate<0,0.000000,0> translate<34.925000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.011600,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,18.516600>}
box{<0,0,-0.127000><1.652367,0.035000,0.127000> rotate<0,44.997030,0> translate<42.011600,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.872400,0.000000,12.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.372400,0.000000,14.010000>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,-44.997030,0> translate<41.872400,0.000000,12.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.180000,0.000000,18.516600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.569200,0.000000,18.516600>}
box{<0,0,-0.127000><0.389200,0.035000,0.127000> rotate<0,0.000000,0> translate<43.180000,0.000000,18.516600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.372400,0.000000,14.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,14.010000>}
box{<0,0,-0.127000><0.342600,0.035000,0.127000> rotate<0,0.000000,0> translate<43.372400,0.000000,14.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.085000,0.000000,14.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,14.510000>}
box{<0,0,-0.127000><0.630000,0.035000,0.127000> rotate<0,0.000000,0> translate<43.085000,0.000000,14.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.823000,0.000000,15.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,15.010000>}
box{<0,0,-0.127000><0.892000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.823000,0.000000,15.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.510200,0.000000,15.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,15.510000>}
box{<0,0,-0.127000><1.204800,0.035000,0.127000> rotate<0,0.000000,0> translate<42.510200,0.000000,15.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.222800,0.000000,16.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,16.010000>}
box{<0,0,-0.127000><1.492200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.222800,0.000000,16.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<41.190000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,16.510000>}
box{<0,0,-0.127000><2.525000,0.035000,0.127000> rotate<0,0.000000,0> translate<41.190000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.222800,0.000000,17.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,17.010000>}
box{<0,0,-0.127000><1.492200,0.035000,0.127000> rotate<0,0.000000,0> translate<42.222800,0.000000,17.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.561000,0.000000,17.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,17.510000>}
box{<0,0,-0.127000><1.154000,0.035000,0.127000> rotate<0,0.000000,0> translate<42.561000,0.000000,17.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.848400,0.000000,18.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,18.010000>}
box{<0,0,-0.127000><0.866600,0.035000,0.127000> rotate<0,0.000000,0> translate<42.848400,0.000000,18.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.569200,0.000000,18.516600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,18.510000>}
box{<0,0,-0.127000><0.145949,0.035000,0.127000> rotate<0,2.591696,0> translate<43.569200,0.000000,18.516600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.215000,0.000000,20.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.715000,0.000000,19.010000>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,44.997030,0> translate<42.215000,0.000000,20.510000> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<43.790000,0.000000,10.710000>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<43.790000,0.000000,11.405000>}
box{<0,0,-0.139700><0.695000,0.035000,0.139700> rotate<0,90.000000,0> translate<43.790000,0.000000,11.405000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.790000,0.000000,21.513400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.790000,0.000000,22.310000>}
box{<0,0,-0.127000><0.796600,0.035000,0.127000> rotate<0,90.000000,0> translate<43.790000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.545000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.790000,0.000000,24.790000>}
box{<0,0,-0.152400><1.760696,0.035000,0.152400> rotate<0,44.997030,0> translate<42.545000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.790000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.790000,0.000000,24.790000>}
box{<0,0,-0.152400><2.480000,0.035000,0.152400> rotate<0,90.000000,0> translate<43.790000,0.000000,24.790000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.815000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.815000,0.000000,27.940000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<43.815000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.815000,-1.535000,27.940000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.815000,-1.535000,29.210000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<43.815000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.545000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.815000,0.000000,29.845000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<42.545000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<42.990000,0.000000,21.399000>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<44.044500,0.000000,20.344500>}
box{<0,0,-0.139700><1.491288,0.035000,0.139700> rotate<0,44.997030,0> translate<42.990000,0.000000,21.399000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.044500,0.000000,20.344500>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.190000,0.000000,20.199000>}
box{<0,0,-0.152400><0.205768,0.035000,0.152400> rotate<0,44.997030,0> translate<44.044500,0.000000,20.344500> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<43.715000,0.000000,19.010000>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<44.337600,0.000000,19.010000>}
box{<0,0,-0.139700><0.622600,0.035000,0.139700> rotate<0,0.000000,0> translate<43.715000,0.000000,19.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<42.990000,0.000000,11.392400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.490000,0.000000,12.892400>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,-44.997030,0> translate<42.990000,0.000000,11.392400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.490000,0.000000,12.892400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.490000,0.000000,13.235000>}
box{<0,0,-0.127000><0.342600,0.035000,0.127000> rotate<0,90.000000,0> translate<44.490000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.490000,0.000000,19.899000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.490000,0.000000,19.785000>}
box{<0,0,-0.127000><0.114000,0.035000,0.127000> rotate<0,-90.000000,0> translate<44.490000,0.000000,19.785000> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<44.044500,0.000000,20.344500>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<44.490000,0.000000,19.899000>}
box{<0,0,-0.139700><0.630032,0.035000,0.139700> rotate<0,44.997030,0> translate<44.044500,0.000000,20.344500> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.590000,0.000000,6.845000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.590000,0.000000,10.710000>}
box{<0,0,-0.152400><3.865000,0.035000,0.152400> rotate<0,90.000000,0> translate<44.590000,0.000000,10.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.590000,0.000000,10.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.590000,0.000000,11.417600>}
box{<0,0,-0.127000><0.707600,0.035000,0.127000> rotate<0,90.000000,0> translate<44.590000,0.000000,11.417600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.590000,0.000000,21.475400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.590000,0.000000,22.310000>}
box{<0,0,-0.127000><0.834600,0.035000,0.127000> rotate<0,90.000000,0> translate<44.590000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.815000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.590000,0.000000,25.260000>}
box{<0,0,-0.152400><1.096016,0.035000,0.152400> rotate<0,44.997030,0> translate<43.815000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.590000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.590000,0.000000,25.260000>}
box{<0,0,-0.152400><2.950000,0.035000,0.152400> rotate<0,90.000000,0> translate<44.590000,0.000000,25.260000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.337600,0.000000,19.010000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.602400,0.000000,18.745200>}
box{<0,0,-0.152400><0.374484,0.035000,0.152400> rotate<0,44.997030,0> translate<44.337600,0.000000,19.010000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.602400,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.754800,0.000000,18.745200>}
box{<0,0,-0.152400><0.152400,0.035000,0.152400> rotate<0,0.000000,0> translate<44.602400,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<43.790000,0.000000,11.405000>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<44.990000,0.000000,12.605000>}
box{<0,0,-0.139700><1.697056,0.035000,0.139700> rotate<0,-44.997030,0> translate<43.790000,0.000000,11.405000> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<44.990000,0.000000,12.605000>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<44.990000,0.000000,13.235000>}
box{<0,0,-0.139700><0.630000,0.035000,0.139700> rotate<0,90.000000,0> translate<44.990000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<44.990000,0.000000,13.235000>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<44.990000,0.000000,14.510000>}
box{<0,0,-0.139700><1.275000,0.035000,0.139700> rotate<0,90.000000,0> translate<44.990000,0.000000,14.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<43.790000,0.000000,21.513400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.990000,0.000000,20.313400>}
box{<0,0,-0.127000><1.697056,0.035000,0.127000> rotate<0,44.997030,0> translate<43.790000,0.000000,21.513400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.990000,0.000000,19.785000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.990000,0.000000,20.313400>}
box{<0,0,-0.127000><0.528400,0.035000,0.127000> rotate<0,90.000000,0> translate<44.990000,0.000000,20.313400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.390000,0.000000,7.315000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.390000,0.000000,10.710000>}
box{<0,0,-0.152400><3.395000,0.035000,0.152400> rotate<0,90.000000,0> translate<45.390000,0.000000,10.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.390000,0.000000,10.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.390000,0.000000,11.430200>}
box{<0,0,-0.127000><0.720200,0.035000,0.127000> rotate<0,90.000000,0> translate<45.390000,0.000000,11.430200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.390000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.390000,0.000000,21.513600>}
box{<0,0,-0.127000><0.796400,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.390000,0.000000,21.513600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.390000,0.000000,28.270000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.390000,0.000000,22.310000>}
box{<0,0,-0.152400><5.960000,0.035000,0.152400> rotate<0,-90.000000,0> translate<45.390000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.815000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.390000,0.000000,28.270000>}
box{<0,0,-0.152400><2.227386,0.035000,0.152400> rotate<0,44.997030,0> translate<43.815000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.590000,0.000000,11.417600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.490000,0.000000,12.317600>}
box{<0,0,-0.127000><1.272792,0.035000,0.127000> rotate<0,-44.997030,0> translate<44.590000,0.000000,11.417600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.490000,0.000000,12.317600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.490000,0.000000,13.235000>}
box{<0,0,-0.127000><0.917400,0.035000,0.127000> rotate<0,90.000000,0> translate<45.490000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<44.590000,0.000000,21.475400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.490000,0.000000,20.575400>}
box{<0,0,-0.127000><1.272792,0.035000,0.127000> rotate<0,44.997030,0> translate<44.590000,0.000000,21.475400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.490000,0.000000,19.785000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.490000,0.000000,20.575400>}
box{<0,0,-0.127000><0.790400,0.035000,0.127000> rotate<0,90.000000,0> translate<45.490000,0.000000,20.575400> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,-1.535000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,-1.535000,2.540000>}
box{<0,0,-0.406400><1.270000,0.035000,0.406400> rotate<0,-90.000000,0> translate<45.720000,-1.535000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<43.180000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.406400 translate<45.720000,-1.535000,3.810000>}
box{<0,0,-0.406400><3.592102,0.035000,0.406400> rotate<0,44.997030,0> translate<43.180000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<36.703000,-1.535000,37.338000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.720000,-1.535000,46.355000>}
box{<0,0,-0.152400><12.751964,0.035000,0.152400> rotate<0,-44.997030,0> translate<36.703000,-1.535000,37.338000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.720000,-1.535000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.720000,-1.535000,50.800000>}
box{<0,0,-0.152400><4.445000,0.035000,0.152400> rotate<0,90.000000,0> translate<45.720000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.390000,0.000000,11.430200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.990000,0.000000,12.030200>}
box{<0,0,-0.127000><0.848528,0.035000,0.127000> rotate<0,-44.997030,0> translate<45.390000,0.000000,11.430200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.990000,0.000000,12.030200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.990000,0.000000,13.235000>}
box{<0,0,-0.127000><1.204800,0.035000,0.127000> rotate<0,90.000000,0> translate<45.990000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.990000,0.000000,20.913600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.990000,0.000000,19.785000>}
box{<0,0,-0.127000><1.128600,0.035000,0.127000> rotate<0,-90.000000,0> translate<45.990000,0.000000,19.785000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.390000,0.000000,21.513600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<45.990000,0.000000,20.913600>}
box{<0,0,-0.127000><0.848528,0.035000,0.127000> rotate<0,44.997030,0> translate<45.390000,0.000000,21.513600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.190000,0.000000,7.785000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.190000,0.000000,10.710000>}
box{<0,0,-0.152400><2.925000,0.035000,0.152400> rotate<0,90.000000,0> translate<46.190000,0.000000,10.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.190000,0.000000,10.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.190000,0.000000,11.442800>}
box{<0,0,-0.127000><0.732800,0.035000,0.127000> rotate<0,90.000000,0> translate<46.190000,0.000000,11.442800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.190000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.190000,0.000000,21.450200>}
box{<0,0,-0.127000><0.859800,0.035000,0.127000> rotate<0,-90.000000,0> translate<46.190000,0.000000,21.450200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.190000,0.000000,28.740000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.190000,0.000000,22.310000>}
box{<0,0,-0.152400><6.430000,0.035000,0.152400> rotate<0,-90.000000,0> translate<46.190000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,0.000000,33.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.190000,0.000000,28.740000>}
box{<0,0,-0.152400><6.052834,0.035000,0.152400> rotate<0,44.997030,0> translate<41.910000,0.000000,33.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<41.910000,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.355000,-1.535000,9.525000>}
box{<0,0,-0.304800><4.445000,0.035000,0.304800> rotate<0,0.000000,0> translate<41.910000,-1.535000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.190000,0.000000,11.442800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.490000,0.000000,11.742800>}
box{<0,0,-0.127000><0.424264,0.035000,0.127000> rotate<0,-44.997030,0> translate<46.190000,0.000000,11.442800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.490000,0.000000,11.742800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.490000,0.000000,13.235000>}
box{<0,0,-0.127000><1.492200,0.035000,0.127000> rotate<0,90.000000,0> translate<46.490000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.490000,0.000000,21.150200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.490000,0.000000,19.785000>}
box{<0,0,-0.127000><1.365200,0.035000,0.127000> rotate<0,-90.000000,0> translate<46.490000,0.000000,19.785000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.190000,0.000000,21.450200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.490000,0.000000,21.150200>}
box{<0,0,-0.127000><0.424264,0.035000,0.127000> rotate<0,44.997030,0> translate<46.190000,0.000000,21.450200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,10.710000>}
box{<0,0,-0.152400><2.455000,0.035000,0.152400> rotate<0,90.000000,0> translate<46.990000,0.000000,10.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.990000,0.000000,10.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.990000,0.000000,13.235000>}
box{<0,0,-0.127000><2.525000,0.035000,0.127000> rotate<0,90.000000,0> translate<46.990000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.754800,0.000000,18.745200>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,16.510000>}
box{<0,0,-0.152400><3.161050,0.035000,0.152400> rotate<0,44.997030,0> translate<44.754800,0.000000,18.745200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.990000,0.000000,14.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,16.510000>}
box{<0,0,-0.152400><2.828427,0.035000,0.152400> rotate<0,-44.997030,0> translate<44.990000,0.000000,14.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.990000,0.000000,19.785000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<46.990000,0.000000,22.310000>}
box{<0,0,-0.127000><2.525000,0.035000,0.127000> rotate<0,90.000000,0> translate<46.990000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,24.750000>}
box{<0,0,-0.152400><2.440000,0.035000,0.152400> rotate<0,90.000000,0> translate<46.990000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,29.210000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,90.000000,0> translate<46.990000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,24.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.371000,0.000000,25.400000>}
box{<0,0,-0.152400><0.753433,0.035000,0.152400> rotate<0,-59.619201,0> translate<46.990000,0.000000,24.750000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.490000,0.000000,11.742800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.490000,0.000000,13.235000>}
box{<0,0,-0.127000><1.492200,0.035000,0.127000> rotate<0,90.000000,0> translate<47.490000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.490000,0.000000,19.785000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.490000,0.000000,21.150200>}
box{<0,0,-0.127000><1.365200,0.035000,0.127000> rotate<0,90.000000,0> translate<47.490000,0.000000,21.150200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.505000,0.000000,29.725000>}
box{<0,0,-0.152400><0.728320,0.035000,0.152400> rotate<0,-44.997030,0> translate<46.990000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<44.590000,0.000000,6.845000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.625000,0.000000,3.810000>}
box{<0,0,-0.152400><4.292138,0.035000,0.152400> rotate<0,44.997030,0> translate<44.590000,0.000000,6.845000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.625000,0.000000,25.400000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<46.990000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.371000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.625000,0.000000,25.400000>}
box{<0,0,-0.152400><0.254000,0.035000,0.152400> rotate<0,0.000000,0> translate<47.371000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.790000,0.000000,8.725000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.790000,0.000000,10.710000>}
box{<0,0,-0.152400><1.985000,0.035000,0.152400> rotate<0,90.000000,0> translate<47.790000,0.000000,10.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.490000,0.000000,11.742800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.790000,0.000000,11.442800>}
box{<0,0,-0.127000><0.424264,0.035000,0.127000> rotate<0,44.997030,0> translate<47.490000,0.000000,11.742800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.790000,0.000000,10.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.790000,0.000000,11.442800>}
box{<0,0,-0.127000><0.732800,0.035000,0.127000> rotate<0,90.000000,0> translate<47.790000,0.000000,11.442800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.490000,0.000000,21.150200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.790000,0.000000,21.450200>}
box{<0,0,-0.127000><0.424264,0.035000,0.127000> rotate<0,-44.997030,0> translate<47.490000,0.000000,21.150200> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.790000,0.000000,21.450200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.790000,0.000000,22.310000>}
box{<0,0,-0.127000><0.859800,0.035000,0.127000> rotate<0,90.000000,0> translate<47.790000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.790000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.790000,0.000000,24.280000>}
box{<0,0,-0.152400><1.970000,0.035000,0.152400> rotate<0,90.000000,0> translate<47.790000,0.000000,24.280000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.505000,0.000000,29.725000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.970000,0.000000,29.725000>}
box{<0,0,-0.152400><0.465000,0.035000,0.152400> rotate<0,0.000000,0> translate<47.505000,0.000000,29.725000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.371000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.970000,0.000000,30.840000>}
box{<0,0,-0.152400><1.089450,0.035000,0.152400> rotate<0,56.641680,0> translate<47.371000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.970000,0.000000,29.725000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.970000,0.000000,30.840000>}
box{<0,0,-0.152400><1.115000,0.035000,0.152400> rotate<0,90.000000,0> translate<47.970000,0.000000,30.840000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.990000,0.000000,12.030200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.990000,0.000000,13.235000>}
box{<0,0,-0.127000><1.204800,0.035000,0.127000> rotate<0,90.000000,0> translate<47.990000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.990000,0.000000,17.510000>}
box{<0,0,-0.152400><1.414214,0.035000,0.152400> rotate<0,-44.997030,0> translate<46.990000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.990000,0.000000,17.510000>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.990000,0.000000,19.785000>}
box{<0,0,-0.139700><2.275000,0.035000,0.139700> rotate<0,90.000000,0> translate<47.990000,0.000000,19.785000> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.990000,0.000000,19.785000>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.990000,0.000000,20.786600>}
box{<0,0,-0.139700><1.001600,0.035000,0.139700> rotate<0,90.000000,0> translate<47.990000,0.000000,20.786600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<45.390000,0.000000,7.315000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,0.000000,4.445000>}
box{<0,0,-0.152400><4.058793,0.035000,0.152400> rotate<0,44.997030,0> translate<45.390000,0.000000,7.315000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.592000,-1.535000,36.957000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,-1.535000,47.625000>}
box{<0,0,-0.152400><15.086830,0.035000,0.152400> rotate<0,-44.997030,0> translate<37.592000,-1.535000,36.957000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,-1.535000,47.625000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,-1.535000,50.800000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,90.000000,0> translate<48.260000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.490000,0.000000,12.317600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.490000,0.000000,13.235000>}
box{<0,0,-0.127000><0.917400,0.035000,0.127000> rotate<0,90.000000,0> translate<48.490000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.490000,0.000000,20.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.490000,0.000000,19.785000>}
box{<0,0,-0.127000><0.765000,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.490000,0.000000,19.785000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.590000,0.000000,10.710000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.590000,0.000000,9.195000>}
box{<0,0,-0.152400><1.515000,0.035000,0.152400> rotate<0,-90.000000,0> translate<48.590000,0.000000,9.195000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590000,0.000000,11.430200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590000,0.000000,10.710000>}
box{<0,0,-0.127000><0.720200,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.590000,0.000000,10.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<47.990000,0.000000,12.030200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.590000,0.000000,11.430200>}
box{<0,0,-0.127000><0.848528,0.035000,0.127000> rotate<0,44.997030,0> translate<47.990000,0.000000,12.030200> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<47.990000,0.000000,20.786600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.590000,0.000000,21.386600>}
box{<0,0,-0.139700><0.848528,0.035000,0.139700> rotate<0,-44.997030,0> translate<47.990000,0.000000,20.786600> }
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.590000,0.000000,21.386600>}
cylinder{<0,0,0><0,0.035000,0>0.139700 translate<48.590000,0.000000,22.310000>}
box{<0,0,-0.139700><0.923400,0.035000,0.139700> rotate<0,90.000000,0> translate<48.590000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.190000,0.000000,7.785000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,0.000000,5.080000>}
box{<0,0,-0.152400><3.825448,0.035000,0.152400> rotate<0,44.997030,0> translate<46.190000,0.000000,7.785000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,0.000000,14.605000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<46.990000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.990000,0.000000,12.655800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.990000,0.000000,13.235000>}
box{<0,0,-0.127000><0.579200,0.035000,0.127000> rotate<0,90.000000,0> translate<48.990000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.990000,0.000000,20.313400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.990000,0.000000,19.785000>}
box{<0,0,-0.127000><0.528400,0.035000,0.127000> rotate<0,-90.000000,0> translate<48.990000,0.000000,19.785000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.790000,0.000000,24.280000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.149000,0.000000,25.400000>}
box{<0,0,-0.152400><1.761045,0.035000,0.152400> rotate<0,-39.490536,0> translate<47.790000,0.000000,24.280000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.390000,0.000000,9.665000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.390000,0.000000,10.710000>}
box{<0,0,-0.152400><1.045000,0.035000,0.152400> rotate<0,90.000000,0> translate<49.390000,0.000000,10.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.490000,0.000000,12.317600>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390000,0.000000,11.417600>}
box{<0,0,-0.127000><1.272792,0.035000,0.127000> rotate<0,44.997030,0> translate<48.490000,0.000000,12.317600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390000,0.000000,10.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390000,0.000000,11.417600>}
box{<0,0,-0.127000><0.707600,0.035000,0.127000> rotate<0,90.000000,0> translate<49.390000,0.000000,11.417600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.490000,0.000000,20.550000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390000,0.000000,21.450000>}
box{<0,0,-0.127000><1.272792,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.490000,0.000000,20.550000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.390000,0.000000,21.450000>}
box{<0,0,-0.127000><0.860000,0.035000,0.127000> rotate<0,-90.000000,0> translate<49.390000,0.000000,21.450000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.390000,0.000000,23.355000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.390000,0.000000,22.310000>}
box{<0,0,-0.203200><1.045000,0.035000,0.203200> rotate<0,-90.000000,0> translate<49.390000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.386000,-1.535000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.403000,-1.535000,15.621000>}
box{<0,0,-0.152400><9.017000,0.035000,0.152400> rotate<0,0.000000,0> translate<40.386000,-1.535000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.490000,0.000000,19.949800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.490000,0.000000,19.785000>}
box{<0,0,-0.127000><0.164800,0.035000,0.127000> rotate<0,-90.000000,0> translate<49.490000,0.000000,19.785000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<46.990000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,0.000000,5.715000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<46.990000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.149000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.545000,0.000000,25.796000>}
box{<0,0,-0.152400><0.560029,0.035000,0.152400> rotate<0,-44.997030,0> translate<49.149000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.545000,0.000000,25.796000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.545000,0.000000,27.150000>}
box{<0,0,-0.152400><1.354000,0.035000,0.152400> rotate<0,90.000000,0> translate<49.545000,0.000000,27.150000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.878000,-1.535000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.784000,-1.535000,16.383000>}
box{<0,0,-0.152400><9.906000,0.035000,0.152400> rotate<0,0.000000,0> translate<39.878000,-1.535000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.545000,0.000000,27.150000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.820000,0.000000,27.425000>}
box{<0,0,-0.152400><0.388909,0.035000,0.152400> rotate<0,-44.997030,0> translate<49.545000,0.000000,27.150000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.820000,0.000000,27.425000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.820000,0.000000,27.559000>}
box{<0,0,-0.152400><0.134000,0.035000,0.152400> rotate<0,90.000000,0> translate<49.820000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.490000,0.000000,13.235000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.909400,0.000000,13.235000>}
box{<0,0,-0.152400><0.419400,0.035000,0.152400> rotate<0,0.000000,0> translate<49.490000,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.625000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,0.000000,3.810000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<47.625000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<46.355000,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.165000,-1.535000,5.715000>}
box{<0,0,-0.304800><5.388154,0.035000,0.304800> rotate<0,44.997030,0> translate<46.355000,-1.535000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<47.790000,0.000000,8.725000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,0.000000,6.350000>}
box{<0,0,-0.152400><3.358757,0.035000,0.152400> rotate<0,44.997030,0> translate<47.790000,0.000000,8.725000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,-1.535000,12.065000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<50.165000,-1.535000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<37.465000,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,-1.535000,17.145000>}
box{<0,0,-0.152400><12.700000,0.035000,0.152400> rotate<0,0.000000,0> translate<37.465000,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.481000,-1.535000,36.576000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,-1.535000,48.260000>}
box{<0,0,-0.152400><16.523671,0.035000,0.152400> rotate<0,-44.997030,0> translate<38.481000,-1.535000,36.576000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,-1.535000,48.260000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,-1.535000,50.165000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<50.165000,-1.535000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.190000,0.000000,10.008000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.190000,0.000000,10.710000>}
box{<0,0,-0.152400><0.702000,0.035000,0.152400> rotate<0,90.000000,0> translate<50.190000,0.000000,10.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.990000,0.000000,12.655800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.190000,0.000000,11.455800>}
box{<0,0,-0.127000><1.697056,0.035000,0.127000> rotate<0,44.997030,0> translate<48.990000,0.000000,12.655800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.190000,0.000000,10.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.190000,0.000000,11.455800>}
box{<0,0,-0.127000><0.745800,0.035000,0.127000> rotate<0,90.000000,0> translate<50.190000,0.000000,11.455800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<48.990000,0.000000,20.313400>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.190000,0.000000,21.513400>}
box{<0,0,-0.127000><1.697056,0.035000,0.127000> rotate<0,-44.997030,0> translate<48.990000,0.000000,20.313400> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.190000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.190000,0.000000,21.513400>}
box{<0,0,-0.127000><0.796600,0.035000,0.127000> rotate<0,-90.000000,0> translate<50.190000,0.000000,21.513400> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.190000,0.000000,22.986600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.190000,0.000000,22.310000>}
box{<0,0,-0.152400><0.676600,0.035000,0.152400> rotate<0,-90.000000,0> translate<50.190000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.909400,0.000000,13.235000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.393600,0.000000,12.700000>}
box{<0,0,-0.152400><0.721578,0.035000,0.152400> rotate<0,47.850275,0> translate<49.909400,0.000000,13.235000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,-1.535000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.393600,-1.535000,12.700000>}
box{<0,0,-0.152400><0.674895,0.035000,0.152400> rotate<0,-70.196491,0> translate<50.165000,-1.535000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.656000,-1.535000,22.479000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.419000,-1.535000,22.479000>}
box{<0,0,-0.152400><8.763000,0.035000,0.152400> rotate<0,0.000000,0> translate<41.656000,-1.535000,22.479000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.265000,0.000000,19.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.455200,0.000000,19.010000>}
box{<0,0,-0.127000><0.190200,0.035000,0.127000> rotate<0,0.000000,0> translate<50.265000,0.000000,19.010000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.265000,0.000000,14.010000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.506000,0.000000,14.010000>}
box{<0,0,-0.152400><0.241000,0.035000,0.152400> rotate<0,0.000000,0> translate<50.265000,0.000000,14.010000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<38.608000,-1.535000,17.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.673000,-1.535000,17.907000>}
box{<0,0,-0.152400><12.065000,0.035000,0.152400> rotate<0,0.000000,0> translate<38.608000,-1.535000,17.907000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.190000,0.000000,22.986600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.698400,0.000000,23.495000>}
box{<0,0,-0.152400><0.718986,0.035000,0.152400> rotate<0,-44.997030,0> translate<50.190000,0.000000,22.986600> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.265000,0.000000,18.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.793400,0.000000,18.510000>}
box{<0,0,-0.127000><0.528400,0.035000,0.127000> rotate<0,0.000000,0> translate<50.265000,0.000000,18.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,0.000000,2.540000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<50.800000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,0.000000,3.175000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<50.165000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.590000,0.000000,9.195000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,0.000000,6.985000>}
box{<0,0,-0.152400><3.125412,0.035000,0.152400> rotate<0,44.997030,0> translate<48.590000,0.000000,9.195000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<49.390000,0.000000,23.355000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,24.765000>}
box{<0,0,-0.203200><1.994041,0.035000,0.203200> rotate<0,-44.997030,0> translate<49.390000,0.000000,23.355000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,-1.535000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,-1.535000,50.800000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<50.165000,-1.535000,50.165000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.265000,0.000000,14.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.945800,0.000000,14.510000>}
box{<0,0,-0.127000><0.680800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.265000,0.000000,14.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.990000,0.000000,12.103600>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.990000,0.000000,10.710000>}
box{<0,0,-0.152400><1.393600,0.035000,0.152400> rotate<0,-90.000000,0> translate<50.990000,0.000000,10.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.393600,0.000000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.990000,0.000000,12.103600>}
box{<0,0,-0.152400><0.843437,0.035000,0.152400> rotate<0,44.997030,0> translate<50.393600,0.000000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<49.490000,0.000000,19.949800>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.990000,0.000000,21.449800>}
box{<0,0,-0.127000><2.121320,0.035000,0.127000> rotate<0,-44.997030,0> translate<49.490000,0.000000,19.949800> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.990000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.990000,0.000000,21.449800>}
box{<0,0,-0.127000><0.860200,0.035000,0.127000> rotate<0,-90.000000,0> translate<50.990000,0.000000,21.449800> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<39.116000,-1.535000,18.669000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,18.669000>}
box{<0,0,-0.203200><11.938000,0.035000,0.203200> rotate<0,0.000000,0> translate<39.116000,-1.535000,18.669000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.265000,0.000000,18.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.080800,0.000000,18.010000>}
box{<0,0,-0.127000><0.815800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.265000,0.000000,18.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.265000,0.000000,15.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.182400,0.000000,15.010000>}
box{<0,0,-0.127000><0.917400,0.035000,0.127000> rotate<0,0.000000,0> translate<50.265000,0.000000,15.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.265000,0.000000,15.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.419000,0.000000,15.510000>}
box{<0,0,-0.127000><1.154000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.265000,0.000000,15.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.265000,0.000000,17.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.419000,0.000000,17.510000>}
box{<0,0,-0.127000><1.154000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.265000,0.000000,17.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.390000,0.000000,9.665000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.435000,0.000000,7.620000>}
box{<0,0,-0.152400><2.892067,0.035000,0.152400> rotate<0,44.997030,0> translate<49.390000,0.000000,9.665000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.435000,-1.535000,13.589000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.435000,-1.535000,10.160000>}
box{<0,0,-0.152400><3.429000,0.035000,0.152400> rotate<0,-90.000000,0> translate<51.435000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.403000,-1.535000,15.621000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.435000,-1.535000,13.589000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,44.997030,0> translate<49.403000,-1.535000,15.621000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.624000,-1.535000,19.431000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.435000,-1.535000,19.431000>}
box{<0,0,-0.152400><11.811000,0.035000,0.152400> rotate<0,0.000000,0> translate<39.624000,-1.535000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.820000,0.000000,27.559000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.435000,0.000000,27.559000>}
box{<0,0,-0.152400><1.615000,0.035000,0.152400> rotate<0,0.000000,0> translate<49.820000,0.000000,27.559000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<34.417000,-1.535000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.562000,-1.535000,21.717000>}
box{<0,0,-0.152400><17.145000,0.035000,0.152400> rotate<0,0.000000,0> translate<34.417000,-1.535000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<40.259000,-1.535000,20.193000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.689000,-1.535000,20.193000>}
box{<0,0,-0.152400><11.430000,0.035000,0.152400> rotate<0,0.000000,0> translate<40.259000,-1.535000,20.193000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.265000,0.000000,16.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.706400,0.000000,16.010000>}
box{<0,0,-0.127000><1.441400,0.035000,0.127000> rotate<0,0.000000,0> translate<50.265000,0.000000,16.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.265000,0.000000,17.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.731800,0.000000,17.010000>}
box{<0,0,-0.127000><1.466800,0.035000,0.127000> rotate<0,0.000000,0> translate<50.265000,0.000000,17.010000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.190000,0.000000,10.008000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.943000,0.000000,8.255000>}
box{<0,0,-0.152400><2.479116,0.035000,0.152400> rotate<0,44.997030,0> translate<50.190000,0.000000,10.008000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.793400,0.000000,18.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.968400,0.000000,19.685000>}
box{<0,0,-0.127000><1.661701,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.793400,0.000000,18.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.455200,0.000000,19.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.968400,0.000000,20.523200>}
box{<0,0,-0.127000><2.139988,0.035000,0.127000> rotate<0,-44.997030,0> translate<50.455200,0.000000,19.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.080800,0.000000,18.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.980800,0.000000,18.910000>}
box{<0,0,-0.127000><1.272792,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.080800,0.000000,18.010000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.506000,0.000000,14.010000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.006000,0.000000,12.510000>}
box{<0,0,-0.152400><2.121320,0.035000,0.152400> rotate<0,44.997030,0> translate<50.506000,0.000000,14.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.706400,0.000000,16.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.006400,0.000000,15.710000>}
box{<0,0,-0.127000><0.424264,0.035000,0.127000> rotate<0,44.997030,0> translate<51.706400,0.000000,16.010000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.419000,0.000000,15.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.019000,0.000000,14.910000>}
box{<0,0,-0.127000><0.848528,0.035000,0.127000> rotate<0,44.997030,0> translate<51.419000,0.000000,15.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.419000,0.000000,17.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.019000,0.000000,18.110000>}
box{<0,0,-0.127000><0.848528,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.419000,0.000000,17.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.731800,0.000000,17.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.031800,0.000000,17.310000>}
box{<0,0,-0.127000><0.424264,0.035000,0.127000> rotate<0,-44.997030,0> translate<51.731800,0.000000,17.010000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.260000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,0.000000,4.445000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<48.260000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<34.798000,-1.535000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,20.955000>}
box{<0,0,-0.203200><17.272000,0.035000,0.203200> rotate<0,0.000000,0> translate<34.798000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.562000,-1.535000,21.717000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,-1.535000,22.225000>}
box{<0,0,-0.152400><0.718420,0.035000,0.152400> rotate<0,-44.997030,0> translate<51.562000,-1.535000,21.717000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.182400,0.000000,15.010000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.082400,0.000000,14.110000>}
box{<0,0,-0.127000><1.272792,0.035000,0.127000> rotate<0,44.997030,0> translate<51.182400,0.000000,15.010000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<50.800000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.085000,0.000000,24.765000>}
box{<0,0,-0.203200><1.285000,0.035000,0.203200> rotate<0,0.000000,0> translate<50.800000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.945800,0.000000,14.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.120800,0.000000,13.335000>}
box{<0,0,-0.127000><1.661701,0.035000,0.127000> rotate<0,44.997030,0> translate<50.945800,0.000000,14.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.990000,0.000000,22.310000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.155000,0.000000,22.310000>}
box{<0,0,-0.152400><1.165000,0.035000,0.152400> rotate<0,0.000000,0> translate<50.990000,0.000000,22.310000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.155000,0.000000,22.310000>}
box{<0,0,-0.152400><0.120208,0.035000,0.152400> rotate<0,-44.997030,0> translate<52.070000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.197000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.197000,-1.535000,10.668000>}
box{<0,0,-0.152400><3.302000,0.035000,0.152400> rotate<0,-90.000000,0> translate<52.197000,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.784000,-1.535000,16.383000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.197000,-1.535000,13.970000>}
box{<0,0,-0.152400><3.412497,0.035000,0.152400> rotate<0,44.997030,0> translate<49.784000,-1.535000,16.383000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.419000,-1.535000,22.479000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.451000,-1.535000,24.511000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,-44.997030,0> translate<50.419000,-1.535000,22.479000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.705000,-1.535000,7.620000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<50.165000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.943000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.705000,0.000000,8.255000>}
box{<0,0,-0.152400><0.762000,0.035000,0.152400> rotate<0,0.000000,0> translate<51.943000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.120800,0.000000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.765000,0.000000,13.335000>}
box{<0,0,-0.127000><0.644200,0.035000,0.127000> rotate<0,0.000000,0> translate<52.120800,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.006000,0.000000,12.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,12.510000>}
box{<0,0,-0.152400><0.784000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.006000,0.000000,12.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.765000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,13.310000>}
box{<0,0,-0.152400><0.035355,0.035000,0.152400> rotate<0,44.997030,0> translate<52.765000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.082400,0.000000,14.110000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.790000,0.000000,14.110000>}
box{<0,0,-0.127000><0.707600,0.035000,0.127000> rotate<0,0.000000,0> translate<52.082400,0.000000,14.110000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.019000,0.000000,14.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.790000,0.000000,14.910000>}
box{<0,0,-0.127000><0.771000,0.035000,0.127000> rotate<0,0.000000,0> translate<52.019000,0.000000,14.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.006400,0.000000,15.710000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.790000,0.000000,15.710000>}
box{<0,0,-0.127000><0.783600,0.035000,0.127000> rotate<0,0.000000,0> translate<52.006400,0.000000,15.710000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<50.265000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.790000,0.000000,16.510000>}
box{<0,0,-0.127000><2.525000,0.035000,0.127000> rotate<0,0.000000,0> translate<50.265000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.031800,0.000000,17.310000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.790000,0.000000,17.310000>}
box{<0,0,-0.127000><0.758200,0.035000,0.127000> rotate<0,0.000000,0> translate<52.031800,0.000000,17.310000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.019000,0.000000,18.110000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.790000,0.000000,18.110000>}
box{<0,0,-0.127000><0.771000,0.035000,0.127000> rotate<0,0.000000,0> translate<52.019000,0.000000,18.110000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.980800,0.000000,18.910000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.790000,0.000000,18.910000>}
box{<0,0,-0.127000><0.809200,0.035000,0.127000> rotate<0,0.000000,0> translate<51.980800,0.000000,18.910000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.968400,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.790000,0.000000,19.710000>}
box{<0,0,-0.127000><0.821980,0.035000,0.127000> rotate<0,-1.742768,0> translate<51.968400,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<51.968400,0.000000,20.523200>}
cylinder{<0,0,0><0,0.035000,0>0.127000 translate<52.790000,0.000000,20.510000>}
box{<0,0,-0.127000><0.821706,0.035000,0.127000> rotate<0,0.920386,0> translate<51.968400,0.000000,20.523200> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,20.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,21.040000>}
box{<0,0,-0.152400><0.530000,0.035000,0.152400> rotate<0,90.000000,0> translate<52.790000,0.000000,21.040000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.959000,-1.535000,14.351000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.959000,-1.535000,12.446000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,-90.000000,0> translate<52.959000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.959000,-1.535000,14.351000>}
box{<0,0,-0.152400><3.951313,0.035000,0.152400> rotate<0,44.997030,0> translate<50.165000,-1.535000,17.145000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,0.000000,2.540000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<53.340000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.070000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,0.000000,3.175000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<52.070000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.435000,-1.535000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,8.255000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<51.435000,-1.535000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.197000,-1.535000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,9.525000>}
box{<0,0,-0.152400><1.616446,0.035000,0.152400> rotate<0,44.997030,0> translate<52.197000,-1.535000,10.668000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,20.701000>}
box{<0,0,-0.152400><3.048000,0.035000,0.152400> rotate<0,-90.000000,0> translate<53.340000,-1.535000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.085000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,0.000000,25.781000>}
box{<0,0,-0.203200><1.614708,0.035000,0.203200> rotate<0,-38.989734,0> translate<52.085000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<41.910000,-1.535000,37.465000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,48.895000>}
box{<0,0,-0.152400><16.164461,0.035000,0.152400> rotate<0,-44.997030,0> translate<41.910000,-1.535000,37.465000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<39.370000,-1.535000,36.195000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,50.165000>}
box{<0,0,-0.152400><19.756563,0.035000,0.152400> rotate<0,-44.997030,0> translate<39.370000,-1.535000,36.195000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,50.165000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,50.800000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<53.340000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.340000,0.000000,25.781000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.495000,0.000000,26.020000>}
box{<0,0,-0.203200><0.284861,0.035000,0.203200> rotate<0,-57.031393,0> translate<53.340000,0.000000,25.781000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.848000,-1.535000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.848000,-1.535000,13.462000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,-90.000000,0> translate<53.848000,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.673000,-1.535000,17.907000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.848000,-1.535000,14.732000>}
box{<0,0,-0.152400><4.490128,0.035000,0.152400> rotate<0,44.997030,0> translate<50.673000,-1.535000,17.907000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<51.054000,-1.535000,18.669000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,-1.535000,15.875000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,44.997030,0> translate<51.054000,-1.535000,18.669000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,12.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.870000,0.000000,11.430000>}
box{<0,0,-0.152400><1.527351,0.035000,0.152400> rotate<0,44.997030,0> translate<52.790000,0.000000,12.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<48.895000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.975000,0.000000,5.080000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,0.000000,0> translate<48.895000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.959000,-1.535000,12.446000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.975000,-1.535000,11.430000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,44.997030,0> translate<52.959000,-1.535000,12.446000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.870000,0.000000,11.430000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.975000,0.000000,11.430000>}
box{<0,0,-0.152400><0.105000,0.035000,0.152400> rotate<0,0.000000,0> translate<53.870000,0.000000,11.430000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,19.710000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.000000,0.000000,19.710000>}
box{<0,0,-0.152400><1.210000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.790000,0.000000,19.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.451000,-1.535000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.102000,-1.535000,24.511000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.451000,-1.535000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,23.749000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.102000,-1.535000,24.511000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,-44.997030,0> translate<53.340000,-1.535000,23.749000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.435000,-1.535000,19.431000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.356000,-1.535000,16.510000>}
box{<0,0,-0.152400><4.130918,0.035000,0.152400> rotate<0,44.997030,0> translate<51.435000,-1.535000,19.431000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.689000,-1.535000,20.193000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.483000,-1.535000,17.399000>}
box{<0,0,-0.152400><3.951313,0.035000,0.152400> rotate<0,44.997030,0> translate<51.689000,-1.535000,20.193000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,21.040000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.610000,0.000000,22.860000>}
box{<0,0,-0.152400><2.573869,0.035000,0.152400> rotate<0,-44.997030,0> translate<52.790000,0.000000,21.040000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.102000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.610000,0.000000,24.511000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,0.000000,0> translate<54.102000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,18.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.724000,0.000000,18.910000>}
box{<0,0,-0.152400><1.934000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.790000,0.000000,18.910000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.070000,-1.535000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.864000,-1.535000,18.161000>}
box{<0,0,-0.203200><3.951313,0.035000,0.203200> rotate<0,44.997030,0> translate<52.070000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,14.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.940000,0.000000,14.910000>}
box{<0,0,-0.152400><2.150000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.790000,0.000000,14.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,18.110000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.940000,0.000000,18.110000>}
box{<0,0,-0.152400><2.150000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.790000,0.000000,18.110000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,20.701000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.991000,-1.535000,19.050000>}
box{<0,0,-0.152400><2.334867,0.035000,0.152400> rotate<0,44.997030,0> translate<53.340000,-1.535000,20.701000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.940000,0.000000,14.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.118000,0.000000,14.732000>}
box{<0,0,-0.152400><0.251730,0.035000,0.152400> rotate<0,44.997030,0> translate<54.940000,0.000000,14.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.705000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.245000,0.000000,10.795000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,-44.997030,0> translate<52.705000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.610000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.245000,0.000000,25.146000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<54.610000,0.000000,24.511000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.245000,0.000000,25.146000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.245000,0.000000,25.570000>}
box{<0,0,-0.152400><0.424000,0.035000,0.152400> rotate<0,90.000000,0> translate<55.245000,0.000000,25.570000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.495000,0.000000,26.020000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.245000,0.000000,27.770000>}
box{<0,0,-0.203200><2.474874,0.035000,0.203200> rotate<0,-44.997030,0> translate<53.495000,0.000000,26.020000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.245000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.245000,0.000000,27.770000>}
box{<0,0,-0.304800><2.075000,0.035000,0.304800> rotate<0,-90.000000,0> translate<55.245000,0.000000,27.770000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.245000,-1.535000,48.895000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,0.000000,0> translate<53.340000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.790000,0.000000,15.710000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.283000,0.000000,15.710000>}
box{<0,0,-0.203200><2.493000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.790000,0.000000,15.710000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.790000,0.000000,17.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.410000,0.000000,17.310000>}
box{<0,0,-0.203200><2.620000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.790000,0.000000,17.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.283000,0.000000,15.710000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.499000,0.000000,15.494000>}
box{<0,0,-0.203200><0.305470,0.035000,0.203200> rotate<0,44.997030,0> translate<55.283000,0.000000,15.710000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<53.848000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.615600,-1.535000,15.875000>}
box{<0,0,-0.203200><1.767600,0.035000,0.203200> rotate<0,0.000000,0> translate<53.848000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.245000,0.000000,25.570000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.695000,0.000000,26.020000>}
box{<0,0,-0.152400><0.636396,0.035000,0.152400> rotate<0,-44.997030,0> translate<55.245000,0.000000,25.570000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,0.000000,2.540000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<55.880000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.975000,0.000000,5.080000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,0.000000,3.175000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<53.975000,0.000000,5.080000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<49.530000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,0.000000,5.715000>}
box{<0,0,-0.152400><6.350000,0.035000,0.152400> rotate<0,0.000000,0> translate<49.530000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,-1.535000,9.525000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,0.000000,0> translate<53.340000,-1.535000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,13.675600>}
box{<0,0,-0.203200><0.340600,0.035000,0.203200> rotate<0,90.000000,0> translate<55.880000,-1.535000,13.675600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,14.310600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,13.970000>}
box{<0,0,-0.203200><0.340600,0.035000,0.203200> rotate<0,-90.000000,0> translate<55.880000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,14.310600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,14.975600>}
box{<0,0,-0.203200><0.665000,0.035000,0.203200> rotate<0,90.000000,0> translate<55.880000,-1.535000,14.975600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.615600,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,15.610600>}
box{<0,0,-0.203200><0.373918,0.035000,0.203200> rotate<0,44.997030,0> translate<55.615600,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,15.610600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,15.875000>}
box{<0,0,-0.203200><0.264400,0.035000,0.203200> rotate<0,90.000000,0> translate<55.880000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.000000,0.000000,19.710000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,0.000000,21.590000>}
box{<0,0,-0.152400><2.658721,0.035000,0.152400> rotate<0,-44.997030,0> translate<54.000000,0.000000,19.710000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.245000,-1.535000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,-1.535000,49.530000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<55.245000,-1.535000,48.895000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,-1.535000,49.530000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,-1.535000,50.800000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<55.880000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<51.435000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.895000,0.000000,7.620000>}
box{<0,0,-0.152400><4.460000,0.035000,0.152400> rotate<0,0.000000,0> translate<51.435000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.245000,0.000000,27.770000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.972000,0.000000,28.497000>}
box{<0,0,-0.203200><1.028133,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.245000,0.000000,27.770000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.790000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.261000,0.000000,16.510000>}
box{<0,0,-0.203200><3.471000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.790000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.848000,-1.535000,13.462000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.515000,-1.535000,10.795000>}
box{<0,0,-0.152400><3.771708,0.035000,0.152400> rotate<0,44.997030,0> translate<53.848000,-1.535000,13.462000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.245000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.515000,0.000000,10.795000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<55.245000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.261000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.515000,0.000000,17.795000>}
box{<0,0,-0.152400><0.348765,0.035000,0.152400> rotate<0,43.254404,0> translate<56.261000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515000,0.000000,17.795000>}
box{<0,0,-0.203200><0.620000,0.035000,0.203200> rotate<0,-90.000000,0> translate<56.515000,0.000000,17.795000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.410000,0.000000,17.310000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515000,0.000000,18.415000>}
box{<0,0,-0.203200><1.562706,0.035000,0.203200> rotate<0,-44.997030,0> translate<55.410000,0.000000,17.310000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.261000,0.000000,18.034000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515000,0.000000,18.415000>}
box{<0,0,-0.203200><0.457905,0.035000,0.203200> rotate<0,-56.306216,0> translate<56.261000,0.000000,18.034000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.515000,-1.535000,21.590000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,0.000000,0> translate<55.880000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.530000,0.000000,9.525000>}
box{<0,0,-0.152400><0.650000,0.035000,0.152400> rotate<0,0.000000,0> translate<55.880000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.991000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.769000,-1.535000,19.050000>}
box{<0,0,-0.152400><1.778000,0.035000,0.152400> rotate<0,0.000000,0> translate<54.991000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<54.864000,-1.535000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.896000,-1.535000,18.161000>}
box{<0,0,-0.203200><2.032000,0.035000,0.203200> rotate<0,0.000000,0> translate<54.864000,-1.535000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.515000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.135000,0.000000,10.160000>}
box{<0,0,-0.152400><0.887482,0.035000,0.152400> rotate<0,45.681762,0> translate<56.515000,0.000000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.895000,0.000000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,0.000000,8.636000>}
box{<0,0,-0.152400><1.614708,0.035000,0.152400> rotate<0,-38.989734,0> translate<55.895000,0.000000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.530000,0.000000,9.525000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,0.000000,8.636000>}
box{<0,0,-0.152400><1.083845,0.035000,0.152400> rotate<0,55.103950,0> translate<56.530000,0.000000,9.525000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.135000,0.000000,10.160000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,0.000000,10.414000>}
box{<0,0,-0.152400><0.254443,0.035000,0.152400> rotate<0,-86.614600,0> translate<57.135000,0.000000,10.160000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,0.000000,10.414000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,0.000000,11.785600>}
box{<0,0,-0.152400><1.371600,0.035000,0.152400> rotate<0,90.000000,0> translate<57.150000,0.000000,11.785600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,12.065000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<55.880000,-1.535000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,11.785600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,12.065000>}
box{<0,0,-0.203200><0.279400,0.035000,0.203200> rotate<0,90.000000,0> translate<57.150000,-1.535000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<52.765000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,13.335000>}
box{<0,0,-0.203200><4.385000,0.035000,0.203200> rotate<0,0.000000,0> translate<52.765000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,13.970000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.880000,-1.535000,13.970000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,14.975600>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,14.975600>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.880000,-1.535000,14.975600> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,13.970000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,-1.535000,14.975600>}
box{<0,0,-0.203200><1.005600,0.035000,0.203200> rotate<0,90.000000,0> translate<57.150000,-1.535000,14.975600> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.483000,-1.535000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,-1.535000,17.399000>}
box{<0,0,-0.152400><2.667000,0.035000,0.152400> rotate<0,0.000000,0> translate<54.483000,-1.535000,17.399000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.695000,0.000000,26.020000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,0.000000,27.559000>}
box{<0,0,-0.152400><2.117911,0.035000,0.152400> rotate<0,-46.603999,0> translate<55.695000,0.000000,26.020000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.356000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.277000,-1.535000,16.510000>}
box{<0,0,-0.152400><2.921000,0.035000,0.152400> rotate<0,0.000000,0> translate<54.356000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.698400,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.453000,0.000000,23.495000>}
box{<0,0,-0.152400><6.754600,0.035000,0.152400> rotate<0,0.000000,0> translate<50.698400,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.165000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.785000,0.000000,6.350000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,0.000000,0> translate<50.165000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.499000,0.000000,15.494000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,0.000000,15.494000>}
box{<0,0,-0.203200><2.286000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.499000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,0.000000,16.495000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,0.000000,15.494000>}
box{<0,0,-0.203200><1.001000,0.035000,0.203200> rotate<0,-90.000000,0> translate<57.785000,0.000000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.896000,-1.535000,18.161000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,-1.535000,19.050000>}
box{<0,0,-0.203200><1.257236,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.896000,-1.535000,18.161000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<56.515000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,0.000000,19.685000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,-44.997030,0> translate<56.515000,0.000000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.940000,0.000000,18.110000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.785000,0.000000,20.955000>}
box{<0,0,-0.152400><4.023438,0.035000,0.152400> rotate<0,-44.997030,0> translate<54.940000,0.000000,18.110000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,0.000000,16.495000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.039000,0.000000,16.510000>}
box{<0,0,-0.203200><0.254443,0.035000,0.203200> rotate<0,-3.379461,0> translate<57.785000,0.000000,16.495000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.724000,0.000000,18.910000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.039000,0.000000,22.225000>}
box{<0,0,-0.152400><4.688118,0.035000,0.152400> rotate<0,-44.997030,0> translate<54.724000,0.000000,18.910000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.150000,-1.535000,17.399000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.166000,-1.535000,18.415000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,-44.997030,0> translate<57.150000,-1.535000,17.399000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.790000,0.000000,14.110000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.280000,0.000000,14.110000>}
box{<0,0,-0.152400><5.490000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.790000,0.000000,14.110000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,0.000000,2.540000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<58.420000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.880000,0.000000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,0.000000,3.175000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<55.880000,0.000000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<50.800000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,0.000000,6.985000>}
box{<0,0,-0.152400><7.620000,0.035000,0.152400> rotate<0,0.000000,0> translate<50.800000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.150000,0.000000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,0.000000,12.065000>}
box{<0,0,-0.203200><1.796051,0.035000,0.203200> rotate<0,44.997030,0> translate<57.150000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,0.000000,12.065000>}
box{<0,0,-0.203200><3.810000,0.035000,0.203200> rotate<0,90.000000,0> translate<58.420000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.880000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,15.875000>}
box{<0,0,-0.203200><2.540000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.880000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,19.050000>}
box{<0,0,-0.203200><0.635000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.785000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.545000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,-1.535000,46.355000>}
box{<0,0,-0.152400><22.450640,0.035000,0.152400> rotate<0,-44.997030,0> translate<42.545000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,-1.535000,46.355000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,-1.535000,50.800000>}
box{<0,0,-0.152400><4.445000,0.035000,0.152400> rotate<0,90.000000,0> translate<58.420000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.277000,-1.535000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.547000,-1.535000,17.780000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<57.277000,-1.535000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.769000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.674000,-1.535000,20.955000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,-44.997030,0> translate<56.769000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<55.972000,0.000000,28.497000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.752000,0.000000,28.497000>}
box{<0,0,-0.203200><2.780000,0.035000,0.203200> rotate<0,0.000000,0> translate<55.972000,0.000000,28.497000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.752000,0.000000,28.497000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.801000,0.000000,28.448000>}
box{<0,0,-0.203200><0.069296,0.035000,0.203200> rotate<0,44.997030,0> translate<58.752000,0.000000,28.497000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<55.118000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.928000,0.000000,14.732000>}
box{<0,0,-0.152400><3.810000,0.035000,0.152400> rotate<0,0.000000,0> translate<55.118000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.453000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.928000,0.000000,24.970000>}
box{<0,0,-0.152400><2.085965,0.035000,0.152400> rotate<0,-44.997030,0> translate<57.453000,0.000000,23.495000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.801000,0.000000,28.448000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.928000,0.000000,28.370000>}
box{<0,0,-0.203200><0.149040,0.035000,0.203200> rotate<0,31.555050,0> translate<58.801000,0.000000,28.448000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.280000,0.000000,14.110000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.055000,0.000000,13.335000>}
box{<0,0,-0.152400><1.096016,0.035000,0.152400> rotate<0,44.997030,0> translate<58.280000,0.000000,14.110000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.928000,0.000000,14.732000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.055000,0.000000,14.859000>}
box{<0,0,-0.152400><0.179605,0.035000,0.152400> rotate<0,-44.997030,0> translate<58.928000,0.000000,14.732000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.979000,0.000000,14.783000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.055000,0.000000,14.859000>}
box{<0,0,-0.152400><0.107480,0.035000,0.152400> rotate<0,-44.997030,0> translate<58.979000,0.000000,14.783000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.039000,0.000000,16.510000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.055000,0.000000,16.510000>}
box{<0,0,-0.203200><1.016000,0.035000,0.203200> rotate<0,0.000000,0> translate<58.039000,0.000000,16.510000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,15.875000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.055000,-1.535000,16.510000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.420000,-1.535000,15.875000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<57.785000,0.000000,19.685000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.055000,0.000000,19.685000>}
box{<0,0,-0.203200><1.270000,0.035000,0.203200> rotate<0,0.000000,0> translate<57.785000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,-1.535000,19.050000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<59.055000,-1.535000,19.685000>}
box{<0,0,-0.203200><0.898026,0.035000,0.203200> rotate<0,-44.997030,0> translate<58.420000,-1.535000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<54.610000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.309000,0.000000,22.860000>}
box{<0,0,-0.152400><4.699000,0.035000,0.152400> rotate<0,0.000000,0> translate<54.610000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.055000,-1.535000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.690000,-1.535000,13.335000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,0.000000,0> translate<59.055000,-1.535000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.055000,-1.535000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.690000,-1.535000,14.859000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,0.000000,0> translate<59.055000,-1.535000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.547000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.690000,-1.535000,17.780000>}
box{<0,0,-0.152400><1.143000,0.035000,0.152400> rotate<0,0.000000,0> translate<58.547000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.785000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.690000,0.000000,20.955000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,0.000000,0> translate<57.785000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<55.245000,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,29.845000>}
box{<0,0,-0.304800><4.445000,0.035000,0.304800> rotate<0,0.000000,0> translate<55.245000,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<53.340000,-1.535000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.817000,-1.535000,8.255000>}
box{<0,0,-0.152400><6.477000,0.035000,0.152400> rotate<0,0.000000,0> translate<53.340000,-1.535000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.039000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.817000,0.000000,22.225000>}
box{<0,0,-0.152400><1.778000,0.035000,0.152400> rotate<0,0.000000,0> translate<58.039000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<58.420000,0.000000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.325000,0.000000,6.350000>}
box{<0,0,-0.203200><2.694077,0.035000,0.203200> rotate<0,44.997030,0> translate<58.420000,0.000000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.690000,-1.535000,14.859000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.325000,-1.535000,15.494000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,-44.997030,0> translate<59.690000,-1.535000,14.859000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.325000,-1.535000,17.145000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.325000,-1.535000,15.494000>}
box{<0,0,-0.152400><1.651000,0.035000,0.152400> rotate<0,-90.000000,0> translate<60.325000,-1.535000,15.494000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.690000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.325000,-1.535000,17.145000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<59.690000,-1.535000,17.780000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.166000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.325000,-1.535000,18.415000>}
box{<0,0,-0.152400><2.159000,0.035000,0.152400> rotate<0,0.000000,0> translate<58.166000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.928000,0.000000,24.970000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.325000,0.000000,26.367000>}
box{<0,0,-0.152400><1.975656,0.035000,0.152400> rotate<0,-44.997030,0> translate<58.928000,0.000000,24.970000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.325000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.325000,0.000000,26.367000>}
box{<0,0,-0.152400><0.303000,0.035000,0.152400> rotate<0,-90.000000,0> translate<60.325000,0.000000,26.367000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<52.705000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.579000,-1.535000,7.620000>}
box{<0,0,-0.152400><7.874000,0.035000,0.152400> rotate<0,0.000000,0> translate<52.705000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.817000,-1.535000,8.255000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.833000,-1.535000,9.271000>}
box{<0,0,-0.152400><1.436841,0.035000,0.152400> rotate<0,-44.997030,0> translate<59.817000,-1.535000,8.255000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.515000,-1.535000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.833000,-1.535000,10.795000>}
box{<0,0,-0.152400><4.318000,0.035000,0.152400> rotate<0,0.000000,0> translate<56.515000,-1.535000,10.795000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.833000,0.000000,10.795000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.833000,0.000000,11.303000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,90.000000,0> translate<60.833000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,2.540000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<60.960000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<57.785000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,3.175000>}
box{<0,0,-0.152400><4.490128,0.035000,0.152400> rotate<0,44.997030,0> translate<57.785000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.420000,0.000000,6.985000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,4.445000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<58.420000,0.000000,6.985000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.690000,-1.535000,13.335000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,-1.535000,14.605000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<59.690000,-1.535000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,-1.535000,17.780000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,-1.535000,14.605000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,-90.000000,0> translate<60.960000,-1.535000,14.605000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.325000,-1.535000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,-1.535000,17.780000>}
box{<0,0,-0.152400><0.898026,0.035000,0.152400> rotate<0,44.997030,0> translate<60.325000,-1.535000,18.415000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<58.674000,-1.535000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,-1.535000,20.955000>}
box{<0,0,-0.152400><2.286000,0.035000,0.152400> rotate<0,0.000000,0> translate<58.674000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,22.225000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<60.960000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.309000,0.000000,22.860000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,24.511000>}
box{<0,0,-0.152400><2.334867,0.035000,0.152400> rotate<0,-44.997030,0> translate<59.309000,0.000000,22.860000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,24.511000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,26.035000>}
box{<0,0,-0.152400><1.524000,0.035000,0.152400> rotate<0,90.000000,0> translate<60.960000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<42.545000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,-1.535000,47.625000>}
box{<0,0,-0.152400><26.042743,0.035000,0.152400> rotate<0,-44.997030,0> translate<42.545000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,-1.535000,47.625000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,-1.535000,50.800000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,90.000000,0> translate<60.960000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<50.165000,-1.535000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.595000,-1.535000,5.715000>}
box{<0,0,-0.304800><11.430000,0.035000,0.304800> rotate<0,0.000000,0> translate<50.165000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.833000,0.000000,11.303000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,12.065000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,-44.997030,0> translate<60.833000,0.000000,11.303000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.690000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,19.050000>}
box{<0,0,-0.152400><2.694077,0.035000,0.152400> rotate<0,44.997030,0> translate<59.690000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,19.050000>}
box{<0,0,-0.152400><6.985000,0.035000,0.152400> rotate<0,90.000000,0> translate<61.595000,0.000000,19.050000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<59.817000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,24.003000>}
box{<0,0,-0.152400><2.514472,0.035000,0.152400> rotate<0,-44.997030,0> translate<59.817000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,24.003000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,25.400000>}
box{<0,0,-0.152400><1.397000,0.035000,0.152400> rotate<0,90.000000,0> translate<61.595000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<56.515000,-1.535000,21.590000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,-1.535000,26.670000>}
box{<0,0,-0.152400><7.184205,0.035000,0.152400> rotate<0,-44.997030,0> translate<56.515000,-1.535000,21.590000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.325000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,27.940000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<60.325000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,27.940000>}
box{<0,0,-0.152400><2.540000,0.035000,0.152400> rotate<0,-90.000000,0> translate<61.595000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.579000,-1.535000,7.620000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.976000,-1.535000,9.017000>}
box{<0,0,-0.152400><1.975656,0.035000,0.152400> rotate<0,-44.997030,0> translate<60.579000,-1.535000,7.620000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.976000,-1.535000,11.811000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.976000,-1.535000,9.017000>}
box{<0,0,-0.152400><2.794000,0.035000,0.152400> rotate<0,-90.000000,0> translate<61.976000,-1.535000,9.017000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,4.445000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<60.960000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<60.325000,0.000000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.203200 translate<62.230000,0.000000,6.350000>}
box{<0,0,-0.203200><1.905000,0.035000,0.203200> rotate<0,0.000000,0> translate<60.325000,0.000000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<61.595000,-1.535000,5.715000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.230000,-1.535000,6.350000>}
box{<0,0,-0.304800><0.898026,0.035000,0.304800> rotate<0,-44.997030,0> translate<61.595000,-1.535000,5.715000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.833000,0.000000,9.271000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,10.668000>}
box{<0,0,-0.152400><1.975656,0.035000,0.152400> rotate<0,-44.997030,0> translate<60.833000,0.000000,9.271000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,19.685000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<60.960000,0.000000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,10.668000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,19.685000>}
box{<0,0,-0.152400><9.017000,0.035000,0.152400> rotate<0,90.000000,0> translate<62.230000,0.000000,19.685000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,22.225000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,23.495000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<60.960000,0.000000,22.225000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,23.495000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,24.130000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,90.000000,0> translate<62.230000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,27.305000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<60.960000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,28.575000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,90.000000,0> translate<62.230000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<59.690000,-1.535000,29.845000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.230000,-1.535000,32.385000>}
box{<0,0,-0.304800><3.592102,0.035000,0.304800> rotate<0,-44.997030,0> translate<59.690000,-1.535000,29.845000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.865000,0.000000,31.750000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<61.595000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,0.000000,2.540000>}
box{<0,0,-0.152400><0.635000,0.035000,0.152400> rotate<0,-90.000000,0> translate<63.500000,0.000000,2.540000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,4.445000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,0.000000,3.175000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,44.997030,0> translate<62.230000,0.000000,4.445000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.976000,-1.535000,11.811000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,-1.535000,13.335000>}
box{<0,0,-0.152400><2.155261,0.035000,0.152400> rotate<0,-44.997030,0> translate<61.976000,-1.535000,11.811000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,0.000000,18.415000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,0.000000,13.335000>}
box{<0,0,-0.152400><5.080000,0.035000,0.152400> rotate<0,-90.000000,0> translate<63.500000,0.000000,13.335000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<60.960000,-1.535000,20.955000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,-1.535000,18.415000>}
box{<0,0,-0.152400><3.592102,0.035000,0.152400> rotate<0,44.997030,0> translate<60.960000,-1.535000,20.955000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<43.815000,-1.535000,29.210000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,-1.535000,48.895000>}
box{<0,0,-0.152400><27.838794,0.035000,0.152400> rotate<0,-44.997030,0> translate<43.815000,-1.535000,29.210000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,-1.535000,48.895000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.500000,-1.535000,50.800000>}
box{<0,0,-0.152400><1.905000,0.035000,0.152400> rotate<0,90.000000,0> translate<63.500000,-1.535000,50.800000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.230000,-1.535000,6.350000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.627000,-1.535000,8.128000>}
box{<0,0,-0.304800><2.261171,0.035000,0.304800> rotate<0,-51.839352,0> translate<62.230000,-1.535000,6.350000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.627000,-1.535000,8.128000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.627000,-1.535000,8.763000>}
box{<0,0,-0.304800><0.635000,0.035000,0.304800> rotate<0,90.000000,0> translate<63.627000,-1.535000,8.763000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.627000,0.000000,25.400000>}
box{<0,0,-0.152400><1.887991,0.035000,0.152400> rotate<0,-42.270899,0> translate<62.230000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.627000,0.000000,27.432000>}
box{<0,0,-0.152400><2.873682,0.035000,0.152400> rotate<0,-44.997030,0> translate<61.595000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.627000,0.000000,27.432000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.627000,0.000000,27.940000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,90.000000,0> translate<63.627000,0.000000,27.940000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.230000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.627000,0.000000,29.972000>}
box{<0,0,-0.152400><1.975656,0.035000,0.152400> rotate<0,-44.997030,0> translate<62.230000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.627000,0.000000,29.972000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.627000,0.000000,30.480000>}
box{<0,0,-0.152400><0.508000,0.035000,0.152400> rotate<0,90.000000,0> translate<63.627000,0.000000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<62.865000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.135000,0.000000,31.750000>}
box{<0,0,-0.152400><1.270000,0.035000,0.152400> rotate<0,0.000000,0> translate<62.865000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<61.595000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.770000,-1.535000,26.670000>}
box{<0,0,-0.152400><3.175000,0.035000,0.152400> rotate<0,0.000000,0> translate<61.595000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<62.230000,-1.535000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770000,-1.535000,32.385000>}
box{<0,0,-0.304800><2.540000,0.035000,0.304800> rotate<0,0.000000,0> translate<62.230000,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<63.627000,0.000000,25.400000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.897000,0.000000,26.670000>}
box{<0,0,-0.152400><1.796051,0.035000,0.152400> rotate<0,-44.997030,0> translate<63.627000,0.000000,25.400000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.135000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.897000,0.000000,30.988000>}
box{<0,0,-0.152400><1.077631,0.035000,0.152400> rotate<0,44.997030,0> translate<64.135000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.897000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.897000,0.000000,30.988000>}
box{<0,0,-0.152400><4.318000,0.035000,0.152400> rotate<0,90.000000,0> translate<64.897000,0.000000,30.988000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<64.770000,-1.535000,32.385000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,31.115000>}
box{<0,0,-0.304800><1.796051,0.035000,0.304800> rotate<0,44.997030,0> translate<64.770000,-1.535000,32.385000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<64.770000,-1.535000,26.670000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<66.167000,-1.535000,27.940000>}
box{<0,0,-0.152400><1.887991,0.035000,0.152400> rotate<0,-42.270899,0> translate<64.770000,-1.535000,26.670000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.040000,-1.535000,31.115000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.167000,-1.535000,30.480000>}
box{<0,0,-0.304800><0.647575,0.035000,0.304800> rotate<0,78.684874,0> translate<66.040000,-1.535000,31.115000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<63.627000,-1.535000,8.763000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,-1.535000,12.954000>}
box{<0,0,-0.304800><5.579334,0.035000,0.304800> rotate<0,-48.688173,0> translate<63.627000,-1.535000,8.763000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,-1.535000,12.954000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,-1.535000,24.130000>}
box{<0,0,-0.304800><11.176000,0.035000,0.304800> rotate<0,90.000000,0> translate<67.310000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.310000,-1.535000,24.130000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.564000,-1.535000,24.384000>}
box{<0,0,-0.304800><0.359210,0.035000,0.304800> rotate<0,-44.997030,0> translate<67.310000,-1.535000,24.130000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<66.167000,-1.535000,30.480000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.564000,-1.535000,28.956000>}
box{<0,0,-0.304800><2.067410,0.035000,0.304800> rotate<0,47.486419,0> translate<66.167000,-1.535000,30.480000> }
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.564000,-1.535000,24.384000>}
cylinder{<0,0,0><0,0.035000,0>0.304800 translate<67.564000,-1.535000,28.956000>}
box{<0,0,-0.304800><4.572000,0.035000,0.304800> rotate<0,90.000000,0> translate<67.564000,-1.535000,28.956000> }
//Text
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,16.599197>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,16.006025>}
box{<0,0,-0.063500><0.593172,0.035000,0.063500> rotate<0,-90.000000,0> translate<0.506500,-1.535000,16.006025> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,16.006025>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.099672,-1.535000,16.599197>}
box{<0,0,-0.063500><0.838872,0.035000,0.063500> rotate<0,-44.997030,0> translate<0.506500,-1.535000,16.006025> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.099672,-1.535000,16.599197>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,16.599197>}
box{<0,0,-0.063500><0.148294,0.035000,0.063500> rotate<0,0.000000,0> translate<1.099672,-1.535000,16.599197> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,16.599197>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,16.450903>}
box{<0,0,-0.063500><0.209719,0.035000,0.063500> rotate<0,44.997030,0> translate<1.247966,-1.535000,16.599197> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,16.450903>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,16.154316>}
box{<0,0,-0.063500><0.296587,0.035000,0.063500> rotate<0,-90.000000,0> translate<1.396259,-1.535000,16.154316> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,16.154316>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,16.006025>}
box{<0,0,-0.063500><0.209717,0.035000,0.063500> rotate<0,-44.996427,0> translate<1.247966,-1.535000,16.006025> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.654791,-1.535000,16.941544>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,16.941544>}
box{<0,0,-0.063500><0.593175,0.035000,0.063500> rotate<0,0.000000,0> translate<0.654791,-1.535000,16.941544> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,16.941544>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,17.089834>}
box{<0,0,-0.063500><0.209717,0.035000,0.063500> rotate<0,-44.996427,0> translate<1.247966,-1.535000,16.941544> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,17.089834>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,17.386422>}
box{<0,0,-0.063500><0.296587,0.035000,0.063500> rotate<0,90.000000,0> translate<1.396259,-1.535000,17.386422> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,17.386422>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,17.534716>}
box{<0,0,-0.063500><0.209719,0.035000,0.063500> rotate<0,44.997030,0> translate<1.247966,-1.535000,17.534716> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,17.534716>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.654791,-1.535000,17.534716>}
box{<0,0,-0.063500><0.593175,0.035000,0.063500> rotate<0,0.000000,0> translate<0.654791,-1.535000,17.534716> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.654791,-1.535000,17.534716>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,17.386422>}
box{<0,0,-0.063500><0.209717,0.035000,0.063500> rotate<0,-44.997634,0> translate<0.506500,-1.535000,17.386422> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,17.386422>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,17.089834>}
box{<0,0,-0.063500><0.296587,0.035000,0.063500> rotate<0,-90.000000,0> translate<0.506500,-1.535000,17.089834> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,17.089834>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.654791,-1.535000,16.941544>}
box{<0,0,-0.063500><0.209715,0.035000,0.063500> rotate<0,44.997030,0> translate<0.506500,-1.535000,17.089834> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.654791,-1.535000,16.941544>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,17.534716>}
box{<0,0,-0.063500><0.838874,0.035000,0.063500> rotate<0,-44.996879,0> translate<0.654791,-1.535000,16.941544> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.099672,-1.535000,17.877063>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,18.173647>}
box{<0,0,-0.063500><0.419436,0.035000,0.063500> rotate<0,-44.996728,0> translate<1.099672,-1.535000,17.877063> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,18.173647>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,18.173647>}
box{<0,0,-0.063500><0.889759,0.035000,0.063500> rotate<0,0.000000,0> translate<0.506500,-1.535000,18.173647> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,17.877063>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,18.470234>}
box{<0,0,-0.063500><0.593172,0.035000,0.063500> rotate<0,90.000000,0> translate<0.506500,-1.535000,18.470234> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.099672,-1.535000,18.812581>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,19.109166>}
box{<0,0,-0.063500><0.419436,0.035000,0.063500> rotate<0,-44.996728,0> translate<1.099672,-1.535000,18.812581> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,19.109166>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,19.109166>}
box{<0,0,-0.063500><0.889759,0.035000,0.063500> rotate<0,0.000000,0> translate<0.506500,-1.535000,19.109166> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,18.812581>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,19.405753>}
box{<0,0,-0.063500><0.593172,0.035000,0.063500> rotate<0,90.000000,0> translate<0.506500,-1.535000,19.405753> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.951378,-1.535000,19.748100>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.951378,-1.535000,20.341272>}
box{<0,0,-0.063500><0.593172,0.035000,0.063500> rotate<0,90.000000,0> translate<0.951378,-1.535000,20.341272> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,20.683619>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,20.683619>}
box{<0,0,-0.063500><0.889759,0.035000,0.063500> rotate<0,0.000000,0> translate<0.506500,-1.535000,20.683619> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,20.683619>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,21.128497>}
box{<0,0,-0.063500><0.444878,0.035000,0.063500> rotate<0,90.000000,0> translate<1.396259,-1.535000,21.128497> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,21.128497>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,21.276791>}
box{<0,0,-0.063500><0.209719,0.035000,0.063500> rotate<0,44.997030,0> translate<1.247966,-1.535000,21.276791> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,21.276791>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.951378,-1.535000,21.276791>}
box{<0,0,-0.063500><0.296587,0.035000,0.063500> rotate<0,0.000000,0> translate<0.951378,-1.535000,21.276791> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.951378,-1.535000,21.276791>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.803084,-1.535000,21.128497>}
box{<0,0,-0.063500><0.209719,0.035000,0.063500> rotate<0,-44.997030,0> translate<0.803084,-1.535000,21.128497> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.803084,-1.535000,21.128497>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.803084,-1.535000,20.683619>}
box{<0,0,-0.063500><0.444878,0.035000,0.063500> rotate<0,-90.000000,0> translate<0.803084,-1.535000,20.683619> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.803084,-1.535000,20.980203>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,21.276791>}
box{<0,0,-0.063500><0.419436,0.035000,0.063500> rotate<0,44.997332,0> translate<0.506500,-1.535000,21.276791> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,22.212309>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,21.619138>}
box{<0,0,-0.063500><0.593172,0.035000,0.063500> rotate<0,-90.000000,0> translate<1.396259,-1.535000,21.619138> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,21.619138>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,21.619138>}
box{<0,0,-0.063500><0.889759,0.035000,0.063500> rotate<0,0.000000,0> translate<0.506500,-1.535000,21.619138> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,21.619138>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,22.212309>}
box{<0,0,-0.063500><0.593172,0.035000,0.063500> rotate<0,90.000000,0> translate<0.506500,-1.535000,22.212309> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.951378,-1.535000,21.619138>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.951378,-1.535000,21.915722>}
box{<0,0,-0.063500><0.296584,0.035000,0.063500> rotate<0,90.000000,0> translate<0.951378,-1.535000,21.915722> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,22.554656>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.803084,-1.535000,22.554656>}
box{<0,0,-0.063500><0.593175,0.035000,0.063500> rotate<0,0.000000,0> translate<0.803084,-1.535000,22.554656> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.803084,-1.535000,22.554656>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,22.851241>}
box{<0,0,-0.063500><0.419434,0.035000,0.063500> rotate<0,44.997030,0> translate<0.506500,-1.535000,22.851241> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,22.851241>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.803084,-1.535000,23.147828>}
box{<0,0,-0.063500><0.419436,0.035000,0.063500> rotate<0,-44.997332,0> translate<0.506500,-1.535000,22.851241> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.803084,-1.535000,23.147828>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,23.147828>}
box{<0,0,-0.063500><0.593175,0.035000,0.063500> rotate<0,0.000000,0> translate<0.803084,-1.535000,23.147828> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,23.490175>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,23.638466>}
box{<0,0,-0.063500><0.209717,0.035000,0.063500> rotate<0,-44.996427,0> translate<1.247966,-1.535000,23.490175> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,23.638466>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,23.935053>}
box{<0,0,-0.063500><0.296587,0.035000,0.063500> rotate<0,90.000000,0> translate<1.396259,-1.535000,23.935053> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.396259,-1.535000,23.935053>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,24.083347>}
box{<0,0,-0.063500><0.209719,0.035000,0.063500> rotate<0,44.997030,0> translate<1.247966,-1.535000,24.083347> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.247966,-1.535000,24.083347>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.099672,-1.535000,24.083347>}
box{<0,0,-0.063500><0.148294,0.035000,0.063500> rotate<0,0.000000,0> translate<1.099672,-1.535000,24.083347> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<1.099672,-1.535000,24.083347>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.951378,-1.535000,23.935053>}
box{<0,0,-0.063500><0.209719,0.035000,0.063500> rotate<0,-44.997030,0> translate<0.951378,-1.535000,23.935053> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.951378,-1.535000,23.935053>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.951378,-1.535000,23.786759>}
box{<0,0,-0.063500><0.148294,0.035000,0.063500> rotate<0,-90.000000,0> translate<0.951378,-1.535000,23.786759> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.951378,-1.535000,23.935053>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.803084,-1.535000,24.083347>}
box{<0,0,-0.063500><0.209719,0.035000,0.063500> rotate<0,44.997030,0> translate<0.803084,-1.535000,24.083347> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.803084,-1.535000,24.083347>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.654791,-1.535000,24.083347>}
box{<0,0,-0.063500><0.148294,0.035000,0.063500> rotate<0,0.000000,0> translate<0.654791,-1.535000,24.083347> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.654791,-1.535000,24.083347>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,23.935053>}
box{<0,0,-0.063500><0.209717,0.035000,0.063500> rotate<0,-44.997634,0> translate<0.506500,-1.535000,23.935053> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,23.935053>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,23.638466>}
box{<0,0,-0.063500><0.296587,0.035000,0.063500> rotate<0,-90.000000,0> translate<0.506500,-1.535000,23.638466> }
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.506500,-1.535000,23.638466>}
cylinder{<0,0,0><0,0.035000,0>0.063500 translate<0.654791,-1.535000,23.490175>}
box{<0,0,-0.063500><0.209715,0.035000,0.063500> rotate<0,44.997030,0> translate<0.506500,-1.535000,23.638466> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.853400,-1.535000,41.631359>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.675450,-1.535000,41.809313>}
box{<0,0,-0.101600><0.251662,0.035000,0.101600> rotate<0,44.997533,0> translate<20.675450,-1.535000,41.809313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.675450,-1.535000,41.809313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.319544,-1.535000,41.809313>}
box{<0,0,-0.101600><0.355906,0.035000,0.101600> rotate<0,0.000000,0> translate<20.319544,-1.535000,41.809313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.319544,-1.535000,41.809313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.141594,-1.535000,41.631359>}
box{<0,0,-0.101600><0.251662,0.035000,0.101600> rotate<0,-44.997533,0> translate<20.141594,-1.535000,41.631359> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.141594,-1.535000,41.631359>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.141594,-1.535000,41.453406>}
box{<0,0,-0.101600><0.177953,0.035000,0.101600> rotate<0,-90.000000,0> translate<20.141594,-1.535000,41.453406> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.141594,-1.535000,41.453406>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.319544,-1.535000,41.275456>}
box{<0,0,-0.101600><0.251659,0.035000,0.101600> rotate<0,44.997030,0> translate<20.141594,-1.535000,41.453406> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.319544,-1.535000,41.275456>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.497497,-1.535000,41.275456>}
box{<0,0,-0.101600><0.177953,0.035000,0.101600> rotate<0,0.000000,0> translate<20.319544,-1.535000,41.275456> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.319544,-1.535000,41.275456>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.141594,-1.535000,41.097503>}
box{<0,0,-0.101600><0.251662,0.035000,0.101600> rotate<0,-44.997533,0> translate<20.141594,-1.535000,41.097503> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.141594,-1.535000,41.097503>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.141594,-1.535000,40.919550>}
box{<0,0,-0.101600><0.177953,0.035000,0.101600> rotate<0,-90.000000,0> translate<20.141594,-1.535000,40.919550> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.141594,-1.535000,40.919550>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.319544,-1.535000,40.741600>}
box{<0,0,-0.101600><0.251659,0.035000,0.101600> rotate<0,44.997030,0> translate<20.141594,-1.535000,40.919550> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.319544,-1.535000,40.741600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.675450,-1.535000,40.741600>}
box{<0,0,-0.101600><0.355906,0.035000,0.101600> rotate<0,0.000000,0> translate<20.319544,-1.535000,40.741600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.675450,-1.535000,40.741600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<20.853400,-1.535000,40.919550>}
box{<0,0,-0.101600><0.251659,0.035000,0.101600> rotate<0,-44.997030,0> translate<20.675450,-1.535000,40.741600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.684003,-1.535000,40.919550>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.684003,-1.535000,41.631359>}
box{<0,0,-0.101600><0.711809,0.035000,0.101600> rotate<0,90.000000,0> translate<19.684003,-1.535000,41.631359> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.684003,-1.535000,41.631359>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.506053,-1.535000,41.809313>}
box{<0,0,-0.101600><0.251662,0.035000,0.101600> rotate<0,44.997533,0> translate<19.506053,-1.535000,41.809313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.506053,-1.535000,41.809313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.150147,-1.535000,41.809313>}
box{<0,0,-0.101600><0.355906,0.035000,0.101600> rotate<0,0.000000,0> translate<19.150147,-1.535000,41.809313> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.150147,-1.535000,41.809313>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<18.972197,-1.535000,41.631359>}
box{<0,0,-0.101600><0.251662,0.035000,0.101600> rotate<0,-44.997533,0> translate<18.972197,-1.535000,41.631359> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<18.972197,-1.535000,41.631359>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<18.972197,-1.535000,40.919550>}
box{<0,0,-0.101600><0.711809,0.035000,0.101600> rotate<0,-90.000000,0> translate<18.972197,-1.535000,40.919550> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<18.972197,-1.535000,40.919550>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.150147,-1.535000,40.741600>}
box{<0,0,-0.101600><0.251659,0.035000,0.101600> rotate<0,44.997030,0> translate<18.972197,-1.535000,40.919550> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.150147,-1.535000,40.741600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.506053,-1.535000,40.741600>}
box{<0,0,-0.101600><0.355906,0.035000,0.101600> rotate<0,0.000000,0> translate<19.150147,-1.535000,40.741600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.506053,-1.535000,40.741600>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.684003,-1.535000,40.919550>}
box{<0,0,-0.101600><0.251659,0.035000,0.101600> rotate<0,-44.997030,0> translate<19.506053,-1.535000,40.741600> }
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<19.684003,-1.535000,40.919550>}
cylinder{<0,0,0><0,0.035000,0>0.101600 translate<18.972197,-1.535000,41.631359>}
box{<0,0,-0.101600><1.006648,0.035000,0.101600> rotate<0,44.997156,0> translate<18.972197,-1.535000,41.631359> }
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
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.635000,0.000000,1.635000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.635000,0.000000,52.705000>}
box{<0,0,-0.076200><51.070000,0.035000,0.076200> rotate<0,90.000000,0> translate<0.635000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.635000,-1.535000,1.635000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.635000,-1.535000,52.705000>}
box{<0,0,-0.076200><51.070000,0.035000,0.076200> rotate<0,90.000000,0> translate<0.635000,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.635000,0.000000,1.635000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.635000,0.000000,0.635000>}
box{<0,0,-0.076200><1.414214,0.035000,0.076200> rotate<0,44.997030,0> translate<0.635000,0.000000,1.635000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.635000,-1.535000,1.635000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.635000,-1.535000,0.635000>}
box{<0,0,-0.076200><1.414214,0.035000,0.076200> rotate<0,44.997030,0> translate<0.635000,-1.535000,1.635000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.635000,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<69.215000,-1.535000,52.705000>}
box{<0,0,-0.076200><68.580000,0.035000,0.076200> rotate<0,0.000000,0> translate<0.635000,-1.535000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<0.635000,0.000000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<71.120000,0.000000,52.705000>}
box{<0,0,-0.076200><70.485000,0.035000,0.076200> rotate<0,0.000000,0> translate<0.635000,0.000000,52.705000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.635000,-1.535000,0.635000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<69.215000,-1.535000,0.635000>}
box{<0,0,-0.076200><67.580000,0.035000,0.076200> rotate<0,0.000000,0> translate<1.635000,-1.535000,0.635000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<1.635000,0.000000,0.635000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<70.120000,0.000000,0.635000>}
box{<0,0,-0.076200><68.485000,0.035000,0.076200> rotate<0,0.000000,0> translate<1.635000,0.000000,0.635000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,-1.535000,13.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,-1.535000,24.019000>}
box{<0,0,-0.152400><10.319000,0.035000,0.152400> rotate<0,90.000000,0> translate<6.350000,-1.535000,24.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,-1.535000,13.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.350000,-1.535000,12.700000>}
box{<0,0,-0.152400><1.414214,0.035000,0.152400> rotate<0,44.997030,0> translate<6.350000,-1.535000,13.700000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<6.350000,-1.535000,24.019000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.350000,-1.535000,25.019000>}
box{<0,0,-0.152400><1.414214,0.035000,0.152400> rotate<0,-44.997030,0> translate<6.350000,-1.535000,24.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.350000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.018000,-1.535000,12.700000>}
box{<0,0,-0.152400><8.668000,0.035000,0.152400> rotate<0,0.000000,0> translate<7.350000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.350000,-1.535000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.018000,-1.535000,25.019000>}
box{<0,0,-0.152400><8.668000,0.035000,0.152400> rotate<0,0.000000,0> translate<7.350000,-1.535000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,13.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,21.606000>}
box{<0,0,-0.152400><7.906000,0.035000,0.152400> rotate<0,90.000000,0> translate<7.620000,0.000000,21.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,13.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.890000,0.000000,12.065000>}
box{<0,0,-0.152400><2.797521,0.035000,0.152400> rotate<0,35.761500,0> translate<7.620000,0.000000,13.700000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<7.620000,0.000000,21.606000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.255000,0.000000,22.733000>}
box{<0,0,-0.152400><1.985788,0.035000,0.152400> rotate<0,-34.576083,0> translate<7.620000,0.000000,21.606000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.255000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.510000,0.000000,22.733000>}
box{<0,0,-0.152400><6.255000,0.035000,0.152400> rotate<0,0.000000,0> translate<9.255000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<9.890000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.145000,0.000000,12.065000>}
box{<0,0,-0.152400><6.255000,0.035000,0.152400> rotate<0,0.000000,0> translate<9.890000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<15.510000,0.000000,22.733000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.145000,0.000000,21.098000>}
box{<0,0,-0.152400><2.312239,0.035000,0.152400> rotate<0,44.997030,0> translate<15.510000,0.000000,22.733000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.018000,-1.535000,12.700000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.653000,-1.535000,13.700000>}
box{<0,0,-0.152400><1.916566,0.035000,0.152400> rotate<0,-31.448747,0> translate<16.018000,-1.535000,12.700000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.018000,-1.535000,25.019000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.653000,-1.535000,23.384000>}
box{<0,0,-0.152400><2.312239,0.035000,0.152400> rotate<0,44.997030,0> translate<16.018000,-1.535000,25.019000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<16.145000,0.000000,12.065000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.145000,0.000000,13.065000>}
box{<0,0,-0.152400><1.414214,0.035000,0.152400> rotate<0,-44.997030,0> translate<16.145000,0.000000,12.065000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.145000,0.000000,21.098000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.145000,0.000000,13.065000>}
box{<0,0,-0.152400><8.033000,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.145000,0.000000,13.065000> }
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.653000,-1.535000,23.384000>}
cylinder{<0,0,0><0,0.035000,0>0.152400 translate<17.653000,-1.535000,13.700000>}
box{<0,0,-0.152400><9.684000,0.035000,0.152400> rotate<0,-90.000000,0> translate<17.653000,-1.535000,13.700000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<69.215000,-1.535000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<69.215000,-1.535000,0.635000>}
box{<0,0,-0.076200><52.070000,0.035000,0.076200> rotate<0,-90.000000,0> translate<69.215000,-1.535000,0.635000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<70.120000,0.000000,0.635000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<71.120000,0.000000,1.635000>}
box{<0,0,-0.076200><1.414214,0.035000,0.076200> rotate<0,-44.997030,0> translate<70.120000,0.000000,0.635000> }
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<71.120000,0.000000,52.705000>}
cylinder{<0,0,0><0,0.035000,0>0.076200 translate<71.120000,0.000000,1.635000>}
box{<0,0,-0.076200><51.070000,0.035000,0.076200> rotate<0,-90.000000,0> translate<71.120000,0.000000,1.635000> }
texture{col_pol}
}
#end
union{
cylinder{<8.686800,0.038000,3.302000><8.686800,-1.538000,3.302000>0.650000}
cylinder{<11.684000,0.038000,8.305800><11.684000,-1.538000,8.305800>0.650000}
cylinder{<5.689600,0.038000,8.305800><5.689600,-1.538000,8.305800>0.650000}
cylinder{<9.448800,0.038000,3.302000><9.448800,-1.538000,3.302000>0.650000}
cylinder{<7.924800,0.038000,3.302000><7.924800,-1.538000,3.302000>0.650000}
cylinder{<5.689600,0.038000,7.543800><5.689600,-1.538000,7.543800>0.650000}
cylinder{<5.689600,0.038000,9.067800><5.689600,-1.538000,9.067800>0.650000}
cylinder{<11.684000,0.038000,7.543800><11.684000,-1.538000,7.543800>0.650000}
cylinder{<11.684000,0.038000,9.067800><11.684000,-1.538000,9.067800>0.650000}
cylinder{<63.627000,0.038000,30.480000><63.627000,-1.538000,30.480000>0.475000}
cylinder{<66.167000,0.038000,30.480000><66.167000,-1.538000,30.480000>0.475000}
cylinder{<63.627000,0.038000,27.940000><63.627000,-1.538000,27.940000>0.475000}
cylinder{<66.167000,0.038000,27.940000><66.167000,-1.538000,27.940000>0.475000}
cylinder{<63.627000,0.038000,25.400000><63.627000,-1.538000,25.400000>0.475000}
cylinder{<66.167000,0.038000,25.400000><66.167000,-1.538000,25.400000>0.475000}
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<1.701800,0.038000,41.605200><1.701800,-1.538000,41.605200>0.350000 }
cylinder{<1.193800,0.038000,41.605200><1.193800,-1.538000,41.605200>0.350000 }
cylinder{<1.701800,0.038000,34.594800><1.701800,-1.538000,34.594800>0.350000 }
cylinder{<1.193800,0.038000,34.594800><1.193800,-1.538000,34.594800>0.350000 }
cylinder{<4.140200,0.038000,40.716200><4.140200,-1.538000,40.716200>0.350000 }
cylinder{<4.140200,0.038000,40.462200><4.140200,-1.538000,40.462200>0.350000 }
cylinder{<4.140200,0.038000,35.737800><4.140200,-1.538000,35.737800>0.350000 }
cylinder{<4.140200,0.038000,35.483800><4.140200,-1.538000,35.483800>0.350000 }
cylinder{<63.500000,0.038000,50.800000><63.500000,-1.538000,50.800000>0.425000}
cylinder{<60.960000,0.038000,50.800000><60.960000,-1.538000,50.800000>0.425000}
cylinder{<58.420000,0.038000,50.800000><58.420000,-1.538000,50.800000>0.425000}
cylinder{<55.880000,0.038000,50.800000><55.880000,-1.538000,50.800000>0.425000}
cylinder{<53.340000,0.038000,50.800000><53.340000,-1.538000,50.800000>0.425000}
cylinder{<50.800000,0.038000,50.800000><50.800000,-1.538000,50.800000>0.425000}
cylinder{<48.260000,0.038000,50.800000><48.260000,-1.538000,50.800000>0.425000}
cylinder{<45.720000,0.038000,50.800000><45.720000,-1.538000,50.800000>0.425000}
cylinder{<27.940000,0.038000,2.540000><27.940000,-1.538000,2.540000>0.425000}
cylinder{<30.480000,0.038000,2.540000><30.480000,-1.538000,2.540000>0.425000}
cylinder{<33.020000,0.038000,2.540000><33.020000,-1.538000,2.540000>0.425000}
cylinder{<35.560000,0.038000,2.540000><35.560000,-1.538000,2.540000>0.425000}
cylinder{<38.100000,0.038000,2.540000><38.100000,-1.538000,2.540000>0.425000}
cylinder{<40.640000,0.038000,2.540000><40.640000,-1.538000,2.540000>0.425000}
cylinder{<43.180000,0.038000,2.540000><43.180000,-1.538000,2.540000>0.425000}
cylinder{<45.720000,0.038000,2.540000><45.720000,-1.538000,2.540000>0.425000}
cylinder{<50.800000,0.038000,2.540000><50.800000,-1.538000,2.540000>0.425000}
cylinder{<53.340000,0.038000,2.540000><53.340000,-1.538000,2.540000>0.425000}
cylinder{<55.880000,0.038000,2.540000><55.880000,-1.538000,2.540000>0.425000}
cylinder{<58.420000,0.038000,2.540000><58.420000,-1.538000,2.540000>0.425000}
cylinder{<60.960000,0.038000,2.540000><60.960000,-1.538000,2.540000>0.425000}
cylinder{<63.500000,0.038000,2.540000><63.500000,-1.538000,2.540000>0.425000}
cylinder{<41.656000,0.038000,50.800000><41.656000,-1.538000,50.800000>0.425000}
cylinder{<39.116000,0.038000,50.800000><39.116000,-1.538000,50.800000>0.425000}
cylinder{<36.576000,0.038000,50.800000><36.576000,-1.538000,50.800000>0.425000}
cylinder{<34.036000,0.038000,50.800000><34.036000,-1.538000,50.800000>0.425000}
cylinder{<31.496000,0.038000,50.800000><31.496000,-1.538000,50.800000>0.425000}
cylinder{<28.956000,0.038000,50.800000><28.956000,-1.538000,50.800000>0.425000}
cylinder{<26.416000,0.038000,50.800000><26.416000,-1.538000,50.800000>0.425000}
cylinder{<23.876000,0.038000,50.800000><23.876000,-1.538000,50.800000>0.425000}
cylinder{<21.336000,0.038000,50.800000><21.336000,-1.538000,50.800000>0.425000}
cylinder{<18.796000,0.038000,50.800000><18.796000,-1.538000,50.800000>0.425000}
//Holes(fast)/Vias
cylinder{<27.686000,0.038000,19.939000><27.686000,-1.538000,19.939000>0.304800 }
cylinder{<27.305000,0.038000,13.335000><27.305000,-1.538000,13.335000>0.304800 }
cylinder{<17.780000,0.038000,32.131000><17.780000,-1.538000,32.131000>0.304800 }
cylinder{<8.890000,0.038000,21.590000><8.890000,-1.538000,21.590000>0.406400 }
cylinder{<14.605000,0.038000,13.335000><14.605000,-1.538000,13.335000>0.406400 }
cylinder{<10.795000,0.038000,21.590000><10.795000,-1.538000,21.590000>0.406400 }
cylinder{<12.700000,0.038000,21.590000><12.700000,-1.538000,21.590000>0.406400 }
cylinder{<14.605000,0.038000,21.590000><14.605000,-1.538000,21.590000>0.406400 }
cylinder{<15.875000,0.038000,17.145000><15.875000,-1.538000,17.145000>0.406400 }
cylinder{<8.890000,0.038000,13.335000><8.890000,-1.538000,13.335000>0.406400 }
cylinder{<10.795000,0.038000,13.335000><10.795000,-1.538000,13.335000>0.406400 }
cylinder{<12.700000,0.038000,13.335000><12.700000,-1.538000,13.335000>0.406400 }
cylinder{<22.987000,0.038000,32.385000><22.987000,-1.538000,32.385000>0.304800 }
cylinder{<19.090000,0.038000,36.830000><19.090000,-1.538000,36.830000>0.304800 }
cylinder{<55.245000,0.038000,29.845000><55.245000,-1.538000,29.845000>0.304800 }
cylinder{<62.230000,0.038000,6.350000><62.230000,-1.538000,6.350000>0.304800 }
cylinder{<41.910000,0.038000,9.525000><41.910000,-1.538000,9.525000>0.304800 }
cylinder{<57.150000,0.038000,11.785600><57.150000,-1.538000,11.785600>0.304800 }
cylinder{<21.336000,0.038000,24.130000><21.336000,-1.538000,24.130000>0.304800 }
cylinder{<55.880000,0.038000,9.525000><55.880000,-1.538000,9.525000>0.304800 }
cylinder{<50.393600,0.038000,12.700000><50.393600,-1.538000,12.700000>0.304800 }
cylinder{<40.513000,0.038000,22.860000><40.513000,-1.538000,22.860000>0.304800 }
cylinder{<54.102000,0.038000,24.511000><54.102000,-1.538000,24.511000>0.304800 }
cylinder{<63.500000,0.038000,18.415000><63.500000,-1.538000,18.415000>0.304800 }
cylinder{<63.500000,0.038000,13.335000><63.500000,-1.538000,13.335000>0.304800 }
cylinder{<43.815000,0.038000,27.940000><43.815000,-1.538000,27.940000>0.304800 }
cylinder{<42.545000,0.038000,26.035000><42.545000,-1.538000,26.035000>0.304800 }
cylinder{<21.590000,0.038000,42.545000><21.590000,-1.538000,42.545000>0.304800 }
cylinder{<27.940000,0.038000,30.480000><27.940000,-1.538000,30.480000>0.304800 }
cylinder{<41.910000,0.038000,30.480000><41.910000,-1.538000,30.480000>0.304800 }
cylinder{<18.415000,0.038000,42.545000><18.415000,-1.538000,42.545000>0.304800 }
cylinder{<28.194000,0.038000,32.385000><28.194000,-1.538000,32.385000>0.304800 }
cylinder{<41.910000,0.038000,33.020000><41.910000,-1.538000,33.020000>0.304800 }
cylinder{<40.640000,0.038000,27.940000><40.640000,-1.538000,27.940000>0.304800 }
cylinder{<31.115000,0.038000,26.670000><31.115000,-1.538000,26.670000>0.304800 }
cylinder{<38.100000,0.038000,27.940000><38.100000,-1.538000,27.940000>0.304800 }
cylinder{<36.830000,0.038000,26.670000><36.830000,-1.538000,26.670000>0.304800 }
cylinder{<53.975000,0.038000,11.430000><53.975000,-1.538000,11.430000>0.304800 }
cylinder{<37.465000,0.038000,17.145000><37.465000,-1.538000,17.145000>0.304800 }
cylinder{<41.783000,0.038000,11.303000><41.783000,-1.538000,11.303000>0.304800 }
cylinder{<48.895000,0.038000,14.605000><48.895000,-1.538000,14.605000>0.304800 }
cylinder{<60.096400,0.038000,12.141200><60.096400,-1.538000,12.141200>0.304800 }
cylinder{<41.783000,0.038000,23.749000><41.783000,-1.538000,23.749000>0.304800 }
cylinder{<56.515000,0.038000,24.511000><56.515000,-1.538000,24.511000>0.304800 }
cylinder{<24.257000,0.038000,39.624000><24.257000,-1.538000,39.624000>0.304800 }
cylinder{<33.020000,0.038000,11.430000><33.020000,-1.538000,11.430000>0.304800 }
cylinder{<29.972000,0.038000,13.081000><29.972000,-1.538000,13.081000>0.304800 }
cylinder{<41.910000,0.038000,7.620000><41.910000,-1.538000,7.620000>0.304800 }
cylinder{<66.040000,0.038000,13.335000><66.040000,-1.538000,13.335000>0.304800 }
cylinder{<66.040000,0.038000,18.415000><66.040000,-1.538000,18.415000>0.304800 }
cylinder{<48.260000,0.038000,2.540000><48.260000,-1.538000,2.540000>0.304800 }
cylinder{<43.688000,0.038000,50.800000><43.688000,-1.538000,50.800000>0.304800 }
cylinder{<32.639000,0.038000,22.352000><32.639000,-1.538000,22.352000>0.304800 }
cylinder{<4.445000,0.038000,42.545000><4.445000,-1.538000,42.545000>0.304800 }
cylinder{<4.445000,0.038000,33.655000><4.445000,-1.538000,33.655000>0.304800 }
cylinder{<25.908000,0.038000,2.540000><25.908000,-1.538000,2.540000>0.304800 }
cylinder{<1.143000,0.038000,40.259000><1.143000,-1.538000,40.259000>0.304800 }
cylinder{<1.143000,0.038000,35.941000><1.143000,-1.538000,35.941000>0.304800 }
cylinder{<2.540000,0.038000,38.100000><2.540000,-1.538000,38.100000>0.304800 }
cylinder{<1.143000,0.038000,42.926000><1.143000,-1.538000,42.926000>0.304800 }
cylinder{<1.016000,0.038000,33.274000><1.016000,-1.538000,33.274000>0.304800 }
cylinder{<64.770000,0.038000,40.640000><64.770000,-1.538000,40.640000>0.304800 }
cylinder{<35.560000,0.038000,27.940000><35.560000,-1.538000,27.940000>0.304800 }
cylinder{<34.290000,0.038000,26.670000><34.290000,-1.538000,26.670000>0.304800 }
cylinder{<33.020000,0.038000,27.940000><33.020000,-1.538000,27.940000>0.304800 }
cylinder{<52.070000,0.038000,22.225000><52.070000,-1.538000,22.225000>0.304800 }
cylinder{<38.735000,0.038000,25.400000><38.735000,-1.538000,25.400000>0.304800 }
cylinder{<30.480000,0.038000,31.750000><30.480000,-1.538000,31.750000>0.304800 }
cylinder{<33.020000,0.038000,31.750000><33.020000,-1.538000,31.750000>0.304800 }
cylinder{<29.210000,0.038000,27.940000><29.210000,-1.538000,27.940000>0.304800 }
cylinder{<21.844000,0.038000,34.417000><21.844000,-1.538000,34.417000>0.304800 }
cylinder{<17.780000,0.038000,30.607000><17.780000,-1.538000,30.607000>0.304800 }
cylinder{<9.525000,0.038000,29.210000><9.525000,-1.538000,29.210000>0.304800 }
cylinder{<55.880000,0.038000,21.590000><55.880000,-1.538000,21.590000>0.304800 }
cylinder{<14.605000,0.038000,36.195000><14.605000,-1.538000,36.195000>0.304800 }
cylinder{<59.055000,0.038000,14.859000><59.055000,-1.538000,14.859000>0.304800 }
cylinder{<14.605000,0.038000,38.100000><14.605000,-1.538000,38.100000>0.304800 }
cylinder{<59.055000,0.038000,13.335000><59.055000,-1.538000,13.335000>0.304800 }
cylinder{<1.905000,0.038000,49.530000><1.905000,-1.538000,49.530000>0.304800 }
cylinder{<60.833000,0.038000,9.271000><60.833000,-1.538000,9.271000>0.304800 }
cylinder{<29.210000,0.038000,14.605000><29.210000,-1.538000,14.605000>0.304800 }
cylinder{<1.905000,0.038000,30.480000><1.905000,-1.538000,30.480000>0.304800 }
cylinder{<60.833000,0.038000,10.795000><60.833000,-1.538000,10.795000>0.304800 }
cylinder{<1.905000,0.038000,28.575000><1.905000,-1.538000,28.575000>0.304800 }
cylinder{<23.495000,0.038000,24.130000><23.495000,-1.538000,24.130000>0.304800 }
cylinder{<10.160000,0.038000,33.655000><10.160000,-1.538000,33.655000>0.304800 }
cylinder{<59.055000,0.038000,16.510000><59.055000,-1.538000,16.510000>0.304800 }
cylinder{<19.685000,0.038000,20.701000><19.685000,-1.538000,20.701000>0.304800 }
cylinder{<24.130000,0.038000,11.430000><24.130000,-1.538000,11.430000>0.304800 }
cylinder{<59.055000,0.038000,19.685000><59.055000,-1.538000,19.685000>0.304800 }
cylinder{<17.780000,0.038000,40.005000><17.780000,-1.538000,40.005000>0.304800 }
//Holes(fast)/Board
texture{col_hls}
}
#if(pcb_silkscreen=on)
//Silk Screen
union{
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.540638,0.000000,5.245741>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.540638,0.000000,4.415300>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,-90.000000,0> translate<37.540638,0.000000,4.415300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.540638,0.000000,4.415300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.163469,0.000000,4.415300>}
box{<0,0,-0.088900><0.622831,0.036000,0.088900> rotate<0,0.000000,0> translate<37.540638,0.000000,4.415300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.163469,0.000000,4.415300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.955859,0.000000,4.830519>}
box{<0,0,-0.088900><0.464229,0.036000,0.088900> rotate<0,63.430762,0> translate<37.955859,0.000000,4.830519> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.955859,0.000000,4.830519>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.955859,0.000000,5.038131>}
box{<0,0,-0.088900><0.207612,0.036000,0.088900> rotate<0,90.000000,0> translate<37.955859,0.000000,5.038131> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.955859,0.000000,5.038131>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.163469,0.000000,5.245741>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,-44.997030,0> translate<37.955859,0.000000,5.038131> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.163469,0.000000,5.245741>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.578691,0.000000,5.245741>}
box{<0,0,-0.088900><0.415222,0.036000,0.088900> rotate<0,0.000000,0> translate<38.163469,0.000000,5.245741> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.578691,0.000000,5.245741>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.786300,0.000000,5.038131>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,44.997030,0> translate<38.578691,0.000000,5.245741> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.786300,0.000000,5.038131>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.786300,0.000000,4.622909>}
box{<0,0,-0.088900><0.415222,0.036000,0.088900> rotate<0,-90.000000,0> translate<38.786300,0.000000,4.622909> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.786300,0.000000,4.622909>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.578691,0.000000,4.415300>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,-44.997030,0> translate<38.578691,0.000000,4.415300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.540638,0.000000,5.725025>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.371081,0.000000,5.725025>}
box{<0,0,-0.088900><0.830444,0.036000,0.088900> rotate<0,0.000000,0> translate<37.540638,0.000000,5.725025> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.371081,0.000000,5.725025>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.786300,0.000000,6.140244>}
box{<0,0,-0.088900><0.587208,0.036000,0.088900> rotate<0,-44.997030,0> translate<38.371081,0.000000,5.725025> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.786300,0.000000,6.140244>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.371081,0.000000,6.555466>}
box{<0,0,-0.088900><0.587210,0.036000,0.088900> rotate<0,44.997246,0> translate<38.371081,0.000000,6.555466> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<38.371081,0.000000,6.555466>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<37.540638,0.000000,6.555466>}
box{<0,0,-0.088900><0.830444,0.036000,0.088900> rotate<0,0.000000,0> translate<37.540638,0.000000,6.555466> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.052100,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.052100,0.000000,4.986872>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,90.000000,0> translate<50.052100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.052100,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.348684,0.000000,5.283459>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.997332,0> translate<50.052100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.348684,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.645272,0.000000,4.986872>}
box{<0,0,-0.063500><0.419438,0.036000,0.063500> rotate<0,44.997030,0> translate<50.348684,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.645272,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.645272,0.000000,4.393700>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.645272,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.052100,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.645272,0.000000,4.838578>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<50.052100,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.987619,0.000000,4.541991>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.987619,0.000000,5.135166>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,90.000000,0> translate<50.987619,0.000000,5.135166> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.987619,0.000000,5.135166>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.135909,0.000000,5.283459>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<50.987619,0.000000,5.135166> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.135909,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.432497,0.000000,5.283459>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<51.135909,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.432497,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.580791,0.000000,5.135166>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<51.432497,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.580791,0.000000,5.135166>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.580791,0.000000,4.541991>}
box{<0,0,-0.063500><0.593175,0.036000,0.063500> rotate<0,-90.000000,0> translate<51.580791,0.000000,4.541991> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.580791,0.000000,4.541991>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.432497,0.000000,4.393700>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<51.432497,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.432497,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.135909,0.000000,4.393700>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<51.135909,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.135909,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.987619,0.000000,4.541991>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<50.987619,0.000000,4.541991> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.987619,0.000000,4.541991>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<51.580791,0.000000,5.135166>}
box{<0,0,-0.063500><0.838874,0.036000,0.063500> rotate<0,-44.997181,0> translate<50.987619,0.000000,4.541991> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.673000,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.673000,0.000000,7.172075>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,90.000000,0> translate<50.673000,0.000000,7.172075> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.673000,0.000000,7.172075>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.147538,0.000000,7.646616>}
box{<0,0,-0.127000><0.671100,0.036000,0.127000> rotate<0,-44.997219,0> translate<50.673000,0.000000,7.172075> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.147538,0.000000,7.646616>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.622075,0.000000,7.172075>}
box{<0,0,-0.127000><0.671100,0.036000,0.127000> rotate<0,44.997219,0> translate<51.147538,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.622075,0.000000,7.172075>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.622075,0.000000,6.223000>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,-90.000000,0> translate<51.622075,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<50.673000,0.000000,6.934806>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<51.622075,0.000000,6.934806>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,0.000000,0> translate<50.673000,0.000000,6.934806> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.216606,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.216606,0.000000,7.646616>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,90.000000,0> translate<52.216606,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<52.216606,0.000000,7.646616>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.165681,0.000000,6.223000>}
box{<0,0,-0.127000><1.710972,0.036000,0.127000> rotate<0,56.306274,0> translate<52.216606,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.165681,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.165681,0.000000,7.646616>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,90.000000,0> translate<53.165681,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.760213,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.760213,0.000000,7.172075>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,90.000000,0> translate<53.760213,0.000000,7.172075> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.760213,0.000000,7.172075>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.234750,0.000000,7.646616>}
box{<0,0,-0.127000><0.671100,0.036000,0.127000> rotate<0,-44.997219,0> translate<53.760213,0.000000,7.172075> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.234750,0.000000,7.646616>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.709288,0.000000,7.172075>}
box{<0,0,-0.127000><0.671100,0.036000,0.127000> rotate<0,44.997219,0> translate<54.234750,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.709288,0.000000,7.172075>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.709288,0.000000,6.223000>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,-90.000000,0> translate<54.709288,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<53.760213,0.000000,6.934806>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<54.709288,0.000000,6.934806>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,0.000000,0> translate<53.760213,0.000000,6.934806> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.303819,0.000000,7.646616>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.303819,0.000000,6.223000>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,-90.000000,0> translate<55.303819,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<55.303819,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.252894,0.000000,6.223000>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,0.000000,0> translate<55.303819,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.559231,0.000000,7.646616>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.084694,0.000000,7.646616>}
box{<0,0,-0.127000><0.474538,0.036000,0.127000> rotate<0,0.000000,0> translate<57.084694,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.084694,0.000000,7.646616>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.847425,0.000000,7.409347>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,-44.997030,0> translate<56.847425,0.000000,7.409347> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.847425,0.000000,7.409347>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.847425,0.000000,6.460269>}
box{<0,0,-0.127000><0.949078,0.036000,0.127000> rotate<0,-90.000000,0> translate<56.847425,0.000000,6.460269> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<56.847425,0.000000,6.460269>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.084694,0.000000,6.223000>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,44.997030,0> translate<56.847425,0.000000,6.460269> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.084694,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.559231,0.000000,6.223000>}
box{<0,0,-0.127000><0.474538,0.036000,0.127000> rotate<0,0.000000,0> translate<57.084694,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.559231,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.796500,0.000000,6.460269>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,-44.997030,0> translate<57.559231,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.796500,0.000000,6.460269>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.796500,0.000000,7.409347>}
box{<0,0,-0.127000><0.949078,0.036000,0.127000> rotate<0,90.000000,0> translate<57.796500,0.000000,7.409347> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.796500,0.000000,7.409347>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<57.559231,0.000000,7.646616>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,44.997030,0> translate<57.559231,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.340106,0.000000,7.409347>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.102837,0.000000,7.646616>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,44.997030,0> translate<59.102837,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.102837,0.000000,7.646616>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.628300,0.000000,7.646616>}
box{<0,0,-0.127000><0.474537,0.036000,0.127000> rotate<0,0.000000,0> translate<58.628300,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.628300,0.000000,7.646616>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.391031,0.000000,7.409347>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,-44.997030,0> translate<58.391031,0.000000,7.409347> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.391031,0.000000,7.409347>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.391031,0.000000,6.460269>}
box{<0,0,-0.127000><0.949078,0.036000,0.127000> rotate<0,-90.000000,0> translate<58.391031,0.000000,6.460269> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.391031,0.000000,6.460269>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.628300,0.000000,6.223000>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,44.997030,0> translate<58.391031,0.000000,6.460269> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.628300,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.102837,0.000000,6.223000>}
box{<0,0,-0.127000><0.474537,0.036000,0.127000> rotate<0,0.000000,0> translate<58.628300,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.102837,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.340106,0.000000,6.460269>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,-44.997030,0> translate<59.102837,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.340106,0.000000,6.460269>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.340106,0.000000,6.934806>}
box{<0,0,-0.127000><0.474538,0.036000,0.127000> rotate<0,90.000000,0> translate<59.340106,0.000000,6.934806> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<59.340106,0.000000,6.934806>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<58.865569,0.000000,6.934806>}
box{<0,0,-0.127000><0.474538,0.036000,0.127000> rotate<0,0.000000,0> translate<58.865569,0.000000,6.934806> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.478244,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.952781,0.000000,6.223000>}
box{<0,0,-0.127000><0.474537,0.036000,0.127000> rotate<0,0.000000,0> translate<61.478244,0.000000,6.223000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.715513,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.715513,0.000000,7.646616>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,90.000000,0> translate<61.715513,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.478244,0.000000,7.646616>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<61.952781,0.000000,7.646616>}
box{<0,0,-0.127000><0.474537,0.036000,0.127000> rotate<0,0.000000,0> translate<61.478244,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.507313,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.507313,0.000000,7.646616>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,90.000000,0> translate<62.507313,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<62.507313,0.000000,7.646616>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.456388,0.000000,6.223000>}
box{<0,0,-0.127000><1.710972,0.036000,0.127000> rotate<0,56.306274,0> translate<62.507313,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.456388,0.000000,6.223000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<63.456388,0.000000,7.646616>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,90.000000,0> translate<63.456388,0.000000,7.646616> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.279400,0.000000,45.964816>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.279400,0.000000,44.541200>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,-90.000000,0> translate<39.279400,0.000000,44.541200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.279400,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.991206,0.000000,44.541200>}
box{<0,0,-0.127000><0.711806,0.036000,0.127000> rotate<0,0.000000,0> translate<39.279400,0.000000,44.541200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.991206,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.228475,0.000000,44.778469>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,-44.997030,0> translate<39.991206,0.000000,44.541200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.228475,0.000000,44.778469>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.228475,0.000000,45.727547>}
box{<0,0,-0.127000><0.949078,0.036000,0.127000> rotate<0,90.000000,0> translate<40.228475,0.000000,45.727547> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.228475,0.000000,45.727547>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.991206,0.000000,45.964816>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,44.997030,0> translate<39.991206,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.991206,0.000000,45.964816>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.279400,0.000000,45.964816>}
box{<0,0,-0.127000><0.711806,0.036000,0.127000> rotate<0,0.000000,0> translate<39.279400,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.823006,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.297544,0.000000,44.541200>}
box{<0,0,-0.127000><0.474538,0.036000,0.127000> rotate<0,0.000000,0> translate<40.823006,0.000000,44.541200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.060275,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.060275,0.000000,45.964816>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,90.000000,0> translate<41.060275,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.823006,0.000000,45.964816>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.297544,0.000000,45.964816>}
box{<0,0,-0.127000><0.474538,0.036000,0.127000> rotate<0,0.000000,0> translate<40.823006,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.801150,0.000000,45.727547>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.563881,0.000000,45.964816>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,44.997030,0> translate<42.563881,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.563881,0.000000,45.964816>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.089344,0.000000,45.964816>}
box{<0,0,-0.127000><0.474537,0.036000,0.127000> rotate<0,0.000000,0> translate<42.089344,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.089344,0.000000,45.964816>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.852075,0.000000,45.727547>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,-44.997030,0> translate<41.852075,0.000000,45.727547> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.852075,0.000000,45.727547>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.852075,0.000000,44.778469>}
box{<0,0,-0.127000><0.949078,0.036000,0.127000> rotate<0,-90.000000,0> translate<41.852075,0.000000,44.778469> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.852075,0.000000,44.778469>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.089344,0.000000,44.541200>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,44.997030,0> translate<41.852075,0.000000,44.778469> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.089344,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.563881,0.000000,44.541200>}
box{<0,0,-0.127000><0.474537,0.036000,0.127000> rotate<0,0.000000,0> translate<42.089344,0.000000,44.541200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.563881,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.801150,0.000000,44.778469>}
box{<0,0,-0.127000><0.335549,0.036000,0.127000> rotate<0,-44.997030,0> translate<42.563881,0.000000,44.541200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.801150,0.000000,44.778469>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.801150,0.000000,45.253006>}
box{<0,0,-0.127000><0.474538,0.036000,0.127000> rotate<0,90.000000,0> translate<42.801150,0.000000,45.253006> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.801150,0.000000,45.253006>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.326613,0.000000,45.253006>}
box{<0,0,-0.127000><0.474537,0.036000,0.127000> rotate<0,0.000000,0> translate<42.326613,0.000000,45.253006> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.395681,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.870219,0.000000,44.541200>}
box{<0,0,-0.127000><0.474537,0.036000,0.127000> rotate<0,0.000000,0> translate<43.395681,0.000000,44.541200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.632950,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.632950,0.000000,45.964816>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,90.000000,0> translate<43.632950,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.395681,0.000000,45.964816>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.870219,0.000000,45.964816>}
box{<0,0,-0.127000><0.474537,0.036000,0.127000> rotate<0,0.000000,0> translate<43.395681,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.899287,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.899287,0.000000,45.964816>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,90.000000,0> translate<44.899287,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.424750,0.000000,45.964816>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.373825,0.000000,45.964816>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,0.000000,0> translate<44.424750,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.968356,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.968356,0.000000,45.490275>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,90.000000,0> translate<45.968356,0.000000,45.490275> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.968356,0.000000,45.490275>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.442894,0.000000,45.964816>}
box{<0,0,-0.127000><0.671100,0.036000,0.127000> rotate<0,-44.997219,0> translate<45.968356,0.000000,45.490275> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.442894,0.000000,45.964816>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.917431,0.000000,45.490275>}
box{<0,0,-0.127000><0.671100,0.036000,0.127000> rotate<0,44.997219,0> translate<46.442894,0.000000,45.964816> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.917431,0.000000,45.490275>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.917431,0.000000,44.541200>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,-90.000000,0> translate<46.917431,0.000000,44.541200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.968356,0.000000,45.253006>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<46.917431,0.000000,45.253006>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,0.000000,0> translate<45.968356,0.000000,45.253006> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.511963,0.000000,45.964816>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.511963,0.000000,44.541200>}
box{<0,0,-0.127000><1.423616,0.036000,0.127000> rotate<0,-90.000000,0> translate<47.511963,0.000000,44.541200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<47.511963,0.000000,44.541200>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<48.461038,0.000000,44.541200>}
box{<0,0,-0.127000><0.949075,0.036000,0.127000> rotate<0,0.000000,0> translate<47.511963,0.000000,44.541200> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.020000,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.020000,0.000000,40.785031>}
box{<0,0,-0.127000><1.288031,0.036000,0.127000> rotate<0,90.000000,0> translate<33.020000,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.020000,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.664016,0.000000,41.429050>}
box{<0,0,-0.127000><0.910778,0.036000,0.127000> rotate<0,-44.997169,0> translate<33.020000,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.664016,0.000000,41.429050>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.308031,0.000000,40.785031>}
box{<0,0,-0.127000><0.910778,0.036000,0.127000> rotate<0,44.997169,0> translate<33.664016,0.000000,41.429050> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.308031,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.308031,0.000000,39.497000>}
box{<0,0,-0.127000><1.288031,0.036000,0.127000> rotate<0,-90.000000,0> translate<34.308031,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<33.020000,0.000000,40.463025>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<34.308031,0.000000,40.463025>}
box{<0,0,-0.127000><1.288031,0.036000,0.127000> rotate<0,0.000000,0> translate<33.020000,0.000000,40.463025> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.031366,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.031366,0.000000,40.785031>}
box{<0,0,-0.127000><1.288031,0.036000,0.127000> rotate<0,90.000000,0> translate<35.031366,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.031366,0.000000,40.141016>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.675381,0.000000,40.785031>}
box{<0,0,-0.127000><0.910776,0.036000,0.127000> rotate<0,-44.997030,0> translate<35.031366,0.000000,40.141016> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.675381,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<35.997391,0.000000,40.785031>}
box{<0,0,-0.127000><0.322009,0.036000,0.127000> rotate<0,0.000000,0> translate<35.675381,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.995534,0.000000,41.429050>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.995534,0.000000,39.497000>}
box{<0,0,-0.127000><1.932050,0.036000,0.127000> rotate<0,-90.000000,0> translate<37.995534,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.995534,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.029509,0.000000,39.497000>}
box{<0,0,-0.127000><0.966025,0.036000,0.127000> rotate<0,0.000000,0> translate<37.029509,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.029509,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.707503,0.000000,39.819006>}
box{<0,0,-0.127000><0.455386,0.036000,0.127000> rotate<0,44.997030,0> translate<36.707503,0.000000,39.819006> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.707503,0.000000,39.819006>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.707503,0.000000,40.463025>}
box{<0,0,-0.127000><0.644019,0.036000,0.127000> rotate<0,90.000000,0> translate<36.707503,0.000000,40.463025> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<36.707503,0.000000,40.463025>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.029509,0.000000,40.785031>}
box{<0,0,-0.127000><0.455386,0.036000,0.127000> rotate<0,-44.997030,0> translate<36.707503,0.000000,40.463025> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.029509,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<37.995534,0.000000,40.785031>}
box{<0,0,-0.127000><0.966025,0.036000,0.127000> rotate<0,0.000000,0> translate<37.029509,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.718869,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.718869,0.000000,39.819006>}
box{<0,0,-0.127000><0.966025,0.036000,0.127000> rotate<0,-90.000000,0> translate<38.718869,0.000000,39.819006> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<38.718869,0.000000,39.819006>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.040875,0.000000,39.497000>}
box{<0,0,-0.127000><0.455386,0.036000,0.127000> rotate<0,44.997030,0> translate<38.718869,0.000000,39.819006> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<39.040875,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.006900,0.000000,39.497000>}
box{<0,0,-0.127000><0.966025,0.036000,0.127000> rotate<0,0.000000,0> translate<39.040875,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.006900,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.006900,0.000000,40.785031>}
box{<0,0,-0.127000><1.288031,0.036000,0.127000> rotate<0,90.000000,0> translate<40.006900,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.730234,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.052241,0.000000,40.785031>}
box{<0,0,-0.127000><0.322006,0.036000,0.127000> rotate<0,0.000000,0> translate<40.730234,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.052241,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.052241,0.000000,39.497000>}
box{<0,0,-0.127000><1.288031,0.036000,0.127000> rotate<0,-90.000000,0> translate<41.052241,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<40.730234,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.374250,0.000000,39.497000>}
box{<0,0,-0.127000><0.644016,0.036000,0.127000> rotate<0,0.000000,0> translate<40.730234,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.052241,0.000000,41.751059>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<41.052241,0.000000,41.429050>}
box{<0,0,-0.127000><0.322009,0.036000,0.127000> rotate<0,-90.000000,0> translate<41.052241,0.000000,41.429050> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.071144,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.071144,0.000000,40.785031>}
box{<0,0,-0.127000><1.288031,0.036000,0.127000> rotate<0,90.000000,0> translate<42.071144,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<42.071144,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.037169,0.000000,40.785031>}
box{<0,0,-0.127000><0.966025,0.036000,0.127000> rotate<0,0.000000,0> translate<42.071144,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.037169,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.359175,0.000000,40.463025>}
box{<0,0,-0.127000><0.455386,0.036000,0.127000> rotate<0,44.997030,0> translate<43.037169,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.359175,0.000000,40.463025>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<43.359175,0.000000,39.497000>}
box{<0,0,-0.127000><0.966025,0.036000,0.127000> rotate<0,-90.000000,0> translate<43.359175,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.404516,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.048534,0.000000,39.497000>}
box{<0,0,-0.127000><0.644019,0.036000,0.127000> rotate<0,0.000000,0> translate<44.404516,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.048534,0.000000,39.497000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.370541,0.000000,39.819006>}
box{<0,0,-0.127000><0.455386,0.036000,0.127000> rotate<0,-44.997030,0> translate<45.048534,0.000000,39.497000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.370541,0.000000,39.819006>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.370541,0.000000,40.463025>}
box{<0,0,-0.127000><0.644019,0.036000,0.127000> rotate<0,90.000000,0> translate<45.370541,0.000000,40.463025> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.370541,0.000000,40.463025>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.048534,0.000000,40.785031>}
box{<0,0,-0.127000><0.455386,0.036000,0.127000> rotate<0,44.997030,0> translate<45.048534,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<45.048534,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.404516,0.000000,40.785031>}
box{<0,0,-0.127000><0.644019,0.036000,0.127000> rotate<0,0.000000,0> translate<44.404516,0.000000,40.785031> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.404516,0.000000,40.785031>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.082509,0.000000,40.463025>}
box{<0,0,-0.127000><0.455386,0.036000,0.127000> rotate<0,-44.997030,0> translate<44.082509,0.000000,40.463025> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.082509,0.000000,40.463025>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.082509,0.000000,39.819006>}
box{<0,0,-0.127000><0.644019,0.036000,0.127000> rotate<0,-90.000000,0> translate<44.082509,0.000000,39.819006> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.082509,0.000000,39.819006>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<44.404516,0.000000,39.497000>}
box{<0,0,-0.127000><0.455386,0.036000,0.127000> rotate<0,44.997030,0> translate<44.082509,0.000000,39.819006> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.095400,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.095400,0.000000,35.207341>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,-90.000000,0> translate<30.095400,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.095400,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.341141,0.000000,34.961600>}
box{<0,0,-0.101600><0.347530,0.036000,0.101600> rotate<0,44.997030,0> translate<30.095400,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.341141,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.586884,0.000000,35.207341>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.996666,0> translate<30.341141,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.586884,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.832628,0.000000,34.961600>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,44.996666,0> translate<30.586884,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<30.832628,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.078372,0.000000,35.207341>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.996666,0> translate<30.832628,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.078372,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.078372,0.000000,35.944572>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,90.000000,0> translate<31.078372,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.639006,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.639006,0.000000,35.207341>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,-90.000000,0> translate<31.639006,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.639006,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.884747,0.000000,34.961600>}
box{<0,0,-0.101600><0.347530,0.036000,0.101600> rotate<0,44.997030,0> translate<31.639006,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<31.884747,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.130491,0.000000,35.207341>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.996666,0> translate<31.884747,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.130491,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.376234,0.000000,34.961600>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,44.996666,0> translate<32.130491,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.376234,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.621978,0.000000,35.207341>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.996666,0> translate<32.376234,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.621978,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<32.621978,0.000000,35.944572>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,90.000000,0> translate<32.621978,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.182613,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.182613,0.000000,35.207341>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,-90.000000,0> translate<33.182613,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.182613,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.428353,0.000000,34.961600>}
box{<0,0,-0.101600><0.347530,0.036000,0.101600> rotate<0,44.997030,0> translate<33.182613,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.428353,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.674097,0.000000,35.207341>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.996666,0> translate<33.428353,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.674097,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.919841,0.000000,34.961600>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,44.996666,0> translate<33.674097,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<33.919841,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.165584,0.000000,35.207341>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.996666,0> translate<33.919841,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.165584,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.165584,0.000000,35.944572>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,90.000000,0> translate<34.165584,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.726219,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.726219,0.000000,35.207341>}
box{<0,0,-0.101600><0.245741,0.036000,0.101600> rotate<0,90.000000,0> translate<34.726219,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.726219,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.971959,0.000000,35.207341>}
box{<0,0,-0.101600><0.245741,0.036000,0.101600> rotate<0,0.000000,0> translate<34.726219,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.971959,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.971959,0.000000,34.961600>}
box{<0,0,-0.101600><0.245741,0.036000,0.101600> rotate<0,-90.000000,0> translate<34.971959,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.971959,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<34.726219,0.000000,34.961600>}
box{<0,0,-0.101600><0.245741,0.036000,0.101600> rotate<0,0.000000,0> translate<34.726219,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.743763,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.235250,0.000000,35.944572>}
box{<0,0,-0.101600><0.491487,0.036000,0.101600> rotate<0,0.000000,0> translate<35.743763,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.235250,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.480994,0.000000,35.698828>}
box{<0,0,-0.101600><0.347534,0.036000,0.101600> rotate<0,44.997030,0> translate<36.235250,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.480994,0.000000,35.698828>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.480994,0.000000,34.961600>}
box{<0,0,-0.101600><0.737228,0.036000,0.101600> rotate<0,-90.000000,0> translate<36.480994,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.480994,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.743763,0.000000,34.961600>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,0.000000,0> translate<35.743763,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.743763,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.498022,0.000000,35.207341>}
box{<0,0,-0.101600><0.347530,0.036000,0.101600> rotate<0,44.997030,0> translate<35.498022,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.498022,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.743763,0.000000,35.453084>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.997394,0> translate<35.498022,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<35.743763,0.000000,35.453084>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<36.480994,0.000000,35.453084>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,0.000000,0> translate<35.743763,0.000000,35.453084> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.041628,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.041628,0.000000,35.944572>}
box{<0,0,-0.101600><0.982972,0.036000,0.101600> rotate<0,90.000000,0> translate<37.041628,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.041628,0.000000,35.453084>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.533113,0.000000,35.944572>}
box{<0,0,-0.101600><0.695066,0.036000,0.101600> rotate<0,-44.997212,0> translate<37.041628,0.000000,35.453084> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.533113,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<37.778856,0.000000,35.944572>}
box{<0,0,-0.101600><0.245744,0.036000,0.101600> rotate<0,0.000000,0> translate<37.533113,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.310938,0.000000,36.436059>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.310938,0.000000,34.961600>}
box{<0,0,-0.101600><1.474459,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.310938,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.310938,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.573706,0.000000,34.961600>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,0.000000,0> translate<38.573706,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.573706,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.327966,0.000000,35.207341>}
box{<0,0,-0.101600><0.347530,0.036000,0.101600> rotate<0,44.997030,0> translate<38.327966,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.327966,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.327966,0.000000,35.698828>}
box{<0,0,-0.101600><0.491487,0.036000,0.101600> rotate<0,90.000000,0> translate<38.327966,0.000000,35.698828> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.327966,0.000000,35.698828>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.573706,0.000000,35.944572>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.997394,0> translate<38.327966,0.000000,35.698828> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<38.573706,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.310938,0.000000,35.944572>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,0.000000,0> translate<38.573706,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.871572,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.871572,0.000000,35.207341>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,-90.000000,0> translate<39.871572,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<39.871572,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.117313,0.000000,34.961600>}
box{<0,0,-0.101600><0.347530,0.036000,0.101600> rotate<0,44.997030,0> translate<39.871572,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.117313,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.854544,0.000000,34.961600>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,0.000000,0> translate<40.117313,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.854544,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<40.854544,0.000000,35.944572>}
box{<0,0,-0.101600><0.982972,0.036000,0.101600> rotate<0,90.000000,0> translate<40.854544,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.415178,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.660919,0.000000,35.944572>}
box{<0,0,-0.101600><0.245741,0.036000,0.101600> rotate<0,0.000000,0> translate<41.415178,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.660919,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.660919,0.000000,34.961600>}
box{<0,0,-0.101600><0.982972,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.660919,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.415178,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.906663,0.000000,34.961600>}
box{<0,0,-0.101600><0.491484,0.036000,0.101600> rotate<0,0.000000,0> translate<41.415178,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.660919,0.000000,36.681803>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<41.660919,0.000000,36.436059>}
box{<0,0,-0.101600><0.245744,0.036000,0.101600> rotate<0,-90.000000,0> translate<41.660919,0.000000,36.436059> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.444247,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.444247,0.000000,35.944572>}
box{<0,0,-0.101600><0.982972,0.036000,0.101600> rotate<0,90.000000,0> translate<42.444247,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.444247,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.181475,0.000000,35.944572>}
box{<0,0,-0.101600><0.737228,0.036000,0.101600> rotate<0,0.000000,0> translate<42.444247,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.181475,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.427219,0.000000,35.698828>}
box{<0,0,-0.101600><0.347534,0.036000,0.101600> rotate<0,44.997030,0> translate<43.181475,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.427219,0.000000,35.698828>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.427219,0.000000,34.961600>}
box{<0,0,-0.101600><0.737228,0.036000,0.101600> rotate<0,-90.000000,0> translate<43.427219,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.233594,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.725081,0.000000,34.961600>}
box{<0,0,-0.101600><0.491487,0.036000,0.101600> rotate<0,0.000000,0> translate<44.233594,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.725081,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.970825,0.000000,35.207341>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.996666,0> translate<44.725081,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.970825,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.970825,0.000000,35.698828>}
box{<0,0,-0.101600><0.491487,0.036000,0.101600> rotate<0,90.000000,0> translate<44.970825,0.000000,35.698828> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.970825,0.000000,35.698828>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.725081,0.000000,35.944572>}
box{<0,0,-0.101600><0.347534,0.036000,0.101600> rotate<0,44.997030,0> translate<44.725081,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.725081,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.233594,0.000000,35.944572>}
box{<0,0,-0.101600><0.491487,0.036000,0.101600> rotate<0,0.000000,0> translate<44.233594,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.233594,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.987853,0.000000,35.698828>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.997394,0> translate<43.987853,0.000000,35.698828> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.987853,0.000000,35.698828>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.987853,0.000000,35.207341>}
box{<0,0,-0.101600><0.491487,0.036000,0.101600> rotate<0,-90.000000,0> translate<43.987853,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.987853,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<44.233594,0.000000,34.961600>}
box{<0,0,-0.101600><0.347530,0.036000,0.101600> rotate<0,44.997030,0> translate<43.987853,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.531459,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.531459,0.000000,35.207341>}
box{<0,0,-0.101600><0.245741,0.036000,0.101600> rotate<0,90.000000,0> translate<45.531459,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.531459,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.777200,0.000000,35.207341>}
box{<0,0,-0.101600><0.245741,0.036000,0.101600> rotate<0,0.000000,0> translate<45.531459,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.777200,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.777200,0.000000,34.961600>}
box{<0,0,-0.101600><0.245741,0.036000,0.101600> rotate<0,-90.000000,0> translate<45.777200,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.777200,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.531459,0.000000,34.961600>}
box{<0,0,-0.101600><0.245741,0.036000,0.101600> rotate<0,0.000000,0> translate<45.531459,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.286234,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.549003,0.000000,35.944572>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,0.000000,0> translate<46.549003,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.549003,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.303263,0.000000,35.698828>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.997394,0> translate<46.303263,0.000000,35.698828> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.303263,0.000000,35.698828>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.303263,0.000000,35.207341>}
box{<0,0,-0.101600><0.491487,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.303263,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.303263,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.549003,0.000000,34.961600>}
box{<0,0,-0.101600><0.347530,0.036000,0.101600> rotate<0,44.997030,0> translate<46.303263,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.549003,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.286234,0.000000,34.961600>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,0.000000,0> translate<46.549003,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.829841,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.092609,0.000000,35.944572>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,0.000000,0> translate<48.092609,0.000000,35.944572> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.092609,0.000000,35.944572>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.846869,0.000000,35.698828>}
box{<0,0,-0.101600><0.347532,0.036000,0.101600> rotate<0,-44.997394,0> translate<47.846869,0.000000,35.698828> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.846869,0.000000,35.698828>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.846869,0.000000,35.207341>}
box{<0,0,-0.101600><0.491487,0.036000,0.101600> rotate<0,-90.000000,0> translate<47.846869,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<47.846869,0.000000,35.207341>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.092609,0.000000,34.961600>}
box{<0,0,-0.101600><0.347530,0.036000,0.101600> rotate<0,44.997030,0> translate<47.846869,0.000000,35.207341> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.092609,0.000000,34.961600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<48.829841,0.000000,34.961600>}
box{<0,0,-0.101600><0.737231,0.036000,0.101600> rotate<0,0.000000,0> translate<48.092609,0.000000,34.961600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.405000,0.000000,44.259000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.557609,0.000000,44.259000>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,0.000000,0> translate<23.557609,0.000000,44.259000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.557609,0.000000,44.259000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,44.682694>}
box{<0,0,-0.076200><0.599193,0.036000,0.076200> rotate<0,44.997030,0> translate<23.133916,0.000000,44.682694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,44.682694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.557609,0.000000,45.106391>}
box{<0,0,-0.076200><0.599196,0.036000,0.076200> rotate<0,-44.997241,0> translate<23.133916,0.000000,44.682694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.557609,0.000000,45.106391>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.405000,0.000000,45.106391>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,0.000000,0> translate<23.557609,0.000000,45.106391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.769459,0.000000,44.259000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.769459,0.000000,45.106391>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,90.000000,0> translate<23.769459,0.000000,45.106391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.405000,0.000000,45.568725>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,45.568725>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<23.133916,0.000000,45.568725> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,45.568725>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,46.204266>}
box{<0,0,-0.076200><0.635541,0.036000,0.076200> rotate<0,90.000000,0> translate<23.133916,0.000000,46.204266> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,46.204266>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.345763,0.000000,46.416116>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<23.133916,0.000000,46.204266> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.345763,0.000000,46.416116>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.769459,0.000000,46.416116>}
box{<0,0,-0.076200><0.423697,0.036000,0.076200> rotate<0,0.000000,0> translate<23.345763,0.000000,46.416116> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.769459,0.000000,46.416116>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.981306,0.000000,46.204266>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,44.997453,0> translate<23.769459,0.000000,46.416116> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.981306,0.000000,46.204266>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.981306,0.000000,45.568725>}
box{<0,0,-0.076200><0.635541,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.981306,0.000000,45.568725> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.981306,0.000000,45.992419>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.405000,0.000000,46.416116>}
box{<0,0,-0.076200><0.599196,0.036000,0.076200> rotate<0,-44.997241,0> translate<23.981306,0.000000,45.992419> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,47.725841>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,46.878450>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,-90.000000,0> translate<23.133916,0.000000,46.878450> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,46.878450>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.405000,0.000000,46.878450>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<23.133916,0.000000,46.878450> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.405000,0.000000,46.878450>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.405000,0.000000,47.725841>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,90.000000,0> translate<24.405000,0.000000,47.725841> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.769459,0.000000,46.878450>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.769459,0.000000,47.302144>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<23.769459,0.000000,47.302144> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.405000,0.000000,48.188175>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,48.188175>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<23.133916,0.000000,48.188175> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,48.188175>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.133916,0.000000,49.035566>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,90.000000,0> translate<23.133916,0.000000,49.035566> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.769459,0.000000,48.188175>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.769459,0.000000,48.611869>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<23.769459,0.000000,48.611869> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.253000,0.000000,32.662806>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.608903,0.000000,33.018712>}
box{<0,0,-0.101600><0.503325,0.036000,0.101600> rotate<0,-44.997282,0> translate<63.253000,0.000000,32.662806> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.608903,0.000000,33.018712>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.608903,0.000000,31.951000>}
box{<0,0,-0.101600><1.067712,0.036000,0.101600> rotate<0,-90.000000,0> translate<63.608903,0.000000,31.951000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.253000,0.000000,31.951000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<63.964806,0.000000,31.951000>}
box{<0,0,-0.101600><0.711806,0.036000,0.101600> rotate<0,0.000000,0> translate<63.253000,0.000000,31.951000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.769563,0.000000,46.401791>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,46.189941>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<25.557716,0.000000,46.189941> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,46.189941>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,45.766247>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.557716,0.000000,45.766247> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,45.766247>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.769563,0.000000,45.554400>}
box{<0,0,-0.076200><0.299597,0.036000,0.076200> rotate<0,44.997030,0> translate<25.557716,0.000000,45.766247> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.769563,0.000000,45.554400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.616953,0.000000,45.554400>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,0.000000,0> translate<25.769563,0.000000,45.554400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.616953,0.000000,45.554400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,45.766247>}
box{<0,0,-0.076200><0.299597,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.616953,0.000000,45.554400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,45.766247>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,46.189941>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<26.828800,0.000000,46.189941> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,46.189941>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.616953,0.000000,46.401791>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,44.997453,0> translate<26.616953,0.000000,46.401791> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.616953,0.000000,46.401791>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.193259,0.000000,46.401791>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,0.000000,0> translate<26.193259,0.000000,46.401791> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.193259,0.000000,46.401791>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.193259,0.000000,45.978094>}
box{<0,0,-0.076200><0.423697,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.193259,0.000000,45.978094> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,46.864125>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,46.864125>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<25.557716,0.000000,46.864125> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,46.864125>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,47.711516>}
box{<0,0,-0.076200><1.527654,0.036000,0.076200> rotate<0,-33.687877,0> translate<25.557716,0.000000,46.864125> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,47.711516>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,47.711516>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<25.557716,0.000000,47.711516> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,48.173850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,48.173850>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<25.557716,0.000000,48.173850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,48.173850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,48.809391>}
box{<0,0,-0.076200><0.635541,0.036000,0.076200> rotate<0,90.000000,0> translate<26.828800,0.000000,48.809391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.828800,0.000000,48.809391>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.616953,0.000000,49.021241>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,44.997453,0> translate<26.616953,0.000000,49.021241> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.616953,0.000000,49.021241>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.769563,0.000000,49.021241>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,0.000000,0> translate<25.769563,0.000000,49.021241> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.769563,0.000000,49.021241>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,48.809391>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<25.557716,0.000000,48.809391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,48.809391>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.557716,0.000000,48.173850>}
box{<0,0,-0.076200><0.635541,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.557716,0.000000,48.173850> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.641400,0.000000,42.676094>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.370316,0.000000,42.676094>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<60.370316,0.000000,42.676094> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.370316,0.000000,42.252400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.370316,0.000000,43.099791>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,90.000000,0> translate<60.370316,0.000000,43.099791> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.370316,0.000000,43.562125>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.641400,0.000000,44.409516>}
box{<0,0,-0.076200><1.527654,0.036000,0.076200> rotate<0,-33.687877,0> translate<60.370316,0.000000,43.562125> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.370316,0.000000,44.409516>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.641400,0.000000,43.562125>}
box{<0,0,-0.076200><1.527654,0.036000,0.076200> rotate<0,33.687877,0> translate<60.370316,0.000000,44.409516> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.794009,0.000000,44.871850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.370316,0.000000,45.295544>}
box{<0,0,-0.076200><0.599193,0.036000,0.076200> rotate<0,44.997030,0> translate<60.370316,0.000000,45.295544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.370316,0.000000,45.295544>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.641400,0.000000,45.295544>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<60.370316,0.000000,45.295544> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.641400,0.000000,44.871850>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.641400,0.000000,45.719241>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,90.000000,0> translate<61.641400,0.000000,45.719241> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.185800,0.000000,42.240200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.914716,0.000000,42.240200>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<62.914716,0.000000,42.240200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.914716,0.000000,42.240200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.914716,0.000000,42.875741>}
box{<0,0,-0.076200><0.635541,0.036000,0.076200> rotate<0,90.000000,0> translate<62.914716,0.000000,42.875741> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.914716,0.000000,42.875741>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.126563,0.000000,43.087591>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<62.914716,0.000000,42.875741> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.126563,0.000000,43.087591>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.550259,0.000000,43.087591>}
box{<0,0,-0.076200><0.423697,0.036000,0.076200> rotate<0,0.000000,0> translate<63.126563,0.000000,43.087591> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.550259,0.000000,43.087591>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.762106,0.000000,42.875741>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,44.997453,0> translate<63.550259,0.000000,43.087591> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.762106,0.000000,42.875741>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.762106,0.000000,42.240200>}
box{<0,0,-0.076200><0.635541,0.036000,0.076200> rotate<0,-90.000000,0> translate<63.762106,0.000000,42.240200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.762106,0.000000,42.663894>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.185800,0.000000,43.087591>}
box{<0,0,-0.076200><0.599196,0.036000,0.076200> rotate<0,-44.997241,0> translate<63.762106,0.000000,42.663894> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.914716,0.000000,43.549925>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.185800,0.000000,44.397316>}
box{<0,0,-0.076200><1.527654,0.036000,0.076200> rotate<0,-33.687877,0> translate<62.914716,0.000000,43.549925> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.914716,0.000000,44.397316>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.185800,0.000000,43.549925>}
box{<0,0,-0.076200><1.527654,0.036000,0.076200> rotate<0,33.687877,0> translate<62.914716,0.000000,44.397316> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.338409,0.000000,44.859650>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.914716,0.000000,45.283344>}
box{<0,0,-0.076200><0.599193,0.036000,0.076200> rotate<0,44.997030,0> translate<62.914716,0.000000,45.283344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.914716,0.000000,45.283344>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.185800,0.000000,45.283344>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<62.914716,0.000000,45.283344> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.185800,0.000000,44.859650>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.185800,0.000000,45.707041>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,90.000000,0> translate<64.185800,0.000000,45.707041> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.657206,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.335200,0.000000,43.002200>}
box{<0,0,-0.076200><0.322006,0.036000,0.076200> rotate<0,0.000000,0> translate<40.335200,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.335200,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.335200,0.000000,43.968225>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,90.000000,0> translate<40.335200,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.335200,0.000000,43.968225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.657206,0.000000,43.968225>}
box{<0,0,-0.076200><0.322006,0.036000,0.076200> rotate<0,0.000000,0> translate<40.335200,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.182250,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.182250,0.000000,43.968225>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,90.000000,0> translate<41.182250,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.504259,0.000000,43.968225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.504259,0.000000,43.002200>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.504259,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021247,0.000000,43.646216>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.504259,0.000000,43.646216>}
box{<0,0,-0.076200><0.483013,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021247,0.000000,43.646216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.504259,0.000000,43.646216>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.665263,0.000000,43.646216>}
box{<0,0,-0.076200><0.161003,0.036000,0.076200> rotate<0,0.000000,0> translate<41.504259,0.000000,43.646216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021247,0.000000,43.324206>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.665263,0.000000,43.324206>}
box{<0,0,-0.076200><0.644016,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021247,0.000000,43.324206> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.050316,0.000000,43.324206>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.694331,0.000000,43.324206>}
box{<0,0,-0.076200><0.644016,0.036000,0.076200> rotate<0,0.000000,0> translate<42.050316,0.000000,43.324206> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.050316,0.000000,43.646216>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.694331,0.000000,43.646216>}
box{<0,0,-0.076200><0.644016,0.036000,0.076200> rotate<0,0.000000,0> translate<42.050316,0.000000,43.646216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.079384,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.079384,0.000000,43.968225>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,90.000000,0> translate<43.079384,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.079384,0.000000,43.968225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.562397,0.000000,43.968225>}
box{<0,0,-0.076200><0.483013,0.036000,0.076200> rotate<0,0.000000,0> translate<43.079384,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.562397,0.000000,43.968225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.723400,0.000000,43.807219>}
box{<0,0,-0.076200><0.227695,0.036000,0.076200> rotate<0,44.997586,0> translate<43.562397,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.723400,0.000000,43.807219>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.723400,0.000000,43.485213>}
box{<0,0,-0.076200><0.322006,0.036000,0.076200> rotate<0,-90.000000,0> translate<43.723400,0.000000,43.485213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.723400,0.000000,43.485213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.562397,0.000000,43.324206>}
box{<0,0,-0.076200><0.227695,0.036000,0.076200> rotate<0,-44.997586,0> translate<43.562397,0.000000,43.324206> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.562397,0.000000,43.324206>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.079384,0.000000,43.324206>}
box{<0,0,-0.076200><0.483013,0.036000,0.076200> rotate<0,0.000000,0> translate<43.079384,0.000000,43.324206> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.108453,0.000000,43.968225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.108453,0.000000,43.002200>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.108453,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.108453,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430459,0.000000,43.324206>}
box{<0,0,-0.076200><0.455386,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.108453,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.430459,0.000000,43.324206>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.752469,0.000000,43.002200>}
box{<0,0,-0.076200><0.455388,0.036000,0.076200> rotate<0,44.996752,0> translate<44.430459,0.000000,43.324206> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.752469,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.752469,0.000000,43.968225>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,90.000000,0> translate<44.752469,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.137522,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.137522,0.000000,43.968225>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,90.000000,0> translate<45.137522,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.137522,0.000000,43.968225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.459528,0.000000,43.646216>}
box{<0,0,-0.076200><0.455388,0.036000,0.076200> rotate<0,44.997308,0> translate<45.137522,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.459528,0.000000,43.646216>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.781537,0.000000,43.968225>}
box{<0,0,-0.076200><0.455390,0.036000,0.076200> rotate<0,-44.997030,0> translate<45.459528,0.000000,43.646216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.781537,0.000000,43.968225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.781537,0.000000,43.002200>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,-90.000000,0> translate<45.781537,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166591,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.488597,0.000000,43.002200>}
box{<0,0,-0.076200><0.322006,0.036000,0.076200> rotate<0,0.000000,0> translate<46.166591,0.000000,43.002200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.488597,0.000000,43.002200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.488597,0.000000,43.968225>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,90.000000,0> translate<46.488597,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.488597,0.000000,43.968225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.166591,0.000000,43.968225>}
box{<0,0,-0.076200><0.322006,0.036000,0.076200> rotate<0,0.000000,0> translate<46.166591,0.000000,43.968225> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<31.661100,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<31.661100,0.000000,36.995100>}
box{<0,0,-0.165100><1.855784,0.036000,0.165100> rotate<0,-90.000000,0> translate<31.661100,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<31.661100,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<32.898291,0.000000,36.995100>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,0.000000,0> translate<31.661100,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<34.909656,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<33.672466,0.000000,38.850884>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,0.000000,0> translate<33.672466,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<33.672466,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<33.672466,0.000000,36.995100>}
box{<0,0,-0.165100><1.855784,0.036000,0.165100> rotate<0,-90.000000,0> translate<33.672466,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<33.672466,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<34.909656,0.000000,36.995100>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,0.000000,0> translate<33.672466,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<33.672466,0.000000,37.922991>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<34.291059,0.000000,37.922991>}
box{<0,0,-0.165100><0.618594,0.036000,0.165100> rotate<0,0.000000,0> translate<33.672466,0.000000,37.922991> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<36.611722,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<35.993128,0.000000,38.850884>}
box{<0,0,-0.165100><0.618594,0.036000,0.165100> rotate<0,0.000000,0> translate<35.993128,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<35.993128,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<35.683831,0.000000,38.541587>}
box{<0,0,-0.165100><0.437412,0.036000,0.165100> rotate<0,-44.997030,0> translate<35.683831,0.000000,38.541587> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<35.683831,0.000000,38.541587>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<35.683831,0.000000,37.304397>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,-90.000000,0> translate<35.683831,0.000000,37.304397> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<35.683831,0.000000,37.304397>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<35.993128,0.000000,36.995100>}
box{<0,0,-0.165100><0.437412,0.036000,0.165100> rotate<0,44.997030,0> translate<35.683831,0.000000,37.304397> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<35.993128,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<36.611722,0.000000,36.995100>}
box{<0,0,-0.165100><0.618594,0.036000,0.165100> rotate<0,0.000000,0> translate<35.993128,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<36.611722,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<36.921022,0.000000,37.304397>}
box{<0,0,-0.165100><0.437414,0.036000,0.165100> rotate<0,-44.996741,0> translate<36.611722,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<36.921022,0.000000,37.304397>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<36.921022,0.000000,38.541587>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,90.000000,0> translate<36.921022,0.000000,38.541587> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<36.921022,0.000000,38.541587>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<36.611722,0.000000,38.850884>}
box{<0,0,-0.165100><0.437414,0.036000,0.165100> rotate<0,44.996741,0> translate<36.611722,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<37.695197,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<37.695197,0.000000,38.850884>}
box{<0,0,-0.165100><1.855784,0.036000,0.165100> rotate<0,90.000000,0> translate<37.695197,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<37.695197,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<38.932388,0.000000,36.995100>}
box{<0,0,-0.165100><2.230376,0.036000,0.165100> rotate<0,56.306194,0> translate<37.695197,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<38.932388,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<38.932388,0.000000,38.850884>}
box{<0,0,-0.165100><1.855784,0.036000,0.165100> rotate<0,90.000000,0> translate<38.932388,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<39.706563,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<39.706563,0.000000,38.232291>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,90.000000,0> translate<39.706563,0.000000,38.232291> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<39.706563,0.000000,38.232291>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<40.325156,0.000000,38.850884>}
box{<0,0,-0.165100><0.874824,0.036000,0.165100> rotate<0,-44.997030,0> translate<39.706563,0.000000,38.232291> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<40.325156,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<40.943753,0.000000,38.232291>}
box{<0,0,-0.165100><0.874826,0.036000,0.165100> rotate<0,44.996885,0> translate<40.325156,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<40.943753,0.000000,38.232291>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<40.943753,0.000000,36.995100>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,-90.000000,0> translate<40.943753,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<39.706563,0.000000,37.922991>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<40.943753,0.000000,37.922991>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,0.000000,0> translate<39.706563,0.000000,37.922991> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<41.717928,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<41.717928,0.000000,38.850884>}
box{<0,0,-0.165100><1.855784,0.036000,0.165100> rotate<0,90.000000,0> translate<41.717928,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<41.717928,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<42.645819,0.000000,38.850884>}
box{<0,0,-0.165100><0.927891,0.036000,0.165100> rotate<0,0.000000,0> translate<41.717928,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<42.645819,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<42.955119,0.000000,38.541587>}
box{<0,0,-0.165100><0.437414,0.036000,0.165100> rotate<0,44.996741,0> translate<42.645819,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<42.955119,0.000000,38.541587>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<42.955119,0.000000,37.922991>}
box{<0,0,-0.165100><0.618597,0.036000,0.165100> rotate<0,-90.000000,0> translate<42.955119,0.000000,37.922991> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<42.955119,0.000000,37.922991>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<42.645819,0.000000,37.613694>}
box{<0,0,-0.165100><0.437414,0.036000,0.165100> rotate<0,-44.996741,0> translate<42.645819,0.000000,37.613694> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<42.645819,0.000000,37.613694>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<41.717928,0.000000,37.613694>}
box{<0,0,-0.165100><0.927891,0.036000,0.165100> rotate<0,0.000000,0> translate<41.717928,0.000000,37.613694> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<42.336522,0.000000,37.613694>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<42.955119,0.000000,36.995100>}
box{<0,0,-0.165100><0.874826,0.036000,0.165100> rotate<0,44.996885,0> translate<42.336522,0.000000,37.613694> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<43.729294,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<43.729294,0.000000,36.995100>}
box{<0,0,-0.165100><1.855784,0.036000,0.165100> rotate<0,-90.000000,0> translate<43.729294,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<43.729294,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<44.657184,0.000000,36.995100>}
box{<0,0,-0.165100><0.927891,0.036000,0.165100> rotate<0,0.000000,0> translate<43.729294,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<44.657184,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<44.966484,0.000000,37.304397>}
box{<0,0,-0.165100><0.437414,0.036000,0.165100> rotate<0,-44.996741,0> translate<44.657184,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<44.966484,0.000000,37.304397>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<44.966484,0.000000,38.541587>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,90.000000,0> translate<44.966484,0.000000,38.541587> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<44.966484,0.000000,38.541587>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<44.657184,0.000000,38.850884>}
box{<0,0,-0.165100><0.437414,0.036000,0.165100> rotate<0,44.996741,0> translate<44.657184,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<44.657184,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<43.729294,0.000000,38.850884>}
box{<0,0,-0.165100><0.927891,0.036000,0.165100> rotate<0,0.000000,0> translate<43.729294,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.668550,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.049956,0.000000,38.850884>}
box{<0,0,-0.165100><0.618594,0.036000,0.165100> rotate<0,0.000000,0> translate<46.049956,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.049956,0.000000,38.850884>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<45.740659,0.000000,38.541587>}
box{<0,0,-0.165100><0.437412,0.036000,0.165100> rotate<0,-44.997030,0> translate<45.740659,0.000000,38.541587> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<45.740659,0.000000,38.541587>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<45.740659,0.000000,37.304397>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,-90.000000,0> translate<45.740659,0.000000,37.304397> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<45.740659,0.000000,37.304397>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.049956,0.000000,36.995100>}
box{<0,0,-0.165100><0.437412,0.036000,0.165100> rotate<0,44.997030,0> translate<45.740659,0.000000,37.304397> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.049956,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.668550,0.000000,36.995100>}
box{<0,0,-0.165100><0.618594,0.036000,0.165100> rotate<0,0.000000,0> translate<46.049956,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.668550,0.000000,36.995100>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.977850,0.000000,37.304397>}
box{<0,0,-0.165100><0.437414,0.036000,0.165100> rotate<0,-44.996741,0> translate<46.668550,0.000000,36.995100> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.977850,0.000000,37.304397>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.977850,0.000000,38.541587>}
box{<0,0,-0.165100><1.237191,0.036000,0.165100> rotate<0,90.000000,0> translate<46.977850,0.000000,38.541587> }
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.977850,0.000000,38.541587>}
cylinder{<0,0,0><0,0.036000,0>0.165100 translate<46.668550,0.000000,38.850884>}
box{<0,0,-0.165100><0.437414,0.036000,0.165100> rotate<0,44.996741,0> translate<46.668550,0.000000,38.850884> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.676000,0.000000,4.381000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,4.381000>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<32.404916,0.000000,4.381000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,4.381000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,5.016541>}
box{<0,0,-0.076200><0.635541,0.036000,0.076200> rotate<0,90.000000,0> translate<32.404916,0.000000,5.016541> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,5.016541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.616763,0.000000,5.228391>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<32.404916,0.000000,5.016541> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.616763,0.000000,5.228391>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.040459,0.000000,5.228391>}
box{<0,0,-0.076200><0.423697,0.036000,0.076200> rotate<0,0.000000,0> translate<32.616763,0.000000,5.228391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.040459,0.000000,5.228391>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.252306,0.000000,5.016541>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,44.997453,0> translate<33.040459,0.000000,5.228391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.252306,0.000000,5.016541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.252306,0.000000,4.381000>}
box{<0,0,-0.076200><0.635541,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.252306,0.000000,4.381000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.252306,0.000000,4.804694>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.676000,0.000000,5.228391>}
box{<0,0,-0.076200><0.599196,0.036000,0.076200> rotate<0,-44.997241,0> translate<33.252306,0.000000,4.804694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.616763,0.000000,6.538116>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,6.326266>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<32.404916,0.000000,6.326266> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,6.326266>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,5.902572>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,-90.000000,0> translate<32.404916,0.000000,5.902572> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,5.902572>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.616763,0.000000,5.690725>}
box{<0,0,-0.076200><0.299597,0.036000,0.076200> rotate<0,44.997030,0> translate<32.404916,0.000000,5.902572> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.616763,0.000000,5.690725>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.828609,0.000000,5.690725>}
box{<0,0,-0.076200><0.211847,0.036000,0.076200> rotate<0,0.000000,0> translate<32.616763,0.000000,5.690725> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.828609,0.000000,5.690725>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.040459,0.000000,5.902572>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.996608,0> translate<32.828609,0.000000,5.690725> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.040459,0.000000,5.902572>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.040459,0.000000,6.326266>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<33.040459,0.000000,6.326266> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.040459,0.000000,6.326266>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.252306,0.000000,6.538116>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<33.040459,0.000000,6.326266> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.252306,0.000000,6.538116>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.464153,0.000000,6.538116>}
box{<0,0,-0.076200><0.211847,0.036000,0.076200> rotate<0,0.000000,0> translate<33.252306,0.000000,6.538116> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.464153,0.000000,6.538116>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.676000,0.000000,6.326266>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,44.997453,0> translate<33.464153,0.000000,6.538116> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.676000,0.000000,6.326266>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.676000,0.000000,5.902572>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,-90.000000,0> translate<33.676000,0.000000,5.902572> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.676000,0.000000,5.902572>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.464153,0.000000,5.690725>}
box{<0,0,-0.076200><0.299597,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.464153,0.000000,5.690725> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.676000,0.000000,7.424144>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,7.424144>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<32.404916,0.000000,7.424144> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,7.000450>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.404916,0.000000,7.847841>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,90.000000,0> translate<32.404916,0.000000,7.847841> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.156762,0.000000,4.381000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.944916,0.000000,4.592847>}
box{<0,0,-0.076200><0.299597,0.036000,0.076200> rotate<0,44.997030,0> translate<34.944916,0.000000,4.592847> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.944916,0.000000,4.592847>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.944916,0.000000,5.016541>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<34.944916,0.000000,5.016541> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.944916,0.000000,5.016541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.156762,0.000000,5.228391>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<34.944916,0.000000,5.016541> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.156762,0.000000,5.228391>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.368609,0.000000,5.228391>}
box{<0,0,-0.076200><0.211847,0.036000,0.076200> rotate<0,0.000000,0> translate<35.156762,0.000000,5.228391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.368609,0.000000,5.228391>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.580459,0.000000,5.016541>}
box{<0,0,-0.076200><0.299601,0.036000,0.076200> rotate<0,44.997030,0> translate<35.368609,0.000000,5.228391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.580459,0.000000,5.016541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.580459,0.000000,4.804694>}
box{<0,0,-0.076200><0.211847,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.580459,0.000000,4.804694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.580459,0.000000,5.016541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792306,0.000000,5.228391>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<35.580459,0.000000,5.016541> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792306,0.000000,5.228391>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.004153,0.000000,5.228391>}
box{<0,0,-0.076200><0.211847,0.036000,0.076200> rotate<0,0.000000,0> translate<35.792306,0.000000,5.228391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.004153,0.000000,5.228391>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.216000,0.000000,5.016541>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,44.997453,0> translate<36.004153,0.000000,5.228391> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.216000,0.000000,5.016541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.216000,0.000000,4.592847>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.216000,0.000000,4.592847> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.216000,0.000000,4.592847>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.004153,0.000000,4.381000>}
box{<0,0,-0.076200><0.299597,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.004153,0.000000,4.381000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.944916,0.000000,5.690725>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792306,0.000000,5.690725>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,0.000000,0> translate<34.944916,0.000000,5.690725> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792306,0.000000,5.690725>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.216000,0.000000,6.114419>}
box{<0,0,-0.076200><0.599193,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.792306,0.000000,5.690725> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.216000,0.000000,6.114419>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792306,0.000000,6.538116>}
box{<0,0,-0.076200><0.599196,0.036000,0.076200> rotate<0,44.997241,0> translate<35.792306,0.000000,6.538116> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792306,0.000000,6.538116>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.944916,0.000000,6.538116>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,0.000000,0> translate<34.944916,0.000000,6.538116> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.156762,0.000000,7.000450>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.944916,0.000000,7.212297>}
box{<0,0,-0.076200><0.299597,0.036000,0.076200> rotate<0,44.997030,0> translate<34.944916,0.000000,7.212297> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.944916,0.000000,7.212297>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.944916,0.000000,7.635991>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<34.944916,0.000000,7.635991> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.944916,0.000000,7.635991>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.156762,0.000000,7.847841>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<34.944916,0.000000,7.635991> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.156762,0.000000,7.847841>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.368609,0.000000,7.847841>}
box{<0,0,-0.076200><0.211847,0.036000,0.076200> rotate<0,0.000000,0> translate<35.156762,0.000000,7.847841> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.368609,0.000000,7.847841>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.580459,0.000000,7.635991>}
box{<0,0,-0.076200><0.299601,0.036000,0.076200> rotate<0,44.997030,0> translate<35.368609,0.000000,7.847841> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.580459,0.000000,7.635991>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.580459,0.000000,7.424144>}
box{<0,0,-0.076200><0.211847,0.036000,0.076200> rotate<0,-90.000000,0> translate<35.580459,0.000000,7.424144> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.580459,0.000000,7.635991>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792306,0.000000,7.847841>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<35.580459,0.000000,7.635991> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.792306,0.000000,7.847841>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.004153,0.000000,7.847841>}
box{<0,0,-0.076200><0.211847,0.036000,0.076200> rotate<0,0.000000,0> translate<35.792306,0.000000,7.847841> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.004153,0.000000,7.847841>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.216000,0.000000,7.635991>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,44.997453,0> translate<36.004153,0.000000,7.847841> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.216000,0.000000,7.635991>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.216000,0.000000,7.212297>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.216000,0.000000,7.212297> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.216000,0.000000,7.212297>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.004153,0.000000,7.000450>}
box{<0,0,-0.076200><0.299597,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.004153,0.000000,7.000450> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.584763,0.000000,40.995600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.584763,0.000000,41.809094>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<45.584763,0.000000,41.809094> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.313600,0.000000,41.809094>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<45.855928,0.000000,41.809094>}
box{<0,0,-0.101600><0.542328,0.036000,0.101600> rotate<0,0.000000,0> translate<45.313600,0.000000,41.809094> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.249119,0.000000,40.995600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.249119,0.000000,41.809094>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,90.000000,0> translate<46.249119,0.000000,41.809094> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.249119,0.000000,41.809094>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.520281,0.000000,41.537928>}
box{<0,0,-0.101600><0.383484,0.036000,0.101600> rotate<0,44.997360,0> translate<46.249119,0.000000,41.809094> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.520281,0.000000,41.537928>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.791447,0.000000,41.809094>}
box{<0,0,-0.101600><0.383486,0.036000,0.101600> rotate<0,-44.997030,0> translate<46.520281,0.000000,41.537928> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.791447,0.000000,41.809094>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<46.791447,0.000000,40.995600>}
box{<0,0,-0.101600><0.813494,0.036000,0.101600> rotate<0,-90.000000,0> translate<46.791447,0.000000,40.995600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.592100,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.592100,0.000000,4.986872>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,90.000000,0> translate<52.592100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.592100,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.888684,0.000000,5.283459>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.997332,0> translate<52.592100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.888684,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.185272,0.000000,4.986872>}
box{<0,0,-0.063500><0.419438,0.036000,0.063500> rotate<0,44.997030,0> translate<52.888684,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.185272,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.185272,0.000000,4.393700>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,-90.000000,0> translate<53.185272,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<52.592100,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.185272,0.000000,4.838578>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<52.592100,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.527619,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.824203,0.000000,5.283459>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.997332,0> translate<53.527619,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.824203,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.824203,0.000000,4.393700>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,-90.000000,0> translate<53.824203,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<53.527619,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<54.120791,0.000000,4.393700>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<53.527619,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.132100,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.132100,0.000000,4.986872>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,90.000000,0> translate<55.132100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.132100,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.428684,0.000000,5.283459>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.997332,0> translate<55.132100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.428684,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.725272,0.000000,4.986872>}
box{<0,0,-0.063500><0.419438,0.036000,0.063500> rotate<0,44.997030,0> translate<55.428684,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.725272,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.725272,0.000000,4.393700>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,-90.000000,0> translate<55.725272,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.132100,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.725272,0.000000,4.838578>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<55.132100,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.660791,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.067619,0.000000,4.393700>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<56.067619,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.067619,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.660791,0.000000,4.986872>}
box{<0,0,-0.063500><0.838872,0.036000,0.063500> rotate<0,-44.997030,0> translate<56.067619,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.660791,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.660791,0.000000,5.135166>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,90.000000,0> translate<56.660791,0.000000,5.135166> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.660791,0.000000,5.135166>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.512497,0.000000,5.283459>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<56.512497,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.512497,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.215909,0.000000,5.283459>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<56.215909,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.215909,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<56.067619,0.000000,5.135166>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<56.067619,0.000000,5.135166> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.672100,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.672100,0.000000,4.986872>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,90.000000,0> translate<57.672100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.672100,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.968684,0.000000,5.283459>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.997332,0> translate<57.672100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.968684,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.265272,0.000000,4.986872>}
box{<0,0,-0.063500><0.419438,0.036000,0.063500> rotate<0,44.997030,0> translate<57.968684,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.265272,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.265272,0.000000,4.393700>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,-90.000000,0> translate<58.265272,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<57.672100,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.265272,0.000000,4.838578>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<57.672100,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.607619,0.000000,5.135166>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.755909,0.000000,5.283459>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.997634,0> translate<58.607619,0.000000,5.135166> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.755909,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.052497,0.000000,5.283459>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<58.755909,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.052497,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.200791,0.000000,5.135166>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<59.052497,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.200791,0.000000,5.135166>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.200791,0.000000,4.986872>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<59.200791,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.200791,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.052497,0.000000,4.838578>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,-44.997030,0> translate<59.052497,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.052497,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.904203,0.000000,4.838578>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<58.904203,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.052497,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.200791,0.000000,4.690284>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<59.052497,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.200791,0.000000,4.690284>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.200791,0.000000,4.541991>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,-90.000000,0> translate<59.200791,0.000000,4.541991> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.200791,0.000000,4.541991>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.052497,0.000000,4.393700>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<59.052497,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<59.052497,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.755909,0.000000,4.393700>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<58.755909,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.755909,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<58.607619,0.000000,4.541991>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<58.607619,0.000000,4.541991> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.212100,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.212100,0.000000,4.986872>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,90.000000,0> translate<60.212100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.212100,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.508684,0.000000,5.283459>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.997332,0> translate<60.212100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.508684,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.805272,0.000000,4.986872>}
box{<0,0,-0.063500><0.419438,0.036000,0.063500> rotate<0,44.997030,0> translate<60.508684,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.805272,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.805272,0.000000,4.393700>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,-90.000000,0> translate<60.805272,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.212100,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<60.805272,0.000000,4.838578>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<60.212100,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.592497,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.592497,0.000000,5.283459>}
box{<0,0,-0.063500><0.889759,0.036000,0.063500> rotate<0,90.000000,0> translate<61.592497,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.592497,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.147619,0.000000,4.838578>}
box{<0,0,-0.063500><0.629155,0.036000,0.063500> rotate<0,-44.997231,0> translate<61.147619,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.147619,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<61.740791,0.000000,4.838578>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<61.147619,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.752100,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.752100,0.000000,4.986872>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,90.000000,0> translate<62.752100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.752100,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.048684,0.000000,5.283459>}
box{<0,0,-0.063500><0.419436,0.036000,0.063500> rotate<0,-44.997332,0> translate<62.752100,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.048684,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.345272,0.000000,4.986872>}
box{<0,0,-0.063500><0.419438,0.036000,0.063500> rotate<0,44.997030,0> translate<63.048684,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.345272,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.345272,0.000000,4.393700>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.345272,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<62.752100,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.345272,0.000000,4.838578>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<62.752100,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.280791,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.687619,0.000000,5.283459>}
box{<0,0,-0.063500><0.593172,0.036000,0.063500> rotate<0,0.000000,0> translate<63.687619,0.000000,5.283459> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.687619,0.000000,5.283459>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.687619,0.000000,4.838578>}
box{<0,0,-0.063500><0.444881,0.036000,0.063500> rotate<0,-90.000000,0> translate<63.687619,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.687619,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.984203,0.000000,4.986872>}
box{<0,0,-0.063500><0.331592,0.036000,0.063500> rotate<0,-26.563539,0> translate<63.687619,0.000000,4.838578> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.984203,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.132497,0.000000,4.986872>}
box{<0,0,-0.063500><0.148294,0.036000,0.063500> rotate<0,0.000000,0> translate<63.984203,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.132497,0.000000,4.986872>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.280791,0.000000,4.838578>}
box{<0,0,-0.063500><0.209719,0.036000,0.063500> rotate<0,44.997030,0> translate<64.132497,0.000000,4.986872> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.280791,0.000000,4.838578>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.280791,0.000000,4.541991>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,-90.000000,0> translate<64.280791,0.000000,4.541991> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.280791,0.000000,4.541991>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.132497,0.000000,4.393700>}
box{<0,0,-0.063500><0.209717,0.036000,0.063500> rotate<0,-44.996427,0> translate<64.132497,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<64.132497,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.835909,0.000000,4.393700>}
box{<0,0,-0.063500><0.296588,0.036000,0.063500> rotate<0,0.000000,0> translate<63.835909,0.000000,4.393700> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.835909,0.000000,4.393700>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<63.687619,0.000000,4.541991>}
box{<0,0,-0.063500><0.209715,0.036000,0.063500> rotate<0,44.997030,0> translate<63.687619,0.000000,4.541991> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.160637,0.000000,4.415300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.991081,0.000000,4.415300>}
box{<0,0,-0.088900><0.830444,0.036000,0.088900> rotate<0,0.000000,0> translate<45.160637,0.000000,4.415300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.991081,0.000000,4.415300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.406300,0.000000,4.830519>}
box{<0,0,-0.088900><0.587208,0.036000,0.088900> rotate<0,-44.997030,0> translate<45.991081,0.000000,4.415300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.406300,0.000000,4.830519>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.991081,0.000000,5.245741>}
box{<0,0,-0.088900><0.587210,0.036000,0.088900> rotate<0,44.997246,0> translate<45.991081,0.000000,5.245741> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.991081,0.000000,5.245741>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.160637,0.000000,5.245741>}
box{<0,0,-0.088900><0.830444,0.036000,0.088900> rotate<0,0.000000,0> translate<45.160637,0.000000,5.245741> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.406300,0.000000,5.725025>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.406300,0.000000,6.140244>}
box{<0,0,-0.088900><0.415219,0.036000,0.088900> rotate<0,90.000000,0> translate<46.406300,0.000000,6.140244> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.406300,0.000000,5.932634>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.160637,0.000000,5.932634>}
box{<0,0,-0.088900><1.245663,0.036000,0.088900> rotate<0,0.000000,0> translate<45.160637,0.000000,5.932634> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.160637,0.000000,5.725025>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.160637,0.000000,6.140244>}
box{<0,0,-0.088900><0.415219,0.036000,0.088900> rotate<0,90.000000,0> translate<45.160637,0.000000,6.140244> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.406300,0.000000,6.598175>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.160637,0.000000,6.598175>}
box{<0,0,-0.088900><1.245663,0.036000,0.088900> rotate<0,0.000000,0> translate<45.160637,0.000000,6.598175> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.160637,0.000000,6.598175>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.406300,0.000000,7.428616>}
box{<0,0,-0.088900><1.497099,0.036000,0.088900> rotate<0,-33.687811,0> translate<45.160637,0.000000,6.598175> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.406300,0.000000,7.428616>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<45.160637,0.000000,7.428616>}
box{<0,0,-0.088900><1.245663,0.036000,0.088900> rotate<0,0.000000,0> translate<45.160637,0.000000,7.428616> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.288247,0.000000,5.245741>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,5.038131>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,-44.997030,0> translate<40.080638,0.000000,5.038131> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,5.038131>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,4.622909>}
box{<0,0,-0.088900><0.415222,0.036000,0.088900> rotate<0,-90.000000,0> translate<40.080638,0.000000,4.622909> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,4.622909>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.288247,0.000000,4.415300>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,44.997030,0> translate<40.080638,0.000000,4.622909> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.288247,0.000000,4.415300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.118691,0.000000,4.415300>}
box{<0,0,-0.088900><0.830444,0.036000,0.088900> rotate<0,0.000000,0> translate<40.288247,0.000000,4.415300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.118691,0.000000,4.415300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,4.622909>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,-44.997030,0> translate<41.118691,0.000000,4.415300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,4.622909>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,5.038131>}
box{<0,0,-0.088900><0.415222,0.036000,0.088900> rotate<0,90.000000,0> translate<41.326300,0.000000,5.038131> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,5.038131>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.118691,0.000000,5.245741>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,44.997030,0> translate<41.118691,0.000000,5.245741> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.118691,0.000000,5.245741>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.703469,0.000000,5.245741>}
box{<0,0,-0.088900><0.415222,0.036000,0.088900> rotate<0,0.000000,0> translate<40.703469,0.000000,5.245741> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.703469,0.000000,5.245741>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.703469,0.000000,4.830519>}
box{<0,0,-0.088900><0.415222,0.036000,0.088900> rotate<0,-90.000000,0> translate<40.703469,0.000000,4.830519> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,5.725025>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,5.725025>}
box{<0,0,-0.088900><1.245663,0.036000,0.088900> rotate<0,0.000000,0> translate<40.080638,0.000000,5.725025> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,5.725025>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,6.555466>}
box{<0,0,-0.088900><1.497099,0.036000,0.088900> rotate<0,-33.687811,0> translate<40.080638,0.000000,5.725025> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,6.555466>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,6.555466>}
box{<0,0,-0.088900><1.245663,0.036000,0.088900> rotate<0,0.000000,0> translate<40.080638,0.000000,6.555466> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,7.034750>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,7.034750>}
box{<0,0,-0.088900><1.245663,0.036000,0.088900> rotate<0,0.000000,0> translate<40.080638,0.000000,7.034750> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,7.034750>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,7.657581>}
box{<0,0,-0.088900><0.622831,0.036000,0.088900> rotate<0,90.000000,0> translate<41.326300,0.000000,7.657581> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.326300,0.000000,7.657581>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.118691,0.000000,7.865191>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,44.997030,0> translate<41.118691,0.000000,7.865191> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<41.118691,0.000000,7.865191>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.288247,0.000000,7.865191>}
box{<0,0,-0.088900><0.830444,0.036000,0.088900> rotate<0,0.000000,0> translate<40.288247,0.000000,7.865191> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.288247,0.000000,7.865191>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,7.657581>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,-44.997030,0> translate<40.080638,0.000000,7.657581> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,7.657581>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<40.080638,0.000000,7.034750>}
box{<0,0,-0.088900><0.622831,0.036000,0.088900> rotate<0,-90.000000,0> translate<40.080638,0.000000,7.034750> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.642097,0.000000,46.759403>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.269247,0.000000,47.132253>}
box{<0,0,-0.076200><0.527290,0.036000,0.076200> rotate<0,44.997030,0> translate<28.269247,0.000000,47.132253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.269247,0.000000,47.132253>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.387800,0.000000,47.132253>}
box{<0,0,-0.076200><1.118553,0.036000,0.076200> rotate<0,0.000000,0> translate<28.269247,0.000000,47.132253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.387800,0.000000,46.759403>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.387800,0.000000,47.505106>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,90.000000,0> translate<29.387800,0.000000,47.505106> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.455672,0.000000,47.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.269247,0.000000,48.115225>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,44.997030,0> translate<28.269247,0.000000,48.115225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.269247,0.000000,48.115225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.269247,0.000000,48.488075>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,90.000000,0> translate<28.269247,0.000000,48.488075> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.269247,0.000000,48.488075>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.455672,0.000000,48.674503>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<28.269247,0.000000,48.488075> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.455672,0.000000,48.674503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.642097,0.000000,48.674503>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<28.455672,0.000000,48.674503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.642097,0.000000,48.674503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.828525,0.000000,48.488075>}
box{<0,0,-0.076200><0.263649,0.036000,0.076200> rotate<0,44.997030,0> translate<28.642097,0.000000,48.674503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.828525,0.000000,48.488075>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.828525,0.000000,48.301650>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,-90.000000,0> translate<28.828525,0.000000,48.301650> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.828525,0.000000,48.488075>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.014950,0.000000,48.674503>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<28.828525,0.000000,48.488075> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.014950,0.000000,48.674503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.201375,0.000000,48.674503>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<29.014950,0.000000,48.674503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.201375,0.000000,48.674503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.387800,0.000000,48.488075>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,44.997510,0> translate<29.201375,0.000000,48.674503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.387800,0.000000,48.488075>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.387800,0.000000,48.115225>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.387800,0.000000,48.115225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.387800,0.000000,48.115225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.201375,0.000000,47.928800>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.201375,0.000000,47.928800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.182097,0.000000,46.759403>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.809247,0.000000,47.132253>}
box{<0,0,-0.076200><0.527290,0.036000,0.076200> rotate<0,44.997030,0> translate<30.809247,0.000000,47.132253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.809247,0.000000,47.132253>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.927800,0.000000,47.132253>}
box{<0,0,-0.076200><1.118553,0.036000,0.076200> rotate<0,0.000000,0> translate<30.809247,0.000000,47.132253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.927800,0.000000,46.759403>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.927800,0.000000,47.505106>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,90.000000,0> translate<31.927800,0.000000,47.505106> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.927800,0.000000,48.674503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.927800,0.000000,47.928800>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.927800,0.000000,47.928800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.927800,0.000000,47.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.182097,0.000000,48.674503>}
box{<0,0,-0.076200><1.054583,0.036000,0.076200> rotate<0,44.997030,0> translate<31.182097,0.000000,48.674503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.182097,0.000000,48.674503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.995672,0.000000,48.674503>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<30.995672,0.000000,48.674503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.995672,0.000000,48.674503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.809247,0.000000,48.488075>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<30.809247,0.000000,48.488075> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.809247,0.000000,48.488075>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.809247,0.000000,48.115225>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.809247,0.000000,48.115225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.809247,0.000000,48.115225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.995672,0.000000,47.928800>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,44.997030,0> translate<30.809247,0.000000,48.115225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.722097,0.000000,46.759403>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.349247,0.000000,47.132253>}
box{<0,0,-0.076200><0.527290,0.036000,0.076200> rotate<0,44.997030,0> translate<33.349247,0.000000,47.132253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.349247,0.000000,47.132253>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.467800,0.000000,47.132253>}
box{<0,0,-0.076200><1.118553,0.036000,0.076200> rotate<0,0.000000,0> translate<33.349247,0.000000,47.132253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.467800,0.000000,46.759403>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.467800,0.000000,47.505106>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,90.000000,0> translate<34.467800,0.000000,47.505106> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.722097,0.000000,47.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.349247,0.000000,48.301650>}
box{<0,0,-0.076200><0.527290,0.036000,0.076200> rotate<0,44.997030,0> translate<33.349247,0.000000,48.301650> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.349247,0.000000,48.301650>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.467800,0.000000,48.301650>}
box{<0,0,-0.076200><1.118553,0.036000,0.076200> rotate<0,0.000000,0> translate<33.349247,0.000000,48.301650> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.467800,0.000000,47.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.467800,0.000000,48.674503>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,90.000000,0> translate<34.467800,0.000000,48.674503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.262097,0.000000,46.759403>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.889247,0.000000,47.132253>}
box{<0,0,-0.076200><0.527290,0.036000,0.076200> rotate<0,44.997030,0> translate<35.889247,0.000000,47.132253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.889247,0.000000,47.132253>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.007800,0.000000,47.132253>}
box{<0,0,-0.076200><1.118553,0.036000,0.076200> rotate<0,0.000000,0> translate<35.889247,0.000000,47.132253> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.007800,0.000000,46.759403>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.007800,0.000000,47.505106>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,90.000000,0> translate<37.007800,0.000000,47.505106> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.821375,0.000000,47.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.075672,0.000000,47.928800>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,0.000000,0> translate<36.075672,0.000000,47.928800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.075672,0.000000,47.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.889247,0.000000,48.115225>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,44.997030,0> translate<35.889247,0.000000,48.115225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.889247,0.000000,48.115225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.889247,0.000000,48.488075>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,90.000000,0> translate<35.889247,0.000000,48.488075> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.889247,0.000000,48.488075>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.075672,0.000000,48.674503>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<35.889247,0.000000,48.488075> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.075672,0.000000,48.674503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.821375,0.000000,48.674503>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,0.000000,0> translate<36.075672,0.000000,48.674503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.821375,0.000000,48.674503>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.007800,0.000000,48.488075>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,44.997510,0> translate<36.821375,0.000000,48.674503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.007800,0.000000,48.488075>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.007800,0.000000,48.115225>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,-90.000000,0> translate<37.007800,0.000000,48.115225> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.007800,0.000000,48.115225>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.821375,0.000000,47.928800>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.821375,0.000000,47.928800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.821375,0.000000,47.928800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.075672,0.000000,48.674503>}
box{<0,0,-0.076200><1.054583,0.036000,0.076200> rotate<0,44.997030,0> translate<36.075672,0.000000,48.674503> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.361375,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,48.115228>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.361375,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,48.488078>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,90.000000,0> translate<39.547800,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.361375,0.000000,48.674506>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,44.997510,0> translate<39.361375,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.361375,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.615672,0.000000,48.674506>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,0.000000,0> translate<38.615672,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.615672,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.429247,0.000000,48.488078>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<38.429247,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.429247,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.429247,0.000000,48.115228>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,-90.000000,0> translate<38.429247,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.429247,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.615672,0.000000,47.928803>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,44.997030,0> translate<38.429247,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.615672,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.802097,0.000000,47.928803>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<38.615672,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.802097,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.988525,0.000000,48.115228>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.996550,0> translate<38.802097,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.988525,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.988525,0.000000,48.674506>}
box{<0,0,-0.076200><0.559278,0.036000,0.076200> rotate<0,90.000000,0> translate<38.988525,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.155672,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.969247,0.000000,48.115228>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,44.997030,0> translate<40.969247,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.969247,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.969247,0.000000,48.488078>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,90.000000,0> translate<40.969247,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.969247,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.155672,0.000000,48.674506>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<40.969247,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.155672,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.342097,0.000000,48.674506>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<41.155672,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.342097,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.528525,0.000000,48.488078>}
box{<0,0,-0.076200><0.263649,0.036000,0.076200> rotate<0,44.997030,0> translate<41.342097,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.528525,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.714950,0.000000,48.674506>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<41.528525,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.714950,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.901375,0.000000,48.674506>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<41.714950,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.901375,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.087800,0.000000,48.488078>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,44.997510,0> translate<41.901375,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.087800,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.087800,0.000000,48.115228>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,-90.000000,0> translate<42.087800,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.087800,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.901375,0.000000,47.928803>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.901375,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.901375,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.714950,0.000000,47.928803>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<41.714950,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.714950,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.528525,0.000000,48.115228>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,44.997030,0> translate<41.528525,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.528525,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.342097,0.000000,47.928803>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.996550,0> translate<41.342097,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.342097,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.155672,0.000000,47.928803>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<41.155672,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.528525,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.528525,0.000000,48.488078>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,90.000000,0> translate<41.528525,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.033247,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.033247,0.000000,48.674506>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,90.000000,0> translate<45.033247,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.033247,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.219672,0.000000,48.674506>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<45.033247,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.219672,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.965375,0.000000,47.928803>}
box{<0,0,-0.076200><1.054583,0.036000,0.076200> rotate<0,44.997030,0> translate<45.219672,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.965375,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.151800,0.000000,47.928803>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<45.965375,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.573247,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.759672,0.000000,48.301653>}
box{<0,0,-0.076200><0.416862,0.036000,0.076200> rotate<0,63.430954,0> translate<47.573247,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.759672,0.000000,48.301653>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.132525,0.000000,47.928803>}
box{<0,0,-0.076200><0.527292,0.036000,0.076200> rotate<0,44.996790,0> translate<47.759672,0.000000,48.301653> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.132525,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.505375,0.000000,47.928803>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,0.000000,0> translate<48.132525,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.505375,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.691800,0.000000,48.115228>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.505375,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.691800,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.691800,0.000000,48.488078>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,90.000000,0> translate<48.691800,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.691800,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.505375,0.000000,48.674506>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,44.997510,0> translate<48.505375,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.505375,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.318950,0.000000,48.674506>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<48.318950,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.318950,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.132525,0.000000,48.488078>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<48.132525,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.132525,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.132525,0.000000,47.928803>}
box{<0,0,-0.076200><0.559275,0.036000,0.076200> rotate<0,-90.000000,0> translate<48.132525,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.113247,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.113247,0.000000,47.928803>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,-90.000000,0> translate<50.113247,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.113247,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.672525,0.000000,47.928803>}
box{<0,0,-0.076200><0.559278,0.036000,0.076200> rotate<0,0.000000,0> translate<50.113247,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.672525,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.486097,0.000000,48.301653>}
box{<0,0,-0.076200><0.416860,0.036000,0.076200> rotate<0,63.430378,0> translate<50.486097,0.000000,48.301653> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.486097,0.000000,48.301653>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.486097,0.000000,48.488078>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,90.000000,0> translate<50.486097,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.486097,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.672525,0.000000,48.674506>}
box{<0,0,-0.076200><0.263649,0.036000,0.076200> rotate<0,-44.997030,0> translate<50.486097,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.672525,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.045375,0.000000,48.674506>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,0.000000,0> translate<50.672525,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.045375,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.231800,0.000000,48.488078>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,44.997510,0> translate<51.045375,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.231800,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.231800,0.000000,48.115228>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,-90.000000,0> translate<51.231800,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.231800,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.045375,0.000000,47.928803>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.045375,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.771800,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.653247,0.000000,48.488078>}
box{<0,0,-0.076200><1.118553,0.036000,0.076200> rotate<0,0.000000,0> translate<52.653247,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.653247,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.212525,0.000000,47.928803>}
box{<0,0,-0.076200><0.790936,0.036000,0.076200> rotate<0,44.996870,0> translate<52.653247,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.212525,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.212525,0.000000,48.674506>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,90.000000,0> translate<53.212525,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.379672,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.193247,0.000000,48.115228>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,44.997030,0> translate<55.193247,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.193247,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.193247,0.000000,48.488078>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,90.000000,0> translate<55.193247,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.193247,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.379672,0.000000,48.674506>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<55.193247,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.379672,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.566097,0.000000,48.674506>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<55.379672,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.566097,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.752525,0.000000,48.488078>}
box{<0,0,-0.076200><0.263649,0.036000,0.076200> rotate<0,44.997030,0> translate<55.566097,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.752525,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.752525,0.000000,48.301653>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.752525,0.000000,48.301653> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.752525,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.938950,0.000000,48.674506>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<55.752525,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.938950,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.125375,0.000000,48.674506>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<55.938950,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.125375,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.311800,0.000000,48.488078>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,44.997510,0> translate<56.125375,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.311800,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.311800,0.000000,48.115228>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,-90.000000,0> translate<56.311800,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.311800,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.125375,0.000000,47.928803>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.125375,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.851800,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.851800,0.000000,47.928803>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,-90.000000,0> translate<58.851800,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.851800,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.106097,0.000000,48.674506>}
box{<0,0,-0.076200><1.054583,0.036000,0.076200> rotate<0,44.997030,0> translate<58.106097,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.106097,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.919672,0.000000,48.674506>}
box{<0,0,-0.076200><0.186425,0.036000,0.076200> rotate<0,0.000000,0> translate<57.919672,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.919672,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.733247,0.000000,48.488078>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<57.733247,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.733247,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.733247,0.000000,48.115228>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.733247,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.733247,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.919672,0.000000,47.928803>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,44.997030,0> translate<57.733247,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.646097,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.273247,0.000000,48.301653>}
box{<0,0,-0.076200><0.527290,0.036000,0.076200> rotate<0,44.997030,0> translate<60.273247,0.000000,48.301653> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.273247,0.000000,48.301653>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.391800,0.000000,48.301653>}
box{<0,0,-0.076200><1.118553,0.036000,0.076200> rotate<0,0.000000,0> translate<60.273247,0.000000,48.301653> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.391800,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.391800,0.000000,48.674506>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,90.000000,0> translate<61.391800,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.745375,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.999672,0.000000,47.928803>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,0.000000,0> translate<62.999672,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.999672,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.813247,0.000000,48.115228>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,44.997030,0> translate<62.813247,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.813247,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.813247,0.000000,48.488078>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,90.000000,0> translate<62.813247,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.813247,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.999672,0.000000,48.674506>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,-44.997510,0> translate<62.813247,0.000000,48.488078> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.999672,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.745375,0.000000,48.674506>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,0.000000,0> translate<62.999672,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.745375,0.000000,48.674506>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.931800,0.000000,48.488078>}
box{<0,0,-0.076200><0.263647,0.036000,0.076200> rotate<0,44.997510,0> translate<63.745375,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.931800,0.000000,48.488078>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.931800,0.000000,48.115228>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,-90.000000,0> translate<63.931800,0.000000,48.115228> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.931800,0.000000,48.115228>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.745375,0.000000,47.928803>}
box{<0,0,-0.076200><0.263645,0.036000,0.076200> rotate<0,-44.997030,0> translate<63.745375,0.000000,47.928803> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<63.745375,0.000000,47.928803>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.999672,0.000000,48.674506>}
box{<0,0,-0.076200><1.054583,0.036000,0.076200> rotate<0,44.997030,0> translate<62.999672,0.000000,48.674506> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.594800,0.000000,45.703203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.628775,0.000000,45.703203>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<33.628775,0.000000,45.703203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.628775,0.000000,46.025213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.594800,0.000000,46.025213>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<33.628775,0.000000,46.025213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.950784,0.000000,45.542200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.950784,0.000000,46.025213>}
box{<0,0,-0.076200><0.483013,0.036000,0.076200> rotate<0,90.000000,0> translate<33.950784,0.000000,46.025213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.950784,0.000000,46.025213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.950784,0.000000,46.186216>}
box{<0,0,-0.076200><0.161003,0.036000,0.076200> rotate<0,90.000000,0> translate<33.950784,0.000000,46.186216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.272794,0.000000,45.542200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.272794,0.000000,46.186216>}
box{<0,0,-0.076200><0.644016,0.036000,0.076200> rotate<0,90.000000,0> translate<34.272794,0.000000,46.186216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.007800,0.000000,45.703203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.041775,0.000000,45.703203>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<36.041775,0.000000,45.703203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.041775,0.000000,46.025213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.007800,0.000000,46.025213>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<36.041775,0.000000,46.025213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.363784,0.000000,45.542200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.363784,0.000000,46.025213>}
box{<0,0,-0.076200><0.483013,0.036000,0.076200> rotate<0,90.000000,0> translate<36.363784,0.000000,46.025213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.363784,0.000000,46.025213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.363784,0.000000,46.186216>}
box{<0,0,-0.076200><0.161003,0.036000,0.076200> rotate<0,90.000000,0> translate<36.363784,0.000000,46.186216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.685794,0.000000,45.542200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.685794,0.000000,46.186216>}
box{<0,0,-0.076200><0.644016,0.036000,0.076200> rotate<0,90.000000,0> translate<36.685794,0.000000,46.186216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,46.846203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.581775,0.000000,46.846203>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<38.581775,0.000000,46.846203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.581775,0.000000,47.168213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.547800,0.000000,47.168213>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<38.581775,0.000000,47.168213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.903784,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.903784,0.000000,47.168213>}
box{<0,0,-0.076200><0.483013,0.036000,0.076200> rotate<0,90.000000,0> translate<38.903784,0.000000,47.168213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.903784,0.000000,47.168213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.903784,0.000000,47.329216>}
box{<0,0,-0.076200><0.161003,0.036000,0.076200> rotate<0,90.000000,0> translate<38.903784,0.000000,47.329216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.225794,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.225794,0.000000,47.329216>}
box{<0,0,-0.076200><0.644016,0.036000,0.076200> rotate<0,90.000000,0> translate<39.225794,0.000000,47.329216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.818800,0.000000,46.846203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.852775,0.000000,46.846203>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<47.852775,0.000000,46.846203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.852775,0.000000,47.168213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.818800,0.000000,47.168213>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<47.852775,0.000000,47.168213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.174784,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.174784,0.000000,47.168213>}
box{<0,0,-0.076200><0.483013,0.036000,0.076200> rotate<0,90.000000,0> translate<48.174784,0.000000,47.168213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.174784,0.000000,47.168213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.174784,0.000000,47.329216>}
box{<0,0,-0.076200><0.161003,0.036000,0.076200> rotate<0,90.000000,0> translate<48.174784,0.000000,47.329216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.496794,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.496794,0.000000,47.329216>}
box{<0,0,-0.076200><0.644016,0.036000,0.076200> rotate<0,90.000000,0> translate<48.496794,0.000000,47.329216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,46.846203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.392775,0.000000,46.846203>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<50.392775,0.000000,46.846203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.392775,0.000000,47.168213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.358800,0.000000,47.168213>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<50.392775,0.000000,47.168213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.714784,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.714784,0.000000,47.168213>}
box{<0,0,-0.076200><0.483013,0.036000,0.076200> rotate<0,90.000000,0> translate<50.714784,0.000000,47.168213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.714784,0.000000,47.168213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.714784,0.000000,47.329216>}
box{<0,0,-0.076200><0.161003,0.036000,0.076200> rotate<0,90.000000,0> translate<50.714784,0.000000,47.329216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.036794,0.000000,46.685200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.036794,0.000000,47.329216>}
box{<0,0,-0.076200><0.644016,0.036000,0.076200> rotate<0,90.000000,0> translate<51.036794,0.000000,47.329216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.565800,0.000000,46.973203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.599775,0.000000,46.973203>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<55.599775,0.000000,46.973203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.599775,0.000000,47.295213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.565800,0.000000,47.295213>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<55.599775,0.000000,47.295213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.921784,0.000000,46.812200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.921784,0.000000,47.295213>}
box{<0,0,-0.076200><0.483013,0.036000,0.076200> rotate<0,90.000000,0> translate<55.921784,0.000000,47.295213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.921784,0.000000,47.295213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.921784,0.000000,47.456216>}
box{<0,0,-0.076200><0.161003,0.036000,0.076200> rotate<0,90.000000,0> translate<55.921784,0.000000,47.456216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.243794,0.000000,46.812200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.243794,0.000000,47.456216>}
box{<0,0,-0.076200><0.644016,0.036000,0.076200> rotate<0,90.000000,0> translate<56.243794,0.000000,47.456216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<0.711200,0.000000,13.335475>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.456903,0.000000,13.335475>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,0.000000,0> translate<0.711200,0.000000,13.335475> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.084050,0.000000,13.708328>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.084050,0.000000,12.962625>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.084050,0.000000,12.962625> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.880597,0.000000,13.894753>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.880597,0.000000,13.149050>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,-90.000000,0> translate<1.880597,0.000000,13.149050> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<1.880597,0.000000,13.149050>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.253447,0.000000,12.776200>}
box{<0,0,-0.076200><0.527290,0.036000,0.076200> rotate<0,44.997030,0> translate<1.880597,0.000000,13.149050> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.253447,0.000000,12.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.626300,0.000000,13.149050>}
box{<0,0,-0.076200><0.527292,0.036000,0.076200> rotate<0,-44.996790,0> translate<2.253447,0.000000,12.776200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.626300,0.000000,13.149050>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<2.626300,0.000000,13.894753>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,90.000000,0> translate<2.626300,0.000000,13.894753> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.049994,0.000000,12.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.422844,0.000000,12.776200>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,0.000000,0> translate<3.049994,0.000000,12.776200> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.236419,0.000000,12.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.236419,0.000000,13.894753>}
box{<0,0,-0.076200><1.118553,0.036000,0.076200> rotate<0,90.000000,0> translate<3.236419,0.000000,13.894753> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.049994,0.000000,13.894753>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.422844,0.000000,13.894753>}
box{<0,0,-0.076200><0.372850,0.036000,0.076200> rotate<0,0.000000,0> translate<3.049994,0.000000,13.894753> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.829591,0.000000,12.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.829591,0.000000,13.894753>}
box{<0,0,-0.076200><1.118553,0.036000,0.076200> rotate<0,90.000000,0> translate<3.829591,0.000000,13.894753> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<3.829591,0.000000,13.894753>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.575294,0.000000,12.776200>}
box{<0,0,-0.076200><1.344334,0.036000,0.076200> rotate<0,56.306179,0> translate<3.829591,0.000000,13.894753> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.575294,0.000000,12.776200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<4.575294,0.000000,13.894753>}
box{<0,0,-0.076200><1.118553,0.036000,0.076200> rotate<0,90.000000,0> translate<4.575294,0.000000,13.894753> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<15.316200,0.000000,12.573475>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<16.061903,0.000000,12.573475>}
box{<0,0,-0.076200><0.745703,0.036000,0.076200> rotate<0,0.000000,0> translate<15.316200,0.000000,12.573475> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.521100,-1.536000,44.538900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.521100,-1.536000,45.784562>}
box{<0,0,-0.088900><1.245662,0.036000,0.088900> rotate<0,90.000000,0> translate<54.521100,-1.536000,45.784562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.521100,-1.536000,45.784562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.105881,-1.536000,45.369341>}
box{<0,0,-0.088900><0.587210,0.036000,0.088900> rotate<0,-44.997246,0> translate<54.105881,-1.536000,45.369341> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<54.105881,-1.536000,45.369341>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.690659,-1.536000,45.784562>}
box{<0,0,-0.088900><0.587212,0.036000,0.088900> rotate<0,44.997030,0> translate<53.690659,-1.536000,45.784562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.690659,-1.536000,45.784562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.690659,-1.536000,44.538900>}
box{<0,0,-0.088900><1.245662,0.036000,0.088900> rotate<0,-90.000000,0> translate<53.690659,-1.536000,44.538900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.211375,-1.536000,44.538900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.211375,-1.536000,45.369341>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,90.000000,0> translate<53.211375,-1.536000,45.369341> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.211375,-1.536000,45.369341>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.796156,-1.536000,45.784562>}
box{<0,0,-0.088900><0.587210,0.036000,0.088900> rotate<0,44.997246,0> translate<52.796156,-1.536000,45.784562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.796156,-1.536000,45.784562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.380934,-1.536000,45.369341>}
box{<0,0,-0.088900><0.587212,0.036000,0.088900> rotate<0,-44.997030,0> translate<52.380934,-1.536000,45.369341> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.380934,-1.536000,45.369341>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.380934,-1.536000,44.538900>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,-90.000000,0> translate<52.380934,-1.536000,44.538900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.211375,-1.536000,45.161731>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.380934,-1.536000,45.161731>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,0.000000,0> translate<52.380934,-1.536000,45.161731> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.901650,-1.536000,45.784562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.901650,-1.536000,44.538900>}
box{<0,0,-0.088900><1.245662,0.036000,0.088900> rotate<0,-90.000000,0> translate<51.901650,-1.536000,44.538900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.901650,-1.536000,44.538900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.278819,-1.536000,44.538900>}
box{<0,0,-0.088900><0.622831,0.036000,0.088900> rotate<0,0.000000,0> translate<51.278819,-1.536000,44.538900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.278819,-1.536000,44.538900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.071209,-1.536000,44.746509>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,44.997030,0> translate<51.071209,-1.536000,44.746509> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.071209,-1.536000,44.746509>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.071209,-1.536000,45.576953>}
box{<0,0,-0.088900><0.830444,0.036000,0.088900> rotate<0,90.000000,0> translate<51.071209,-1.536000,45.576953> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.071209,-1.536000,45.576953>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.278819,-1.536000,45.784562>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,-44.997030,0> translate<51.071209,-1.536000,45.576953> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.278819,-1.536000,45.784562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.901650,-1.536000,45.784562>}
box{<0,0,-0.088900><0.622831,0.036000,0.088900> rotate<0,0.000000,0> translate<51.278819,-1.536000,45.784562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.761484,-1.536000,45.784562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.591925,-1.536000,45.784562>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,0.000000,0> translate<49.761484,-1.536000,45.784562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.591925,-1.536000,45.784562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.591925,-1.536000,44.538900>}
box{<0,0,-0.088900><1.245662,0.036000,0.088900> rotate<0,-90.000000,0> translate<50.591925,-1.536000,44.538900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.591925,-1.536000,44.538900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.761484,-1.536000,44.538900>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,0.000000,0> translate<49.761484,-1.536000,44.538900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.591925,-1.536000,45.161731>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.176706,-1.536000,45.161731>}
box{<0,0,-0.088900><0.415219,0.036000,0.088900> rotate<0,0.000000,0> translate<50.176706,-1.536000,45.161731> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.972475,-1.536000,44.538900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.557256,-1.536000,44.538900>}
box{<0,0,-0.088900><0.415219,0.036000,0.088900> rotate<0,0.000000,0> translate<47.557256,-1.536000,44.538900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.764866,-1.536000,44.538900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.764866,-1.536000,45.784562>}
box{<0,0,-0.088900><1.245662,0.036000,0.088900> rotate<0,90.000000,0> translate<47.764866,-1.536000,45.784562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.972475,-1.536000,45.784562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.557256,-1.536000,45.784562>}
box{<0,0,-0.088900><0.415219,0.036000,0.088900> rotate<0,0.000000,0> translate<47.557256,-1.536000,45.784562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.099325,-1.536000,44.538900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.099325,-1.536000,45.784562>}
box{<0,0,-0.088900><1.245662,0.036000,0.088900> rotate<0,90.000000,0> translate<47.099325,-1.536000,45.784562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.099325,-1.536000,45.784562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.268884,-1.536000,44.538900>}
box{<0,0,-0.088900><1.497099,0.036000,0.088900> rotate<0,-56.306249,0> translate<46.268884,-1.536000,44.538900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.268884,-1.536000,44.538900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<46.268884,-1.536000,45.784562>}
box{<0,0,-0.088900><1.245662,0.036000,0.088900> rotate<0,90.000000,0> translate<46.268884,-1.536000,45.784562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.251100,-1.536000,42.633900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.835881,-1.536000,42.633900>}
box{<0,0,-0.088900><0.415219,0.036000,0.088900> rotate<0,0.000000,0> translate<52.835881,-1.536000,42.633900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.043491,-1.536000,42.633900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.043491,-1.536000,43.879562>}
box{<0,0,-0.088900><1.245662,0.036000,0.088900> rotate<0,90.000000,0> translate<53.043491,-1.536000,43.879562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<53.251100,-1.536000,43.879562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.835881,-1.536000,43.879562>}
box{<0,0,-0.088900><0.415219,0.036000,0.088900> rotate<0,0.000000,0> translate<52.835881,-1.536000,43.879562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.962731,-1.536000,42.633900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.962731,-1.536000,43.879562>}
box{<0,0,-0.088900><1.245662,0.036000,0.088900> rotate<0,90.000000,0> translate<51.962731,-1.536000,43.879562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<52.377950,-1.536000,43.879562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.547509,-1.536000,43.879562>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,0.000000,0> translate<51.547509,-1.536000,43.879562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.068225,-1.536000,42.633900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.068225,-1.536000,43.464341>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,90.000000,0> translate<51.068225,-1.536000,43.464341> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.068225,-1.536000,43.464341>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.653006,-1.536000,43.879562>}
box{<0,0,-0.088900><0.587210,0.036000,0.088900> rotate<0,44.997246,0> translate<50.653006,-1.536000,43.879562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.653006,-1.536000,43.879562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.237784,-1.536000,43.464341>}
box{<0,0,-0.088900><0.587212,0.036000,0.088900> rotate<0,-44.997030,0> translate<50.237784,-1.536000,43.464341> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.237784,-1.536000,43.464341>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.237784,-1.536000,42.633900>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,-90.000000,0> translate<50.237784,-1.536000,42.633900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<51.068225,-1.536000,43.256731>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<50.237784,-1.536000,43.256731>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,0.000000,0> translate<50.237784,-1.536000,43.256731> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.758500,-1.536000,43.879562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.758500,-1.536000,42.633900>}
box{<0,0,-0.088900><1.245662,0.036000,0.088900> rotate<0,-90.000000,0> translate<49.758500,-1.536000,42.633900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<49.758500,-1.536000,42.633900>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.928059,-1.536000,42.633900>}
box{<0,0,-0.088900><0.830441,0.036000,0.088900> rotate<0,0.000000,0> translate<48.928059,-1.536000,42.633900> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.448775,-1.536000,43.879562>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.448775,-1.536000,43.671953>}
box{<0,0,-0.088900><0.207609,0.036000,0.088900> rotate<0,-90.000000,0> translate<48.448775,-1.536000,43.671953> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.448775,-1.536000,43.671953>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.033556,-1.536000,43.256731>}
box{<0,0,-0.088900><0.587210,0.036000,0.088900> rotate<0,-44.997246,0> translate<48.033556,-1.536000,43.256731> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.033556,-1.536000,43.256731>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.618334,-1.536000,43.671953>}
box{<0,0,-0.088900><0.587212,0.036000,0.088900> rotate<0,44.997030,0> translate<47.618334,-1.536000,43.671953> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.618334,-1.536000,43.671953>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<47.618334,-1.536000,43.879562>}
box{<0,0,-0.088900><0.207609,0.036000,0.088900> rotate<0,90.000000,0> translate<47.618334,-1.536000,43.879562> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.033556,-1.536000,43.256731>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<48.033556,-1.536000,42.633900>}
box{<0,0,-0.088900><0.622831,0.036000,0.088900> rotate<0,-90.000000,0> translate<48.033556,-1.536000,42.633900> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.514800,0.000000,45.703203>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.548775,0.000000,45.703203>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<28.548775,0.000000,45.703203> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.548775,0.000000,46.025213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.514800,0.000000,46.025213>}
box{<0,0,-0.076200><0.966025,0.036000,0.076200> rotate<0,0.000000,0> translate<28.548775,0.000000,46.025213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.870784,0.000000,45.542200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.870784,0.000000,46.025213>}
box{<0,0,-0.076200><0.483013,0.036000,0.076200> rotate<0,90.000000,0> translate<28.870784,0.000000,46.025213> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.870784,0.000000,46.025213>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.870784,0.000000,46.186216>}
box{<0,0,-0.076200><0.161003,0.036000,0.076200> rotate<0,90.000000,0> translate<28.870784,0.000000,46.186216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.192794,0.000000,45.542200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.192794,0.000000,46.186216>}
box{<0,0,-0.076200><0.644016,0.036000,0.076200> rotate<0,90.000000,0> translate<29.192794,0.000000,46.186216> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,4.381000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,4.804694>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<31.136000,0.000000,4.804694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,4.592847>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,4.592847>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<29.864916,0.000000,4.592847> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,4.381000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,4.804694>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<29.864916,0.000000,4.804694> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,5.889691>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,5.465997>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.864916,0.000000,5.465997> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,5.465997>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.076763,0.000000,5.254150>}
box{<0,0,-0.076200><0.299597,0.036000,0.076200> rotate<0,44.997030,0> translate<29.864916,0.000000,5.465997> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.076763,0.000000,5.254150>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.924153,0.000000,5.254150>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,0.000000,0> translate<30.076763,0.000000,5.254150> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.924153,0.000000,5.254150>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,5.465997>}
box{<0,0,-0.076200><0.299597,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.924153,0.000000,5.254150> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,5.465997>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,5.889691>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<31.136000,0.000000,5.889691> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,5.889691>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.924153,0.000000,6.101541>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,44.997453,0> translate<30.924153,0.000000,6.101541> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.924153,0.000000,6.101541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.076763,0.000000,6.101541>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,0.000000,0> translate<30.076763,0.000000,6.101541> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.076763,0.000000,6.101541>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,5.889691>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<29.864916,0.000000,5.889691> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,6.563875>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,6.563875>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<29.864916,0.000000,6.563875> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,6.563875>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,7.199416>}
box{<0,0,-0.076200><0.635541,0.036000,0.076200> rotate<0,90.000000,0> translate<29.864916,0.000000,7.199416> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,7.199416>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.076763,0.000000,7.411266>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,-44.997453,0> translate<29.864916,0.000000,7.199416> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.076763,0.000000,7.411266>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.500459,0.000000,7.411266>}
box{<0,0,-0.076200><0.423697,0.036000,0.076200> rotate<0,0.000000,0> translate<30.076763,0.000000,7.411266> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.500459,0.000000,7.411266>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.712306,0.000000,7.199416>}
box{<0,0,-0.076200><0.299599,0.036000,0.076200> rotate<0,44.997453,0> translate<30.500459,0.000000,7.411266> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.712306,0.000000,7.199416>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.712306,0.000000,6.563875>}
box{<0,0,-0.076200><0.635541,0.036000,0.076200> rotate<0,-90.000000,0> translate<30.712306,0.000000,6.563875> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.712306,0.000000,6.987569>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,7.411266>}
box{<0,0,-0.076200><0.599196,0.036000,0.076200> rotate<0,-44.997241,0> translate<30.712306,0.000000,6.987569> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,8.720991>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,7.873600>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.864916,0.000000,7.873600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,7.873600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,7.873600>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<29.864916,0.000000,7.873600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,7.873600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,8.720991>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,90.000000,0> translate<31.136000,0.000000,8.720991> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.500459,0.000000,7.873600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.500459,0.000000,8.297294>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<30.500459,0.000000,8.297294> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.136000,0.000000,9.183325>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,9.183325>}
box{<0,0,-0.076200><1.271084,0.036000,0.076200> rotate<0,0.000000,0> translate<29.864916,0.000000,9.183325> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,9.183325>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.864916,0.000000,10.030716>}
box{<0,0,-0.076200><0.847391,0.036000,0.076200> rotate<0,90.000000,0> translate<29.864916,0.000000,10.030716> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.500459,0.000000,9.183325>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.500459,0.000000,9.607019>}
box{<0,0,-0.076200><0.423694,0.036000,0.076200> rotate<0,90.000000,0> translate<30.500459,0.000000,9.607019> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.828247,0.000000,5.245741>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,5.038131>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,-44.997030,0> translate<42.620638,0.000000,5.038131> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,5.038131>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,4.622909>}
box{<0,0,-0.088900><0.415222,0.036000,0.088900> rotate<0,-90.000000,0> translate<42.620638,0.000000,4.622909> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,4.622909>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.828247,0.000000,4.415300>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,44.997030,0> translate<42.620638,0.000000,4.622909> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.828247,0.000000,4.415300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.658691,0.000000,4.415300>}
box{<0,0,-0.088900><0.830444,0.036000,0.088900> rotate<0,0.000000,0> translate<42.828247,0.000000,4.415300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.658691,0.000000,4.415300>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,4.622909>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,-44.997030,0> translate<43.658691,0.000000,4.415300> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,4.622909>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,5.038131>}
box{<0,0,-0.088900><0.415222,0.036000,0.088900> rotate<0,90.000000,0> translate<43.866300,0.000000,5.038131> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,5.038131>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.658691,0.000000,5.245741>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,44.997030,0> translate<43.658691,0.000000,5.245741> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.658691,0.000000,5.245741>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.243469,0.000000,5.245741>}
box{<0,0,-0.088900><0.415222,0.036000,0.088900> rotate<0,0.000000,0> translate<43.243469,0.000000,5.245741> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.243469,0.000000,5.245741>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.243469,0.000000,4.830519>}
box{<0,0,-0.088900><0.415222,0.036000,0.088900> rotate<0,-90.000000,0> translate<43.243469,0.000000,4.830519> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,5.725025>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,5.725025>}
box{<0,0,-0.088900><1.245663,0.036000,0.088900> rotate<0,0.000000,0> translate<42.620638,0.000000,5.725025> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,5.725025>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,6.555466>}
box{<0,0,-0.088900><1.497099,0.036000,0.088900> rotate<0,-33.687811,0> translate<42.620638,0.000000,5.725025> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,6.555466>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,6.555466>}
box{<0,0,-0.088900><1.245663,0.036000,0.088900> rotate<0,0.000000,0> translate<42.620638,0.000000,6.555466> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,7.034750>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,7.034750>}
box{<0,0,-0.088900><1.245663,0.036000,0.088900> rotate<0,0.000000,0> translate<42.620638,0.000000,7.034750> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,7.034750>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,7.657581>}
box{<0,0,-0.088900><0.622831,0.036000,0.088900> rotate<0,90.000000,0> translate<43.866300,0.000000,7.657581> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.866300,0.000000,7.657581>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.658691,0.000000,7.865191>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,44.997030,0> translate<43.658691,0.000000,7.865191> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<43.658691,0.000000,7.865191>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.828247,0.000000,7.865191>}
box{<0,0,-0.088900><0.830444,0.036000,0.088900> rotate<0,0.000000,0> translate<42.828247,0.000000,7.865191> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.828247,0.000000,7.865191>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,7.657581>}
box{<0,0,-0.088900><0.293604,0.036000,0.088900> rotate<0,-44.997030,0> translate<42.620638,0.000000,7.657581> }
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,7.657581>}
cylinder{<0,0,0><0,0.036000,0>0.088900 translate<42.620638,0.000000,7.034750>}
box{<0,0,-0.088900><0.622831,0.036000,0.088900> rotate<0,-90.000000,0> translate<42.620638,0.000000,7.034750> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<38.481000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.448000,0.000000,45.085000>}
box{<0,0,-0.152400><10.033000,0.036000,0.152400> rotate<0,0.000000,0> translate<28.448000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<28.448000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<27.940000,0.000000,45.593000>}
box{<0,0,-0.152400><0.718420,0.036000,0.152400> rotate<0,44.997030,0> translate<27.940000,0.000000,45.593000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<59.182000,0.000000,45.085000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<49.149000,0.000000,45.085000>}
box{<0,0,-0.152400><10.033000,0.036000,0.152400> rotate<0,0.000000,0> translate<49.149000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<59.690000,0.000000,45.593000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<59.182000,0.000000,45.085000>}
box{<0,0,-0.152400><0.718420,0.036000,0.152400> rotate<0,-44.997030,0> translate<59.182000,0.000000,45.085000> }
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.987400,0.000000,3.023000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<26.987500,0.000000,3.023100>}
box{<0,0,-0.025400><0.000141,0.036000,0.025400> rotate<0,-44.997030,0> translate<26.987400,0.000000,3.023000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<1.905000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<3.175000,0.000000,1.905000>}
box{<0,0,-0.152400><1.270000,0.036000,0.152400> rotate<0,0.000000,0> translate<1.905000,0.000000,1.905000> }
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,0.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-1.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-2.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-3.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-4.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-5.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-6.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-7.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-8.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-9.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-10.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-11.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-12.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-13.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-14.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-15.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-16.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-17.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-18.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-19.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-20.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-21.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-22.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-23.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-24.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-25.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-26.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-27.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-28.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-29.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-30.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-31.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-32.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-33.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-34.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-35.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-36.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-37.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-38.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-39.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-40.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-41.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-42.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-43.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-44.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-45.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-46.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-47.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-48.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-49.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-50.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-51.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-52.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-53.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-54.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-55.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-56.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-57.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-58.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-59.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-60.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-61.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-62.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-63.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-64.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-65.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-66.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-67.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-68.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-69.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-70.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-71.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-72.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-73.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-74.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-75.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-76.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-77.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-78.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-79.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-80.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-81.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-82.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-83.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-84.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-85.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-86.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-87.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-88.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-89.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-270.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-271.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-272.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-273.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-274.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-275.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-276.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-277.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-278.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-279.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-280.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-281.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-282.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-283.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-284.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-285.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-286.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-287.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-288.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-289.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-290.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-291.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-292.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-293.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-294.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-295.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-296.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-297.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-298.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-299.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-300.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-301.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-302.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-303.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-304.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-305.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-306.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-307.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-308.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-309.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-310.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-311.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-312.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-313.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-314.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-315.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-316.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-317.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-318.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-319.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-320.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-321.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-322.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-323.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-324.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-325.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-326.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-327.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-328.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-329.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-330.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-331.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-332.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-333.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-334.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-335.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-336.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-337.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-338.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-339.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-340.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-341.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-342.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-343.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-344.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-345.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-346.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-347.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-348.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-349.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-350.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-351.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-352.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-353.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-354.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-355.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-356.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-357.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-358.000000,0> translate<3.175000,0,1.905000>}
box{<-0.152400,0,-0.035447>,<0.152400,0.036000,0.035447> translate<1.016000,0,0> rotate<0,-359.000000,0> translate<3.175000,0,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<4.191000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<5.080000,0.000000,1.905000>}
box{<0,0,-0.152400><0.889000,0.036000,0.152400> rotate<0,0.000000,0> translate<4.191000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<5.080000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<6.350000,0.000000,1.270000>}
box{<0,0,-0.152400><1.270000,0.036000,0.152400> rotate<0,0.000000,0> translate<5.080000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<0.635000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<1.905000,0.000000,1.270000>}
box{<0,0,-0.152400><1.270000,0.036000,0.152400> rotate<0,0.000000,0> translate<0.635000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<1.270000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.152400 translate<1.270000,0.000000,0.635000>}
box{<0,0,-0.152400><1.270000,0.036000,0.152400> rotate<0,-90.000000,0> translate<1.270000,0.000000,0.635000> }
difference{
cylinder{<3.175000,0,1.905000><3.175000,0.036000,1.905000>0.554000 translate<0,0.000000,0>}
cylinder{<3.175000,-0.1,1.905000><3.175000,0.135000,1.905000>0.249200 translate<0,0.000000,0>}}
//C1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.091000,0.000000,9.093000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.379000,0.000000,9.093000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<38.379000,0.000000,9.093000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<39.091000,0.000000,9.944000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<38.379000,0.000000,9.944000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<38.379000,0.000000,9.944000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<39.323150,0.000000,9.519900>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<38.154750,0.000000,9.519900>}
//C2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.908000,0.000000,26.314000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<52.908000,0.000000,27.026000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<52.908000,0.000000,27.026000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.759000,0.000000,26.314000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<53.759000,0.000000,27.026000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<53.759000,0.000000,27.026000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<53.334900,0.000000,26.081850>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<53.334900,0.000000,27.250250>}
//C3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.003000,0.000000,26.314000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.003000,0.000000,27.026000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<51.003000,0.000000,27.026000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.854000,0.000000,26.314000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<51.854000,0.000000,27.026000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,90.000000,0> translate<51.854000,0.000000,27.026000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<51.429900,0.000000,26.081850>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-90.000000,0> translate<51.429900,0.000000,27.250250>}
//C4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.904000,0.000000,32.182000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.616000,0.000000,32.182000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<47.904000,0.000000,32.182000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<47.904000,0.000000,31.331000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<48.616000,0.000000,31.331000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<47.904000,0.000000,31.331000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<47.671850,0.000000,31.755100>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<48.840250,0.000000,31.755100>}
//C5 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.582000,0.000000,27.026000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.582000,0.000000,26.314000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<57.582000,0.000000,26.314000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.731000,0.000000,27.026000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.731000,0.000000,26.314000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<56.731000,0.000000,26.314000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-270.000000,0> translate<57.155100,0.000000,27.258150>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-270.000000,0> translate<57.155100,0.000000,26.089750>}
//C6 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.582000,0.000000,9.881000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.582000,0.000000,9.169000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<57.582000,0.000000,9.169000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.731000,0.000000,9.881000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.731000,0.000000,9.169000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,-90.000000,0> translate<56.731000,0.000000,9.169000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-270.000000,0> translate<57.155100,0.000000,10.113150>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-270.000000,0> translate<57.155100,0.000000,8.944750>}
//C7 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.794000,0.000000,16.942000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.506000,0.000000,16.942000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<56.794000,0.000000,16.942000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.794000,0.000000,16.091000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.506000,0.000000,16.091000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<56.794000,0.000000,16.091000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<56.561850,0.000000,16.515100>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<57.730250,0.000000,16.515100>}
//C8 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.300000,0.000000,27.225000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.100000,0.000000,27.225000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.100000,0.000000,27.225000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.100000,0.000000,27.225000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.100000,0.000000,29.925000>}
box{<0,0,-0.050800><2.700000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.100000,0.000000,29.925000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.100000,0.000000,29.925000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.300000,0.000000,29.925000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.100000,0.000000,29.925000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.300000,0.000000,29.925000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.300000,0.000000,27.225000>}
box{<0,0,-0.050800><2.700000,0.036000,0.050800> rotate<0,-90.000000,0> translate<14.300000,0.000000,27.225000> }
box{<-0.100000,0,-1.100000><0.100000,0.036000,1.100000> rotate<0,-180.000000,0> translate<14.350000,0.000000,28.575000>}
box{<-0.100000,0,-1.100000><0.100000,0.036000,1.100000> rotate<0,-0.000000,0> translate<11.050000,0.000000,28.575000>}
box{<-0.325000,0,-1.350000><0.325000,0.036000,1.350000> rotate<0,-180.000000,0> translate<13.975000,0.000000,28.575000>}
//C9 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.506000,0.000000,17.602000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.794000,0.000000,17.602000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<56.794000,0.000000,17.602000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<57.506000,0.000000,18.453000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<56.794000,0.000000,18.453000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<56.794000,0.000000,18.453000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<57.738150,0.000000,18.028900>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<56.569750,0.000000,18.028900>}
//C10 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.130000,0.000000,9.220000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.130000,0.000000,6.020000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.130000,0.000000,6.020000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.130000,0.000000,6.020000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.430000,0.000000,6.020000>}
box{<0,0,-0.050800><2.700000,0.036000,0.050800> rotate<0,0.000000,0> translate<16.430000,0.000000,6.020000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.430000,0.000000,6.020000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.430000,0.000000,9.220000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,90.000000,0> translate<16.430000,0.000000,9.220000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<16.430000,0.000000,9.220000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.130000,0.000000,9.220000>}
box{<0,0,-0.050800><2.700000,0.036000,0.050800> rotate<0,0.000000,0> translate<16.430000,0.000000,9.220000> }
box{<-0.100000,0,-1.100000><0.100000,0.036000,1.100000> rotate<0,-270.000000,0> translate<17.780000,0.000000,9.270000>}
box{<-0.100000,0,-1.100000><0.100000,0.036000,1.100000> rotate<0,-90.000000,0> translate<17.780000,0.000000,5.970000>}
box{<-0.325000,0,-1.350000><0.325000,0.036000,1.350000> rotate<0,-270.000000,0> translate<17.780000,0.000000,8.895000>}
//C11 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.121000,0.000000,19.253000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.409000,0.000000,19.253000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<24.409000,0.000000,19.253000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.121000,0.000000,20.104000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.409000,0.000000,20.104000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<24.409000,0.000000,20.104000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<25.353150,0.000000,19.679900>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<24.184750,0.000000,19.679900>}
//C12 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.750000,0.000000,9.220000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.750000,0.000000,6.020000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,-90.000000,0> translate<26.750000,0.000000,6.020000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.750000,0.000000,6.020000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.050000,0.000000,6.020000>}
box{<0,0,-0.050800><2.700000,0.036000,0.050800> rotate<0,0.000000,0> translate<24.050000,0.000000,6.020000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.050000,0.000000,6.020000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.050000,0.000000,9.220000>}
box{<0,0,-0.050800><3.200000,0.036000,0.050800> rotate<0,90.000000,0> translate<24.050000,0.000000,9.220000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.050000,0.000000,9.220000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<26.750000,0.000000,9.220000>}
box{<0,0,-0.050800><2.700000,0.036000,0.050800> rotate<0,0.000000,0> translate<24.050000,0.000000,9.220000> }
box{<-0.100000,0,-1.100000><0.100000,0.036000,1.100000> rotate<0,-270.000000,0> translate<25.400000,0.000000,9.270000>}
box{<-0.100000,0,-1.100000><0.100000,0.036000,1.100000> rotate<0,-90.000000,0> translate<25.400000,0.000000,5.970000>}
box{<-0.325000,0,-1.350000><0.325000,0.036000,1.350000> rotate<0,-270.000000,0> translate<25.400000,0.000000,8.895000>}
//C13 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.504000,0.000000,30.912000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.216000,0.000000,30.912000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<22.504000,0.000000,30.912000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.504000,0.000000,30.061000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.216000,0.000000,30.061000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<22.504000,0.000000,30.061000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<22.271850,0.000000,30.485100>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<23.440250,0.000000,30.485100>}
//C14 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.409000,0.000000,15.037000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.121000,0.000000,15.037000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<24.409000,0.000000,15.037000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<24.409000,0.000000,14.186000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<25.121000,0.000000,14.186000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<24.409000,0.000000,14.186000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<24.176850,0.000000,14.610100>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-0.000000,0> translate<25.345250,0.000000,14.610100>}
//C22 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.216000,0.000000,37.668000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.504000,0.000000,37.668000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<22.504000,0.000000,37.668000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.216000,0.000000,38.519000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<22.504000,0.000000,38.519000>}
box{<0,0,-0.050800><0.712000,0.036000,0.050800> rotate<0,0.000000,0> translate<22.504000,0.000000,38.519000> }
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<23.448150,0.000000,38.094900>}
box{<-0.250050,0,-0.475000><0.250050,0.036000,0.475000> rotate<0,-180.000000,0> translate<22.279750,0.000000,38.094900>}
//D1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.495000,0.000000,9.880600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.495000,0.000000,5.359400>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,-90.000000,0> translate<23.495000,0.000000,5.359400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.685000,0.000000,9.880600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.685000,0.000000,5.359400>}
box{<0,0,-0.050800><4.521200,0.036000,0.050800> rotate<0,-90.000000,0> translate<19.685000,0.000000,5.359400> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.685000,0.000000,9.880600>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.495000,0.000000,9.880600>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,0.000000,0> translate<19.685000,0.000000,9.880600> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<19.685000,0.000000,5.359400>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<23.495000,0.000000,5.359400>}
box{<0,0,-0.050800><3.810000,0.036000,0.050800> rotate<0,0.000000,0> translate<19.685000,0.000000,5.359400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.590000,0.000000,7.427000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,8.450000>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,45.648369,0> translate<21.590000,0.000000,8.450000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<21.590000,0.000000,8.450000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.590000,0.000000,7.427000>}
box{<0,0,-0.101600><1.430569,0.036000,0.101600> rotate<0,-45.648369,0> translate<20.590000,0.000000,7.427000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<20.590000,0.000000,7.427000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<22.590000,0.000000,7.427000>}
box{<0,0,-0.101600><2.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<20.590000,0.000000,7.427000> }
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-270.000000,0> translate<21.590000,0.000000,10.147300>}
box{<-0.266700,0,-1.092200><0.266700,0.036000,1.092200> rotate<0,-270.000000,0> translate<21.590000,0.000000,5.092700>}
box{<-0.275000,0,-1.900000><0.275000,0.036000,1.900000> rotate<0,-270.000000,0> translate<21.590000,0.000000,8.695000>}
//D2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.715400,0.000000,25.349200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.715400,0.000000,27.990800>}
box{<0,0,-0.076200><2.641600,0.036000,0.076200> rotate<0,90.000000,0> translate<59.715400,0.000000,27.990800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.140600,0.000000,25.349200>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<58.140600,0.000000,27.990800>}
box{<0,0,-0.076200><2.641600,0.036000,0.076200> rotate<0,90.000000,0> translate<58.140600,0.000000,27.990800> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.428000,0.000000,26.170000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.928000,0.000000,27.170000>}
box{<0,0,-0.101600><1.118034,0.036000,0.101600> rotate<0,63.430762,0> translate<58.928000,0.000000,27.170000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.928000,0.000000,27.170000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.428000,0.000000,26.170000>}
box{<0,0,-0.101600><1.118034,0.036000,0.101600> rotate<0,-63.430762,0> translate<58.428000,0.000000,26.170000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<58.428000,0.000000,26.170000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<59.428000,0.000000,26.170000>}
box{<0,0,-0.101600><1.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<58.428000,0.000000,26.170000> }
box{<-0.279400,0,-0.863600><0.279400,0.036000,0.863600> rotate<0,-270.000000,0> translate<58.928000,0.000000,28.244800>}
box{<-0.279400,0,-0.863600><0.279400,0.036000,0.863600> rotate<0,-270.000000,0> translate<58.928000,0.000000,25.095200>}
box{<-0.304800,0,-0.787400><0.304800,0.036000,0.787400> rotate<0,-270.000000,0> translate<58.928000,0.000000,27.228800>}
//EXTPOWER silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,0.000000,5.524500>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,0.000000,3.302000>}
box{<0,0,-0.063500><2.222500,0.036000,0.063500> rotate<0,-90.000000,0> translate<11.684000,0.000000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,0.000000,3.302000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.366500,0.000000,3.302000>}
box{<0,0,-0.063500><0.317500,0.036000,0.063500> rotate<0,0.000000,0> translate<11.366500,0.000000,3.302000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,0.000000,10.922000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,0.000000,12.293600>}
box{<0,0,-0.063500><1.371600,0.036000,0.063500> rotate<0,90.000000,0> translate<11.684000,0.000000,12.293600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.684000,0.000000,12.293600>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.676400,0.000000,12.293600>}
box{<0,0,-0.063500><10.007600,0.036000,0.063500> rotate<0,0.000000,0> translate<1.676400,0.000000,12.293600> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.676400,0.000000,3.327400>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<1.676400,0.000000,12.293600>}
box{<0,0,-0.063500><8.966200,0.036000,0.063500> rotate<0,90.000000,0> translate<1.676400,0.000000,12.293600> }
//F1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.173200,0.000000,42.214800>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.226800,0.000000,42.214800>}
box{<0,0,-0.050800><2.946400,0.036000,0.050800> rotate<0,0.000000,0> translate<11.226800,0.000000,42.214800> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<14.147800,0.000000,45.415200>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.226800,0.000000,45.415200>}
box{<0,0,-0.050800><2.921000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.226800,0.000000,45.415200> }
box{<-0.475000,0,-1.650000><0.475000,0.036000,1.650000> rotate<0,-180.000000,0> translate<14.612600,0.000000,43.816000>}
box{<-0.475000,0,-1.650000><0.475000,0.036000,1.650000> rotate<0,-180.000000,0> translate<10.777200,0.000000,43.816000>}
//FID1 silk screen
//FID2 silk screen
//FID3 silk screen
//IC1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,20.421600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,0.000000,20.421600>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.732000,0.000000,20.421600> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,0.000000,20.421600>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,0.000000,13.868400>}
box{<0,0,-0.101600><6.553200,0.036000,0.101600> rotate<0,-90.000000,0> translate<18.288000,0.000000,13.868400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<18.288000,0.000000,13.868400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,13.868400>}
box{<0,0,-0.101600><3.556000,0.036000,0.101600> rotate<0,0.000000,0> translate<14.732000,0.000000,13.868400> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,13.868400>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<14.732000,0.000000,20.421600>}
box{<0,0,-0.101600><6.553200,0.036000,0.101600> rotate<0,90.000000,0> translate<14.732000,0.000000,20.421600> }
box{<-1.600200,0,-0.927100><1.600200,0.036000,0.927100> rotate<0,-90.000000,0> translate<13.779500,0.000000,17.145000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<19.240500,0.000000,17.145000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<19.240500,0.000000,14.833600>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<19.240500,0.000000,19.456400>}
box{<-1.600200,0,-0.927100><1.600200,0.036000,0.927100> rotate<0,-90.000000,0> translate<13.779500,0.000000,17.145000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<19.240500,0.000000,17.145000>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<19.240500,0.000000,14.833600>}
box{<-0.431800,0,-0.927100><0.431800,0.036000,0.927100> rotate<0,-90.000000,0> translate<19.240500,0.000000,19.456400>}
//IC2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.579000,0.000000,35.589000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.579000,0.000000,32.989000>}
box{<0,0,-0.076200><2.600000,0.036000,0.076200> rotate<0,-90.000000,0> translate<22.579000,0.000000,32.989000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.329000,0.000000,32.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.329000,0.000000,35.589000>}
box{<0,0,-0.076200><2.600000,0.036000,0.076200> rotate<0,90.000000,0> translate<19.329000,0.000000,35.589000> }
object{ARC(0.325000,0.152400,0.000000,90.000000,0.036000) translate<22.254000,0.000000,35.589000>}
object{ARC(0.325000,0.152400,90.000000,180.000000,0.036000) translate<19.654000,0.000000,35.589000>}
object{ARC(0.325000,0.152400,180.000000,270.000000,0.036000) translate<19.654000,0.000000,32.989000>}
object{ARC(0.325000,0.152400,270.000000,360.000000,0.036000) translate<22.254000,0.000000,32.989000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.614000,0.000000,32.664000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.751000,0.000000,32.664000>}
box{<0,0,-0.076200><0.137000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.614000,0.000000,32.664000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.208000,0.000000,32.664000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.401000,0.000000,32.664000>}
box{<0,0,-0.076200><0.193000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.208000,0.000000,32.664000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.858000,0.000000,32.664000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.051000,0.000000,32.664000>}
box{<0,0,-0.076200><0.193000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.858000,0.000000,32.664000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.508000,0.000000,32.664000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.701000,0.000000,32.664000>}
box{<0,0,-0.076200><0.193000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.508000,0.000000,32.664000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.158000,0.000000,32.664000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.254000,0.000000,32.664000>}
box{<0,0,-0.076200><0.096000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.158000,0.000000,32.664000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.654000,0.000000,35.914000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.751000,0.000000,35.914000>}
box{<0,0,-0.076200><0.097000,0.036000,0.076200> rotate<0,0.000000,0> translate<19.654000,0.000000,35.914000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.208000,0.000000,35.914000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.401000,0.000000,35.914000>}
box{<0,0,-0.076200><0.193000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.208000,0.000000,35.914000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.858000,0.000000,35.914000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.051000,0.000000,35.914000>}
box{<0,0,-0.076200><0.193000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.858000,0.000000,35.914000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.508000,0.000000,35.914000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.701000,0.000000,35.914000>}
box{<0,0,-0.076200><0.193000,0.036000,0.076200> rotate<0,0.000000,0> translate<21.508000,0.000000,35.914000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.158000,0.000000,35.914000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.254000,0.000000,35.914000>}
box{<0,0,-0.076200><0.096000,0.036000,0.076200> rotate<0,0.000000,0> translate<22.158000,0.000000,35.914000> }
difference{
cylinder{<20.009400,0,33.499400><20.009400,0.036000,33.499400>0.525400 translate<0,0.000000,0>}
cylinder{<20.009400,-0.1,33.499400><20.009400,0.135000,33.499400>0.474600 translate<0,0.000000,0>}}
box{<-0.121900,0,-0.365650><0.121900,0.036000,0.365650> rotate<0,-0.000000,0> translate<19.979400,0.000000,36.280050>}
box{<-0.121900,0,-0.365650><0.121900,0.036000,0.365650> rotate<0,-0.000000,0> translate<20.629400,0.000000,36.280050>}
box{<-0.121900,0,-0.365650><0.121900,0.036000,0.365650> rotate<0,-0.000000,0> translate<21.279400,0.000000,36.280050>}
box{<-0.121900,0,-0.365650><0.121900,0.036000,0.365650> rotate<0,-0.000000,0> translate<21.929400,0.000000,36.280050>}
box{<-0.121900,0,-0.365650><0.121900,0.036000,0.365650> rotate<0,-0.000000,0> translate<19.979400,0.000000,32.298750>}
box{<-0.121900,0,-0.365650><0.121900,0.036000,0.365650> rotate<0,-0.000000,0> translate<20.629400,0.000000,32.298750>}
box{<-0.121900,0,-0.365650><0.121900,0.036000,0.365650> rotate<0,-0.000000,0> translate<21.279400,0.000000,32.298750>}
box{<-0.121900,0,-0.365650><0.121900,0.036000,0.365650> rotate<0,-0.000000,0> translate<21.929400,0.000000,32.298750>}
//ICSP silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,31.115000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.357000,0.000000,31.115000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,29.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.357000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,28.575000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.357000,0.000000,28.575000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,26.670000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.357000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,31.750000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.992000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,31.750000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,31.115000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<66.802000,0.000000,31.750000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,29.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.437000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,29.845000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,29.210000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.802000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,28.575000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<66.802000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,27.305000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.437000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,27.305000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,26.670000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.802000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,29.210000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,29.210000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.992000,0.000000,29.210000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,26.670000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.992000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,28.575000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,27.305000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.357000,0.000000,27.305000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,31.115000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,29.845000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.357000,0.000000,29.845000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,26.035000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.357000,0.000000,26.035000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.357000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,26.670000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,26.035000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<66.802000,0.000000,26.670000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,24.765000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<67.437000,0.000000,24.765000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<67.437000,0.000000,24.765000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,24.130000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<66.802000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<66.802000,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.992000,0.000000,24.130000>}
box{<0,0,-0.076200><3.810000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.992000,0.000000,24.130000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,26.035000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.357000,0.000000,24.765000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.357000,0.000000,24.765000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<63.627000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<66.167000,0.000000,30.480000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<66.167000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<63.627000,0.000000,27.940000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<66.167000,0.000000,25.400000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-270.000000,0> translate<63.627000,0.000000,25.400000>}
//J1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<0.000000,0.000000,42.164000>}
cylinder{<0,0,0><0,0.036000,0>0.025400 translate<0.000000,0.000000,30.734000>}
box{<0,0,-0.025400><11.430000,0.036000,0.025400> rotate<0,-90.000000,0> translate<0.000000,0.000000,30.734000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.241800,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.241800,0.000000,34.544000>}
box{<0,0,-0.127000><7.112000,0.036000,0.127000> rotate<0,-90.000000,0> translate<4.241800,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.241800,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.463800,0.000000,34.544000>}
box{<0,0,-0.127000><1.778000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.463800,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.463800,0.000000,34.544000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.463800,0.000000,33.782000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<2.463800,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.463800,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.431800,0.000000,33.782000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.431800,0.000000,33.782000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.431800,0.000000,33.782000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.431800,0.000000,34.544000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<0.431800,0.000000,34.544000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.431800,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.431800,0.000000,42.418000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,90.000000,0> translate<0.431800,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<0.431800,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.463800,0.000000,42.418000>}
box{<0,0,-0.127000><2.032000,0.036000,0.127000> rotate<0,0.000000,0> translate<0.431800,0.000000,42.418000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.463800,0.000000,42.418000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.463800,0.000000,41.656000>}
box{<0,0,-0.127000><0.762000,0.036000,0.127000> rotate<0,-90.000000,0> translate<2.463800,0.000000,41.656000> }
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<2.463800,0.000000,41.656000>}
cylinder{<0,0,0><0,0.036000,0>0.127000 translate<4.241800,0.000000,41.656000>}
box{<0,0,-0.127000><1.778000,0.036000,0.127000> rotate<0,0.000000,0> translate<2.463800,0.000000,41.656000> }
//J2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.625000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.990000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<46.990000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.990000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.435000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<49.530000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<49.530000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.530000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<51.435000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<48.895000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<48.895000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.625000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.895000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.625000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<54.610000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.975000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.705000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<52.070000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<52.070000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<52.070000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.705000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<53.975000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<57.150000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<57.150000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.150000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.515000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<56.515000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.230000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<62.230000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.230000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.595000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.690000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<59.690000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.690000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<61.595000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<64.770000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.135000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<64.135000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.450000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<44.450000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.450000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.355000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.355000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,52.070000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<48.260000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<50.800000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<53.340000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<55.880000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<58.420000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<60.960000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<63.500000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<45.720000,0.000000,50.800000>}
//J3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.545000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<43.815000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<44.450000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<43.815000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.370000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.005000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.275000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<41.910000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.275000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.275000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<40.005000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.005000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,1.905000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.370000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<41.910000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.910000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<41.910000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<43.815000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.545000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<42.545000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.195000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<36.830000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.195000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<36.830000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<38.735000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<39.370000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.370000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<38.735000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.735000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<37.465000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.465000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.830000,0.000000,1.905000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<36.830000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.750000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.385000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<33.655000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<34.290000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<33.655000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.655000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<32.385000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.385000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,1.905000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.750000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.290000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.290000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.290000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<36.195000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.925000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<34.925000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.305000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.305000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<28.575000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<29.210000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<28.575000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.210000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<31.115000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<31.750000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.750000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<31.115000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<31.115000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<29.845000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.845000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.210000,0.000000,1.905000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.210000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<26.670000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.305000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<26.670000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<26.670000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.305000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<26.670000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.575000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.305000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<27.305000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<46.355000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<46.990000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.990000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<46.355000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<44.450000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<44.450000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<44.450000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<46.355000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<45.085000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<45.085000,0.000000,1.270000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<43.180000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<40.640000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<38.100000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<35.560000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<33.020000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<30.480000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<27.940000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<45.720000,0.000000,2.540000>}
//J4 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.055000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<59.690000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.055000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<59.690000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<61.595000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<62.230000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<61.595000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<61.595000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<60.325000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<60.325000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.690000,0.000000,1.905000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<59.690000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<54.610000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<56.515000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<57.150000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<56.515000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.515000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<55.245000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.245000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,1.905000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<54.610000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<57.150000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.150000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<57.150000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<59.055000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<57.785000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<57.785000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<51.435000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<52.070000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<51.435000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,3.810000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<52.070000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.705000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<53.975000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<54.610000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<54.610000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<53.975000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<53.975000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<52.705000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.705000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<52.070000,0.000000,1.905000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<52.070000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<49.530000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<49.530000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<49.530000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<49.530000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<51.435000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<50.165000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<50.165000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,3.810000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<64.135000,0.000000,3.810000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,3.175000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,1.905000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,-90.000000,0> translate<64.770000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.770000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<64.135000,0.000000,1.270000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,3.810000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,3.175000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<62.230000,0.000000,3.175000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.230000,0.000000,1.905000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,1.270000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<62.230000,0.000000,1.905000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<64.135000,0.000000,1.270000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<62.865000,0.000000,1.270000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<62.865000,0.000000,1.270000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<60.960000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<58.420000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<55.880000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<53.340000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<50.800000,0.000000,2.540000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-0.000000,0> translate<63.500000,0.000000,2.540000>}
//JP1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<21.971000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<20.066000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<20.066000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<20.066000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.701000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<20.701000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<21.971000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<21.971000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<25.146000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<25.146000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<25.146000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<24.511000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<22.606000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<22.606000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<22.606000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<22.606000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.241000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.241000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<24.511000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.146000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<24.511000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<29.591000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.321000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<27.686000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<27.686000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.686000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<28.321000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<28.321000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<29.591000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<29.591000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<27.051000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.686000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<27.051000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.781000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<27.051000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<25.781000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.401000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<32.766000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<32.766000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.766000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<32.131000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<30.226000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<30.226000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.226000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<30.226000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<30.861000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<30.861000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.131000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<32.766000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<32.131000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.211000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<35.306000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<35.306000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<35.306000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.941000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<35.941000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.211000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<37.211000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<34.671000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<35.306000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<34.671000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<33.401000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<34.671000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<33.401000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<40.386000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<40.386000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<40.386000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,49.530000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<39.751000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<37.846000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<37.846000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<37.846000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<37.846000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<38.481000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<38.481000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<39.751000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<40.386000,0.000000,51.435000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<39.751000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<42.926000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<42.291000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.926000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<42.291000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<41.021000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<42.291000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<41.021000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,49.530000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.161000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<17.526000,0.000000,50.165000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,0.000000,50.165000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,0.000000,51.435000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,90.000000,0> translate<17.526000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.526000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<17.526000,0.000000,51.435000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,49.530000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,50.165000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,-44.997030,0> translate<19.431000,0.000000,49.530000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<20.066000,0.000000,51.435000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,52.070000>}
box{<0,0,-0.076200><0.898026,0.036000,0.076200> rotate<0,44.997030,0> translate<19.431000,0.000000,52.070000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,52.070000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<19.431000,0.000000,52.070000>}
box{<0,0,-0.076200><1.270000,0.036000,0.076200> rotate<0,0.000000,0> translate<18.161000,0.000000,52.070000> }
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<21.336000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<23.876000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<26.416000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<28.956000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<31.496000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<34.036000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<36.576000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<39.116000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<41.656000,0.000000,50.800000>}
box{<-0.254000,0,-0.254000><0.254000,0.036000,0.254000> rotate<0,-180.000000,0> translate<18.796000,0.000000,50.800000>}
//L silk screen
object{ARC(0.354172,0.101600,278.802740,441.197260,0.036000) translate<3.465800,0.000000,20.320000>}
object{ARC(0.354172,0.101600,98.802740,261.197260,0.036000) translate<5.424200,0.000000,20.320000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.920000,0.000000,20.895000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.970000,0.000000,20.895000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<3.920000,0.000000,20.895000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.945000,0.000000,19.745000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.520000,0.000000,19.745000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<3.520000,0.000000,19.745000> }
difference{
cylinder{<3.595000,0,19.870000><3.595000,0.036000,19.870000>0.153800 translate<0,0.000000,0>}
cylinder{<3.595000,-0.1,19.870000><3.595000,0.135000,19.870000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<3.695000,0.000000,20.782500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.820000,0.000000,20.070000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.820000,0.000000,20.570000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<3.857500,0.000000,20.320000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.195000,0.000000,20.782500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.195000,0.000000,19.857500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.070000,0.000000,20.570000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.070000,0.000000,20.070000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<5.032500,0.000000,20.320000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-90.000000,0> translate<4.345000,0.000000,20.320000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-90.000000,0> translate<3.795000,0.000000,19.870000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-90.000000,0> translate<3.482500,0.000000,19.857500>}
//L1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.245000,0.000000,27.970000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.245000,0.000000,25.470000>}
box{<0,0,-0.063500><2.500000,0.036000,0.063500> rotate<0,-90.000000,0> translate<55.245000,0.000000,25.470000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.245000,0.000000,27.770000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<55.245000,0.000000,25.570000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<55.245000,0.000000,25.570000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<55.870000,0.000000,27.670000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<55.870000,0.000000,25.670000>}
box{<0,0,-0.035000><2.000000,0.036000,0.035000> rotate<0,-90.000000,0> translate<55.870000,0.000000,25.670000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<55.870000,0.000000,25.670000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<54.620000,0.000000,25.670000>}
box{<0,0,-0.035000><1.250000,0.036000,0.035000> rotate<0,0.000000,0> translate<54.620000,0.000000,25.670000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<54.620000,0.000000,25.670000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<54.620000,0.000000,27.670000>}
box{<0,0,-0.035000><2.000000,0.036000,0.035000> rotate<0,90.000000,0> translate<54.620000,0.000000,27.670000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<54.620000,0.000000,27.670000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<55.870000,0.000000,27.670000>}
box{<0,0,-0.035000><1.250000,0.036000,0.035000> rotate<0,0.000000,0> translate<54.620000,0.000000,27.670000> }
box{<-0.350000,0,-0.150000><0.350000,0.036000,0.150000> rotate<0,-270.000000,0> translate<55.245000,0.000000,26.670000>}
//L2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.400000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.900000,0.000000,32.385000>}
box{<0,0,-0.063500><2.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.400000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<11.600000,0.000000,32.385000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<13.800000,0.000000,32.385000>}
box{<0,0,-0.063500><2.200000,0.036000,0.063500> rotate<0,0.000000,0> translate<11.600000,0.000000,32.385000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<11.700000,0.000000,33.010000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<13.700000,0.000000,33.010000>}
box{<0,0,-0.035000><2.000000,0.036000,0.035000> rotate<0,0.000000,0> translate<11.700000,0.000000,33.010000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<13.700000,0.000000,33.010000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<13.700000,0.000000,31.760000>}
box{<0,0,-0.035000><1.250000,0.036000,0.035000> rotate<0,-90.000000,0> translate<13.700000,0.000000,31.760000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<13.700000,0.000000,31.760000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<11.700000,0.000000,31.760000>}
box{<0,0,-0.035000><2.000000,0.036000,0.035000> rotate<0,0.000000,0> translate<11.700000,0.000000,31.760000> }
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<11.700000,0.000000,31.760000>}
cylinder{<0,0,0><0,0.036000,0>0.035000 translate<11.700000,0.000000,33.010000>}
box{<0,0,-0.035000><1.250000,0.036000,0.035000> rotate<0,90.000000,0> translate<11.700000,0.000000,33.010000> }
box{<-0.350000,0,-0.150000><0.350000,0.036000,0.150000> rotate<0,-0.000000,0> translate<12.700000,0.000000,32.385000>}
//ON silk screen
object{ARC(0.354172,0.101600,278.802740,441.197260,0.036000) translate<3.465800,0.000000,16.510000>}
object{ARC(0.354172,0.101600,98.802740,261.197260,0.036000) translate<5.424200,0.000000,16.510000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.920000,0.000000,17.085000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.970000,0.000000,17.085000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<3.920000,0.000000,17.085000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.945000,0.000000,15.935000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.520000,0.000000,15.935000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<3.520000,0.000000,15.935000> }
difference{
cylinder{<3.595000,0,16.060000><3.595000,0.036000,16.060000>0.153800 translate<0,0.000000,0>}
cylinder{<3.595000,-0.1,16.060000><3.595000,0.135000,16.060000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<3.695000,0.000000,16.972500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.820000,0.000000,16.260000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.820000,0.000000,16.760000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<3.857500,0.000000,16.510000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.195000,0.000000,16.972500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.195000,0.000000,16.047500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.070000,0.000000,16.760000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.070000,0.000000,16.260000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<5.032500,0.000000,16.510000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-90.000000,0> translate<4.345000,0.000000,16.510000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-90.000000,0> translate<3.795000,0.000000,16.060000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-90.000000,0> translate<3.482500,0.000000,16.047500>}
//ORIGIN silk screen
//R1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.828000,0.000000,25.044000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.692000,0.000000,25.044000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.828000,0.000000,25.044000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<48.692000,0.000000,25.756000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<47.828000,0.000000,25.756000>}
box{<0,0,-0.076200><0.864000,0.036000,0.076200> rotate<0,0.000000,0> translate<47.828000,0.000000,25.756000> }
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<48.895000,0.000000,25.400000>}
box{<-0.203200,0,-0.431800><0.203200,0.036000,0.431800> rotate<0,-0.000000,0> translate<47.625000,0.000000,25.400000>}
//R2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.104000,-1.536000,14.080600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.104000,-1.536000,14.570600>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.104000,-1.536000,14.570600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.656000,-1.536000,14.570600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.656000,-1.536000,14.080600>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.656000,-1.536000,14.080600> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<55.875150,-1.536000,13.921600>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<55.875150,-1.536000,14.734400>}
//R3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.104000,-1.536000,14.715600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<56.104000,-1.536000,15.205600>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,90.000000,0> translate<56.104000,-1.536000,15.205600> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.656000,-1.536000,15.205600>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<55.656000,-1.536000,14.715600>}
box{<0,0,-0.076200><0.490000,0.036000,0.076200> rotate<0,-90.000000,0> translate<55.656000,-1.536000,14.715600> }
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<55.875150,-1.536000,14.556600>}
box{<-0.150000,0,-0.299950><0.150000,0.036000,0.299950> rotate<0,-90.000000,0> translate<55.875150,-1.536000,15.369400>}
//RESET silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.373000,0.000000,52.292000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.373000,0.000000,46.514000>}
box{<0,0,-0.063500><5.778000,0.036000,0.063500> rotate<0,-90.000000,0> translate<3.373000,0.000000,46.514000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.327000,0.000000,46.514000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.327000,0.000000,48.903000>}
box{<0,0,-0.063500><2.389000,0.036000,0.063500> rotate<0,90.000000,0> translate<9.327000,0.000000,48.903000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.327000,0.000000,49.903000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.327000,0.000000,52.292000>}
box{<0,0,-0.063500><2.389000,0.036000,0.063500> rotate<0,90.000000,0> translate<9.327000,0.000000,52.292000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.327000,0.000000,48.903000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.577000,0.000000,48.903000>}
box{<0,0,-0.063500><0.250000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.327000,0.000000,48.903000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.577000,0.000000,48.903000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.577000,0.000000,49.903000>}
box{<0,0,-0.063500><1.000000,0.036000,0.063500> rotate<0,90.000000,0> translate<9.577000,0.000000,49.903000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.577000,0.000000,49.903000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.327000,0.000000,49.903000>}
box{<0,0,-0.063500><0.250000,0.036000,0.063500> rotate<0,0.000000,0> translate<9.327000,0.000000,49.903000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,46.714000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,46.714000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.350000,0.000000,46.714000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,46.714000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,46.514000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.350000,0.000000,46.514000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,46.514000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,46.314000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.350000,0.000000,46.314000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,46.314000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,46.314000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.350000,0.000000,46.314000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,46.314000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,46.514000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<7.350000,0.000000,46.514000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,46.514000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,46.714000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<7.350000,0.000000,46.714000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,52.492000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,52.492000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.350000,0.000000,52.492000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,52.492000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,52.292000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.350000,0.000000,52.292000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,52.292000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,52.092000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<5.350000,0.000000,52.092000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,52.092000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,52.092000>}
box{<0,0,-0.063500><2.000000,0.036000,0.063500> rotate<0,0.000000,0> translate<5.350000,0.000000,52.092000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,52.092000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,52.292000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<7.350000,0.000000,52.292000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,52.292000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,52.492000>}
box{<0,0,-0.063500><0.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<7.350000,0.000000,52.492000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.327000,0.000000,46.514000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,46.514000>}
box{<0,0,-0.063500><1.977000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.350000,0.000000,46.514000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,46.514000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.373000,0.000000,46.514000>}
box{<0,0,-0.063500><1.977000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.373000,0.000000,46.514000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<5.350000,0.000000,52.292000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<3.373000,0.000000,52.292000>}
box{<0,0,-0.063500><1.977000,0.036000,0.063500> rotate<0,0.000000,0> translate<3.373000,0.000000,52.292000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<7.350000,0.000000,52.292000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<9.327000,0.000000,52.292000>}
box{<0,0,-0.063500><1.977000,0.036000,0.063500> rotate<0,0.000000,0> translate<7.350000,0.000000,52.292000> }
difference{
cylinder{<6.350000,0,49.403000><6.350000,0.036000,49.403000>1.563500 translate<0,0.000000,0>}
cylinder{<6.350000,-0.1,49.403000><6.350000,0.135000,49.403000>1.436500 translate<0,0.000000,0>}}
difference{
cylinder{<6.350000,0,49.403000><6.350000,0.036000,49.403000>1.263500 translate<0,0.000000,0>}
cylinder{<6.350000,-0.1,49.403000><6.350000,0.135000,49.403000>1.136500 translate<0,0.000000,0>}}
//RN1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,19.965000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,19.415000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.230000,0.000000,19.415000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,19.015000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,18.615000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.230000,0.000000,18.615000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,18.215000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,17.815000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.230000,0.000000,17.815000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,17.415000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,16.865000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,-90.000000,0> translate<31.230000,0.000000,16.865000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,16.865000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.730000,0.000000,16.865000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<29.730000,0.000000,16.865000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.730000,0.000000,19.965000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<31.230000,0.000000,19.965000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<29.730000,0.000000,19.965000> }
object{ARC(0.200000,0.101600,90.000000,270.000000,0.036000) translate<31.230000,0.000000,19.215000>}
object{ARC(0.200000,0.101600,90.000000,270.000000,0.036000) translate<31.230000,0.000000,18.415000>}
object{ARC(0.200000,0.101600,90.000000,270.000000,0.036000) translate<31.230000,0.000000,17.615000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.730000,0.000000,16.865000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.730000,0.000000,17.415000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,90.000000,0> translate<29.730000,0.000000,17.415000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.730000,0.000000,17.815000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.730000,0.000000,18.215000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,90.000000,0> translate<29.730000,0.000000,18.215000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.730000,0.000000,18.615000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.730000,0.000000,19.015000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,90.000000,0> translate<29.730000,0.000000,19.015000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.730000,0.000000,19.415000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<29.730000,0.000000,19.965000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,90.000000,0> translate<29.730000,0.000000,19.965000> }
object{ARC(0.200000,0.101600,270.000000,450.000000,0.036000) translate<29.730000,0.000000,17.615000>}
object{ARC(0.200000,0.101600,270.000000,450.000000,0.036000) translate<29.730000,0.000000,18.415000>}
object{ARC(0.200000,0.101600,270.000000,450.000000,0.036000) translate<29.730000,0.000000,19.215000>}
//RN2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,23.215000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,23.765000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.950000,0.000000,23.765000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,24.165000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,24.565000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.950000,0.000000,24.565000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,24.965000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,25.365000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.950000,0.000000,25.365000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,25.765000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,26.315000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.950000,0.000000,26.315000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,26.315000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,26.315000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.950000,0.000000,26.315000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,23.215000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,23.215000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.950000,0.000000,23.215000> }
object{ARC(0.200000,0.101600,270.000000,450.000000,0.036000) translate<11.950000,0.000000,23.965000>}
object{ARC(0.200000,0.101600,270.000000,450.000000,0.036000) translate<11.950000,0.000000,24.765000>}
object{ARC(0.200000,0.101600,270.000000,450.000000,0.036000) translate<11.950000,0.000000,25.565000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,26.315000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,25.765000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.450000,0.000000,25.765000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,25.365000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,24.965000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.450000,0.000000,24.965000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,24.565000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,24.165000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.450000,0.000000,24.165000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,23.765000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,23.215000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.450000,0.000000,23.215000> }
object{ARC(0.200000,0.101600,90.000000,270.000000,0.036000) translate<13.450000,0.000000,25.565000>}
object{ARC(0.200000,0.101600,90.000000,270.000000,0.036000) translate<13.450000,0.000000,24.765000>}
object{ARC(0.200000,0.101600,90.000000,270.000000,0.036000) translate<13.450000,0.000000,23.965000>}
//RN3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,35.915000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,36.465000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.950000,0.000000,36.465000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,36.865000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,37.265000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.950000,0.000000,37.265000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,37.665000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,38.065000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.950000,0.000000,38.065000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,38.465000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,39.015000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.950000,0.000000,39.015000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,39.015000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,39.015000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.950000,0.000000,39.015000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,35.915000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,35.915000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.950000,0.000000,35.915000> }
object{ARC(0.200000,0.101600,270.000000,450.000000,0.036000) translate<11.950000,0.000000,36.665000>}
object{ARC(0.200000,0.101600,270.000000,450.000000,0.036000) translate<11.950000,0.000000,37.465000>}
object{ARC(0.200000,0.101600,270.000000,450.000000,0.036000) translate<11.950000,0.000000,38.265000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,39.015000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,38.465000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.450000,0.000000,38.465000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,38.065000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,37.665000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.450000,0.000000,37.665000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,37.265000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,36.865000>}
box{<0,0,-0.050800><0.400000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.450000,0.000000,36.865000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,36.465000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,35.915000>}
box{<0,0,-0.050800><0.550000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.450000,0.000000,35.915000> }
object{ARC(0.200000,0.101600,90.000000,270.000000,0.036000) translate<13.450000,0.000000,38.265000>}
object{ARC(0.200000,0.101600,90.000000,270.000000,0.036000) translate<13.450000,0.000000,37.465000>}
object{ARC(0.200000,0.101600,90.000000,270.000000,0.036000) translate<13.450000,0.000000,36.665000>}
//RX silk screen
object{ARC(0.354172,0.101600,278.802740,441.197260,0.036000) translate<3.465800,0.000000,27.940000>}
object{ARC(0.354172,0.101600,98.802740,261.197260,0.036000) translate<5.424200,0.000000,27.940000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.920000,0.000000,28.515000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.970000,0.000000,28.515000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<3.920000,0.000000,28.515000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.945000,0.000000,27.365000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.520000,0.000000,27.365000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<3.520000,0.000000,27.365000> }
difference{
cylinder{<3.595000,0,27.490000><3.595000,0.036000,27.490000>0.153800 translate<0,0.000000,0>}
cylinder{<3.595000,-0.1,27.490000><3.595000,0.135000,27.490000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<3.695000,0.000000,28.402500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.820000,0.000000,27.690000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.820000,0.000000,28.190000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<3.857500,0.000000,27.940000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.195000,0.000000,28.402500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.195000,0.000000,27.477500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.070000,0.000000,28.190000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.070000,0.000000,27.690000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<5.032500,0.000000,27.940000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-90.000000,0> translate<4.345000,0.000000,27.940000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-90.000000,0> translate<3.795000,0.000000,27.490000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-90.000000,0> translate<3.482500,0.000000,27.477500>}
//T1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,29.997400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,27.101800>}
box{<0,0,-0.076200><2.895600,0.036000,0.076200> rotate<0,-90.000000,0> translate<18.161000,0.000000,27.101800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,27.101800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,27.101800>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,27.101800> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,27.101800>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,29.997400>}
box{<0,0,-0.076200><2.895600,0.036000,0.076200> rotate<0,90.000000,0> translate<17.399000,0.000000,29.997400> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<17.399000,0.000000,29.997400>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<18.161000,0.000000,29.997400>}
box{<0,0,-0.076200><0.762000,0.036000,0.076200> rotate<0,0.000000,0> translate<17.399000,0.000000,29.997400> }
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<18.465800,0.000000,27.597100>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<18.465800,0.000000,29.527500>}
box{<-0.190500,0,-0.254000><0.190500,0.036000,0.254000> rotate<0,-270.000000,0> translate<17.094200,0.000000,28.562300>}
//TX silk screen
object{ARC(0.354172,0.101600,278.802740,441.197260,0.036000) translate<3.465800,0.000000,24.130000>}
object{ARC(0.354172,0.101600,98.802740,261.197260,0.036000) translate<5.424200,0.000000,24.130000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.920000,0.000000,24.705000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.970000,0.000000,24.705000>}
box{<0,0,-0.050800><1.050000,0.036000,0.050800> rotate<0,0.000000,0> translate<3.920000,0.000000,24.705000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<4.945000,0.000000,23.555000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<3.520000,0.000000,23.555000>}
box{<0,0,-0.050800><1.425000,0.036000,0.050800> rotate<0,0.000000,0> translate<3.520000,0.000000,23.555000> }
difference{
cylinder{<3.595000,0,23.680000><3.595000,0.036000,23.680000>0.153800 translate<0,0.000000,0>}
cylinder{<3.595000,-0.1,23.680000><3.595000,0.135000,23.680000>0.052200 translate<0,0.000000,0>}}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<3.695000,0.000000,24.592500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.820000,0.000000,23.880000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<3.820000,0.000000,24.380000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<3.857500,0.000000,24.130000>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.195000,0.000000,24.592500>}
box{<-0.162500,0,-0.250000><0.162500,0.036000,0.250000> rotate<0,-90.000000,0> translate<5.195000,0.000000,23.667500>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.070000,0.000000,24.380000>}
box{<-0.075000,0,-0.125000><0.075000,0.036000,0.125000> rotate<0,-90.000000,0> translate<5.070000,0.000000,23.880000>}
box{<-0.200000,0,-0.087500><0.200000,0.036000,0.087500> rotate<0,-90.000000,0> translate<5.032500,0.000000,24.130000>}
box{<-0.100000,0,-0.100000><0.100000,0.036000,0.100000> rotate<0,-90.000000,0> translate<4.345000,0.000000,24.130000>}
box{<-0.150000,0,-0.150000><0.150000,0.036000,0.150000> rotate<0,-90.000000,0> translate<3.795000,0.000000,23.680000>}
box{<-0.162500,0,-0.037500><0.162500,0.036000,0.037500> rotate<0,-90.000000,0> translate<3.482500,0.000000,23.667500>}
//U1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.490000,0.000000,20.010000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.490000,0.000000,20.010000>}
box{<0,0,-0.101600><7.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.490000,0.000000,20.010000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.490000,0.000000,20.010000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.490000,0.000000,13.010000>}
box{<0,0,-0.101600><7.000000,0.036000,0.101600> rotate<0,-90.000000,0> translate<43.490000,0.000000,13.010000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<43.490000,0.000000,13.010000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.490000,0.000000,13.010000>}
box{<0,0,-0.101600><7.000000,0.036000,0.101600> rotate<0,0.000000,0> translate<43.490000,0.000000,13.010000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.490000,0.000000,13.010000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<50.490000,0.000000,20.010000>}
box{<0,0,-0.101600><7.000000,0.036000,0.101600> rotate<0,90.000000,0> translate<50.490000,0.000000,20.010000> }
box{<-1.750000,0,-1.750000><1.750000,0.036000,1.750000> rotate<0,-180.000000,0> translate<48.740000,0.000000,14.760000>}
//U2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.790000,0.000000,12.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.390000,0.000000,11.710000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,-44.997030,0> translate<51.390000,0.000000,11.710000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.390000,0.000000,11.710000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.590000,0.000000,11.710000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.590000,0.000000,11.710000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.590000,0.000000,11.710000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.190000,0.000000,12.110000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,44.997030,0> translate<42.190000,0.000000,12.110000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.190000,0.000000,12.110000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.190000,0.000000,20.910000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,90.000000,0> translate<42.190000,0.000000,20.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.190000,0.000000,20.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.590000,0.000000,21.310000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,-44.997030,0> translate<42.190000,0.000000,20.910000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<42.590000,0.000000,21.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.390000,0.000000,21.310000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,0.000000,0> translate<42.590000,0.000000,21.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.390000,0.000000,21.310000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.790000,0.000000,20.910000>}
box{<0,0,-0.101600><0.565685,0.036000,0.101600> rotate<0,44.997030,0> translate<51.390000,0.000000,21.310000> }
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.790000,0.000000,20.910000>}
cylinder{<0,0,0><0,0.036000,0>0.101600 translate<51.790000,0.000000,12.110000>}
box{<0,0,-0.101600><8.800000,0.036000,0.101600> rotate<0,-90.000000,0> translate<51.790000,0.000000,12.110000> }
difference{
cylinder{<50.990000,0,12.510000><50.990000,0.036000,12.510000>0.409700 translate<0,0.000000,0>}
cylinder{<50.990000,-0.1,12.510000><50.990000,0.135000,12.510000>0.155700 translate<0,0.000000,0>}}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<52.515050,0.000000,12.510000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<52.515050,0.000000,13.310000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<52.515050,0.000000,14.110100>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<52.515050,0.000000,14.909950>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<52.515050,0.000000,15.710050>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<52.515050,0.000000,16.510000>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<52.515050,0.000000,17.309950>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<52.515050,0.000000,18.110050>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<52.515050,0.000000,18.909900>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<52.515050,0.000000,19.710000>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<52.515050,0.000000,20.510000>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<50.990000,0.000000,22.035050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<50.190000,0.000000,22.035050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<49.389900,0.000000,22.035050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<48.590050,0.000000,22.035050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<47.789950,0.000000,22.035050>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<46.990000,0.000000,22.035050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<46.190050,0.000000,22.035050>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<45.389950,0.000000,22.035050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<44.590100,0.000000,22.035050>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<43.790000,0.000000,22.035050>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<42.990000,0.000000,22.035050>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<41.464950,0.000000,20.510000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<41.464950,0.000000,19.710000>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<41.464950,0.000000,18.909900>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<41.464950,0.000000,18.110050>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<41.464950,0.000000,17.309950>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<41.464950,0.000000,16.510000>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<41.464950,0.000000,15.710050>}
box{<-0.575050,0,-0.200050><0.575050,0.036000,0.200050> rotate<0,-180.000000,0> translate<41.464950,0.000000,14.909950>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<41.464950,0.000000,14.110100>}
box{<-0.575050,0,-0.200000><0.575050,0.036000,0.200000> rotate<0,-180.000000,0> translate<41.464950,0.000000,13.310000>}
box{<-0.575050,0,-0.199900><0.575050,0.036000,0.199900> rotate<0,-180.000000,0> translate<41.464950,0.000000,12.510000>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<42.990000,0.000000,10.984950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<43.790000,0.000000,10.984950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<44.590100,0.000000,10.984950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<45.389950,0.000000,10.984950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<46.190050,0.000000,10.984950>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<46.990000,0.000000,10.984950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<47.789950,0.000000,10.984950>}
box{<-0.200050,0,-0.575050><0.200050,0.036000,0.575050> rotate<0,-180.000000,0> translate<48.590050,0.000000,10.984950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<49.389900,0.000000,10.984950>}
box{<-0.200000,0,-0.575050><0.200000,0.036000,0.575050> rotate<0,-180.000000,0> translate<50.190000,0.000000,10.984950>}
box{<-0.199900,0,-0.575050><0.199900,0.036000,0.575050> rotate<0,-180.000000,0> translate<50.990000,0.000000,10.984950>}
//U3 silk screen
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575000,0.000000,15.723000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,15.723000>}
box{<0,0,-0.076200><1.620000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.955000,0.000000,15.723000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,15.723000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,18.567000>}
box{<0,0,-0.076200><2.844000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.955000,0.000000,18.567000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,18.567000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575000,0.000000,18.567000>}
box{<0,0,-0.076200><1.620000,0.036000,0.076200> rotate<0,0.000000,0> translate<23.955000,0.000000,18.567000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575000,0.000000,18.567000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575000,0.000000,15.723000>}
box{<0,0,-0.076200><2.844000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.575000,0.000000,15.723000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575000,0.000000,17.667000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575000,0.000000,16.623000>}
box{<0,0,-0.076200><1.044000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.575000,0.000000,16.623000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,17.573000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,17.667000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.955000,0.000000,17.667000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,16.623000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,16.717000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.955000,0.000000,16.717000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,18.473000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,18.567000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.955000,0.000000,18.567000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,15.723000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<23.955000,0.000000,15.817000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,90.000000,0> translate<23.955000,0.000000,15.817000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575000,0.000000,15.817000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575000,0.000000,15.723000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.575000,0.000000,15.723000> }
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575000,0.000000,18.567000>}
cylinder{<0,0,0><0,0.036000,0>0.076200 translate<25.575000,0.000000,18.473000>}
box{<0,0,-0.076200><0.094000,0.036000,0.076200> rotate<0,-90.000000,0> translate<25.575000,0.000000,18.473000> }
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-270.000000,0> translate<23.590000,0.000000,18.095000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-270.000000,0> translate<23.590000,0.000000,17.145000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-270.000000,0> translate<23.590000,0.000000,16.195000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-270.000000,0> translate<25.940000,0.000000,16.195000>}
box{<-0.250000,0,-0.325000><0.250000,0.036000,0.325000> rotate<0,-270.000000,0> translate<25.940000,0.000000,18.095000>}
//Y1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.145000,0.000000,26.975000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.645000,0.000000,26.975000>}
box{<0,0,-0.063500><2.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.645000,0.000000,26.975000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.645000,0.000000,26.975000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.645000,0.000000,30.175000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,90.000000,0> translate<47.645000,0.000000,30.175000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<47.645000,0.000000,30.175000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.145000,0.000000,30.175000>}
box{<0,0,-0.063500><2.500000,0.036000,0.063500> rotate<0,0.000000,0> translate<47.645000,0.000000,30.175000> }
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.145000,0.000000,30.175000>}
cylinder{<0,0,0><0,0.036000,0>0.063500 translate<50.145000,0.000000,26.975000>}
box{<0,0,-0.063500><3.200000,0.036000,0.063500> rotate<0,-90.000000,0> translate<50.145000,0.000000,26.975000> }
//Z1 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,34.640000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,34.640000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.950000,0.000000,34.640000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,34.640000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,33.940000>}
box{<0,0,-0.050800><0.700000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.450000,0.000000,33.940000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,33.940000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,33.940000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.950000,0.000000,33.940000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,33.940000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,34.640000>}
box{<0,0,-0.050800><0.700000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.950000,0.000000,34.640000> }
box{<-0.175000,0,-0.350000><0.175000,0.036000,0.350000> rotate<0,-0.000000,0> translate<12.125000,0.000000,34.290000>}
box{<-0.175000,0,-0.350000><0.175000,0.036000,0.350000> rotate<0,-180.000000,0> translate<13.275000,0.000000,34.290000>}
//Z2 silk screen
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,40.990000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,40.990000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.950000,0.000000,40.990000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,40.990000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,40.290000>}
box{<0,0,-0.050800><0.700000,0.036000,0.050800> rotate<0,-90.000000,0> translate<13.450000,0.000000,40.290000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<13.450000,0.000000,40.290000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,40.290000>}
box{<0,0,-0.050800><1.500000,0.036000,0.050800> rotate<0,0.000000,0> translate<11.950000,0.000000,40.290000> }
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,40.290000>}
cylinder{<0,0,0><0,0.036000,0>0.050800 translate<11.950000,0.000000,40.990000>}
box{<0,0,-0.050800><0.700000,0.036000,0.050800> rotate<0,90.000000,0> translate<11.950000,0.000000,40.990000> }
box{<-0.175000,0,-0.350000><0.175000,0.036000,0.350000> rotate<0,-0.000000,0> translate<12.125000,0.000000,40.640000>}
box{<-0.175000,0,-0.350000><0.175000,0.036000,0.350000> rotate<0,-180.000000,0> translate<13.275000,0.000000,40.640000>}
texture{col_slk}
}
#end
translate<mac_x_ver,mac_y_ver,mac_z_ver>
rotate<mac_x_rot,mac_y_rot,mac_z_rot>
}//End union
#end

#if(use_file_as_inc=off)
object{  ARDUINO_LEONARDO_REV3B(-34.290000,0,-26.670000,pcb_rotate_x,pcb_rotate_y,pcb_rotate_z)
#if(pcb_upsidedown=on)
rotate pcb_rotdir*180
#end
}
#end


//Parts not found in 3dpack.dat or 3dusrpac.dat are:
//C1	100n	C0603-ROUND
//C2	100n	C0603-ROUND
//C3	22p	C0603-ROUND
//C4	22p	C0603-ROUND
//C5	1uF	C0603-ROUND
//C6	100n	C0603-ROUND
//C7	1uF	C0603-ROUND
//C8	10u	SMC_B
//C9	100n	C0603-ROUND
//C10	10u	SMC_B
//C11	1u	C0603-ROUND
//C12	10u	SMC_B
//C13	100n	C0603-ROUND
//C14	1u	C0603-ROUND
//C22	100n	C0603-ROUND
//EXTPOWER	POWERSUPPLY_DC21MMX	POWERSUPPLY_DC-21MM
//F1	MF-MSMF050-2 500mA	L1812
//FID1	FIDUCIALMOUNT	FIDUCIA-MOUNT
//FID2	FIDUCIALMOUNT	FIDUCIA-MOUNT
//FID3	FIDUCIALMOUNT	FIDUCIA-MOUNT
//IC2	LMV358IDGKR	MSOP08
//J1	USB MICRO	CON2_USB_MICRO_B_AT
//L1	MH2029-300Y	0805
//L2	MH2029-300Y	0805
//ORIGIN	TP_SP	TP-SP
//R1	1M	R0603-ROUND
//RESET	TS42	TS42
//RN1	10K	CAY16
//RN2	1K	CAY16
//RN3	22R	CAY16
//T1	FDN340P	SOT-23
//U1	ATMEGA32U4-XUMU	QFN44ML7X7
//U2	ATMEGA32U4-XUAU	TQFP44-PAD
//U3	LP2985-33DBVR	SOT23-DBV
//Y1	16MHz KX-7	CRYSTAL-3.2-2.5
//Z1	CG0603MLC-05E	CT/CN0603
//Z2	CG0603MLC-05E	CT/CN0603
