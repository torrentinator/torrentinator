



cd /sdcard/download/
mkdir www.philiphacker.in
cd www.philiphacker.in
mkdir torrent-downloads
mkdir magnet-to-torrent
mkdir torrent-to-magnet
mkdir torrent-hashes
cd /data/data/com.termux/files/home/torrentinator/
cp uninstall /sdcard/download/www.philiphacker.in/
cp update /sdcard/download/www.philiphacker.in/

BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GREY='\033[0;37m'
WHITE='\033[1;37m'
yellow='\033[1;33m'
grey='\033[1;30m'
red='\033[1;31m'
lime='\033[1;32m'
blue='\033[1;34m'
purple='\033[1;35m'
cyan='\033[1;36m'
NC='\033[0m' # No Color

clear
printf "${red}====================================\n"
printf "${lime}             Torrentinator    \n"
printf "${red}====================================\n"
printf "${WHITE}                                     \n\n"
printf "     Downloader \n\n"
printf "${yellow}        1 - Torrent Downloader   \n"
printf "        2 - Magnet Downloader  \n\n"
printf "${WHITE}     Convertor \n\n"
printf "${yellow}        3 - Torrent to Magnet      \n"
printf "        4 - Magnet to Torrent     \n\n"
printf "${WHITE}     Hash viewer \n\n"
printf "${yellow}        5 - Torrent Hash Viewer \n"
printf "        6 - Magnet Hash viewer   \n\n"
printf "${WHITE}     Settings\n\n"
printf "${yellow}"
printf "        7 - About This Tool    \n"
printf "        8 - Guide and Tutorial \n"
printf "        0 - Exit Torrentinator     \n"
printf "                         \n\n"
printf "${red}====================================\n"
printf "${lime}        www.philiphacker.in        \n"
printf "${red}====================================\n"
printf "${NC}                                     \n"

printf "${lime}Enter Your Choice : ${NC}"
read choice

if [ $choice -eq 1 ]
then
clear
printf "${GREEN}====================================\n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${WHITE}        TORRENT  DOWNLOADER          \n"
printf "${lime}        www.philiphacker.in        \n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${GREEN}====================================\n"
printf "${NC}                                     \n"
printf "${yellow}Enter Your Torrent File Path : ${NC}"
read path
cd /sdcard/download/www.philiphacker.in/torrent-downloads/
aria2c "$path"


elif [ $choice -eq 2 ]
then
clear
printf "${purple}====================================\n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${WHITE}         MAGNET DOWNLOADER          \n"
printf "${lime}        www.philiphacker.in        \n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${purple}====================================\n"
printf "${NC}                                     \n"
printf "${yellow}Paste Your Magnet Link here : ${NC}"
read link
cd /sdcard/download/www.philiphacker.in/torrent-downloads/
aria2c $link

elif [ $choice -eq 3 ]
then
clear
printf "${GREEN}====================================\n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${WHITE}         TORRENT TO MAGNET          \n"
printf "${lime}        www.philiphacker.in        \n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${GREEN}====================================\n"
printf "${NC}                                     \n"
printf "${yellow}Enter Your Torrent File Path : ${NC}"
read path
magnetlink=`aria2c -S "$path" | grep "Magnet URI" | cut -c13-`
magnetname=`aria2c -S "$path" | grep "Name" | cut -c7-`
cd /sdcard/download/www.philiphacker.in/torrent-to-magnet/
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
echo ${WHITE}Your Torrent File Name is,
echo ""
echo ${lime} $magnetname
echo ""
echo ${WHITE}Your Torrent File Magnet link is,
echo ""
echo $magnetname >> magnet-links.txt
echo "" >> magnet-links.txt
echo $magnetlink >> magnet-links.txt
echo "" >> magnet-links.txt
echo "" >> magnet-links.txt
echo ${lime} $magnetlink
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
echo -n "Do you want to download this torrent files (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
cd /sdcard/download/www.philiphacker.in/torrent-downloads
    aria2c $magnetlink
else
cd /data/data/com.termux/files/home/torrentinator/
    sh start
fi

elif [ $choice -eq 4 ]
then
clear
printf "${cyan}====================================\n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${WHITE}        MAGNET TO TORRENT          \n"
printf "${lime}        www.philiphacker.in        \n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${cyan}====================================\n"
printf "${NC}                                     \n"
printf "${yellow}Paste Your Magnet Link here : ${NC}"
read magneturl

echo ""
echo ""
echo ""
echo ${lime} Converting... Please Wait...

aria2c --bt-metadata-only=true --bt-save-metadata=true $magneturl >/dev/null

echo ""
echo ${lime} Converted Successfully ✓

mv *.torrent hash.torrent

torrentname=`aria2c -S hash.torrent | grep "Name" | cut -c7-`

mv hash.torrent  "`aria2c -S hash.torrent | grep Name | cut -c7-`_(www.philiphacker.in).torrent"

mv *.torrent "/sdcard/download/www.philiphacker.in/magnet-to-torrent/"



printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
echo ${WHITE}Your Torrent File Name is,
echo ""
echo ${lime} $torrentname
echo ""
echo ${WHITE}Your Torrent File Stored in Download folder at following loctaion,
echo ""
echo ${lime} /sdcard/download/www.philiphacker.in/magnet-to-torrent/
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
echo -n "Do you want to download this torrent files (y/n)? "
read answer

if [ "$answer" != "${answer#[Yy]}" ] ;then
cd /sdcard/download/www.philiphacker.in/torrent-downloads
    aria2c $magneturl
else
cd /data/data/com.termux/files/home/torrentinator/
    sh start
fi





elif [ $choice -eq 5 ]
then
clear
printf "${GREEN}====================================\n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${WHITE}        TORRENT HASH VIEWER          \n"
printf "${lime}        www.philiphacker.in        \n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${GREEN}====================================\n"
printf "${NC}                                     \n"
printf "${yellow}Enter Torrent File Path : ${NC}"
read path

torrenthash=`aria2c -S "$path" | grep "Info Hash" | cut -c11-`

torrentfilehash=`sha1sum "$path" -b | grep "" | cut -c-40`

echo ""
echo ""
echo ""
echo ${WHITE} Your Torrent Info Hash is,
echo ""
echo ${lime} $torrenthash
echo ""
echo ${WHITE} Your Current Torrent File Hash is,
echo ""
echo ${lime} $torrentfilehash ${NC}
echo ""
echo ""
echo ""

elif [ $choice -eq 6 ]
then
clear
printf "${purple}====================================\n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${WHITE}        MAGNET  HASH VIEWER          \n"
printf "${lime}        www.philiphacker.in        \n"
printf "${NC}                                     \n"
printf "${NC}                                     \n"
printf "${purple}====================================\n"
printf "${NC}                                     \n"
printf "${yellow}Paste Magnet Link Here : ${NC}"
read magnet

echo ""
echo ""
echo ""
echo ${lime} Converting Magnet into Torrent File to Check hash... Please wait...

aria2c --bt-metadata-only=true --bt-save-metadata=true $magnet >/dev/null

echo ""
echo ${lime} Converted ✓
echo ""
echo ${lime} Checking Torrent Hash... Please wait...
sleep 3
echo ""
echo ${lime} Done ✓


mv *.torrent infohash.torrent
path=infohash.torrent

torrenthash=`aria2c -S "$path" | grep "Info Hash" | cut -c11-`

torrentfilehash=`sha1sum "$path" -b | grep "" | cut -c-40`

rm infohash.torrent

echo ""
echo ""
echo ""
echo ${WHITE} Your Torrent Info Hash is,
echo ""
echo ${lime} $torrenthash
echo ""
echo ${WHITE} Your Current Torrent File Hash is,
echo ""
echo ${lime} $torrentfilehash ${NC}
echo ""
echo ""
echo ""




elif [ $choice -eq 7 ]
then
clear
printf "${red}====================================\n"
printf "${lime}             Torrentinator    \n"
printf "${red}====================================\n"
printf "${yellow}                                     \n\n"
printf "     ABOUT, \n\n"
printf "${WHITE}      This tool can download your\n"
printf "   files from both torrent and\n"
printf "   magnet links. It also convert\n"
printf "   torrent file into magnet link\n"
printf "   and magnet link into torrent\n"
printf "   file. It can also view both \n"
printf "   inbound and outbound hashes \n"
printf "   of both magnet and torrent.\n\n"
printf "${yellow}"
printf "    1 - Check for update    \n"
printf "    2 - Uninstall this tool \n"
printf "    3 - Go back to main menu     \n"
printf "                         \n\n"
printf "${red}====================================\n"
printf "${lime}        www.philiphacker.in        \n"
printf "${red}====================================\n"
printf "${NC}                                     \n"

printf "${lime}Enter Your Choice : ${NC}"
read cho
if [ $cho -eq 1 ]
then
 cd /sdcard/download/www.philiphacker.in/
sh update
elif [ $cho -eq 2 ]
then
 cd /sdcard/download/www.philiphacker.in/
sh uninstall
elif [ $cho -eq 3 ]
then
cd /data/data/com.termux/files/home/torrentinator/
    sh start
fi



elif [ $choice -eq 0 ]
then
clear
printf "${NC}\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
printf "${lime}Perry The Platypus !\n${NC}"
sleep 2
clear
exit
else
clear
printf "${NC}\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
printf "${lime}Invalid Choice ! Try Again..\n${NC}"
sleep 1
sh .menu
fi