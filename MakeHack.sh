base_dir=$(dirname "$(readlink -f "$0")")
Compile_Folder="$base_dir/EngineHacks" 
main_event="$base_dir/Buildfile.event"
source_rom="$base_dir/FE8U.gba"
target_rom="$base_dir/FEtest.gba"
ea_exe="$base_dir/EventAssembler/ColorzCore.exe"


cd "$Compile_Folder"
rm _include/_Definitions.h.o
make _include/_Definitions.h.o
make clean
make lyn



cd "$base_dir"
echo "Preparing ROM"
cp -f "$source_rom" "$target_rom"
echo "Assembling"
"$ea_exe" A FE8 "-output:$target_rom" "-input:$main_event"
echo "Done!"

