###################################################################################################
# Aliases for quicker use

#Normal SSH
alias s="jump"

#SSH with old ciphers
alias o="ojump"

# Variables
jumpuser="$USERNAME"

function jump () {
        if [[ -z $1 ]]; then
                ssh ${jumpuser}@unix.codero.com
        elif [[ -n $1 && -z $2 ]]; then
                ssh -t -o ProxyCommand="ssh ${jumpuser}@unix.codero.com nc $1 22" root@$1
        elif [[ -n $1 && -n $2 ]]; then
                ssh -t -o ProxyCommand="ssh ${jumpuser}@unix.codero.com nc $1 $2" root@$1
        else
                echo -e '\nSyntax Error'
        fi
}

function ojump () {
        if [[ -z $1 ]]; then
                ssh ${jumpuser}@unix.codero.com
        elif [[ -n $1 && -z $2 ]]; then
                ssh -oHostKeyAlgorithms=+ssh-dss -t -o ProxyCommand="ssh ${jumpuser}@unix.codero.com nc $1 22" root@$1
        elif [[ -n $1 && -n $2 ]]; then
                ssh -oHostKeyAlgorithms=+ssh-dss -t -o ProxyCommand="ssh ${jumpuser}@unix.codero.com nc $1 $2" root@$1
        else
                echo -e '\nSyntax Error'
        fi
}

###################################################################################################
