#este codigo permite comprobar la conectivad y disponibilidad de los canales m3u8
#los cuales genera un archivo unico fiable que se actualiza cada tiempo previamente 
#determinado

#!/bin/bash

#colores 

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'



save_to_file()
{
local url="$1"
local file_exit="$2"

if [ -z "$url" ] || [ -z "$file_exit" ]; then
        echo "debes proporcionar un texto y un nombre de archivo." >&2
        return 1
fi

echo "$url" >> $file_exit
echo "El texto '$url' ha sido añadido a '$file_exit'"

}


via_net()
{
URL="$1"
REGEX='^(https?|ftp)://[^\s/$.?#].[^\s]*$'

if [[ "$URL" =~ $REGEX ]]; then
	#comprobar si hay conexion
	
	if curl -s --head --fail "$URL" > /dev/null 2>&1; then
	obtener_canales "$URL"
	else
	echo "La URL '$URL' no responde correctamente o hubo un error."
	fi
else
echo "La sintaxis '$URL' no es valida"
fi
}


check_connect()
{
local channel_found=0
url="$1"
exit_file="$2"
curl -I -s "$url" -o /dev/null

response_code=$?

if [ "$response_code" -eq 0 ]; then
	
	status_code=$(curl -I -s "$url" | grep "HTTP/" | awk '{print $2}')

	if [ "$status_code" -eq 200 ]; then
    channel_found+=1
    save_to_file "$url" "$exit_file"
    
    printf "${GREEN}$url -> $exit_file ${NC}\n"
    
    
    elif [ "$status_code" -eq 403 ]; then
    printf "${RED}$url$ :ERROR 403 FORBIDEN.${NC}\n"
    
    
    elif [ "$status_code" -eq 404 ]; then
    printf "${RED}$url: ERROR 404 NOT FOUND. ${NC}\n"
    
else
	printf "${RED}La URL devolvió un código de estado inesperado: $status_code ${NC} \n"
fi

else
	printf "${RED}Error al contactar la URL con curl. Código de error: $status_code ${NC} \n"
fi
}




main()
{

local file="$1"	
local file_exit="$2"
local urls=()

 while IFS= read -r linea; do
    if [[ "$linea" == *"m3u8"* ]]; then
    url=$(grep -oE 'https?://[^ ]+\.m3u8' <<< "$linea")
		if [[ -n "$url" ]]; then
		urls+=("$url")
		fi
    fi
  done < "$file"



	
	if [ ${#urls[@]} -gt 0 ]; then
	#check each link and print to green on screen with code 200, save to file
		for url in "${urls[@]}"; do
			check_connect "$url" "$file_exit"
		done
		
	else
	echo "No se encontraron URLs con terminacion .m3u8"
	fi	

printf "Channel Found: ${channel_found}"
}


main "$1" "$2" #enviar nombre de archivo
    
