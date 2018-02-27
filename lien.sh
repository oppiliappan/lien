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
	local iext="${1##*.}"
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
	else
		id="${out##*Name\":\"}"
		id="${id%%\"*}"

		echo -ne "$grn"
		echo -ne "Uploaded $rst"
		echo -ne "${1} to "
		echo "https://u.teknik.io/${id}"

		local file_path=$( readlink -f $1 )
		echo "${file_path} - https://u.teknik.io/${id}" >> ~/lien/lien_logs

		notify-send "Uploaded" "${1} to teknik.io"

	fi
}

upoxo() {
	local id=$( curl -sf -F "file=@${1}" https://0x0.st )

	if [[ -z "${id// }" ]]
	then
		echo -ne "$red Error $rst"
		notify-send "Failed to upload ${1}"
		exit 1
	else
		echo -ne "$grn"
		echo -ne "Uploaded $rst"
		echo -ne "${1} to "
		echo "${id}"

		local file_path=$( readlink -f $1 )
		echo "${file_path} - ${id}" >> ~/lien/lien_logs

		notify-send "Uploaded" "${1} to 0x0.st"
	fi
}

print_logs() {
	cat ~/lien_logs.txt
}


while [[ $# -gt 0 ]]
do
	key="$1"

	case $key in
		-o|--oxo)
			file="$2"
			upoxo $file
			shift
			shift
			;;
		-t|--teknik)
			file="$2"
			uptek $2
			shift
			shift
			;;
		-s|--scrot)
			file="$2"
			scrot -s $2
			upoxo $file
			shift
			shift
			;;
		-f|--scrot-full)
			file="$2"
			scrot $2
			upoxo $file
			shift
			shift
			;;
		-l|--display-logs)
			print_logs
			exit 1
			;;
	esac
done
