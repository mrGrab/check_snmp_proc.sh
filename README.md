<H3 align=center>check_snmp_proc.sh</H3>
<H6 align=center>Plugin for checking process (or quantity of them) status via SNMP writed in bash </H6>
<br>
<br align=left><b>Usage:</b>
<br align=left>./check_snmp_proc -H 127.0.0.1 -C public -N ssh -w 3 -c 0
<br>
<br><b>Where:</b>
<ul><li>  -H hostname /string/
<dd>     Name or IP address of host (default 127.0.0.1)</dd>
<br><li>  -C OID /string/
<dd>     Community name for the host SNMP agent (default public)</dd>
<br><li>  -N Process name /string/
<dd>     Exact process name (default snmpd)</dd>
<br><li>  -w warning level /integer/
<dd>     Warning level of running processes (default: 0)</dd>
<br><li>  -c critical level /integer/
<dd>     Critical level of running processes (default: 0)</dd>
<br><li>  -h help
<dd>     Print this help screen</dd>
<br><li>  -V version number
<dd>     Print version and license information</dd></ul>
<br>
<br>  This plugin uses the 'snmpwalk' command included with the NET-SNMP package.
<br>  This nagios plugins comes with ABSOLUTELY NO WARRANTY. So, enjoy ;)
<br>Also plugin <b>return codes</b>:
<ul><br><li> OK=0
<br><li>CRITICAL=2
<br><li>WARNING=1
<br><li>UNKNOWN=3</ul>
