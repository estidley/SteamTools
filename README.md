# SteamTools
Assortment of Powershell that helps view Steam games and were they exist etc.

## Requirements

1. Excel - for the excel output

## Directions

1. Go to https://steamapi.xpaw.me/# and get a Token
2. Replace the $TOKEN in Out-SteamAppIds.PS1 with the one you generated.
3. CD a directory of your choice. (Note all other scripts will need to be run in this directory.)
4. Run "Out-SteamAppIds.PS1 -Quite" (Note this will run for a long time...a long time... Slightly faster with quite.) (This is getting every name and game id in all of Steam) 
5. When the file is finished run Out-SteamGameList.PS1. This will give an output of a CSV and Excel (Unless you dont have excel.. Then it will error.)
