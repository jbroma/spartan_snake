<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="rst" />
        <signal name="XLXN_76" />
        <signal name="rx_input" />
        <signal name="XLXN_80(7:0)" />
        <signal name="XLXN_81" />
        <signal name="XLXN_82(3:0)" />
        <signal name="XLXN_83(2:0)" />
        <signal name="VGA_R" />
        <signal name="VGA_G" />
        <signal name="VGA_B" />
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="clk" />
        <signal name="XLXN_101" />
        <signal name="XLXN_102(8:0)" />
        <signal name="XLXN_103(9:0)" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="rx_input" />
        <port polarity="Output" name="VGA_R" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_B" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Input" name="clk" />
        <blockdef name="bgen">
            <timestamp>2019-5-10T8:30:46</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="rx">
            <timestamp>2019-5-10T8:30:53</timestamp>
            <rect width="352" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="480" y1="-224" y2="-224" x1="416" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
        </blockdef>
        <blockdef name="kbd">
            <timestamp>2019-5-17T8:21:39</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="vga_driver">
            <timestamp>2019-5-17T8:21:30</timestamp>
            <rect width="256" x="64" y="-448" height="448" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="snake">
            <timestamp>2019-5-17T9:18:45</timestamp>
            <rect width="320" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="384" y="-364" height="24" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
        </blockdef>
        <block symbolname="bgen" name="XLXI_13">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_76" name="tick" />
        </block>
        <block symbolname="rx" name="XLXI_19">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="rx_input" name="rx_input_bit" />
            <blockpin signalname="XLXN_76" name="s_tick" />
            <blockpin signalname="XLXN_81" name="rx_input_bit_finished" />
            <blockpin signalname="XLXN_80(7:0)" name="data_out(7:0)" />
        </block>
        <block symbolname="kbd" name="XLXI_20">
            <blockpin signalname="XLXN_81" name="input_ready" />
            <blockpin signalname="XLXN_80(7:0)" name="keycode(7:0)" />
            <blockpin signalname="XLXN_82(3:0)" name="key(3:0)" />
        </block>
        <block symbolname="vga_driver" name="XLXI_22">
            <blockpin signalname="clk" name="CLK_50MHz" />
            <blockpin signalname="XLXN_83(2:0)" name="RGB(2:0)" />
            <blockpin signalname="VGA_R" name="VGA_R" />
            <blockpin signalname="VGA_G" name="VGA_G" />
            <blockpin signalname="VGA_B" name="VGA_B" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin signalname="XLXN_103(9:0)" name="PIX_X(9:0)" />
            <blockpin signalname="XLXN_102(8:0)" name="PIX_Y(8:0)" />
        </block>
        <block symbolname="snake" name="XLXI_31">
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_81" name="input_ready" />
            <blockpin signalname="XLXN_82(3:0)" name="key_input(3:0)" />
            <blockpin signalname="XLXN_103(9:0)" name="VGA_X(9:0)" />
            <blockpin signalname="XLXN_102(8:0)" name="VGA_Y(8:0)" />
            <blockpin signalname="XLXN_83(2:0)" name="VGA_RGB(2:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="432" y="912" name="XLXI_13" orien="R0">
        </instance>
        <branch name="rst">
            <wire x2="352" y1="880" y2="880" x1="192" />
            <wire x2="432" y1="880" y2="880" x1="352" />
            <wire x2="352" y1="880" y2="928" x1="352" />
            <wire x2="2256" y1="928" y2="928" x1="352" />
            <wire x2="1120" y1="688" y2="688" x1="352" />
            <wire x2="352" y1="688" y2="880" x1="352" />
            <wire x2="2256" y1="784" y2="928" x1="2256" />
            <wire x2="2352" y1="784" y2="784" x1="2256" />
        </branch>
        <instance x="1120" y="848" name="XLXI_19" orien="R0">
        </instance>
        <branch name="XLXN_76">
            <wire x2="1120" y1="816" y2="816" x1="816" />
        </branch>
        <branch name="rx_input">
            <wire x2="1104" y1="736" y2="736" x1="240" />
            <wire x2="1104" y1="736" y2="752" x1="1104" />
            <wire x2="1120" y1="752" y2="752" x1="1104" />
        </branch>
        <branch name="XLXN_80(7:0)">
            <wire x2="1808" y1="816" y2="816" x1="1600" />
        </branch>
        <instance x="1808" y="848" name="XLXI_20" orien="R0">
        </instance>
        <branch name="XLXN_81">
            <wire x2="1696" y1="624" y2="624" x1="1600" />
            <wire x2="1696" y1="624" y2="752" x1="1696" />
            <wire x2="1808" y1="752" y2="752" x1="1696" />
            <wire x2="1696" y1="752" y2="912" x1="1696" />
            <wire x2="2352" y1="912" y2="912" x1="1696" />
        </branch>
        <branch name="XLXN_83(2:0)">
            <wire x2="2848" y1="784" y2="784" x1="2800" />
            <wire x2="2848" y1="784" y2="816" x1="2848" />
            <wire x2="2864" y1="816" y2="816" x1="2848" />
        </branch>
        <branch name="VGA_R">
            <wire x2="3280" y1="432" y2="432" x1="3248" />
        </branch>
        <branch name="VGA_G">
            <wire x2="3280" y1="496" y2="496" x1="3248" />
        </branch>
        <branch name="VGA_B">
            <wire x2="3280" y1="560" y2="560" x1="3248" />
        </branch>
        <branch name="VGA_HS">
            <wire x2="3280" y1="624" y2="624" x1="3248" />
        </branch>
        <branch name="VGA_VS">
            <wire x2="3280" y1="688" y2="688" x1="3248" />
        </branch>
        <branch name="clk">
            <wire x2="304" y1="816" y2="816" x1="208" />
            <wire x2="432" y1="816" y2="816" x1="304" />
            <wire x2="304" y1="816" y2="960" x1="304" />
            <wire x2="2272" y1="960" y2="960" x1="304" />
            <wire x2="304" y1="624" y2="816" x1="304" />
            <wire x2="1072" y1="624" y2="624" x1="304" />
            <wire x2="1120" y1="624" y2="624" x1="1072" />
            <wire x2="1072" y1="432" y2="624" x1="1072" />
            <wire x2="2864" y1="432" y2="432" x1="1072" />
            <wire x2="2272" y1="848" y2="960" x1="2272" />
            <wire x2="2352" y1="848" y2="848" x1="2272" />
        </branch>
        <instance x="2864" y="848" name="XLXI_22" orien="R0">
        </instance>
        <iomarker fontsize="28" x="208" y="816" name="clk" orien="R180" />
        <iomarker fontsize="28" x="192" y="880" name="rst" orien="R180" />
        <iomarker fontsize="28" x="240" y="736" name="rx_input" orien="R180" />
        <iomarker fontsize="28" x="3280" y="432" name="VGA_R" orien="R0" />
        <iomarker fontsize="28" x="3280" y="496" name="VGA_G" orien="R0" />
        <iomarker fontsize="28" x="3280" y="560" name="VGA_B" orien="R0" />
        <iomarker fontsize="28" x="3280" y="624" name="VGA_HS" orien="R0" />
        <iomarker fontsize="28" x="3280" y="688" name="VGA_VS" orien="R0" />
        <branch name="XLXN_82(3:0)">
            <wire x2="2208" y1="752" y2="752" x1="2192" />
            <wire x2="2208" y1="752" y2="976" x1="2208" />
            <wire x2="2352" y1="976" y2="976" x1="2208" />
        </branch>
        <instance x="2352" y="1136" name="XLXI_31" orien="R0">
        </instance>
        <branch name="XLXN_102(8:0)">
            <wire x2="2352" y1="1104" y2="1104" x1="2288" />
            <wire x2="2288" y1="1104" y2="1248" x1="2288" />
            <wire x2="3264" y1="1248" y2="1248" x1="2288" />
            <wire x2="3264" y1="816" y2="816" x1="3248" />
            <wire x2="3264" y1="816" y2="1248" x1="3264" />
        </branch>
        <branch name="XLXN_103(9:0)">
            <wire x2="2352" y1="1040" y2="1040" x1="2336" />
            <wire x2="2336" y1="1040" y2="1312" x1="2336" />
            <wire x2="3344" y1="1312" y2="1312" x1="2336" />
            <wire x2="3344" y1="752" y2="752" x1="3248" />
            <wire x2="3344" y1="752" y2="1312" x1="3344" />
        </branch>
    </sheet>
</drawing>