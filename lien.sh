#!/bin/bash

red="\e[31m"
grn="\e[32m"
ylw="\e[33m"
cyn="\e[36m"
blu="\e[34m"
prp="\e[35m"
bprp="\e[35;1m"
rst="\e[0m"


uptek() {
	iext="${1##*.}"
	if [[ "${iext}" == "png" || "${iext}" == "PNG" ]]; then
		out=$( curl -sf -F "contentType=image/png" -F "encrypt=${encrypt}"  -F file="@${1}" https://api.teknik.io/v1/Upload )
	else
		out=$( curl -sf -F "encrypt=${encrypt}" -F file="@${1}" https://api.teknik.io/v1/Upload )
	fi

	if [[ "${out}" =~ "error" ]]
	then
		echo -ne "$red Error $rst"
		notify-send "Failed to upload ${1}"
		exit 1
	elif [[ "${out}" =~ "curl" ]]
	then
		echo -ne "$red Error $rst"
		notify-send "Failed to upload ${1}"
		exit 1
	else
		id="${out##*Name\":\"}"
		id="${id%%\"*}"

		notify-send "Uploaded" "${1} to teknik.io"
		echo "${1} - https://u.teknik.io/${id}" >> ~/logs.txt

		echo -ne "$grn Uploaded $rst"
		echo -n "${1} to "
		echo "https://u.teknik.io/${id}"
	fi
}

upoxo() {
	
}


while [[ $# -gt 0 ]]
do
	key="$1"

	case $key in
		-o|--oxo)
			file="$2"
			upoxo $file
			shift # past argument
			shift # past value
			;;
		-t|--teknik)
			file="$2"
			uptek $2
			shift # past argument
			shift # past value
			;;
	esac
done
