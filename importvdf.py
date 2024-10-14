# Import VDF file and export it to json
# Usage: python vdf2json.py <input.vdf> <output.json>
# Example: python vdf2json.py gameinfo.vdf gameinfo.json
import vdf
import json
import sys

def vdf2json(input_file, output_file):
    with open(input_file, 'r') as f:
        data = vdf.load(f)
    with open(output_file, 'w') as f:
        json.dump(data, f, indent=4)

if __name__ == '__main__':
    if len(sys.argv) != 3:
        print('Usage: python vdf2json.py <input.vdf> <output.json>')
        sys.exit(1)
    vdf2json(sys.argv[1], sys.argv[2])
