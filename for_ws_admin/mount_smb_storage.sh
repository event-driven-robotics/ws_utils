echo "Type IIT when prompted for domain"

function show_help() {
  echo "Usage: $(basename $0) [OPTIONS]"
  echo "OPTIONS: "
  echo "-s|--server_url <server_url>. Example:iiticubstor01.iit.local"
  echo "-f|--folder_name <folder_name>. Example:scratch"
  echo "-l|--link <name of symlink>. Optional name of symlink relative to current directory. If not specified will be automatically generated."
  exit 1
}

while :; do
  case $1 in
  -h | -\? | --help)
    show_help # Display a usage synopsis.
    exit
    ;;
  -s | --server) # Takes an option argument; ensure it has been specified.
    if [ "$2" ]; then
      server_location=$2
      shift
    else
      die "ERROR: option $1 requires a non-empty option argument."
    fi
    ;;  
  -f | --folder_name) # Takes an option argument; ensure it has been specified.
    if [ "$2" ]; then
      folder_name=$2
      shift
    else
      die "ERROR: option $1 requires a non-empty option argument."
    fi
    ;;
  -l|--link) # Takes an option argument; ensure it has been specified.
    if [ "$2" ]; then
      symlink_name=$2
      shift
    else
      die "ERROR: option $1 requires a non-empty option argument."
    fi
    ;;
  --) # End of all options.
    shift
    break
    ;;
  -?*)
    printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
    ;;
  *) # Default case: No more options, so break out of the loop.
    break ;;
  esac

  shift
done

if [ -z "${server_location}" ]; then
    echo "Please specify server location. Example:iiticubstor01.iit.local"
    exit
fi

if [ -z "${folder_name}" ]; then
    echo "Please specify folder location. Example:scratch"
    exit
fi

if [ -z "${symlink_name}" ]; then
    symlink_name="${server_location}_${folder_name}"
fi

gio mount smb://$server_location/$folder_name

if [ -e $symlink_name ]; then
    echo "$symlink_name already exists. Skipping"
else
    echo "Linking mounted directory /run/user/$(id -u `whoami`)/gvfs/smb-share:server=$server_location,share=$folder_name to $symlink_name"
    ln -s "/run/user/$(id -u `whoami`)/gvfs/smb-share:server=$server_location,share=$folder_name" $symlink_name
fi