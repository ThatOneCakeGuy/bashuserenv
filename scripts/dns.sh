#Pulls DNS for a given domain
function dns () {
DOM="$1"
NSNS="`dig NS $1 +short`"
ADNS=("`dig A $1 +short`")
CDNS="`dig A www.$1 +short`"
MDNS="`dig MX $1 +short`"
TXT="`dig TXT $1 +short|grep -iv spf | grep -v dkim`"
SPF="`dig TXT $1 +short|grep -i spf`"
DKIM="`dig TXT default._domainkey.$1 +short|grep -i DKIM`"


echo -e "\nName Servers for $DOM:\n$NSNS"
echo -e "\nA Record for $DOM:\n$ADNS"
echo -e "\nWWW Record for $DOM:\n$CDNS"
echo -e "\nRDNS for $DOM:"
declare -a arr=($(dig A $DOM +short)) ; for i in ${arr[@]} ; do echo "$i > `dig -x $i +short`" ; done
echo -e "\n\nMX Records for $DOM:\n$MDNS"
echo -e "\nTXT Record for $DOM:\n$TXT"
echo -e "\nSPF Records for $DOM:\n$SPF"
echo -e "\nDKIM default for $DOM:\n$DKIM"
}
