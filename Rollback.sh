WorkingDir=/home/devops/todo
branch="$1"
ssh devops@18.207.161.214 <<EOF

echo "*********************************************************************"

echo "Changing the working Directory"
cd $WorkingDir

echo "Uninstalling the requirments on the server"
pip uninstall -y -r requirements.txt

EOF

