<H3 align=center>check_snmp_proc.sh</H3>
<H6 align=center>Plugin for checking process (or quantity of them) status via SNMP writed in bash </H6>
<br>
<br align=left><b>Usage:</b>
<br align=left>./check_snmp_proc -H 127.0.0.1 -C public -N ssh -w 3 -c 0
<br>
<br><b>Where:</b>
<p><dd>  -H hostname /string/
     Name or IP address of host (default 127.0.0.1)
  -C OID /string/
     Community name for the host SNMP agent (default public)
  -N Process name /string/
     Exact process name (default snmpd)
  -w warning level /integer/
     Warning level of running processes (default: 0)
<br>  -c critical level /integer/
     Critical level of running processes (default: 0)
<br>  -h help
     Print this help screen
<br>  -V version number
     Print version and license information </dd>
<br>
<br>  This plugin uses the 'snmpwalk' command included with the NET-SNMP package.
<br>  This nagios plugins comes with ABSOLUTELY NO WARRANTY. So, enjoy ;)
<br>Also plugin <b>return codes</b>:
<br> OK=0
<br>CRITICAL=2
<br>WARNING=1
<br>UNKNOWN=3
