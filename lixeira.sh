18/07/2019 bob_util.sh__________________
# NÃO USADO
# -----------------------------------------------------------------------------------------
# Criar paths adicionais para arquivos que não foram tratados indivicualmente
# -----------------------------------------------------------------------------------------
# SOURCE="${BASH_SOURCE[0]}"

# while [ -h "${SOURCE}" ]; do # resolve ${SOURCE} until the file is no longer a symlink
#   DIR="$( cd -P "$( dirname "${SOURCE}" )" && pwd )"
#   SOURCE="$(readlink "${SOURCE}")"
#   [[ ${SOURCE} != /* ]] && SOURCE="${DIR}/${SOURCE}" 
#   # if ${SOURCE} was a relative symlink, we need to resolve it relative to the path where 
#   #the symlink file was located
# done
# SOURCEPATH="$( cd -P "$( dirname "${SOURCE}" )" && pwd )"

# if [ ! -d "${SOURCEPATH}" ] ; then
#       die "Failed to find library files expected in: ${SOURCEPATH}"
# fi

# for utility_file in "${SOURCEPATH}"/*.sh
# do
#       if [ -e "${utility_file}" ]; then
#       # Don't source self
#       if [[ "${utility_file}" == *"utils.sh"* ]]; then
#               continue
#       fi
#       source "$utility_file"
#       fi
# done
# -----------------------------------------------------------------------------------------
17/07/2019 bob_util.sh__________________

    # -----------------------------------------------------------------------------------------
                                                                  # Testes de funções para json
    # -----------------------------------------------------------------------------------------
    function bashJson(){
        python readjson.py "$@"
    }
    function jsonGet {
        python -c 'import json,sys
        o=json.load(sys.stdin)
        k="'$1'"
        if k != "":
            for a in k.split("."):
                if isinstance(o, dict):
                    o=o[a] if a in o else ""
                elif isinstance(o, list):
                    if a == "length":
                        o=str(len(o))
                elif a == "join":
                    o=",".join(o)
                else:
                    o=o[int(a)]
                else:
                    o=""
        if isinstance(o, str) or isinstance(o, unicode):
            print o
        else:
            print json.dumps(o)
        '
    }
    function lp(){
        python -c "
            from jsonpath_rw import jsonpath, parse
            import sys,json
            jsonpath_expr = parse('Install.comandos[1]')
            out = [match.value for match in jsonpath_expr.find(json.load(sys.stdin))]
            print out;
        "
    }
    function json_extract() {
        local key=$1
        local json=$2

        local string_regex='"([^"\]|\\.)*"'
        local number_regex='-?(0|[1-9][0-9]*)(\.[0-9]+)?([eE][+-]?[0-9]+)?'
        local value_regex="${string_regex}|${number_regex}|true|false|null"
        local pair_regex="\"${key}\"[[:space:]]*:[[:space:]]*(${value_regex})"

        if [[ ${json} =~ ${pair_regex} ]]; then
            echo $(sed 's/^"\|"$//g' <<< "${BASH_REMATCH[1]}")
        else
            return 1
        fi
    }
    function parse_json()
    {
        echo $1 | \
        sed -e 's/[{}]/''/g' | \
        sed -e 's/", "/'\",\"'/g' | \
        sed -e 's/" ,"/'\",\"'/g' | \
        sed -e 's/" , "/'\",\"'/g' | \
        sed -e 's/","/'\"---SEPERATOR---\"'/g' | \
        awk -F=':' -v RS='---SEPERATOR---' "\$1~/\"$2\"/ {print}" | \
        sed -e "s/\"$2\"://" | \
        tr -d "\n\t" | \
        sed -e 's/\\"/"/g' | \
        sed -e 's/\\\\/\\/g' | \
        sed -e 's/^[ \t]*//g' | \
        sed -e 's/^"//'  -e 's/"$//'
    }
    function LerJson() {
        python -c "import json,sys;sys.stdout.write(json.dumps(json.load(sys.stdin)$1))";
    }
___________________________________________________________________________________________________________

# bob_i.sh em 15/07/2019-------------------------------------------------------------------------------------
# ___________________________________________________________________________________________________________
# Iterate over options breaking -ab into -a -b when needed and --foo=bar into
# --foo bar
# optstring=h
# unset options
# while (($#)); do
#   	case $1 in
#     	# If option is of type -ab
#     	-[!-]?*)
#       		# Loop over each character starting with the second
#       		for ((i=1; i < ${#1}; i++)); do
# 	        	c=${1:i:1}

# 	        	# Add current char to options
# 	        	options+=("-$c")

# 	        	# If option takes a required argument, and it's not the last char make
# 	        	# the rest of the string its argument
# 	        	if [[ $optstring = *"$c:"* && ${1:i+1} ]]; then
# 	          		options+=("${1:i+1}")
# 	          		break
# 	        	fi
#       		done
#       	;;

#     	# If option is of type --foo=bar
#     	--?*=*) options+=("${1%%=*}" "${1#*=}") ;;
#     	# add --endopts for --
#     	--) options+=(--endopts) ;;
#     	# Otherwise, nothing special
#     	*) options+=("$1") ;;
#   	esac
#   	shift
# done
# set -- "${options[@]}"
# unset options

# Print help if no arguments were passed.
# Uncomment to force arguments when invoking the script
# [[ $# -eq 0 ]] && set -- "--help"

# # Read the options and set stuff
# while [[ $1 = -?* ]]; do
#   	case $1 in
# 	    -h|--help) usage >&2; safeExit ;;
# 	    --version) echo "$(basename $0) ${version}"; safeExit ;;
# 	    -c|--clima) shift; 
# 			if [ "${1}" = "-d" ] ; then
# 				ClimaTempo -d ${2}; mainScript 
# 			else
# 				ClimaTempo -c ${2}; mainScript 
# 			fi ;;
# 	    #-p|--password) shift; echo "Enter Pass: "; stty -echo; read PASS; stty echo;
# 	    #  echo ;;
# 	    -v|--verbose) verbose=true ;;
# 	    -l|--log) printLog=true ;;
# 	    -q|--quiet) quiet=true ;;
# 	    -s|--strict) strict=true;;
# 	    -d|--debug) deb; mainScript ;;
# 	    --force) force=true ;;
# 	    --endopts) shift; break ;;
# 	    *) die "invalida optção: '$1'." ;;
#   	esac
#   	shift
# done


#args+=("$@")  							# Store the remaining part as arguments.
#trap trapCleanup EXIT INT TERM 			# Trap bad exits with your cleanup function
#IFS=$'\n\t' 							# Set IFS to preferred implementation
#set -o errexit 							# Exit on error. Append '||true' when you run the script if you 
#if ${strict}; then set -o nounset ; fi 	# Exit on empty variable

# Bash will remember & return the highest exitcode in a chain of pipes.
# This way you can catch the error in case mysqldump fails in `mysqldump |gzip`, for example.
#set -o pipefail


# Exit cleanlyd
#safeExit
#________________________________________________________________________________________________________________