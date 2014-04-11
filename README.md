<H3 align=center>check_snmp_proc.sh</H3>
<H5 align=center>this is small nagios plugin for checking status of processes (or quantity of them) via SNMP writed in bash </H5>
<br align=left><b>Usage:</b>
<br align=left>./check_snmp_proc -H 127.0.0.1 -C public -N ssh -w 3 -c 0
<br>
<br><b>Where:</b>
<dd>  -H hostname /string/
<br>    Name or IP address of host (default 127.0.0.1)
<br>  -C OID /string/
<br>     Community name for the host SNMP agent (default public)
<br>  -N Process name /string/
<br>     Exact process name (default snmpd)
<br>  -w warning level /integer/
<br>     Warning level of running processes (default: 0)
<br>  -c critical level /integer/
<br>     Critical level of running processes (default: 0)
<br>  -h help
<br>     Print this help screen
<br>  -V version number
<br>     Print version and license information </dd>
<br>
<br>  This plugin uses the 'snmpwalk' command included with the NET-SNMP package.
<br>  This nagios plugins comes with ABSOLUTELY NO WARRANTY. So, enjoy ;)
