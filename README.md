<h1>Powershell - Scripting a FIM (File Integrity Monitor)</h1>

 ### [YouTube Demonstration](https://youtu.be/pJ97mlLQcUc)

<h2>Description</h2>
This project makes use of a Powershell script that acts as a File Integrity Monitor. By collecting file hashes, the script can alert the user when a selected file path has had its files deleted or modified as well as if new files are created. This project is meant to be a proof of concept in regards to the concept of integrity from the CIA Triad and also serves as a good introduction to scripting. 


<h2>Languages and Utilities Used</h2>

- <b>Powershell ISE</b> 

<h2>Program walk-through:</h2>

<p align="center">
Create a function to calculate file hashes: <br/><br />
<img src="https://i.imgur.com/NntlsdZ.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Create a function to erase the previous session's baseline file so that we can update our hash list later: <br/><br />
<img src="https://i.imgur.com/ydpUY36.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Create a function to populate our baseline file with each hash and file path: <br/><br />
<img src="https://i.imgur.com/EFCLmba.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Create a function that creates a dictionary and populates it with the data in the baseline file: <br/><br />
<img src="https://i.imgur.com/niTGzDD.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Collect the file path to scan user input, erase the previous baseline file, collect hashes, and create the dictionary: <br/><br />
<img src="https://i.imgur.com/uZaPWTb.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Create a loop that constantly checks to see if the new files are created, deleted, or modified: <br/><br />
<img src="https://i.imgur.com/kPYvFcy.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
And we're done <br/><br />
