<h1>Custom File Integrity Monitoring Script</h1>

<h2>Overview</h2>
I created a simple File Integrity Monitor or FIM using a Powershell script. This project aimed to achieve the following goals:
<br><br>
<ul>
 <li>Gain experience with scripting</li>
 <li>Utilize and gain a deeper understanding of hashing</li>
 <li>Practice the concept of integrity, a core pillar of the CIA Triad </li>
</ul>

<h2>Summary</h2>
The File Integrity Monitor I developed functions by asking the user for a file path to monitor. After the user provides a valid file path, the script collects the hashes of each file and stores them in a text file. Next, the script transfers all the hashes from the text file into a newly created dictionary. Finally, the script will alert the user via the console if any changes occur within the specified folder. I wrote the script to detect and report when the system deletes, modifies, or creates new files in the selected path. It does this by comparing the dictionary's contents to the current hashes of the specified file path.   

<h2>Languages and Utilities Used</h2>

- Powershell ISE 

<h2>Program walk-through:</h2>

<p align="center">
This first function uses the provided file path to calculate each file's hash: <br/><br />
<img src="https://i.imgur.com/NntlsdZ.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
This second function erases the baseline file if it already exists. The baseline file is the text file that stores each of the hashes:<br/><br />
<img src="https://i.imgur.com/ydpUY36.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
This third function writes each hash and file path to the baseline file: <br/><br />
<img src="https://i.imgur.com/9eQGJPP.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
This fourth function creates the dictionary and populates it with the data from the baseline file: <br/><br />
<img src="https://i.imgur.com/uDJu323.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Now that the functions are defined, I can write the rest of the code. This portion of the code collects the file path from user input and erases the previous baseline file. Next, it will collect the hashes, write them to the baseline, and create/populate the dictionary. Finally, it will write to the console that it is checking the hashes: <br/><br />
<img src="https://i.imgur.com/HsNLNLO.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
I wrote the rest of the code within this while loop. Essentially, I iterate through each file in the folder and use a bunch of if statements to enforce integrity. Since this part is so big, I will break down what each piece is doing separately: <br/><br />
<img src="https://i.imgur.com/khC7YHs.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
This first if statement is checking if any new files have been added to the folder:<br/><br />
<img src="https://i.imgur.com/s7bml0r.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Within this else statement, the codes checks if the files have changed or not: <br/><br />
<img src="https://i.imgur.com/THLgWjO.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
This final for loop checks whether the system deleted any files: <br/><br />
<img src="https://i.imgur.com/ec79aSl.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />

 <h2>Program demonstration:</h2>
 <p align="center">
For this demonstration, I created a folder with three files: <br/><br />
<img src="https://i.imgur.com/xT9DdiE.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Upon starting the script, the code prompts for a file path. Now that I have given the script a file path, it will continuously monitor that path:<br/><br />
<img src="https://i.imgur.com/pciFv7r.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
First, I went into the folder and created a fourth file: <br/><br />
<img src="https://i.imgur.com/oHjXxmX.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Going back to the console, I can see that the script detected that addition: <br/><br />
<img src="https://i.imgur.com/1FMRNTu.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Next, I went into the folder and edited the first file: <br/><br />
<img src="https://i.imgur.com/KabHBMN.png" height="40%" width="40%" alt="Script Steps"/>
<br />
<br />
<br />
Going back to the console, I can see that the script detected that modification: <br/><br />
<img src="https://i.imgur.com/B7onWWY.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Finally, I went into the folder and deleted the second file: <br/><br />
<img src="https://i.imgur.com/VRJ37sO.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Going back to the console, I can see that the script detected that deletion: <br/><br />
<img src="https://i.imgur.com/CULmlfv.png" height="80%" width="80%" alt="Script Steps"/>
<br />
<br />
<br />
Thanks for reading this far! I enjoyed creating this File Integrity Monitor and hope you enjoyed learning about it!<br/><br/>
