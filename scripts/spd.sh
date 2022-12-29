#Tests speeds on remote linux server
function spd () {
echo -e "\nPlease login to test internet speeds for $1"
ssh root@$1 'echo ; curl -s https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py | python -|grep "Download\|Upload"'
echo
}
