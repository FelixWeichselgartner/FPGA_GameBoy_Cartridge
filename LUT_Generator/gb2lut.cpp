#include <iostream>
using namespace std;
#include <iomanip>
#define HEX		std::hex << std::setw(2) << std::setfill('0')
#define HEX16	std::hex << std::setw(4) << std::setfill('0')

#include <string>
#include <fstream>

unsigned int RomSize, AmountRomBanks;
char *rom;


void load(string inputFile) {
	streampos size;
	ifstream gbfile;

	cout << "opening file." << endl;
	gbfile.open(inputFile, ios::in | ios::binary | ios::ate);

	if (gbfile.is_open()) {
		gbfile.seekg(0, ios::end);
		size = gbfile.tellg();
		cout << "file length: " << HEX16 << size << endl;
		gbfile.seekg(0, ios::beg);
		RomSize = (int)size;
		AmountRomBanks = RomSize / 0x4000;
		rom = new char[RomSize];
		if (rom != NULL) {
			gbfile.read(rom, size);
		} else {
			cout << "unable to reserve heap memory" << endl;
		}
		gbfile.close();
	} else {
		cout << "unable to open file" << endl;
		exit(9);
    }
}


void generate_lut(string name) {
    ofstream vhdl;
	vhdl.open("lut.vhd");
	vhdl << "TYPE rom is array (0 to 32768) of std_logic_vector(7 downto 0);" << endl;
    vhdl << "constant gbrom : rom := (" << endl;

    for (int address = 0; address < RomSize; address += 16) {
		vhdl << "    ";
		for (int i = 0; i < 16; i++) {
			vhdl << "x\"" << HEX << (int)rom[address + i] << "\"";
			if (address + i != RomSize - 1) {
				vhdl << ", ";
			}
		}
        vhdl << endl;
    }
	vhdl << ");" << endl;
    vhdl.close();
}


int main() {
    string name = "Tetris.gb";
    load(name);
    generate_lut(name);

    return 0;
}