

function error {
	echo $*
	exit 2
}

DIR=${1-~/daring/dare-aws-cli}

mkdir -p $DIR || error "failed to create $DIR"
cd $DIR || error "can not change to $DIR"

# Extract to current directory
curl -L https://api.github.com/repos/daringway/dare-aws-cli/tarball/master | gunzip -c | tar --strip-components=1 -xvf -
chmod +x ./bin/*

# Cleanup old files
rm ./bin/aws-report-ec2-ri-unused 2>/dev/null
rm ./bin/dare-aws-cli-setup 2>/dev/null

PROFILE=~/.bash_profile
if [ -f ~/.profile ]
then
    PROFILE=~/.profile
fi
DENV=$(dirname $(dirname $0))/etc/dare-aws-cli.rc

if ! grep $DENV $PROFILE >/dev/null 2>&1
then
    echo "" >> $PROFILE
    echo "# ADDED by ${USER} on $(date)" >> $PROFILE
    echo "# BY running $0" >> $PROFILE
    echo ". $DENV" >> $PROFILE

    echo "Added $DENV to your $PROFILE"
    echo "Restart your login sesison and your are all set."
else
    echo "Your environment is already setup, you're all set."
fi