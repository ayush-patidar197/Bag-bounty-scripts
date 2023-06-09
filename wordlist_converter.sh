#!/bin/bash

generate_output() {
    input_word=$1
    input_list_path=$2
    output=()

    if [[ ! -f "$input_list_path" ]]; then
        echo "File not found."
        return
    fi

    while IFS= read -r word; do
        output+=("$input_word" "$word")
    done < "$input_list_path"

    printf '%s\n' "${output[@]}"
}

read -p "Enter the input word: " input_word
read -p "Enter the word list file name: " input_list_filename
read -p "Enter the path for the output file: " output_file_path

input_list_path="./$input_list_filename"

output_list=$(generate_output "$input_word" "$input_list_path")

if [[ -n "$output_list" ]]; then
    printf '%s\n' "${output_list[@]}" > "$output_file_path"
    echo "Output saved successfully."
else
    echo "Output generation failed."
fi

