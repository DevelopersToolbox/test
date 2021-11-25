os='alpine'

if [ -n ${os} ]; then
           dir_path="Dockerfiles/${os}/*/"
        else
           dir_path="Dockerfiles/*/"
        fi
        if [ -d "${dir_name}" ]; then
echo "here"
          echo "::set-output name=versions::$(ls -d ${dir_path} | cut -f3 -d'/' | sort -n | jq -cnR '[inputs | select(length>0)]')"
        else
          echo "$dir_path"
          echo "::set-output name=versions::[]"
        fi
