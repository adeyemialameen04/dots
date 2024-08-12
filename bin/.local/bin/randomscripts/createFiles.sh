#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "Usage: $0 <filenames_file> <directory>"
	exit 1
fi

FILENAMES_FILE="$1"
DIR="$2"

if [ ! -f "$FILENAMES_FILE" ]; then
	echo "Error: File '$FILENAMES_FILE' not found. Please check the file path."
	exit 1
fi

if [ ! -d "$DIR" ]; then
	mkdir -p "$DIR"
	if [ $? -ne 0 ]; then
		echo "Error: Failed to create directory '$DIR'!"
		exit 1
	fi
	echo "Created directory: $DIR"
fi

while IFS= read -r filename || [ -n "$filename" ]; do
	[ -z "$filename" ] && continue

	file_path="$DIR/$filename"
	touch "$file_path"
	if [ $? -ne 0 ]; then
		echo "Error: Failed to create file '$file_path'!"
		continue
	fi

	echo "Created: $filename"
done <"$FILENAMES_FILE"

echo "File creation process completed in directory '$DIR'."

add_shebang_to_files() {
	local directory="$1"
	local extension="$2"
	local shebang="$3"

	echo "Processing $extension files for shebang..."
	for file in $(find "$directory" -type f -name "*.$extension"); do
		chmod u+x "$file"
		first_line=$(head -n 1 "$file")
		if [ "$first_line" != "#!/usr/bin/python3" ]; then
			echo "Adding shebang to $file"
			(
				echo "$shebang"
				cat "$file"
			) >"${file}.tmp" && mv "${file}.tmp" "$file"
		else
			echo "Shebang already present in $file"
		fi
	done
}

add_shebang_to_files "$DIR" "js" "#!/usr/bin/node"
add_shebang_to_files "$DIR" "sh" "#!/bin/bash"

echo "Attempting to make scripts executable"
find "$DIR" -type f -name "*.c" -exec chmod u+x {} \;
js_files=$(find "$DIR" -type f -name "*.js")
find "$DIR" -type f -name "*.js" -exec chmod u+x {} \;
find "$DIR" -type f -name "*.sql" -exec chmod u+x {} \;
echo "DONE!"
echo "Now go and write bad code 😂"
