#!/bin/bash
clear
sudo systemctl restart nscd
qc=false;
if [ ! -z $1 ]; then
    if [ "$1" == "-c" ]; then
        qc=true;
    else
        d=$1;
    fi

    if [ ! -z $2 ]; then
        if [[ "$qc" == "true" ]]; then
            d=$2;
        else
            if [ "$2" == "-c" ]; then
                qc=true;
            else
                w=$2;
                w=$(($w + 0));
            fi
        fi

        if [ ! -z $3 ]; then
            if [ "$3" == "-c" ]; then
                qc=true;
            else
                if [[ "$qc" == "true" ]]; then
                    w=$2;
                    w=$(($w + 0));
                else
                    qc=$2;
                fi
            fi
        else
            if [ -z "$w" ]; then
                w=5;
            fi
        fi
    else
        if [[ "$qc" == "true" ]]; then
            clear;
            echo "Enter a domain";
            read d;
            clear;
            echo "Enter seconds to wait";
            read w;
            w=$(($w + 0));
        else
            if [ -z "$w" ]; then
                w=5;
            fi
        fi
    fi
else
    clear;
    echo "Enter a domain";
    read d;
    clear;
    echo "Enter seconds to wait";
    read w;
    w=$(($w + 0));
    clear;
    echo "Would you like to exit on domain update?";
    read qc;
    if [[ "$qc" == "Y" || "$qc" == "y" ]]; then
        qc=true;
    else
        qc=false;
    fi
fi

if [[ "$w" == "0" ||  -z "$w" ]]; then
    w=1;
fi


clear
echo "Press any key to exit"
sleep 2

clear
echo -e "Domain: $d\nRefresh Interval: $w seconds\nUpdate Mode: $qc"
sleep 2

clear
if [ -t 0 ]; then SAVED_STTY="`stty --save`"; stty -echo -icanon -icrnl time 0 min 0;  fi

gp="";
lp="";
gc=false;
for (( ; ; )); do
	sudo systemctl restart nscd
    l=$(host $d)
    g=$(host $d 8.8.8.8 | sed -e '1,5d;')

    clear
    printf "\e[7m                                                                           \e[27m\n\n\nLocal DNS:\n$l\n\n\nGoogle DNS:\n$g\n\n\n"

    if [[ "$qc" == "true" ]]; then
        if [ "$gc" == "true" ]; then
            if [ ! -z "$lp" ]; then
                if [ ! "$lp" == "$l" ]; then
                    q=true;
                    printf '\e[7m Local DNS has changed!                                                      \e[27m\r';
                    break;
                fi
            fi
        fi
        if [ ! -z "$gp" ]; then
            if [ ! "$gp" == "$g" ]; then
                gc=true;
                printf '\e[7m Google DNS has changed!                                                    \e[27m\r';
                sleep 1
            fi
        fi
        gp=$g
        lp=$l
    fi

    if [ ! "$w" == "1" ]; then
        c=$w
        for (( ; ; )); do
             printf ' \e[7mWaiting '$c' seconds                                                         \e[27m\r';
            sleep 0.25;
            if [ "$c" == "0" ]; then
                for i in {1..2}; do
                    printf ' \e[7m[-] Refreshing!                                                           \e[27m\r';
                    sleep 0.1
                    printf ' \e[7m[\] Refreshing!                                                           \e[27m\r';
                    sleep 0.1
                    printf ' \e[7m[|] Refreshing!                                                           \e[27m\r';
                    sleep 0.1
                    printf ' \e[7m[/] Refreshing!                                                           \e[27m\r';
                    sleep 0.1
                done
                break;
            fi
            let c-=1
            sleep 0.75
            key="`cat -v`"
            if [ ! "x$key" = "x" ]; then q=true; break; fi
        done
    else
        printf '\e[7m                                                                          \e[27m\r';
        sleep $w
        printf ' \e[7m Refreshing!                                                              \e[27m\r';
        key="`cat -v`"
        if [ ! "x$key" = "x" ]; then q=true; fi
    fi

    if [ "$q" = true ]; then printf '\e[7m                                                                           \e[27m\r'; break; fi
done

if [ -t 0 ]; then stty "$SAVED_STTY"; fi

echo
exit 0
