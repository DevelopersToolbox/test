#!/usr/bin/env bash


mapfile -t remote_tags < <( git ls-remote --tags origin | grep -v '\^{}' | cut -f 2 | cut -d '/' -f '3' | sort -V )
mapfile -t local_tags < <(git tag --sort=committerdate -l)

echo "${remote_tags[@]}"
echo "${local_tags[@]}"


Array3=()
for i in "${local_tags[@]}"; do
    skip=
    for j in "${remote_tags[@]}"; do
        if [[ $i == "${j}" ]]; then
            skip=1;
            break;
        fi
    done
    [[ -n $skip ]] || Array3+=("$i")
done

if [[ ${#Array3[*]} -eq 0 ]]; then
        echo "No differences between the list"
else
        echo "${Array3[@]}"
        echo "${Array3[-1]}"
fi


#echo "${Array3[@]}"

