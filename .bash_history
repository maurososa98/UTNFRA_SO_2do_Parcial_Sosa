ls
cd mauro/
ls
cat ~/.ssh/id_ed25519.pub
ls
cd repogit/
ls
git clone https://github.com/upszot/UTN-FRA_SO_Examenes.git
ls
cd UTN-FRA_SO_Examenes/
ls
cd 202406
ls
./script_Precondicion.sh
source  ~/.bashrc  && history -a
ls
cd ..
ls
cd ..
ls
cd ..
ls
cd mauro/
clear
mkdir RTA_Examen_T$(date +%Y%m%d)
ls
cd RTA_Examen_20241118/
ls
vim Punto_A.sh 
ls
cd ..
cd RTA_Examen_T20241118
ls
cd ..
ls
rmdir RTA_Examen_T20241118
ls
cd RTA_Examen_20241118/
ls
sudo apt update
sudo apt install ansible -y
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc
# Add the repository to Apt sources:
echo   "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" |   sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
sudo usermod -a -G docker mauro 
exit
groups mauro
docker login -u maurososa988
ls
cd ..
ls
cd mauro/
ls
cd RTA_Examen_20241118/
ls
git init
ls
ls -l
git add .
rm -rf .git
ls
git status
cd ..
ls
cd repogit/
ls
git clone git@github.com:maurososa98/UTNFRA_SO_2do_Parcial_Sosa.git
ls
cd UTNFRA_SO_2do_Parcial_Sosa/
ls
pwd
cd ..
ls
cd RTA_Examen_20241118/
pwd
cd ..
ls
cp -r /home/mauro/RTA_Examen_20241118 /home/mauro/repogit/UTNFRA_SO_2do_Parcial_Sosa
cd repogit/
ls
cd UTNFRA_SO_2do_Parcial_Sosa/
ls
rm -rf RTA_Examen_20241118/
ls
cd ..
ls
cd UTN-FRA_SO_Examenes/
ls
cd 202406
ls
pwd
cd ..
ls
cd ..
ls
cd ..
ls
cd RTA_Examen_20241118/
ls
vim Punto_A.sh
ls -l
chmod 764 Punto_A.sh
ls -l
chmod 764 Punto_B.sh
chmod 764 Punto_C.sh
chmod 764 Punto_D.sh
ls -l
./Punto_A.sh
ls
cd ..
ls
cd ..
ls
cd home/
cd mauro/
ls
cd RTA_Examen_20241118/
ls
vim Punto_B.sh 
vim Punto_C.sh 
./Punto_B.sh 
ls
vim Punto_B.sh 
./Punto_B.sh 
vim Punto_B.sh 
sudo ./Punto_B.sh 
ls -l /usr/local/bin/sosaAltaUser-Groups.sh
ls
vim Punto_C.sh 
sudo ./Punto_C.sh 
docker login -u maurososa988
sudo ./Punto_C.sh 
ls
vim Punto_C.sh 
sudo ./Punto_C.sh 
sudo lsof -i :8080
cd ..
ls
cp -r /home/mauro/repogit/UTN-FRA_SO_Examenes/202406 /home/mauro/repogit/UTNFRA_SO_2do_Parcial_Sosa
cp -r /home/mauro/RTA_Examen_20241118 /home/mauro/repogit/UTNFRA_SO_2do_Parcial_Sosa
history -a
$HOME/.bash_history
sudo $HOME/.bash_history
ls -l ~/.bash_history
chmod 600 ~/.bash_history
$HOME/.bash_history
ls -l ~/.bash_history
cd ..
ls
cd home/
cd mauro/
ls
cd repogit/
ls
cd UTNFRA_SO_2do_Parcial_Sosa/
pwd
history -a
cp ~/.bash_history /home/mauro/repogit/UTNFRA_SO_2do_Parcial_Sosa
ls
ls -l
cd ..
ls
cd ..
ls
cd ..
ls
cd mauro/
ls
cd repogit/
cd UTNFRA_SO_2do_Parcial_Sosa/
ls
