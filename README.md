Contract Examples for Montreal's Blockchain Bootcamp


To connect to the private network, download mist browser.


For a simple installation go here:

https://github.com/ethereum/mist/releases

Choose the latest release (version 0.8.9) and download the necessary package for your system.

This depends on your operating system and architechture.

To find out your architechture:

Windows : https://answers.microsoft.com/en-us/windows/forum/windows_7-hardware/i-need-to-know-how-to-determine-my-processors/3ede9c69-25f5-427b-8e8d-e9dd2d032d22

Mac: https://www.chiefarchitect.com/support/article/KB-01230/determining-if-your-computer-is-32-bit-or-64-bit.html

Linux: http://unix.stackexchange.com/questions/12453/how-to-determine-linux-kernel-architecture


*********************************************************************************************
Windows

Download the correct .zip file
Extract the file into a chosen folder
Go in the folder
Click on Mist.exe

And voila!

Note: By clicking on Mist.exe, the Mist browser should execute and will start downloading the Ethereum Blockchain (the real one!). As this is multiple Gigs of data, and we don't want you to go over your expensive bandwidth allocation, close it and forget it until Sunday.


*********************************************************************************************
Mac

Download the .dmg
Either install it on the cli : http://apple.stackexchange.com/questions/73926/is-there-a-command-to-install-a-dmg
Or using Applications: https://www.howtogeek.com/177619/how-to-install-applications-on-a-mac-everything-you-need-to-know/
And voila!

By clicking on the application, the Mist browser should execute and will start downloading the Ethereum Blockchain (the real one!). As this is multiple Gigs of data, and we don't want you to go over your expensive bandwidth allocation, close it and forget it until Sunday.
*********************************************************************************************
Linux

Download the .deb
Go in a terminal, go to the file directory (most likely /home/<NAMEOFCOMP>/Downloads)
Execute the command " sudo dpkg -i <name_of_package>"
And voila!

By clicking on the application, the Mist browser should execute and will start downloading the Ethereum Blockchain (the real one!). As this is multiple Gigs of data, and we don't want you to go over your expensive bandwidth allocation, close it and forget it until Sunday.
*********************************************************************************************

Building from source

Want to make your life a bit harder?

You can also download Mist from source here:

https://github.com/ethereum/mist


If you have any questions regarding installation, please email Patrick at patrick.guay43@gmail.com


To connect to private testnet, when executing the application (though command line), add the flag "--rpc" with this address:"http://boot7c4rd.westus.cloudapp.azure.com:8545"

So in LINUX it should look like

mist --rpc http://boot7c4rd.westus.cloudapp.azure.com:8545


In Windows

Mist.exe --rpc http://boot7c4rd.westus.cloudapp.azure.com:8545

in Mac?
In a terminal : 
/Applications/Mist.app/Contents/MacOS/Mist --rpc http://boot7c4rd.westus.cloudapp.azure.com:8545



*************************************************************************************************

Addresses and ABI's

Bootcamp Ballot contract :

Address :  0xc5c996ac1e72f909c3ae1ca82ae10e9fad2ab49b

ABI: [{"constant":false,"inputs":[{"name":"proposal","type":"uint256"}],"name":"vote","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"uint256"}],"name":"proposals","outputs":[{"name":"name","type":"string"},{"name":"description","type":"string"},{"name":"voteCount","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"newProposal","type":"string"},{"name":"desc","type":"string"}],"name":"addProposal","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"creatorPayday","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"chairperson","outputs":[{"name":"","type":"address"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"voter","type":"address"}],"name":"removeRightToVote","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"destroy","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"voters","outputs":[{"name":"voted","type":"bool"},{"name":"vote","type":"uint256"}],"payable":false,"type":"function"},{"constant":true,"inputs":[],"name":"balance","outputs":[{"name":"","type":"uint256"}],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"donateToCreator","outputs":[],"payable":true,"type":"function"},{"constant":true,"inputs":[],"name":"winnerName","outputs":[{"name":"winnerName","type":"string"}],"payable":false,"type":"function"},{"inputs":[],"payable":false,"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"who","type":"address"},{"indexed":false,"name":"voteCalc","type":"uint256"}],"name":"Voted","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"from","type":"address"},{"indexed":false,"name":"chair","type":"address"},{"indexed":false,"name":"amount","type":"uint256"}],"name":"Donation","type":"event"}]


----------------------------------------------------------------------------------------------------

NHLPredictor Contract

Address: 0xe1f160641d09ee4c6d4f5cd744b22b016b60b76d

ABI : [{"constant":false,"inputs":[{"name":"_forTeam","type":"string"},{"name":"_conference","type":"string"},{"name":"length","type":"uint256"}],"name":"placeBet","outputs":[],"payable":true,"type":"function"},{"constant":true,"inputs":[],"name":"isWinner","outputs":[{"name":"","type":"bool"}],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"myid","type":"bytes32"},{"name":"result","type":"string"}],"name":"__callback","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"myid","type":"bytes32"},{"name":"result","type":"string"},{"name":"proof","type":"bytes"}],"name":"__callback","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[{"name":"_division","type":"string"}],"name":"getWinnerPerDivision","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"addToBet","outputs":[],"payable":true,"type":"function"},{"constant":false,"inputs":[],"name":"claimPrize","outputs":[],"payable":false,"type":"function"},{"constant":false,"inputs":[],"name":"destroy","outputs":[],"payable":false,"type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"allBets","outputs":[{"name":"init","type":"bool"},{"name":"leadingTeam","type":"string"},{"name":"conference","type":"string"},{"name":"betBalance","type":"uint256"},{"name":"betLength","type":"uint256"}],"payable":false,"type":"function"},{"inputs":[],"payable":false,"type":"constructor"},{"anonymous":false,"inputs":[{"indexed":false,"name":"_betPlaced","type":"string"},{"indexed":false,"name":"_team","type":"string"},{"indexed":false,"name":"conference","type":"string"},{"indexed":false,"name":"_amountBet","type":"uint256"}],"name":"BetPlaced","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"_desc","type":"string"},{"indexed":false,"name":"_by","type":"uint256"},{"indexed":false,"name":"_total","type":"uint256"}],"name":"BetIncreased","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"_to","type":"address"},{"indexed":false,"name":"_amount","type":"uint256"}],"name":"Paid","type":"event"},{"anonymous":false,"inputs":[{"indexed":false,"name":"desc","type":"string"},{"indexed":false,"name":"result","type":"string"}],"name":"OraclizeCalledBack","type":"event"}]
