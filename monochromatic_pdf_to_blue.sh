#!/bin/sh

############################################################
# Help                                                     #
############################################################
Help()
{
   # Display Help
   echo "Perform monochromatic to blue PDF transformation."
   echo
   echo "Syntax: monochromatic_pdf_to_blue.sh [OPTIONS] INPUT_FILE"
   echo "Options:"
   echo "    -c  --from-color	Color --> monochromatic --> blue transformation"
   echo "    -h  --help		Print this help"
   echo "    -o  --output FILE	Set custom output file name"
   echo
}

############################################################
# Main program                                             #
############################################################

# Check if "convert" command is present and abort if not
if ! command_lookup="$(type -p "convert")" || [[ -z $command_lookup ]]; then
  echo 'Command "convert" from ImageMagick not present. Aborting...'
  echo
  Help
  exit 1
fi

# Parse options
while [ True ]; do
if [ "$1" = "--from-color" -o "$1" = "-c" ]; then
    COLOR_TRANSFORMATION="1"
    shift 1
elif [ "$1" = "--output" -o "$1" = "-o" ]; then
    OUTPUT_FILE=$2
    shift 2
elif [ "$1" = "--help" -o "$1" = "-h" ]; then
    Help
    exit
else
    INPUT_FILE=$1
    break
fi
done

# Print help message if no file to transform
if [ -z "$INPUT_FILE" ]; then
    Help
    exit
fi

# Set default output file
if [ -z "$OUTPUT_FILE" ]; then
    OUTPUT_FILE="output.pdf"
fi

# If "-c" or "--from-color" option is given,
# this perform color to monochromatic transformation,
# and then monochromatic to blue transformation.
# If not, it is only performed monochromatic to blue transformation.
if [ ! -z "$COLOR_TRANSFORMATION" ]; then
    convert -density 300 -monochrome "$INPUT_FILE" "$OUTPUT_FILE"
    convert -density 300 "$OUTPUT_FILE" -fill blue -opaque black "$OUTPUT_FILE"
else
    convert -density 300 "$INPUT_FILE" -fill blue -opaque black "$OUTPUT_FILE"
fi

echo "---- Result in file $OUTPUT_FILE ----"
