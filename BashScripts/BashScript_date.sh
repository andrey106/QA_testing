#!/bin/bash
monthto() {
case $1 in
1 ) month="Jan" ;; 7 ) month="Jul" ;;
2 ) month="Feb" ;; 8 ) month="Aug" ;;
3 ) month="Mar" ;; 9 ) month="Sep" ;;
4 ) month="Apr" ;; 10 ) month="Oct" ;;
5 ) month="May" ;; 11 ) month="Nov" ;;
6 ) month="Jun" ;; 12 ) month="Dec" ;;
* ) echo "$0: Unknown month value $1" >&2 exit 1
esac
return 0
}
#################
if [ $# -ne 3 ] ; then
echo "Usage: $0 month day year" >&2
echo "Formats are August 3 1962 and 8 3 1962" >&2
exit 1
fi
if [ $3 -le 99 ]; then
echo "$O: expected 4-digit year value." >&2
exit 1
fi
if [ -z $(echo $1|sed 's/[[:digit:]]//g') ]; then
monthto $1
else
month="$(echo $1 | cut -c1 | tr '[:lower:]' '[:upper:]')"
month="$month$(echo $1 | cut -c2-3 | tr '[:upper:]' '[:lower:]')"
fi
echo $month $2 $3
exit 0
