# dare-aws-cli

A set of helper scripts to make your life a little easier in AWS.

## Installation & Setup

Time to setup your environment. All the dare-aws-cli-setup script does is add the etc/dare-aws-cli.rc to your .profile or .bash_profile

1. Clone or download this repo and runt the setup script.
    ``` 
    # git clone https://github.com/daringway/dare-aws-cli.git
    # dare-aws-cli/bin/dare-aws-cli-setup 
    ```
1. Start a new bash session


## Overview

All commands start with 'aws-' for easy tab completion.  Most commands have the -? and -h options.

WARNING: Commands that are not listed below are still in development and subject to change.

## aws-cred AWS Credential Switching

aws-cred is built-in function that allows easy switching between AWS Credentials.

Credentials can exist in either ~/./aws/credentials or in Mac OS X keychain (see aws-cred-addx)

If you do not specify a credential a list of options will be presented. 

## aws-cred-loop

This commands allows you to loop over a set of $AWSLOOPACCOUNTS and execute a command

```
# export AWSLOOPACCOUNTS="cred1 cred2 cred5"
# aws-cred-loop ec2 describe-instances
```

## aws-role AWS Assume Role

aws-role is a built-in function that allows easy AWS assume role.  Same functionality as aws-cred

## aws-role-loop

Exact same function as aws-cred-loop except for roles and the uses AWSLOOPROLES

## aws-ec2-ssh (alias assh)

Assist with login into an EC2 instance and use specified keyname if found.  aws-ec2-ssh will search all meta 
data associated with the each EC2.  If one match is found it will automatically ssh to the instance.
If multiple instances are found you will be prompted to select.

keyname files use the following search option in ~/.aws/keys
1. <keyname>+<cred-name>.pem
2. <keyname>.pem

```
# aws-cred my-dev-cred
# assh adminhost
```