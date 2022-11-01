
# monochromatic_pdf_to_blue

Transform any colour a PDF to blue.
This idea came to mind as, at the time of this writing, I have no black ink left in my printer, and it does not let me use the color ink cartridge for printing in these situations, like in other printers...

## Pre-requisites
The command `convert` from [ImageMagick](https://imagemagick.org/) is used for this script, so please install it before executing the script or it will fail.

## Usage
First, set the script as executable:
```
$ chmod +x monochromatic_pdf_to_blue.sh
```
Then, execute it to see how to use it.
```
$ ./monochromatic_pdf_to_blue.sh
Perform monochromatic to blue PDF transformation.

Syntax: monochromatic_pdf_to_blue.sh [OPTIONS] INPUT_FILE
Options:
    -c  --from-color	Color --> monochromatic --> blue transformation
    -h  --help		Print this help
    -o  --output FILE	Set custom output file name

$
```

## Examples
If the PDF to be transformed is in greyscale, execute the following command and the resulting PDF will be saved as `output.pdf`:
```
$ ./monochromatic_pdf_to_blue.sh <FILE>
```
If the PDF to be transformed is not monochromatic (red, blue, yellow...), give it the option `--from-color` or `-c` to transform from color to monochromatic:
```
$ ./monochromatic_pdf_to_blue.sh -c <FILE>
```

