#/bin/bash 
 
case "$1" in 
     clean) 
          make clean 
          rm -rf ./out 
          exit 
          ;; 
     prepare) 
          cd vendor/cyanogen 
          ./get-rommanager
          ./get-google-files
          exit
          ;;
     otapackage) 
          . build/envsetup.sh 
          lunch cyanogen_galaxys-eng
          make -j`grep 'processor' /proc/cpuinfo | wc -l` otapackage
	  exit
          ;; 
     *)
esac

. build/envsetup.sh 
lunch cyanogen_galaxys-eng
make -j`grep 'processor' /proc/cpuinfo | wc -l`
