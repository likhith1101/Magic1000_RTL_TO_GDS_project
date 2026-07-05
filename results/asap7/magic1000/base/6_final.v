module magic1000_core_orfs (clk,
    halt_on_nop,
    halted,
    out_valid,
    rst,
    run,
    data_addr,
    data_in,
    instr_addr,
    instr_in,
    out_a,
    out_b,
    reg0,
    reg1,
    reg2,
    reg3);
 input clk;
 input halt_on_nop;
 output halted;
 output out_valid;
 input rst;
 input run;
 output [3:0] data_addr;
 input [3:0] data_in;
 output [3:0] instr_addr;
 input [15:0] instr_in;
 output [3:0] out_a;
 output [3:0] out_b;
 output [3:0] reg0;
 output [3:0] reg1;
 output [3:0] reg2;
 output [3:0] reg3;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _094_;
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _124_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _131_;
 wire _133_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire _180_;
 wire _181_;
 wire _182_;
 wire _183_;
 wire _184_;
 wire _185_;
 wire _186_;
 wire _187_;
 wire _188_;
 wire _189_;
 wire _190_;
 wire _191_;
 wire _192_;
 wire _193_;
 wire _194_;
 wire _195_;
 wire _198_;
 wire _199_;
 wire _200_;
 wire _201_;
 wire _203_;
 wire _204_;
 wire _205_;
 wire _206_;
 wire _208_;
 wire _209_;
 wire _210_;
 wire _211_;
 wire _212_;
 wire _213_;
 wire _214_;
 wire _215_;
 wire _216_;
 wire _217_;
 wire _218_;
 wire _219_;
 wire _220_;
 wire _221_;
 wire _222_;
 wire _223_;
 wire _224_;
 wire _225_;
 wire _226_;
 wire _227_;
 wire _228_;
 wire _229_;
 wire _230_;
 wire _231_;
 wire _232_;
 wire _233_;
 wire _234_;
 wire _235_;
 wire _236_;
 wire _237_;
 wire _238_;
 wire \alu.a[0] ;
 wire \alu.a[1] ;
 wire \alu.a[2] ;
 wire \alu.a[3] ;
 wire \alu.b[0] ;
 wire \alu.b[1] ;
 wire \alu.b[2] ;
 wire \alu.b[3] ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net16;
 wire net17;
 wire clknet_0_clk;
 wire clknet_2_0__leaf_clk;
 wire clknet_2_1__leaf_clk;
 wire clknet_2_2__leaf_clk;
 wire clknet_2_3__leaf_clk;

 INVx1_ASAP7_75t_R _239_ (.A(_001_),
    .Y(net18));
 INVx1_ASAP7_75t_R _240_ (.A(_002_),
    .Y(net31));
 INVx1_ASAP7_75t_R _241_ (.A(_003_),
    .Y(net26));
 INVx1_ASAP7_75t_R _242_ (.A(_006_),
    .Y(net35));
 NAND2x1_ASAP7_75t_R _245_ (.A(_008_),
    .B(net15),
    .Y(_087_));
 INVx1_ASAP7_75t_R _246_ (.A(net14),
    .Y(_088_));
 OA211x2_ASAP7_75t_R _247_ (.A1(net35),
    .A2(net15),
    .B(_087_),
    .C(_088_),
    .Y(_089_));
 INVx1_ASAP7_75t_R _248_ (.A(_007_),
    .Y(net39));
 NAND2x1_ASAP7_75t_R _249_ (.A(_009_),
    .B(net15),
    .Y(_090_));
 OA211x2_ASAP7_75t_R _250_ (.A1(net39),
    .A2(net15),
    .B(_090_),
    .C(net14),
    .Y(_091_));
 OR2x2_ASAP7_75t_R _251_ (.A(_089_),
    .B(_091_),
    .Y(\alu.a[3] ));
 INVx1_ASAP7_75t_R _252_ (.A(_004_),
    .Y(net22));
 INVx1_ASAP7_75t_R _253_ (.A(_005_),
    .Y(net30));
 INVx1_ASAP7_75t_R _254_ (.A(_009_),
    .Y(net47));
 NOR2x1_ASAP7_75t_R _257_ (.A(_008_),
    .B(net12),
    .Y(_094_));
 AO21x1_ASAP7_75t_R _258_ (.A1(net47),
    .A2(net12),
    .B(_094_),
    .Y(_095_));
 NAND2x1_ASAP7_75t_R _259_ (.A(_007_),
    .B(net12),
    .Y(_096_));
 INVx1_ASAP7_75t_R _260_ (.A(net13),
    .Y(_097_));
 OA211x2_ASAP7_75t_R _261_ (.A1(net35),
    .A2(net12),
    .B(_096_),
    .C(_097_),
    .Y(_098_));
 AO21x1_ASAP7_75t_R _262_ (.A1(net13),
    .A2(_095_),
    .B(_098_),
    .Y(\alu.b[3] ));
 INVx1_ASAP7_75t_R _263_ (.A(_008_),
    .Y(net43));
 INVx1_ASAP7_75t_R _264_ (.A(_010_),
    .Y(net40));
 INVx1_ASAP7_75t_R _265_ (.A(_011_),
    .Y(net41));
 INVx1_ASAP7_75t_R _266_ (.A(_012_),
    .Y(net42));
 INVx1_ASAP7_75t_R _267_ (.A(_013_),
    .Y(net36));
 INVx1_ASAP7_75t_R _268_ (.A(_014_),
    .Y(net37));
 INVx1_ASAP7_75t_R _269_ (.A(_015_),
    .Y(net38));
 INVx1_ASAP7_75t_R _270_ (.A(_016_),
    .Y(net32));
 INVx1_ASAP7_75t_R _271_ (.A(_017_),
    .Y(net33));
 INVx1_ASAP7_75t_R _272_ (.A(_018_),
    .Y(net34));
 INVx1_ASAP7_75t_R _273_ (.A(_019_),
    .Y(net44));
 INVx1_ASAP7_75t_R _274_ (.A(_020_),
    .Y(net45));
 INVx1_ASAP7_75t_R _275_ (.A(_021_),
    .Y(net46));
 INVx1_ASAP7_75t_R _276_ (.A(_000_),
    .Y(net19));
 INVx1_ASAP7_75t_R _277_ (.A(_022_),
    .Y(net20));
 INVx1_ASAP7_75t_R _278_ (.A(_023_),
    .Y(net21));
 INVx1_ASAP7_75t_R _279_ (.A(_024_),
    .Y(net27));
 NOR2x1_ASAP7_75t_R _280_ (.A(_010_),
    .B(net12),
    .Y(_099_));
 AO21x1_ASAP7_75t_R _281_ (.A1(net44),
    .A2(net12),
    .B(_099_),
    .Y(_100_));
 NAND2x1_ASAP7_75t_R _282_ (.A(_013_),
    .B(net12),
    .Y(_101_));
 OA211x2_ASAP7_75t_R _283_ (.A1(net32),
    .A2(net12),
    .B(_101_),
    .C(_097_),
    .Y(_102_));
 AO21x1_ASAP7_75t_R _284_ (.A1(net13),
    .A2(_100_),
    .B(_102_),
    .Y(\alu.b[0] ));
 INVx1_ASAP7_75t_R _285_ (.A(_025_),
    .Y(net28));
 NOR2x1_ASAP7_75t_R _286_ (.A(_011_),
    .B(net12),
    .Y(_103_));
 AO21x1_ASAP7_75t_R _287_ (.A1(net45),
    .A2(net12),
    .B(_103_),
    .Y(_104_));
 NAND2x1_ASAP7_75t_R _288_ (.A(_014_),
    .B(net12),
    .Y(_105_));
 OA211x2_ASAP7_75t_R _289_ (.A1(net33),
    .A2(net12),
    .B(_105_),
    .C(_097_),
    .Y(_106_));
 AO21x1_ASAP7_75t_R _290_ (.A1(net13),
    .A2(_104_),
    .B(_106_),
    .Y(\alu.b[1] ));
 INVx1_ASAP7_75t_R _291_ (.A(_026_),
    .Y(net29));
 NOR2x1_ASAP7_75t_R _292_ (.A(_012_),
    .B(net12),
    .Y(_107_));
 AO21x1_ASAP7_75t_R _293_ (.A1(net46),
    .A2(net12),
    .B(_107_),
    .Y(_108_));
 NAND2x1_ASAP7_75t_R _294_ (.A(_015_),
    .B(net12),
    .Y(_109_));
 OA211x2_ASAP7_75t_R _295_ (.A1(net34),
    .A2(net12),
    .B(_109_),
    .C(_097_),
    .Y(_110_));
 AO21x1_ASAP7_75t_R _296_ (.A1(net13),
    .A2(_108_),
    .B(_110_),
    .Y(\alu.b[2] ));
 INVx1_ASAP7_75t_R _297_ (.A(_027_),
    .Y(net23));
 NAND2x1_ASAP7_75t_R _298_ (.A(_010_),
    .B(net15),
    .Y(_111_));
 OA211x2_ASAP7_75t_R _299_ (.A1(net32),
    .A2(net15),
    .B(_111_),
    .C(_088_),
    .Y(_112_));
 NAND2x1_ASAP7_75t_R _300_ (.A(_019_),
    .B(net15),
    .Y(_113_));
 OA211x2_ASAP7_75t_R _301_ (.A1(net36),
    .A2(net15),
    .B(_113_),
    .C(net14),
    .Y(_114_));
 OR2x2_ASAP7_75t_R _302_ (.A(_112_),
    .B(_114_),
    .Y(\alu.a[0] ));
 INVx1_ASAP7_75t_R _303_ (.A(_028_),
    .Y(net24));
 NOR2x1_ASAP7_75t_R _304_ (.A(_014_),
    .B(net15),
    .Y(_115_));
 AO21x1_ASAP7_75t_R _305_ (.A1(net45),
    .A2(net15),
    .B(_115_),
    .Y(_116_));
 NAND2x1_ASAP7_75t_R _306_ (.A(_011_),
    .B(net15),
    .Y(_117_));
 OA211x2_ASAP7_75t_R _307_ (.A1(net33),
    .A2(net15),
    .B(_117_),
    .C(_088_),
    .Y(_118_));
 AO21x2_ASAP7_75t_R _308_ (.A1(net14),
    .A2(_116_),
    .B(_118_),
    .Y(\alu.a[1] ));
 INVx1_ASAP7_75t_R _309_ (.A(_029_),
    .Y(net25));
 NAND2x1_ASAP7_75t_R _310_ (.A(_012_),
    .B(net15),
    .Y(_119_));
 OA211x2_ASAP7_75t_R _311_ (.A1(net34),
    .A2(net15),
    .B(_119_),
    .C(_088_),
    .Y(_120_));
 NAND2x1_ASAP7_75t_R _312_ (.A(_021_),
    .B(net15),
    .Y(_121_));
 OA211x2_ASAP7_75t_R _313_ (.A1(net38),
    .A2(net15),
    .B(_121_),
    .C(net14),
    .Y(_122_));
 OR2x2_ASAP7_75t_R _314_ (.A(_120_),
    .B(_122_),
    .Y(\alu.a[2] ));
 INVx1_ASAP7_75t_R _315_ (.A(\alu.b[2] ),
    .Y(_043_));
 INVx1_ASAP7_75t_R _316_ (.A(\alu.a[1] ),
    .Y(_039_));
 INVx1_ASAP7_75t_R _317_ (.A(\alu.b[1] ),
    .Y(_038_));
 INVx1_ASAP7_75t_R _318_ (.A(\alu.a[0] ),
    .Y(_034_));
 INVx1_ASAP7_75t_R _319_ (.A(\alu.b[0] ),
    .Y(_033_));
 INVx1_ASAP7_75t_R _320_ (.A(\alu.a[3] ),
    .Y(_051_));
 INVx1_ASAP7_75t_R _321_ (.A(\alu.b[3] ),
    .Y(_050_));
 INVx1_ASAP7_75t_R _322_ (.A(_037_),
    .Y(_030_));
 INVx1_ASAP7_75t_R _323_ (.A(\alu.a[2] ),
    .Y(_044_));
 INVx1_ASAP7_75t_R _325_ (.A(net9),
    .Y(_124_));
 INVx2_ASAP7_75t_R _327_ (.A(net8),
    .Y(_126_));
 NAND2x1_ASAP7_75t_R _328_ (.A(_001_),
    .B(net17),
    .Y(_127_));
 OR5x1_ASAP7_75t_R _329_ (.A(net10),
    .B(_124_),
    .C(_126_),
    .D(net11),
    .E(_127_),
    .Y(_128_));
 NAND2x1_ASAP7_75t_R _332_ (.A(_029_),
    .B(_128_),
    .Y(_131_));
 INVx1_ASAP7_75t_R _334_ (.A(net16),
    .Y(_133_));
 OA211x2_ASAP7_75t_R _336_ (.A1(\alu.a[2] ),
    .A2(_128_),
    .B(_131_),
    .C(_133_),
    .Y(_055_));
 NAND2x1_ASAP7_75t_R _337_ (.A(_028_),
    .B(_128_),
    .Y(_135_));
 OA211x2_ASAP7_75t_R _338_ (.A1(\alu.a[1] ),
    .A2(_128_),
    .B(_135_),
    .C(_133_),
    .Y(_056_));
 NAND2x1_ASAP7_75t_R _339_ (.A(_027_),
    .B(_128_),
    .Y(_136_));
 OA211x2_ASAP7_75t_R _340_ (.A1(\alu.a[0] ),
    .A2(_128_),
    .B(_136_),
    .C(_133_),
    .Y(_057_));
 NAND2x1_ASAP7_75t_R _341_ (.A(_026_),
    .B(_128_),
    .Y(_137_));
 OA211x2_ASAP7_75t_R _342_ (.A1(\alu.b[2] ),
    .A2(_128_),
    .B(_137_),
    .C(_133_),
    .Y(_058_));
 NAND2x1_ASAP7_75t_R _343_ (.A(_025_),
    .B(_128_),
    .Y(_138_));
 OA211x2_ASAP7_75t_R _344_ (.A1(\alu.b[1] ),
    .A2(_128_),
    .B(_138_),
    .C(_133_),
    .Y(_059_));
 NAND2x1_ASAP7_75t_R _345_ (.A(_024_),
    .B(_128_),
    .Y(_139_));
 OA211x2_ASAP7_75t_R _346_ (.A1(\alu.b[0] ),
    .A2(_128_),
    .B(_139_),
    .C(_133_),
    .Y(_060_));
 NOR2x1_ASAP7_75t_R _347_ (.A(net10),
    .B(net9),
    .Y(_140_));
 NOR2x1_ASAP7_75t_R _348_ (.A(net8),
    .B(net11),
    .Y(_141_));
 AO31x2_ASAP7_75t_R _349_ (.A1(net5),
    .A2(_140_),
    .A3(_141_),
    .B(_127_),
    .Y(_142_));
 OR3x1_ASAP7_75t_R _350_ (.A(_023_),
    .B(_048_),
    .C(_142_),
    .Y(_143_));
 OAI21x1_ASAP7_75t_R _351_ (.A1(_048_),
    .A2(_142_),
    .B(_023_),
    .Y(_144_));
 AND3x1_ASAP7_75t_R _352_ (.A(_133_),
    .B(_143_),
    .C(_144_),
    .Y(_061_));
 INVx1_ASAP7_75t_R _353_ (.A(_049_),
    .Y(_145_));
 NAND2x1_ASAP7_75t_R _354_ (.A(_022_),
    .B(_142_),
    .Y(_146_));
 OA211x2_ASAP7_75t_R _355_ (.A1(_145_),
    .A2(_142_),
    .B(_146_),
    .C(_133_),
    .Y(_062_));
 XNOR2x2_ASAP7_75t_R _356_ (.A(net19),
    .B(_142_),
    .Y(_147_));
 AND2x2_ASAP7_75t_R _357_ (.A(_133_),
    .B(_147_),
    .Y(_063_));
 AND2x2_ASAP7_75t_R _358_ (.A(net6),
    .B(net7),
    .Y(_148_));
 XOR2x1_ASAP7_75t_R _359_ (.A(net9),
    .Y(_149_),
    .B(net8));
 AND2x2_ASAP7_75t_R _360_ (.A(_001_),
    .B(net17),
    .Y(_150_));
 INVx1_ASAP7_75t_R _361_ (.A(net11),
    .Y(_151_));
 OA211x2_ASAP7_75t_R _362_ (.A1(net10),
    .A2(_149_),
    .B(_150_),
    .C(_151_),
    .Y(_152_));
 AO21x1_ASAP7_75t_R _363_ (.A1(_148_),
    .A2(_152_),
    .B(net16),
    .Y(_153_));
 NOR2x1_ASAP7_75t_R _367_ (.A(_046_),
    .B(net9),
    .Y(_157_));
 AO21x1_ASAP7_75t_R _368_ (.A1(net9),
    .A2(_045_),
    .B(_157_),
    .Y(_158_));
 AND2x2_ASAP7_75t_R _369_ (.A(net8),
    .B(_151_),
    .Y(_159_));
 AO32x1_ASAP7_75t_R _370_ (.A1(net10),
    .A2(_141_),
    .A3(_158_),
    .B1(_159_),
    .B2(_140_),
    .Y(_160_));
 INVx1_ASAP7_75t_R _371_ (.A(net10),
    .Y(_161_));
 AND3x1_ASAP7_75t_R _372_ (.A(_161_),
    .B(net9),
    .C(_141_),
    .Y(_162_));
 OA21x2_ASAP7_75t_R _373_ (.A1(_120_),
    .A2(_122_),
    .B(_162_),
    .Y(_163_));
 XOR2x2_ASAP7_75t_R _374_ (.A(_046_),
    .B(_031_),
    .Y(_164_));
 NOR2x1_ASAP7_75t_R _375_ (.A(net9),
    .B(_047_),
    .Y(_165_));
 AO21x1_ASAP7_75t_R _376_ (.A1(net9),
    .A2(_164_),
    .B(_165_),
    .Y(_166_));
 AND4x1_ASAP7_75t_R _377_ (.A(net10),
    .B(net8),
    .C(_151_),
    .D(_166_),
    .Y(_167_));
 OR4x1_ASAP7_75t_R _378_ (.A(net10),
    .B(net9),
    .C(_126_),
    .D(net11),
    .Y(_168_));
 NOR2x1_ASAP7_75t_R _379_ (.A(net11),
    .B(net16),
    .Y(_169_));
 OA211x2_ASAP7_75t_R _380_ (.A1(net10),
    .A2(_149_),
    .B(_169_),
    .C(_150_),
    .Y(_170_));
 OA21x2_ASAP7_75t_R _381_ (.A1(net3),
    .A2(_168_),
    .B(_170_),
    .Y(_171_));
 OA31x2_ASAP7_75t_R _382_ (.A1(_160_),
    .A2(_163_),
    .A3(_167_),
    .B1(_171_),
    .Y(_172_));
 NOR2x1_ASAP7_75t_R _383_ (.A(_021_),
    .B(_153_),
    .Y(_173_));
 AO21x1_ASAP7_75t_R _384_ (.A1(_153_),
    .A2(_172_),
    .B(_173_),
    .Y(_064_));
 OR4x1_ASAP7_75t_R _385_ (.A(net10),
    .B(net9),
    .C(_126_),
    .D(net2),
    .Y(_174_));
 AND2x2_ASAP7_75t_R _386_ (.A(_124_),
    .B(net8),
    .Y(_175_));
 NAND2x1_ASAP7_75t_R _387_ (.A(net10),
    .B(_042_),
    .Y(_176_));
 NAND2x1_ASAP7_75t_R _388_ (.A(net9),
    .B(net8),
    .Y(_177_));
 OR3x1_ASAP7_75t_R _389_ (.A(net9),
    .B(net8),
    .C(_041_),
    .Y(_178_));
 OAI21x1_ASAP7_75t_R _390_ (.A1(_032_),
    .A2(_177_),
    .B(_178_),
    .Y(_179_));
 AND4x1_ASAP7_75t_R _391_ (.A(net10),
    .B(net9),
    .C(_126_),
    .D(_040_),
    .Y(_180_));
 AO221x1_ASAP7_75t_R _392_ (.A1(_175_),
    .A2(_176_),
    .B1(_179_),
    .B2(net10),
    .C(_180_),
    .Y(_181_));
 AO32x1_ASAP7_75t_R _393_ (.A1(_151_),
    .A2(_174_),
    .A3(_181_),
    .B1(_162_),
    .B2(\alu.a[1] ),
    .Y(_182_));
 AND2x2_ASAP7_75t_R _394_ (.A(_153_),
    .B(_170_),
    .Y(_183_));
 NOR2x1_ASAP7_75t_R _395_ (.A(_020_),
    .B(_153_),
    .Y(_184_));
 AO21x1_ASAP7_75t_R _396_ (.A1(_182_),
    .A2(_183_),
    .B(_184_),
    .Y(_065_));
 OA211x2_ASAP7_75t_R _397_ (.A1(_161_),
    .A2(_030_),
    .B(net8),
    .C(_124_),
    .Y(_185_));
 NOR3x1_ASAP7_75t_R _398_ (.A(_036_),
    .B(_161_),
    .C(_149_),
    .Y(_186_));
 AND4x1_ASAP7_75t_R _399_ (.A(net10),
    .B(net9),
    .C(_126_),
    .D(_035_),
    .Y(_187_));
 OA31x2_ASAP7_75t_R _400_ (.A1(_185_),
    .A2(_186_),
    .A3(_187_),
    .B1(_151_),
    .Y(_188_));
 OA21x2_ASAP7_75t_R _401_ (.A1(_112_),
    .A2(_114_),
    .B(_162_),
    .Y(_189_));
 OA21x2_ASAP7_75t_R _402_ (.A1(net1),
    .A2(_168_),
    .B(_170_),
    .Y(_190_));
 OA21x2_ASAP7_75t_R _403_ (.A1(_188_),
    .A2(_189_),
    .B(_190_),
    .Y(_191_));
 NOR2x1_ASAP7_75t_R _404_ (.A(_019_),
    .B(_153_),
    .Y(_192_));
 AO21x1_ASAP7_75t_R _405_ (.A1(_153_),
    .A2(_191_),
    .B(_192_),
    .Y(_066_));
 INVx1_ASAP7_75t_R _406_ (.A(net6),
    .Y(_193_));
 INVx1_ASAP7_75t_R _407_ (.A(net7),
    .Y(_194_));
 AND3x1_ASAP7_75t_R _408_ (.A(_193_),
    .B(_194_),
    .C(_170_),
    .Y(_195_));
 NOR3x1_ASAP7_75t_R _411_ (.A(_018_),
    .B(net16),
    .C(_195_),
    .Y(_198_));
 AO21x2_ASAP7_75t_R _412_ (.A1(_172_),
    .A2(_195_),
    .B(_198_),
    .Y(_067_));
 NOR3x1_ASAP7_75t_R _413_ (.A(_017_),
    .B(net16),
    .C(_195_),
    .Y(_199_));
 AO21x2_ASAP7_75t_R _414_ (.A1(_182_),
    .A2(_195_),
    .B(_199_),
    .Y(_068_));
 NOR3x1_ASAP7_75t_R _415_ (.A(_016_),
    .B(net16),
    .C(_195_),
    .Y(_200_));
 AO21x2_ASAP7_75t_R _416_ (.A1(_191_),
    .A2(_195_),
    .B(_200_),
    .Y(_069_));
 AND3x1_ASAP7_75t_R _417_ (.A(net6),
    .B(_194_),
    .C(_170_),
    .Y(_201_));
 NOR3x1_ASAP7_75t_R _419_ (.A(_015_),
    .B(net16),
    .C(_201_),
    .Y(_203_));
 AO21x2_ASAP7_75t_R _420_ (.A1(_172_),
    .A2(_201_),
    .B(_203_),
    .Y(_070_));
 NOR3x1_ASAP7_75t_R _421_ (.A(_014_),
    .B(net16),
    .C(_201_),
    .Y(_204_));
 AO21x2_ASAP7_75t_R _422_ (.A1(_182_),
    .A2(_201_),
    .B(_204_),
    .Y(_071_));
 NOR3x1_ASAP7_75t_R _423_ (.A(_013_),
    .B(net16),
    .C(_201_),
    .Y(_205_));
 AO21x2_ASAP7_75t_R _424_ (.A1(_191_),
    .A2(_201_),
    .B(_205_),
    .Y(_072_));
 AND3x1_ASAP7_75t_R _425_ (.A(_193_),
    .B(net7),
    .C(_170_),
    .Y(_206_));
 NOR3x1_ASAP7_75t_R _427_ (.A(_012_),
    .B(net16),
    .C(_206_),
    .Y(_208_));
 AO21x2_ASAP7_75t_R _428_ (.A1(_172_),
    .A2(_206_),
    .B(_208_),
    .Y(_073_));
 NOR3x1_ASAP7_75t_R _429_ (.A(_011_),
    .B(net16),
    .C(_206_),
    .Y(_209_));
 AO21x2_ASAP7_75t_R _430_ (.A1(_182_),
    .A2(_206_),
    .B(_209_),
    .Y(_074_));
 NOR3x1_ASAP7_75t_R _431_ (.A(_010_),
    .B(net16),
    .C(_206_),
    .Y(_210_));
 AO21x2_ASAP7_75t_R _432_ (.A1(_191_),
    .A2(_206_),
    .B(_210_),
    .Y(_075_));
 INVx1_ASAP7_75t_R _433_ (.A(_053_),
    .Y(_211_));
 AND2x2_ASAP7_75t_R _434_ (.A(net9),
    .B(_052_),
    .Y(_212_));
 AO21x1_ASAP7_75t_R _435_ (.A1(_124_),
    .A2(_211_),
    .B(_212_),
    .Y(_213_));
 INVx1_ASAP7_75t_R _436_ (.A(_054_),
    .Y(_214_));
 OA211x2_ASAP7_75t_R _437_ (.A1(_161_),
    .A2(_214_),
    .B(_151_),
    .C(net8),
    .Y(_215_));
 AO32x1_ASAP7_75t_R _438_ (.A1(net10),
    .A2(_141_),
    .A3(_213_),
    .B1(_215_),
    .B2(_124_),
    .Y(_216_));
 OA21x2_ASAP7_75t_R _439_ (.A1(_089_),
    .A2(_091_),
    .B(_162_),
    .Y(_217_));
 OR3x1_ASAP7_75t_R _440_ (.A(_046_),
    .B(_037_),
    .C(_041_),
    .Y(_218_));
 OA21x2_ASAP7_75t_R _441_ (.A1(_046_),
    .A2(_042_),
    .B(_047_),
    .Y(_219_));
 AOI21x1_ASAP7_75t_R _442_ (.A1(_218_),
    .A2(_219_),
    .B(_211_),
    .Y(_220_));
 AND3x1_ASAP7_75t_R _443_ (.A(_211_),
    .B(_218_),
    .C(_219_),
    .Y(_221_));
 AND4x1_ASAP7_75t_R _444_ (.A(net10),
    .B(net9),
    .C(net8),
    .D(_151_),
    .Y(_222_));
 OA21x2_ASAP7_75t_R _445_ (.A1(_220_),
    .A2(_221_),
    .B(_222_),
    .Y(_223_));
 OA21x2_ASAP7_75t_R _446_ (.A1(net4),
    .A2(_168_),
    .B(_170_),
    .Y(_224_));
 OA31x2_ASAP7_75t_R _447_ (.A1(_216_),
    .A2(_217_),
    .A3(_223_),
    .B1(_224_),
    .Y(_225_));
 NOR2x1_ASAP7_75t_R _448_ (.A(_009_),
    .B(_153_),
    .Y(_226_));
 AO21x1_ASAP7_75t_R _449_ (.A1(_153_),
    .A2(_225_),
    .B(_226_),
    .Y(_076_));
 NOR3x1_ASAP7_75t_R _450_ (.A(_008_),
    .B(net16),
    .C(_206_),
    .Y(_227_));
 AO21x2_ASAP7_75t_R _451_ (.A1(_206_),
    .A2(_225_),
    .B(_227_),
    .Y(_077_));
 NOR3x1_ASAP7_75t_R _452_ (.A(_007_),
    .B(net16),
    .C(_201_),
    .Y(_228_));
 AO21x2_ASAP7_75t_R _453_ (.A1(_201_),
    .A2(_225_),
    .B(_228_),
    .Y(_078_));
 NOR3x1_ASAP7_75t_R _454_ (.A(_006_),
    .B(net16),
    .C(_195_),
    .Y(_229_));
 AO21x2_ASAP7_75t_R _455_ (.A1(_195_),
    .A2(_225_),
    .B(_229_),
    .Y(_079_));
 NAND2x1_ASAP7_75t_R _456_ (.A(_005_),
    .B(_128_),
    .Y(_230_));
 OA211x2_ASAP7_75t_R _457_ (.A1(\alu.b[3] ),
    .A2(_128_),
    .B(_230_),
    .C(_133_),
    .Y(_080_));
 OR4x1_ASAP7_75t_R _458_ (.A(_000_),
    .B(_022_),
    .C(_023_),
    .D(_142_),
    .Y(_231_));
 XNOR2x2_ASAP7_75t_R _459_ (.A(net22),
    .B(_231_),
    .Y(_232_));
 AND2x2_ASAP7_75t_R _460_ (.A(_133_),
    .B(_232_),
    .Y(_081_));
 NAND2x1_ASAP7_75t_R _461_ (.A(_003_),
    .B(_128_),
    .Y(_233_));
 OA211x2_ASAP7_75t_R _462_ (.A1(\alu.a[3] ),
    .A2(_128_),
    .B(_233_),
    .C(_133_),
    .Y(_082_));
 NOR2x1_ASAP7_75t_R _463_ (.A(net16),
    .B(_128_),
    .Y(_083_));
 AND4x1_ASAP7_75t_R _464_ (.A(net5),
    .B(net17),
    .C(_140_),
    .D(_141_),
    .Y(_234_));
 OA21x2_ASAP7_75t_R _465_ (.A1(net18),
    .A2(_234_),
    .B(_133_),
    .Y(_084_));
 FAx1_ASAP7_75t_R _466_ (.SN(_032_),
    .A(_030_),
    .B(\alu.b[1] ),
    .CI(\alu.a[1] ),
    .CON(_031_));
 HAxp5_ASAP7_75t_R _467_ (.A(_033_),
    .B(_034_),
    .CON(_035_),
    .SN(_036_));
 HAxp5_ASAP7_75t_R _468_ (.A(\alu.b[0] ),
    .B(\alu.a[0] ),
    .CON(_037_),
    .SN(_235_));
 HAxp5_ASAP7_75t_R _469_ (.A(_038_),
    .B(_039_),
    .CON(_040_),
    .SN(_041_));
 HAxp5_ASAP7_75t_R _470_ (.A(\alu.b[1] ),
    .B(\alu.a[1] ),
    .CON(_042_),
    .SN(_236_));
 HAxp5_ASAP7_75t_R _471_ (.A(_043_),
    .B(_044_),
    .CON(_045_),
    .SN(_046_));
 HAxp5_ASAP7_75t_R _472_ (.A(\alu.b[2] ),
    .B(\alu.a[2] ),
    .CON(_047_),
    .SN(_237_));
 HAxp5_ASAP7_75t_R _473_ (.A(net19),
    .B(net20),
    .CON(_048_),
    .SN(_049_));
 HAxp5_ASAP7_75t_R _474_ (.A(_050_),
    .B(_051_),
    .CON(_052_),
    .SN(_053_));
 HAxp5_ASAP7_75t_R _475_ (.A(\alu.b[3] ),
    .B(\alu.a[3] ),
    .CON(_054_),
    .SN(_238_));
 BUFx2_ASAP7_75t_R clkbuf_0_clk (.A(clk),
    .Y(clknet_0_clk));
 BUFx2_ASAP7_75t_R clkbuf_2_0__f_clk (.A(clknet_0_clk),
    .Y(clknet_2_0__leaf_clk));
 BUFx2_ASAP7_75t_R clkbuf_2_1__f_clk (.A(clknet_0_clk),
    .Y(clknet_2_1__leaf_clk));
 BUFx2_ASAP7_75t_R clkbuf_2_2__f_clk (.A(clknet_0_clk),
    .Y(clknet_2_2__leaf_clk));
 BUFx2_ASAP7_75t_R clkbuf_2_3__f_clk (.A(clknet_0_clk),
    .Y(clknet_2_3__leaf_clk));
 BUFx2_ASAP7_75t_R clkload0 (.A(clknet_2_0__leaf_clk));
 BUFx4f_ASAP7_75t_R clkload1 (.A(clknet_2_2__leaf_clk));
 BUFx12_ASAP7_75t_R clkload2 (.A(clknet_2_3__leaf_clk));
 DFFHQNx1_ASAP7_75t_R \halted_reg$_SDFFE_PP0P_  (.CLK(clknet_2_1__leaf_clk),
    .D(_084_),
    .QN(_001_));
 BUFx2_ASAP7_75t_R input1 (.A(data_in[0]),
    .Y(net1));
 BUFx2_ASAP7_75t_R input10 (.A(instr_in[14]),
    .Y(net10));
 BUFx2_ASAP7_75t_R input11 (.A(instr_in[15]),
    .Y(net11));
 BUFx2_ASAP7_75t_R input12 (.A(instr_in[6]),
    .Y(net12));
 BUFx2_ASAP7_75t_R input13 (.A(instr_in[7]),
    .Y(net13));
 BUFx2_ASAP7_75t_R input14 (.A(instr_in[8]),
    .Y(net14));
 BUFx2_ASAP7_75t_R input15 (.A(instr_in[9]),
    .Y(net15));
 BUFx2_ASAP7_75t_R input16 (.A(rst),
    .Y(net16));
 BUFx2_ASAP7_75t_R input17 (.A(run),
    .Y(net17));
 BUFx2_ASAP7_75t_R input2 (.A(data_in[1]),
    .Y(net2));
 BUFx2_ASAP7_75t_R input3 (.A(data_in[2]),
    .Y(net3));
 BUFx2_ASAP7_75t_R input4 (.A(data_in[3]),
    .Y(net4));
 BUFx2_ASAP7_75t_R input5 (.A(halt_on_nop),
    .Y(net5));
 BUFx2_ASAP7_75t_R input6 (.A(instr_in[10]),
    .Y(net6));
 BUFx2_ASAP7_75t_R input7 (.A(instr_in[11]),
    .Y(net7));
 BUFx2_ASAP7_75t_R input8 (.A(instr_in[12]),
    .Y(net8));
 BUFx2_ASAP7_75t_R input9 (.A(instr_in[13]),
    .Y(net9));
 DFFHQNx1_ASAP7_75t_R \out_a[0]$_SDFFE_PP0P_  (.CLK(clknet_2_2__leaf_clk),
    .D(_057_),
    .QN(_027_));
 DFFHQNx1_ASAP7_75t_R \out_a[1]$_SDFFE_PP0P_  (.CLK(clknet_2_2__leaf_clk),
    .D(_056_),
    .QN(_028_));
 DFFHQNx1_ASAP7_75t_R \out_a[2]$_SDFFE_PP0P_  (.CLK(clknet_2_2__leaf_clk),
    .D(_055_),
    .QN(_029_));
 DFFHQNx1_ASAP7_75t_R \out_a[3]$_SDFFE_PP0P_  (.CLK(clknet_2_3__leaf_clk),
    .D(_082_),
    .QN(_003_));
 DFFHQNx1_ASAP7_75t_R \out_b[0]$_SDFFE_PP0P_  (.CLK(clknet_2_2__leaf_clk),
    .D(_060_),
    .QN(_024_));
 DFFHQNx1_ASAP7_75t_R \out_b[1]$_SDFFE_PP0P_  (.CLK(clknet_2_2__leaf_clk),
    .D(_059_),
    .QN(_025_));
 DFFHQNx1_ASAP7_75t_R \out_b[2]$_SDFFE_PP0P_  (.CLK(clknet_2_2__leaf_clk),
    .D(_058_),
    .QN(_026_));
 DFFHQNx1_ASAP7_75t_R \out_b[3]$_SDFFE_PP0P_  (.CLK(clknet_2_3__leaf_clk),
    .D(_080_),
    .QN(_005_));
 DFFHQNx1_ASAP7_75t_R \out_valid$_SDFF_PP0_  (.CLK(clknet_2_2__leaf_clk),
    .D(_083_),
    .QN(_002_));
 BUFx2_ASAP7_75t_R output18 (.A(net18),
    .Y(halted));
 BUFx2_ASAP7_75t_R output19 (.A(net19),
    .Y(instr_addr[0]));
 BUFx2_ASAP7_75t_R output20 (.A(net20),
    .Y(instr_addr[1]));
 BUFx2_ASAP7_75t_R output21 (.A(net21),
    .Y(instr_addr[2]));
 BUFx2_ASAP7_75t_R output22 (.A(net22),
    .Y(instr_addr[3]));
 BUFx2_ASAP7_75t_R output23 (.A(net23),
    .Y(out_a[0]));
 BUFx2_ASAP7_75t_R output24 (.A(net24),
    .Y(out_a[1]));
 BUFx2_ASAP7_75t_R output25 (.A(net25),
    .Y(out_a[2]));
 BUFx2_ASAP7_75t_R output26 (.A(net26),
    .Y(out_a[3]));
 BUFx2_ASAP7_75t_R output27 (.A(net27),
    .Y(out_b[0]));
 BUFx2_ASAP7_75t_R output28 (.A(net28),
    .Y(out_b[1]));
 BUFx2_ASAP7_75t_R output29 (.A(net29),
    .Y(out_b[2]));
 BUFx2_ASAP7_75t_R output30 (.A(net30),
    .Y(out_b[3]));
 BUFx2_ASAP7_75t_R output31 (.A(net31),
    .Y(out_valid));
 BUFx2_ASAP7_75t_R output32 (.A(net32),
    .Y(reg0[0]));
 BUFx2_ASAP7_75t_R output33 (.A(net33),
    .Y(reg0[1]));
 BUFx2_ASAP7_75t_R output34 (.A(net34),
    .Y(reg0[2]));
 BUFx2_ASAP7_75t_R output35 (.A(net35),
    .Y(reg0[3]));
 BUFx2_ASAP7_75t_R output36 (.A(net36),
    .Y(reg1[0]));
 BUFx2_ASAP7_75t_R output37 (.A(net37),
    .Y(reg1[1]));
 BUFx2_ASAP7_75t_R output38 (.A(net38),
    .Y(reg1[2]));
 BUFx2_ASAP7_75t_R output39 (.A(net39),
    .Y(reg1[3]));
 BUFx2_ASAP7_75t_R output40 (.A(net40),
    .Y(reg2[0]));
 BUFx2_ASAP7_75t_R output41 (.A(net41),
    .Y(reg2[1]));
 BUFx2_ASAP7_75t_R output42 (.A(net42),
    .Y(reg2[2]));
 BUFx2_ASAP7_75t_R output43 (.A(net43),
    .Y(reg2[3]));
 BUFx2_ASAP7_75t_R output44 (.A(net44),
    .Y(reg3[0]));
 BUFx2_ASAP7_75t_R output45 (.A(net45),
    .Y(reg3[1]));
 BUFx2_ASAP7_75t_R output46 (.A(net46),
    .Y(reg3[2]));
 BUFx2_ASAP7_75t_R output47 (.A(net47),
    .Y(reg3[3]));
 DFFHQNx1_ASAP7_75t_R \pc_reg[0]$_SDFFE_PP0P_  (.CLK(clknet_2_3__leaf_clk),
    .D(_063_),
    .QN(_000_));
 DFFHQNx1_ASAP7_75t_R \pc_reg[1]$_SDFFE_PP0P_  (.CLK(clknet_2_3__leaf_clk),
    .D(_062_),
    .QN(_022_));
 DFFHQNx1_ASAP7_75t_R \pc_reg[2]$_SDFFE_PP0P_  (.CLK(clknet_2_3__leaf_clk),
    .D(_061_),
    .QN(_023_));
 DFFHQNx1_ASAP7_75t_R \pc_reg[3]$_SDFFE_PP0P_  (.CLK(clknet_2_3__leaf_clk),
    .D(_081_),
    .QN(_004_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[0][0]$_SDFFCE_PN0P_  (.CLK(clknet_2_1__leaf_clk),
    .D(_069_),
    .QN(_016_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[0][1]$_SDFFCE_PN0P_  (.CLK(clknet_2_0__leaf_clk),
    .D(_068_),
    .QN(_017_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[0][2]$_SDFFCE_PN0P_  (.CLK(clknet_2_0__leaf_clk),
    .D(_067_),
    .QN(_018_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[0][3]$_SDFFCE_PN0P_  (.CLK(clknet_2_1__leaf_clk),
    .D(_079_),
    .QN(_006_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[1][0]$_SDFFCE_PN0P_  (.CLK(clknet_2_1__leaf_clk),
    .D(_072_),
    .QN(_013_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[1][1]$_SDFFCE_PN0P_  (.CLK(clknet_2_0__leaf_clk),
    .D(_071_),
    .QN(_014_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[1][2]$_SDFFCE_PN0P_  (.CLK(clknet_2_0__leaf_clk),
    .D(_070_),
    .QN(_015_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[1][3]$_SDFFCE_PN0P_  (.CLK(clknet_2_1__leaf_clk),
    .D(_078_),
    .QN(_007_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[2][0]$_SDFFCE_PN0P_  (.CLK(clknet_2_1__leaf_clk),
    .D(_075_),
    .QN(_010_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[2][1]$_SDFFCE_PN0P_  (.CLK(clknet_2_0__leaf_clk),
    .D(_074_),
    .QN(_011_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[2][2]$_SDFFCE_PN0P_  (.CLK(clknet_2_0__leaf_clk),
    .D(_073_),
    .QN(_012_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[2][3]$_SDFFCE_PN0P_  (.CLK(clknet_2_1__leaf_clk),
    .D(_077_),
    .QN(_008_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[3][0]$_DFFE_PP_  (.CLK(clknet_2_1__leaf_clk),
    .D(_066_),
    .QN(_019_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[3][1]$_DFFE_PP_  (.CLK(clknet_2_0__leaf_clk),
    .D(_065_),
    .QN(_020_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[3][2]$_DFFE_PP_  (.CLK(clknet_2_0__leaf_clk),
    .D(_064_),
    .QN(_021_));
 DFFHQNx1_ASAP7_75t_R \register_file.regs[3][3]$_DFFE_PP_  (.CLK(clknet_2_1__leaf_clk),
    .D(_076_),
    .QN(_009_));
 assign data_addr[0] = instr_in[0];
 assign data_addr[1] = instr_in[1];
 assign data_addr[2] = instr_in[2];
 assign data_addr[3] = instr_in[3];
endmodule
