#Tests remote IP for listening ports
function isup () {
echo $1 | while read IP
do
echo
IP=$1;
RD='\033[0;31m'
GR='\033[0;32m'
NC='\033[0m'
ICMP_ENABLED=$(ping -c2 -W1 $IP &>/dev/null && echo 'ICMP' || echo 'DOWN');
if [[ $ICMP_ENABLED =~ 'DOWN' ]]
then
SERVICE_STATUS=$(nmap -T4 -Pn -p 22,3389,80,443,10222,2083,2087,8443 $IP | grep -m1 'open' | awk '{print $1}');
if [[ -z "$SERVICE_STATUS" ]]
then
echo -e "${RD}*** $IP is DOWN ***${NC}";
else
echo -e "${GR}~~~ $IP is UP ~~~${NC}";
fi
else
echo -e "${GR}~~~ $IP is UP ~~~${NC}";
fi
echo
done
}
