
#!/bin/sh
 
    hcitool scan > bt_scan_in
    sudo arp-scan --interface=wlan0 192.168.4.0/24  > wf_scan_in

    awk '!/Scanning/{print tolower ($1)}' bt_scan_in > scan_out
    gawk '/192/{print $2}' wf_scan_in >> scan_out

    sort -u scan_out > scan_out_s
    wc -l scan_out > scan_nbrdev
    gawk '{print $1}' scan_nbrdev > scan_ap0


   rm bt_scan_in wf_scan_in scan_out scan_nbrdev scan_out_s

   cat scan_ap0

   git add scan_ap0

   git commit -m update

   git push -u origin master

   echo File uploaded

   date


