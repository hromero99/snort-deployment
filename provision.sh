#!/bin/bash

install_mariadb(){
    if [ ! -z $(cat /etc/passwd | grep mysql)  ];then
        echo "[!] Mariadb / Mysql server already installed";
        return
    else
        sudo apt install -y  mariadb-server
 #       sudo mysql_secure_installation
    fi

}

install_libraries(){
    echo "[-] Installing libraries"
    #sudo apt install -y make gcc libpcre3-dev zlib1g-dev libluajit-5.1-dev libpcap-dev openssl libssl-dev libnghttp2-dev libdumbnet-dev bison flex libdnet autoconf libtool
    sudo apt install make gcc   libauthen-sasl-perl libdaq2 libdata-dump-perl libencode-locale-perl libfile-listing-perl libfont-afm-perl libhtml-form-perl libhtml-format-perl libhtml-parser-perl libhtml-tagset-perl
  libhtml-tree-perl libhttp-cookies-perl libhttp-daemon-perl libhttp-date-perl libhttp-message-perl libhttp-negotiate-perl libio-html-perl libio-socket-ssl-perl liblwp-mediatypes-perl
  liblwp-protocol-https-perl libmailtools-perl libnet-http-perl libnet-smtp-ssl-perl libnet-ssleay-perl libtimedate-perl libtry-tiny-perl liburi-perl libwww-perl libwww-robotrules-perl
  net-tools oinkmaster perl-openssl-defaults bison flex libcap-dev autoconf libtool libtool-bin
}

install_snort_daq(){
    echo "[-] Installing Snort DAQ"
    if [ ! -d /tmp/snort_daq ];then
            mkdir /tmp/snort_daq
            wget https://www.snort.org/downloads/snort/daq-2.0.7.tar.gz -O /tmp/snort_daq.tar.gz
            tar xvf /tmp/snort_daq.tar.gz --directory /tmp/snort_daq
            fi
    cd /tmp/snort_daq/daq-2.0.7
    autoreconf -f -i
    ./configure && make && sudo make install
}

install_mariadb
install_libraries
install_snort_daq