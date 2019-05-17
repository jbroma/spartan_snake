<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="rx_input" />
        <signal name="clk" />
        <signal name="rst" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="XLXN_9" />
        <signal name="XLXN_11" />
        <signal name="XLXN_12" />
        <signal name="Line_1(63:0)" />
        <signal name="Line_1(63:56)" />
        <signal name="Line_1(7:0)" />
        <signal name="XLXN_16(63:0)" />
        <signal name="XLXN_17" />
        <signal name="XLXN_18(15:0)" />
        <signal name="XLXN_26" />
        <signal name="XLXN_27" />
        <signal name="XLXN_29" />
        <signal name="LCD_E" />
        <signal name="LCD_RS" />
        <signal name="LCD_RW" />
        <signal name="LCD_D(3:0)" />
        <signal name="SF_CE" />
        <signal name="XLXN_36(15:0)" />
        <port polarity="Input" name="rx_input" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Output" name="LCD_E" />
        <port polarity="Output" name="LCD_RS" />
        <port polarity="Output" name="LCD_RW" />
        <port polarity="BiDirectional" name="LCD_D(3:0)" />
        <port polarity="Output" name="SF_CE" />
        <blockdef name="rx">
            <timestamp>2019-4-26T8:47:53</timestamp>
            <rect width="352" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="480" y1="-224" y2="-224" x1="416" />
            <rect width="64" x="416" y="-44" height="24" />
            <line x2="480" y1="-32" y2="-32" x1="416" />
        </blockdef>
        <blockdef name="bgen">
            <timestamp>2019-4-26T8:48:5</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="LCD2x64">
            <timestamp>2019-4-26T8:52:49</timestamp>
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <line x2="432" y1="-224" y2="-224" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <rect width="64" x="368" y="-108" height="24" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <line x2="432" y1="-32" y2="-32" x1="368" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="304" x="64" y="-320" height="384" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
        </blockdef>
        <blockdef name="cb8ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="constant">
            <timestamp>2006-1-1T10:10:10</timestamp>
            <rect width="112" x="0" y="0" height="64" />
            <line x2="112" y1="32" y2="32" x1="144" />
        </blockdef>
        <block symbolname="rx" name="XLXI_1">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="rx_input" name="rx_input_bit" />
            <blockpin signalname="XLXN_1" name="s_tick" />
            <blockpin signalname="XLXN_29" name="rx_input_bit_finished" />
            <blockpin signalname="Line_1(63:56)" name="data_out(7:0)" />
        </block>
        <block symbolname="bgen" name="XLXI_2">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_1" name="tick" />
        </block>
        <block symbolname="LCD2x64" name="XLXI_4">
            <blockpin signalname="Line_1(63:0)" name="Line1(63:0)" />
            <blockpin signalname="XLXN_36(15:0)" name="Blank1(15:0)" />
            <blockpin name="Line2(63:0)" />
            <blockpin signalname="XLXN_18(15:0)" name="Blank2(15:0)" />
            <blockpin signalname="LCD_D(3:0)" name="LCD_D(3:0)" />
            <blockpin signalname="LCD_E" name="LCD_E" />
            <blockpin signalname="LCD_RW" name="LCD_RW" />
            <blockpin signalname="LCD_RS" name="LCD_RS" />
            <blockpin signalname="SF_CE" name="SF_CE" />
            <blockpin signalname="rst" name="Reset" />
            <blockpin signalname="clk" name="Clk_50MHz" />
        </block>
        <block symbolname="cb8ce" name="XLXI_5">
            <blockpin signalname="clk" name="C" />
            <blockpin signalname="XLXN_29" name="CE" />
            <blockpin signalname="rst" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="Line_1(7:0)" name="Q(7:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="constant" name="XLXI_6">
            <attr value="0FF0" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_36(15:0)" name="O" />
        </block>
        <block symbolname="constant" name="XLXI_8">
            <attr value="FFFF" name="CValue">
                <trait delete="all:1 sym:0" />
                <trait editname="all:1 sch:0" />
                <trait valuetype="BitVector 32 Hexadecimal" />
            </attr>
            <blockpin signalname="XLXN_18(15:0)" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_1">
            <wire x2="1280" y1="816" y2="816" x1="976" />
        </branch>
        <instance x="592" y="912" name="XLXI_2" orien="R0">
        </instance>
        <instance x="1280" y="848" name="XLXI_1" orien="R0">
        </instance>
        <branch name="rx_input">
            <wire x2="1264" y1="368" y2="368" x1="416" />
            <wire x2="1264" y1="368" y2="752" x1="1264" />
            <wire x2="1280" y1="752" y2="752" x1="1264" />
        </branch>
        <branch name="clk">
            <wire x2="496" y1="816" y2="816" x1="352" />
            <wire x2="544" y1="816" y2="816" x1="496" />
            <wire x2="560" y1="816" y2="816" x1="544" />
            <wire x2="592" y1="816" y2="816" x1="560" />
            <wire x2="544" y1="816" y2="960" x1="544" />
            <wire x2="2272" y1="960" y2="960" x1="544" />
            <wire x2="496" y1="816" y2="1472" x1="496" />
            <wire x2="1360" y1="1472" y2="1472" x1="496" />
            <wire x2="1280" y1="624" y2="624" x1="560" />
            <wire x2="560" y1="624" y2="816" x1="560" />
            <wire x2="2272" y1="928" y2="960" x1="2272" />
        </branch>
        <branch name="rst">
            <wire x2="400" y1="880" y2="880" x1="352" />
            <wire x2="480" y1="880" y2="880" x1="400" />
            <wire x2="592" y1="880" y2="880" x1="480" />
            <wire x2="480" y1="880" y2="976" x1="480" />
            <wire x2="1040" y1="976" y2="976" x1="480" />
            <wire x2="400" y1="880" y2="1568" x1="400" />
            <wire x2="1360" y1="1568" y2="1568" x1="400" />
            <wire x2="1280" y1="688" y2="688" x1="480" />
            <wire x2="480" y1="688" y2="880" x1="480" />
            <wire x2="1040" y1="896" y2="976" x1="1040" />
            <wire x2="2272" y1="896" y2="896" x1="1040" />
            <wire x2="2272" y1="864" y2="896" x1="2272" />
        </branch>
        <iomarker fontsize="28" x="352" y="816" name="clk" orien="R180" />
        <iomarker fontsize="28" x="352" y="880" name="rst" orien="R180" />
        <iomarker fontsize="28" x="416" y="368" name="rx_input" orien="R180" />
        <instance x="1360" y="1600" name="XLXI_5" orien="R0" />
        <branch name="Line_1(63:0)">
            <wire x2="2272" y1="608" y2="608" x1="2000" />
            <wire x2="2000" y1="608" y2="816" x1="2000" />
            <wire x2="2000" y1="816" y2="1344" x1="2000" />
            <wire x2="2000" y1="1344" y2="1584" x1="2000" />
        </branch>
        <bustap x2="1904" y1="816" y2="816" x1="2000" />
        <branch name="Line_1(63:56)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1832" y="816" type="branch" />
            <wire x2="1832" y1="816" y2="816" x1="1760" />
            <wire x2="1904" y1="816" y2="816" x1="1832" />
        </branch>
        <bustap x2="1904" y1="1344" y2="1344" x1="2000" />
        <branch name="Line_1(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1824" y="1344" type="branch" />
            <wire x2="1824" y1="1344" y2="1344" x1="1744" />
            <wire x2="1904" y1="1344" y2="1344" x1="1824" />
        </branch>
        <instance x="2272" y="896" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_18(15:0)">
            <wire x2="2272" y1="800" y2="800" x1="2240" />
            <wire x2="2240" y1="800" y2="1152" x1="2240" />
            <wire x2="2240" y1="1152" y2="1360" x1="2240" />
        </branch>
        <instance x="1744" y="1120" name="XLXI_8" orien="R0">
        </instance>
        <bustap x2="2144" y1="1152" y2="1152" x1="2240" />
        <branch name="XLXN_18(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="2016" y="1152" type="branch" />
            <wire x2="2016" y1="1152" y2="1152" x1="1888" />
            <wire x2="2144" y1="1152" y2="1152" x1="2016" />
        </branch>
        <instance x="1648" y="416" name="XLXI_6" orien="R0">
        </instance>
        <branch name="XLXN_29">
            <wire x2="1904" y1="1200" y2="1200" x1="1312" />
            <wire x2="1312" y1="1200" y2="1408" x1="1312" />
            <wire x2="1360" y1="1408" y2="1408" x1="1312" />
            <wire x2="1904" y1="624" y2="624" x1="1760" />
            <wire x2="1904" y1="624" y2="1200" x1="1904" />
        </branch>
        <branch name="LCD_E">
            <wire x2="2736" y1="608" y2="608" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2736" y="608" name="LCD_E" orien="R0" />
        <branch name="LCD_RS">
            <wire x2="2736" y1="672" y2="672" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2736" y="672" name="LCD_RS" orien="R0" />
        <branch name="LCD_RW">
            <wire x2="2736" y1="736" y2="736" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2736" y="736" name="LCD_RW" orien="R0" />
        <branch name="LCD_D(3:0)">
            <wire x2="2736" y1="800" y2="800" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2736" y="800" name="LCD_D(3:0)" orien="R0" />
        <branch name="SF_CE">
            <wire x2="2736" y1="864" y2="864" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2736" y="864" name="SF_CE" orien="R0" />
        <branch name="XLXN_36(15:0)">
            <wire x2="2144" y1="272" y2="448" x1="2144" />
            <wire x2="2144" y1="448" y2="672" x1="2144" />
            <wire x2="2272" y1="672" y2="672" x1="2144" />
        </branch>
        <bustap x2="2048" y1="448" y2="448" x1="2144" />
        <branch name="XLXN_36(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:28;fontname:Arial" attrname="Name" x="1920" y="448" type="branch" />
            <wire x2="1920" y1="448" y2="448" x1="1792" />
            <wire x2="2048" y1="448" y2="448" x1="1920" />
        </branch>
    </sheet>
</drawing>