Flush DNS Bash Script
===
Recently buy a domain? You can get on it alot faster by running this script. You can actually see the IP change with the script.
##For OS X:
It involves Terminal but only requires to be logged in an administrator account, and that accounts password to be inputted for it to run.

On OS X you must put this file within your home directory and open Terminal and run `chmod +x` on the file.

For exmple `chmod +x /Users/saigon/Documents/sh/flushdns.sh`

Now you can add it as an alias in .bash_profile, open Terminal and

```plaintext
cd ~/
nano .bash_profile
```

```plaintext
  GNU nano 2.0.6             File: .bash_profile                                
alias flushdns="/Users/saigon/Documents/sh/flushdns.sh"














                                [ Read 5 lines ]
^G Get Help  ^O WriteOut  ^R Read File ^Y Prev Page ^K Cut Text  ^C Cur Pos
^X Exit      ^J Justify   ^W Where Is  ^V Next Page ^U UnCut Text^T To Spell
```

`^X`  to exit, and `Y` to save changes.

Now reload the .bash_profile by
```plaintext
cd ~/
source .bash_profile
```
###Usage
Fist arguemnt is the domain, Second argument is refresh interval and Third arguemnt is if you want to exit on IP change.
```plaintext
jgonrowski:~ jgonrowski$ flushdns saigon.sh 5 -c
```
####Output
```plaintext
---------------------------------------------------------------------------
Local DNS:
google.com has address 172.217.0.14
google.com has IPv6 address 2607:f8b0:4009:813::200e
google.com mail is handled by 30 alt2.aspmx.l.google.com.
google.com mail is handled by 20 alt1.aspmx.l.google.com.
google.com mail is handled by 40 alt3.aspmx.l.google.com.
google.com mail is handled by 50 alt4.aspmx.l.google.com.
google.com mail is handled by 10 aspmx.l.google.com.


Google DNS:
google.com has address 172.217.8.206
google.com has IPv6 address 2607:f8b0:4009:815::200e
google.com mail is handled by 20 alt1.aspmx.l.google.com.
google.com mail is handled by 30 alt2.aspmx.l.google.com.
google.com mail is handled by 40 alt3.aspmx.l.google.com.
google.com mail is handled by 10 aspmx.l.google.com.
google.com mail is handled by 50 alt4.aspmx.l.google.com.


 Local DNS has changed!
 ---------------------------------------------------------------------------                                                      
```

###For Linux:
It involves opening a Terminal but only requires to be logged in an account that is in sudoers (account can use sudo), and that accounts password to be inputted for it to run.

On linux put the file within your home directory and open a Terminal and run `chmod +x` on the file.

For exmple `chmod +x ~/flushdns.sh`

Now you can add it as an alias in .bash_profile, open Terminal and

```plaintext
cd ~/
nano .bash_profile
```

```plaintext
  GNU nano 2.0.6             File: .bash_profile                                
alias flushdns="~/flushdns.sh"














                                [ Read 5 lines ]
^G Get Help  ^O WriteOut  ^R Read File ^Y Prev Page ^K Cut Text  ^C Cur Pos
^X Exit      ^J Justify   ^W Where Is  ^V Next Page ^U UnCut Text^T To Spell
```

`^X`  to exit, and `Y` to save changes.

Now reload the .bash_profile by
```plaintext
cd ~/
source .bash_profile
```
###Usage
Fist arguemnt is the domain, Second argument is refresh interval and Third arguemnt is if you want to exit on IP change.
```plaintext
jgonrowski:~ jgonrowski$ flushdns saigon.sh 5 -c
```
####Output
```plaintext
---------------------------------------------------------------------------
Local DNS:
google.com has address 172.217.0.14
google.com has IPv6 address 2607:f8b0:4009:813::200e
google.com mail is handled by 30 alt2.aspmx.l.google.com.
google.com mail is handled by 20 alt1.aspmx.l.google.com.
google.com mail is handled by 40 alt3.aspmx.l.google.com.
google.com mail is handled by 50 alt4.aspmx.l.google.com.
google.com mail is handled by 10 aspmx.l.google.com.


Google DNS:
google.com has address 172.217.8.206
google.com has IPv6 address 2607:f8b0:4009:815::200e
google.com mail is handled by 20 alt1.aspmx.l.google.com.
google.com mail is handled by 30 alt2.aspmx.l.google.com.
google.com mail is handled by 40 alt3.aspmx.l.google.com.
google.com mail is handled by 10 aspmx.l.google.com.
google.com mail is handled by 50 alt4.aspmx.l.google.com.


 Local DNS has changed!
---------------------------------------------------------------------------
```

