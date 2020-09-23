WorkingDir=/home/devops/todo
branch="$1"
ssh devops@18.207.161.214 <<EOF

echo "*********************************************************************"

echo "Changing the working Directory"
cd $WorkingDir

echo "*********************************************************************"
echo "Checkout git repository from the $branch"
git fetch

git checkout $branch

git pull

echo "Python virtualenv activation"
source env/bin/activate

echo "Installing the requirments on the server"
pip install -U -r requirements.txt

echo "**********************************************************************"
echo "Database Migrations"
flask db upgrade

echo "Restart the application process"
pkill -u devops flask
flask run -h 0.0.0.0 &
EOF
