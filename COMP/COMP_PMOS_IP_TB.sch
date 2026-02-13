v {xschem version=3.4.8RC file_version=1.3}
G {}
K {}
V {}
S {}
F {}
E {}
B 2 0 -810 800 -410 {flags=graph
y1=-0.011
y2=1.6
ypos1=-0.011
ypos2=1.6
divy=5
subdivy=1
unity=1
x1=1.2418998e-08
x2=5e-06
divx=5
subdivx=1
xlabmag=1.0
ylabmag=1.0
node="voutp
voutn
vinp
vinn
clk"
color="4 10 7 9 1"
dataset=-1
unitx=1
logx=0
logy=0
rawfile=$netlist_dir/COMP_PMOS_IP_TB.raw
autoload=1
sim_type=tran
digital=1}
N 30 -160 30 -140 {lab=GND}
N 110 -160 110 -140 {lab=GND}
N 30 -240 30 -220 {lab=VDD}
N 110 -240 110 -220 {lab=AVSS}
N 180 -160 180 -140 {lab=GND}
N 180 -240 180 -220 {lab=CLK}
N 450 -160 450 -140 {lab=GND}
N 450 -240 450 -220 {lab=VINP}
N 900 -270 920 -270 {lab=VINP}
N 900 -290 920 -290 {lab=VINN}
N 730 -160 730 -140 {lab=GND}
N 730 -240 730 -220 {lab=VINN}
N 1280 -290 1340 -290 {lab=VOUTN}
N 1280 -390 1280 -370 {lab=GND}
N 1280 -310 1280 -290 {lab=VOUTN}
N 1220 -290 1280 -290 {lab=VOUTN}
N 1280 -190 1280 -170 {lab=GND}
N 1280 -270 1280 -250 {lab=VOUTP}
N 1280 -270 1340 -270 {lab=VOUTP}
N 1220 -270 1280 -270 {lab=VOUTP}
N 550 -120 590 -120 {lab=VDD}
N 550 -180 550 -120 {lab=VDD}
N 550 -180 590 -180 {lab=VDD}
N 590 -180 590 -120 {lab=VDD}
N 560 -340 600 -340 {lab=CLK_B}
N 440 -340 480 -340 {lab=CLK}
C {vsource.sym} 30 -190 0 0 {name=V1 value=1.5 savecurrent=false}
C {vsource.sym} 110 -190 0 0 {name=V2 value=0 savecurrent=false}
C {gnd.sym} 110 -140 0 0 {name=l1 lab=GND}
C {gnd.sym} 30 -140 0 0 {name=l2 lab=GND}
C {lab_pin.sym} 30 -240 1 0 {name=p1 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 110 -240 1 0 {name=p2 sig_type=std_logic lab=AVSS}
C {lab_pin.sym} 1130 -210 3 0 {name=p3 sig_type=std_logic lab=AVSS}
C {lab_pin.sym} 1080 -210 3 0 {name=p4 sig_type=std_logic lab=AVSS}
C {lab_pin.sym} 1050 -350 1 0 {name=p5 sig_type=std_logic lab=VDD}
C {lab_pin.sym} 1100 -350 1 0 {name=p6 sig_type=std_logic lab=VDD}
C {vsource.sym} 180 -190 0 0 {name=V3 value="PULSE(0 1.5 0 100p 100p 200n 400n 1000)" savecurrent=false}
C {gnd.sym} 180 -140 0 0 {name=l3 lab=GND}
C {lab_pin.sym} 180 -240 1 0 {name=p7 sig_type=std_logic lab=CLK}
C {vsource.sym} 450 -190 0 0 {name=V4 value=0.795 savecurrent=false}
C {gnd.sym} 450 -140 0 0 {name=l4 lab=GND}
C {lab_pin.sym} 450 -240 1 0 {name=p9 sig_type=std_logic lab=VINP}
C {lab_pin.sym} 900 -270 0 0 {name=p10 sig_type=std_logic lab=VINP}
C {lab_pin.sym} 900 -290 0 0 {name=p11 sig_type=std_logic lab=VINN}
C {lab_pin.sym} 1340 -290 2 0 {name=p12 sig_type=std_logic lab=VOUTN}
C {lab_pin.sym} 1340 -270 2 0 {name=p13 sig_type=std_logic lab=VOUTP}
C {vsource.sym} 730 -190 0 0 {name=V5 value=0.8 savecurrent=false}
C {gnd.sym} 730 -140 0 0 {name=l5 lab=GND}
C {devices/code_shown.sym} -540 -370 0 0 {name="NGSPICE" only_toplevel=true 
value="
**.ic v(voutn)=0 v(voutp)=1.5
.include sg13g2_stdcell.spice
.option wnflag=1
.option savecurrents
.temp 27
.control
save all 
op
show m : gm : gmbs : gds : vds : vdsat : vgs : vth : id
write COMP_PMOS_IP_TB.raw
set appendwrite
tran 10n 5u 1n
plot v(voutn) v(voutp) v(clk) v(vinn)
write COMP_PMOS_IP_TB.raw
.endc
"}
C {simulator_commands_shown.sym} -360 -530 0 0 {
name=Libs_Ngspice
simulator=ngspice
only_toplevel=false
value="
.lib cornerMOSlv.lib mos_tt
.lib cornerMOShv.lib mos_tt
.lib cornerHBT.lib hbt_typ
.lib cornerRES.lib res_typ
.lib cornerCAP.lib cap_typ
"
      }
C {capa.sym} 1280 -340 2 0 {name=C1
m=1
value=500f
footprint=1206
device="ceramic capacitor"
}
C {gnd.sym} 1280 -390 2 0 {name=l6 lab=GND
}
C {capa.sym} 1280 -220 0 1 {name=C2
m=1
value=500f
footprint=1206
device="ceramic capacitor"
}
C {gnd.sym} 1280 -170 0 1 {name=l7 lab=GND
}
C {lab_pin.sym} 730 -240 1 0 {name=p14 sig_type=std_logic lab=VINN}
C {devices/launcher.sym} 940 -520 0 0 {name=h3
descr="Load waves" 
tclcommand="
xschem raw_read $netlist_dir/[file rootname [file tail [xschem get current_name]]].raw dc
xschem setprop rect 2 0 fullxzoom
"
}
C {sg13g2_pr/sg13_lv_pmos.sym} 570 -150 0 0 {name=M1
l=0.13u
w=0.15u
ng=1
m=1
model=sg13_lv_pmos
spiceprefix=X
}
C {lab_pin.sym} 590 -180 1 0 {name=p15 sig_type=std_logic lab=VDD}
C {devices/code.sym} -360 -730 0 0 {name=SAVE_COMMANDS only_toplevel=true 
value="

.save @n.xm1.nsg13_lv_pmos[ids]
.save @n.xm1.nsg13_lv_pmos[gm]
.save @n.xm1.nsg13_lv_pmos[gds]
.save @n.xm1.nsg13_lv_pmos[vth]
.save @n.xm1.nsg13_lv_pmos[vgs]
.save @n.xm1.nsg13_lv_pmos[vdss]
.save @n.xm1.nsg13_lv_pmos[vds]
.save @n.xm1.nsg13_lv_pmos[cgg]
.save @n.xm1.nsg13_lv_pmos[cgsol]
.save @n.xm1.nsg13_lv_pmos[cgdol]
.save @n.x1.xmp_vip.nsg13_lv_pmos[ids]
.save @n.x1.xmp_vip.nsg13_lv_pmos[gm]
.save @n.x1.xmp_vip.nsg13_lv_pmos[gds]
.save @n.x1.xmp_vip.nsg13_lv_pmos[vth]
.save @n.x1.xmp_vip.nsg13_lv_pmos[vgs]
.save @n.x1.xmp_vip.nsg13_lv_pmos[vdss]
.save @n.x1.xmp_vip.nsg13_lv_pmos[vds]
.save @n.x1.xmp_vip.nsg13_lv_pmos[cgg]
.save @n.x1.xmp_vip.nsg13_lv_pmos[cgsol]
.save @n.x1.xmp_vip.nsg13_lv_pmos[cgdol]
.save @n.x1.xmp_vin.nsg13_lv_pmos[ids]
.save @n.x1.xmp_vin.nsg13_lv_pmos[gm]
.save @n.x1.xmp_vin.nsg13_lv_pmos[gds]
.save @n.x1.xmp_vin.nsg13_lv_pmos[vth]
.save @n.x1.xmp_vin.nsg13_lv_pmos[vgs]
.save @n.x1.xmp_vin.nsg13_lv_pmos[vdss]
.save @n.x1.xmp_vin.nsg13_lv_pmos[vds]
.save @n.x1.xmp_vin.nsg13_lv_pmos[cgg]
.save @n.x1.xmp_vin.nsg13_lv_pmos[cgsol]
.save @n.x1.xmp_vin.nsg13_lv_pmos[cgdol]
.save @n.x1.xmp_crs_cp1.nsg13_lv_pmos[ids]
.save @n.x1.xmp_crs_cp1.nsg13_lv_pmos[gm]
.save @n.x1.xmp_crs_cp1.nsg13_lv_pmos[gds]
.save @n.x1.xmp_crs_cp1.nsg13_lv_pmos[vth]
.save @n.x1.xmp_crs_cp1.nsg13_lv_pmos[vgs]
.save @n.x1.xmp_crs_cp1.nsg13_lv_pmos[vdss]
.save @n.x1.xmp_crs_cp1.nsg13_lv_pmos[vds]
.save @n.x1.xmp_crs_cp1.nsg13_lv_pmos[cgg]
.save @n.x1.xmp_crs_cp1.nsg13_lv_pmos[cgsol]
.save @n.x1.xmp_crs_cp1.nsg13_lv_pmos[cgdol]
.save @n.x1.xmp_crs_cp2.nsg13_lv_pmos[ids]
.save @n.x1.xmp_crs_cp2.nsg13_lv_pmos[gm]
.save @n.x1.xmp_crs_cp2.nsg13_lv_pmos[gds]
.save @n.x1.xmp_crs_cp2.nsg13_lv_pmos[vth]
.save @n.x1.xmp_crs_cp2.nsg13_lv_pmos[vgs]
.save @n.x1.xmp_crs_cp2.nsg13_lv_pmos[vdss]
.save @n.x1.xmp_crs_cp2.nsg13_lv_pmos[vds]
.save @n.x1.xmp_crs_cp2.nsg13_lv_pmos[cgg]
.save @n.x1.xmp_crs_cp2.nsg13_lv_pmos[cgsol]
.save @n.x1.xmp_crs_cp2.nsg13_lv_pmos[cgdol]
.save @n.x1.xm5.nsg13_lv_pmos[ids]
.save @n.x1.xm5.nsg13_lv_pmos[gm]
.save @n.x1.xm5.nsg13_lv_pmos[gds]
.save @n.x1.xm5.nsg13_lv_pmos[vth]
.save @n.x1.xm5.nsg13_lv_pmos[vgs]
.save @n.x1.xm5.nsg13_lv_pmos[vdss]
.save @n.x1.xm5.nsg13_lv_pmos[vds]
.save @n.x1.xm5.nsg13_lv_pmos[cgg]
.save @n.x1.xm5.nsg13_lv_pmos[cgsol]
.save @n.x1.xm5.nsg13_lv_pmos[cgdol]
.save @n.x1.xmn_crs_cp2.nsg13_lv_nmos[ids]
.save @n.x1.xmn_crs_cp2.nsg13_lv_nmos[gm]
.save @n.x1.xmn_crs_cp2.nsg13_lv_nmos[gds]
.save @n.x1.xmn_crs_cp2.nsg13_lv_nmos[vth]
.save @n.x1.xmn_crs_cp2.nsg13_lv_nmos[vgs]
.save @n.x1.xmn_crs_cp2.nsg13_lv_nmos[vdss]
.save @n.x1.xmn_crs_cp2.nsg13_lv_nmos[vds]
.save @n.x1.xmn_crs_cp2.nsg13_lv_nmos[cgg]
.save @n.x1.xmn_crs_cp2.nsg13_lv_nmos[cgsol]
.save @n.x1.xmn_crs_cp2.nsg13_lv_nmos[cgdol]
.save @n.x1.xmn_crs_cp1.nsg13_lv_nmos[ids]
.save @n.x1.xmn_crs_cp1.nsg13_lv_nmos[gm]
.save @n.x1.xmn_crs_cp1.nsg13_lv_nmos[gds]
.save @n.x1.xmn_crs_cp1.nsg13_lv_nmos[vth]
.save @n.x1.xmn_crs_cp1.nsg13_lv_nmos[vgs]
.save @n.x1.xmn_crs_cp1.nsg13_lv_nmos[vdss]
.save @n.x1.xmn_crs_cp1.nsg13_lv_nmos[vds]
.save @n.x1.xmn_crs_cp1.nsg13_lv_nmos[cgg]
.save @n.x1.xmn_crs_cp1.nsg13_lv_nmos[cgsol]
.save @n.x1.xmn_crs_cp1.nsg13_lv_nmos[cgdol]
.save @n.x1.xmn_pc_out_p.nsg13_lv_nmos[ids]
.save @n.x1.xmn_pc_out_p.nsg13_lv_nmos[gm]
.save @n.x1.xmn_pc_out_p.nsg13_lv_nmos[gds]
.save @n.x1.xmn_pc_out_p.nsg13_lv_nmos[vth]
.save @n.x1.xmn_pc_out_p.nsg13_lv_nmos[vgs]
.save @n.x1.xmn_pc_out_p.nsg13_lv_nmos[vdss]
.save @n.x1.xmn_pc_out_p.nsg13_lv_nmos[vds]
.save @n.x1.xmn_pc_out_p.nsg13_lv_nmos[cgg]
.save @n.x1.xmn_pc_out_p.nsg13_lv_nmos[cgsol]
.save @n.x1.xmn_pc_out_p.nsg13_lv_nmos[cgdol]
.save @n.x1.xmn_pc_out_n.nsg13_lv_nmos[ids]
.save @n.x1.xmn_pc_out_n.nsg13_lv_nmos[gm]
.save @n.x1.xmn_pc_out_n.nsg13_lv_nmos[gds]
.save @n.x1.xmn_pc_out_n.nsg13_lv_nmos[vth]
.save @n.x1.xmn_pc_out_n.nsg13_lv_nmos[vgs]
.save @n.x1.xmn_pc_out_n.nsg13_lv_nmos[vdss]
.save @n.x1.xmn_pc_out_n.nsg13_lv_nmos[vds]
.save @n.x1.xmn_pc_out_n.nsg13_lv_nmos[cgg]
.save @n.x1.xmn_pc_out_n.nsg13_lv_nmos[cgsol]
.save @n.x1.xmn_pc_out_n.nsg13_lv_nmos[cgdol]
.save @n.x1.xmn_pc_ip_p.nsg13_lv_nmos[ids]
.save @n.x1.xmn_pc_ip_p.nsg13_lv_nmos[gm]
.save @n.x1.xmn_pc_ip_p.nsg13_lv_nmos[gds]
.save @n.x1.xmn_pc_ip_p.nsg13_lv_nmos[vth]
.save @n.x1.xmn_pc_ip_p.nsg13_lv_nmos[vgs]
.save @n.x1.xmn_pc_ip_p.nsg13_lv_nmos[vdss]
.save @n.x1.xmn_pc_ip_p.nsg13_lv_nmos[vds]
.save @n.x1.xmn_pc_ip_p.nsg13_lv_nmos[cgg]
.save @n.x1.xmn_pc_ip_p.nsg13_lv_nmos[cgsol]
.save @n.x1.xmn_pc_ip_p.nsg13_lv_nmos[cgdol]
.save @n.x1.xmn_pc_ip_n.nsg13_lv_nmos[ids]
.save @n.x1.xmn_pc_ip_n.nsg13_lv_nmos[gm]
.save @n.x1.xmn_pc_ip_n.nsg13_lv_nmos[gds]
.save @n.x1.xmn_pc_ip_n.nsg13_lv_nmos[vth]
.save @n.x1.xmn_pc_ip_n.nsg13_lv_nmos[vgs]
.save @n.x1.xmn_pc_ip_n.nsg13_lv_nmos[vdss]
.save @n.x1.xmn_pc_ip_n.nsg13_lv_nmos[vds]
.save @n.x1.xmn_pc_ip_n.nsg13_lv_nmos[cgg]
.save @n.x1.xmn_pc_ip_n.nsg13_lv_nmos[cgsol]
.save @n.x1.xmn_pc_ip_n.nsg13_lv_nmos[cgdol]
.save @n.x1.xm12.nsg13_lv_nmos[ids]
.save @n.x1.xm12.nsg13_lv_nmos[gm]
.save @n.x1.xm12.nsg13_lv_nmos[gds]
.save @n.x1.xm12.nsg13_lv_nmos[vth]
.save @n.x1.xm12.nsg13_lv_nmos[vgs]
.save @n.x1.xm12.nsg13_lv_nmos[vdss]
.save @n.x1.xm12.nsg13_lv_nmos[vds]
.save @n.x1.xm12.nsg13_lv_nmos[cgg]
.save @n.x1.xm12.nsg13_lv_nmos[cgsol]
.save @n.x1.xm12.nsg13_lv_nmos[cgdol]
.save @n.x1.xm13.nsg13_lv_pmos[ids]
.save @n.x1.xm13.nsg13_lv_pmos[gm]
.save @n.x1.xm13.nsg13_lv_pmos[gds]
.save @n.x1.xm13.nsg13_lv_pmos[vth]
.save @n.x1.xm13.nsg13_lv_pmos[vgs]
.save @n.x1.xm13.nsg13_lv_pmos[vdss]
.save @n.x1.xm13.nsg13_lv_pmos[vds]
.save @n.x1.xm13.nsg13_lv_pmos[cgg]
.save @n.x1.xm13.nsg13_lv_pmos[cgsol]
.save @n.x1.xm13.nsg13_lv_pmos[cgdol]
.save @n.x1.xm14.nsg13_lv_nmos[ids]
.save @n.x1.xm14.nsg13_lv_nmos[gm]
.save @n.x1.xm14.nsg13_lv_nmos[gds]
.save @n.x1.xm14.nsg13_lv_nmos[vth]
.save @n.x1.xm14.nsg13_lv_nmos[vgs]
.save @n.x1.xm14.nsg13_lv_nmos[vdss]
.save @n.x1.xm14.nsg13_lv_nmos[vds]
.save @n.x1.xm14.nsg13_lv_nmos[cgg]
.save @n.x1.xm14.nsg13_lv_nmos[cgsol]
.save @n.x1.xm14.nsg13_lv_nmos[cgdol]
.save @n.x1.xm15.nsg13_lv_pmos[ids]
.save @n.x1.xm15.nsg13_lv_pmos[gm]
.save @n.x1.xm15.nsg13_lv_pmos[gds]
.save @n.x1.xm15.nsg13_lv_pmos[vth]
.save @n.x1.xm15.nsg13_lv_pmos[vgs]
.save @n.x1.xm15.nsg13_lv_pmos[vdss]
.save @n.x1.xm15.nsg13_lv_pmos[vds]
.save @n.x1.xm15.nsg13_lv_pmos[cgg]
.save @n.x1.xm15.nsg13_lv_pmos[cgsol]
.save @n.x1.xm15.nsg13_lv_pmos[cgdol]
"}
C {devices/launcher.sym} 940 -470 0 0 {name=h2
descr="OP annotate" 
tclcommand="xschem annotate_op"
}
C {sg13g2_pr/annotate_fet_params.sym} 820 -200 0 0 {name=annot1 ref=M1}
C {title.sym} 160 -30 0 0 {name=l8 author="Nithin Purushothama"}
C {/foss/designs/SAR_ADC_8_Bit_IHP130/COMP/COMP_PMOS_IP.sym} 590 -120 0 0 {name=x1}
C {sg13g2_stdcells/sg13g2_inv_1.sym} 520 -340 0 0 {name=x2 VDD=VDD VSS=AVSS prefix=sg13g2_ }
C {lab_pin.sym} 440 -340 0 0 {name=p16 sig_type=std_logic lab=CLK}
C {lab_pin.sym} 600 -340 2 0 {name=p17 sig_type=std_logic lab=CLK_B}
C {lab_pin.sym} 1030 -210 3 0 {name=p8 sig_type=std_logic lab=CLK_B}
