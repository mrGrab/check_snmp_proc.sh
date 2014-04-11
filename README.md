<H3 align=center>check_snmp_proc.sh</H3>
<H6 align=center>Plugin for checking process (or quantity of them) status via SNMP writed in bash </H6>
<br>
<br align=left><b>Usage:</b>
<br align=left>./check_snmp_proc -H 127.0.0.1 -C public -N ssh -w 3 -c 0
<br>Where:
<li>  -H hostname /string/
<br>     Name or IP address of host (default 127.0.0.1)"
<li>  -C OID /string/
<br>     Community name for the host SNMP agent (default public)
<li>  -N Process name /string/
<br>     Exact process name (default snmpd)
<li>  -w warning level /integer/
<br>     Warning level of running processes (default: 0)
<li>  -c critical level /integer/
<br>     Critical level of running processes (default: 0)
<li>  -h help
<br>     Print this help screen
<li>  -V version number
<br>     Print version and license information

<br>  This plugin uses the 'snmpwalk' command included with the NET-SNMP package.
<br>  This nagios plugins comes with ABSOLUTELY NO WARRANTY. So enjoy ;)
<br>Also plugin return codes:
<li> OK=0
<li>CRITICAL=2
<li>WARNING=1
<li>UNKNOWN=3
