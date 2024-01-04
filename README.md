# age-tools

Tools I use to make life with Age easier.

## Installation

Clone this repository and copy `*.sh` files to you executable path.

Create age key (or symlink you existing one).

`age-keygen -o ~/.age.key`

Optional: Add you pubkey to known identities

`age-identity-add me $(cat ~/.age.key | grep public | awk '{print $4}')`


## Usage

### Basic usage
Your buddy John sends you his public key
`age1yytg7aq3q0j256xeaekh6arrlrvxcrju5vh5kx0h6acrj0x7mq8qvwpau7`

Add his key and send him a message

```
age-identity-add.sh george age1yytg7aq3q0j256xeaekh6arrlrvxcrju5vh5kx0h6acrj0x7mq8qvwpau7
>> Identity key age1yytg7aq3q0j256xeaekh6arrlrvxcrju5vh5kx0h6acrj0x7mq8qvwpau7 was registered under nick george.

# encrypt message "Hi George, this is secret message."
age-encrypt.sh george   # opens editor to write the message
>> -----BEGIN AGE ENCRYPTED FILE-----
>> YWdlLWVuY3J5cHRpb24ub3JnL3YxCi0+IFgyNTUxOSBWTWJoVlNCdk5nVklGc1A2
>> OGlJVHJwTGlUUVJWNE4rRlhlUy9rM3dlRHlZCldVRzJqQkVnemhWMEJZVFVYZGZa
>> T1orZWIrbDdSdCs3alZIbEdhamprY2cKLS0tIHRnNlB0UzhNSTg2MnByeW9lSE9Y
>> RTk0emJ6UFNsdXNRTjVCakhvWGZGNlEKstCb82pC8OPPbzgHVII2/KPUINK03InN
>> mZrdV3Kxyad/CzXE1mEkjQh7RwmGKI6xqUbOXPe3GHgA+Gu+hVi+nG+q0w==
>> -----END AGE ENCRYPTED FILE-----
```

You send the output to George.

George reads the message:
```
age-decrypt.sh  # opens editor to paste the message
```

### Encrypt / decrypt files

To encrypt file use standard linux pipes.

Example: You have a file `secret-certificate.cer`

```
age-encrypt-file.sh secret-certificate.cer
>> Encrypted file was stored to secret-certificate.cer.age
```

George then decrypts the file by

```age-decrypt-file:ta > secret-sertificate.cer


