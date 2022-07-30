#!/bin/bash
# Additional wrapper to

function clean
{
	echo "Cleaning"
	2>/dev/null 1>/dev/null rm config.h &
	2>/dev/null 1>/dev/null rm st &
	2>/dev/null 1>/dev/null rm st.o &
	2>/dev/null 1>/dev/null rm x.o &
}

echo "Started"
clean

while getopts 'imu' OPTION; do
  case "$OPTION" in
    i)
      echo "Make and install"
      make && sudo make clean install
      ;;
    m)
      echo "Make only"
      make
      ;;
    u)
      echo "Uninstall"
      sudo make uninstall
      ;;
    ?)
      echo "Script usage: $(basename \$0) -i make+install -m - make, -u uninstall" >&2
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

clean
echo "Finished"
