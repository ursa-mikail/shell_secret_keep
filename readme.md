
# Shell Menu for Passcode Keeping

1. Store passcode
1.1. Query the following details:

<pre>
account: 
user_id: 
passcode: 
timestamp: <YYYY-MM-DD_HHmm_ss>
</pre>

<pre>
Save as tokenised file 

[&lt;account&gt;.&lt;user_id&gt;.txt, e.g.                  xx@123.com.joe.txt 
            where                           &lt;account=xx@123.com&gt;.&lt;user_id=joe&gt;] 

                        under : ./key_vault/passcodes
</pre>

2. Search and display passcode

3. Suggest random passcode

> [!WARNING]
> This is merely a plaintext keep. Please add file and/or folder ciphering. 


<pre>
% chmod +x ./main.sh
% ./main.sh

Directory exists: ./key_vault/passcodes
1. Store passcode
2. Search and display passcode
3. Suggest random passcode
x|X. Exit
Input Selection: 2

./key_vault
└── passcodes
    ├── xx@123.com.joe.txt
    └── x@ursa.com.ursa.txt

2 directories, 2 files
Enter keyword to search for passcode (e.g. gmail, chasebank): 
123.com
Found passcodes matching '123.com':
Displaying passcode from ./key_vault/passcodes/xx@123.com.joe.txt:
account: me@you.com
user_id: joe
passcode: 234
timestamp: 2024-11-25_2149_15

=======================================================================
=======================================================================
1. Store passcode
2. Search and display passcode
3. Suggest random passcode
x|X. Exit
Input Selection: 1

Enter the account (e.g. email, web-service): 
jo@chase.com
Enter the user ID (e.g. username): 
jo
Enter the passcode: 
Passcode for jo@chase.com (ho) saved successfully!
=======================================================================
=======================================================================
1. Store passcode
2. Search and display passcode
3. Suggest random passcode
x|X. Exit
Input Selection: 2

./key_vault
└── passcodes
    ├── jo@chase.com.jo.txt
    ├── xx@123.com.joe.txt
    └── x@ursa.com.ursa.txt

2 directories, 3 files
Enter keyword to search for passcode (e.g. gmail, chasebank): 
chase
Found passcodes matching 'chase':
Displaying passcode from jo@chase.com.jo.txt:
account: jo@chase.com
user_id: jo
passcode: 345
timestamp: 2024-11-25_2152_57

=======================================================================
=======================================================================
 % ./main.sh
Directory exists: ./key_vault/passcodes
1. Store passcode
2. Search and display passcode
3. Suggest random passcode
x|X. Exit
Input Selection: 3

Enter the desired length of the passcode: 
300
Suggested random passcode: ]2:(\,K|Ylv_.imd2-KR&6}qg~28ZB@ZR:F<gH!cFh=Qsj7X#}WxQtVQ$[b6wtbaY1)mh6$02KT(x*p+%uKgeFitv>[foVnv$D%m$^LA@joV5iMW_?y+f0>C}rq-a9DeAx}aa\|W&eX/3YxmxRwm}6jyo1VIR8$XE#o0&LRdLq=iqoK=\#7lLVvr+@W]m8p>-Z!W2GiVX$*YL!!ic{*LW=PnrYw!2$O$409sD\!>2{-^_Thl1SF9KyL+!O7M6FA+3H<k<$gyR]Z3_V6|^rOQ]3gT?)zK125b_CHh-be4.KQ=
=======================================================================
=======================================================================
1. Store passcode
2. Search and display passcode
3. Suggest random passcode
x|X. Exit
Input Selection: x

</pre>
