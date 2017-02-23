

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

$DIR/bin/dare-aws-cli-setup

