Data Processing in Shell
========================

# 1. Downloading Data on the Command Line

## 1.1 Downloading data using curl

* **What is curl?**

  * `curl` is short for Client for URLs
  * `curl` is a Unix command line tool
  * `curl` transfers data to and from a server
  * `curl` is used to download data from HTTP(s) sites and FTP servers

* **Checking curl installation**

  * Check curl version: `curl --version`
  * Browsing the curl Manual: `man curl`
    * Press 'Enter' to scroll
    * Press 'q' to exit and return to your console
  * Show curl help: `curl --help`

* **Learning curl Syntax**

  * Basic `curl` syntax: `curl [options...] <url>`
    * URL is required. 
    * `curl` also supports `HTTP`, `HTTPS`, `FTP`, and `SFTP`
   
* **Downloading a Single File**

  * `-O`: uppercase O, save the file with its original name
  
  ```
  curl -O https://websitename.com/datafilename.txt
  ```
  
  * `-o`: lowercase o, add new filename

  ```
  curl -o renamedatafilename.txt https://websitename.com/datafilename.txt
  ```

* **Downloading Multiple Files**

  * Using Wildcards
 
  ```
  curl -O https://websitename.com/datafilename*.txt
  ```

  * Using Globbing Parser

  ```
  curl -O https://websitename.com/datafilename[001-100].txt
  
  # Increment through the files and download every Nth file
  curl -O https://websitename.com/datafilename[001-100:10].txt
  ```
  
* **Preemptive Troubleshooting**

  * `curl` has two particularly useful option flags in case of timeouts during download:

    * `-L`: Redirects the HTTP URL if a 300 error code occurs
    * `-C`: Resumes a previous file transfer if it times out before completion

  * `curl -L -O -C https://websitename.com/datafilename[001-100].txt`

    * All option flags come before the URL
    * Order of the flags does not matter


## 1.2 Downloading data using Wget

* **What is Wget?**

  * `Wget` derives its name from World Wide Web and get
  * native to Linux but compatible for all operating systems
  * used to download data from HTTP(S) and FTP
  * better than curl at downloading multiple files recursively


* **Checking Wget Installation**

  * `which wget` : print the location of where Wget has been installed
  * `wget --version`: check version
  * Installation on MacOS: `brew install wget`
  * Browsing the Wget Manual: `man wget`

* **Learning Wget Syntax**

  * Basic `Wget` syntax: `wget [OPTION]... [URL]...`
    * URL is required. 
    * `curl` also supports `HTTP`, `HTTPS`, `FTP`, and `SFTP`

* **Downloading a Single File**

  * `-b`: Go to background immediately after startup
  * `-q`: Turn off the `Wget` output
  * `-c`: Resume broken download (i.e. continue getting a partially-downloaded file)
  * preview the log file: `cat wget-log`

```
~ % wget -bqc https://websitename.com/datafilename.txt
Continuing in background, pid 14335.
# The pid is a unique process ID assigned to this particular data download job for your reference, in case you need to cancel the process
```

* **Multiple file downloading with Wget**

  * Save a list of file locations in a text file (url_list.txt)
  * Download from the URL locations stored within the file `url_list.txt` using `-i`. `wget -i url_list.txt`


* **Setting download constraints for large files**

Set upper download bandwidth limit (by default in bytes per second) with `--limit-rate`

  * Syntax: `wget --limit-rate={rate}K {file_location}`
  * Example: `wget --limit-rate=200K -i url_list.txt` (200 kilobytes per second)

* **Setting download constraints for small files**

Set a mandatory pause time (in seconds) between file downloads with `--wait`

  * Syntax: `wget --wait={seconds} {file_location}`
  * Example: `wget --wait=2.5 -i url_list.txt`

* **curl versus Wget**

  * `curl` advantages:
    * Can be used for downloading and uploading files from 20+ protocols
    * Easier to install across all operating systems
   
  * `Wget` advantages:
    * Has many built-in functionalities for handling multiple file downloads.
    * Can handle various file formats for download (e.g. file directory, HTML page).
 
 
# 2. Data Cleaning and Munging on the Command Line

## 2.1 Getting started with csvkit

* **What is csvkit?**

	* `csvkit` is a suite of command-line tools
	* `csvkit` is developed in Python by Wireservice
	* `csvkit` offers data processing and cleaning capabilities on CSV files
	* `csvkit` has data capabilities that rival Python, R, and SQL

* **csvkit installation**

	* Install using Python package manager `pip`: `pip install csvkit`
	* Upgrade to the latest version: `pip install --upgrade csvkit`

* **Browsing the csvkit manual**

Web-based documentation: https://csvkit.readthedocs.io/en/latest/tutorial.html

* **in2csv: converting files to CSV**

	* `in2csv`: converts tabular data files, like text or Excel, into CSV. 

	* Syntax: `in2csv SpotifyData.xlsx > SpotifyData.csv`

	* `--name` or `-n` option：print all sheet names
	
	```
	in2csv -n SpotifyData.xlsx
	
	Worksheet1_Popularity
	Worksheet2_MusicAttributes
	```
	
	* `--sheet` option: select which sheet to convert

	```
	in2csv SpotifyData.xlsx --sheet "Worksheet1_Popularity" > Spotify_Popularity.csv
	```

	* `in2csv` does not print logs to console

* **csvlook: data preview on the command line**

	* `csvlook`: renders a CSV to the command line in a Markdown-compatible, fixed-width format
	* Syntax: `csvlook Spotify_Popularity.csv`

* **csvstat: descriptive stats on CSV data files**

	* `csvstat`: prints descriptive summary statistics on all columns in CSV (e.g. mean, median, unique values counts)
	* Syntax: `csvstat Spotify_Popularity.csv`

## 2.2 Filtering data using csvkit




## 2.3 Stacking data and chaining commands with csvkit





# 3. Database Operations on the Command Line

## 3.1 Pulling data from database

## 3.2 Manipulating data using SQL syntax

## 3.3 Pushing data back to database

# 4. Data Pipeline on the Command Line

## 4.1 Python on the command line



## 4.2 Python package installation with pip



## 4.3 Data job automation with cron



