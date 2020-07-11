---
Title:    Add Multiple albums to spotify playlist using Autohotkey  
Author:   Duarte Pompeu 
Date:     2020-07-11  
tags:     script autohotkey music spotify
---


# Add multiple albums to Spotify playlist using Autohotkey

2020-07-11

## Story time

One of the things I love about Spotify is the dynamic playlist Discover Weekly, which is algorithmically generated according to your interests. It is a great source to explore new music. 

What I also like to do is diving deeper into the artist's catalog and get to know more of their reportoir. This is often listening to the whole album containg the track. So I created a playlist where I would be adding albums from spotify's Discover Weekly tracks, which led me to find great albums and artists.

However, it was a bit boring to do it manually for multiple songs... and queue Autohokey. Autohotkey is a scripting language for Windows which enables you to automate clicks and keys, and you can do interesting stuff with it, such as shortcuts, auto-typing, game cheats and more.

So, I quickly hacked the script, and I'm making it available below.

## Instruction and script

Instructions:

1. Add the songs you want to get albums for to a new, empty playlist
2. Download Autohotkey
3. Create a file with .ahk extension, open with a text editor and copy the script into it
4. Configure the script with the playlist name, you want (it's not case sensitive, and you can use partial names)
5. Configure the script with the number of songs in the playlist
6. In the playlist with tracks, click the first one to select it, up arrow, move cursor away from any music (to make sure play button doesn't show)
7. Press shift+3 and wait
8. Enjoy the music in your playlist :)


```ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance force

AlbumName := "DW - Albums from Liked Songs"
NSongs := 14
SleepTime := 300

; shift+1: reload script, in case you needed to change it
+1::Reload

; shift+3: run script
+3::
	Loop, %NSongs%{
		Send {Tab}
		Sleep, %SleepTime%	
		Send {Tab}
		Sleep, %SleepTime%
		Send {Tab}
		Sleep, %SleepTime%

		Send {AppsKey}
		Sleep, %SleepTime%

		Send {Up}
		Sleep, %SleepTime%
		Send {Up}
		Sleep, %SleepTime%

		Send {Right}
		Sleep, %SleepTime%
		
		Send %AlbumName%
		Sleep, %SleepTime%

		Send {Down}
		Sleep, %SleepTime%

		Send {Enter}
		Sleep, %SleepTime%

		Send {Down}
		Sleep, %SleepTime%
	}
	

	return
```