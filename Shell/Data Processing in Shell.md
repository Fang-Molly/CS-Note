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
  
  ```bash
  curl -O https://websitename.com/datafilename.txt
  ```
  
  * `-o`: lowercase o, add new filename

  ```bash
  curl -o renamedatafilename.txt https://websitename.com/datafilename.txt
  ```

* **Downloading Multiple Files**

  * Using Wildcards
 
  ```bash
  curl -O https://websitename.com/datafilename*.txt
  ```

  * Using Globbing Parser

  ```bash
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

```bash
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
	
	```bash
	in2csv -n SpotifyData.xlsx
	
	Worksheet1_Popularity
	Worksheet2_MusicAttributes
	```
	
	* `--sheet` option: select which sheet to convert

	```bash
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

* `csvcut`: filters and truncate CSV files by column name or position

	* by position: 
		* `csvcut -c 1 Spotify_MusicAttributes.csv`
		* `csvcut -c 2,3 Spotify_MusicAttributes.csv`
	* by name: 
		* `csvcut -c "track_id" Spotify_MusicAttributes.csv`
		* `csvcut -c "danceability" "duration_ms" Spotify_MusicAttributes.csv`

	* print column headers
		* ``csvcut -n Spotify_MusicAttributes.csv`

* `csvgrep`: filter data by row using exact match or regex fuzzy matching
	* must be paired with one of these options
		* `-m`: followed by exact row value to filter
		* `-r`: followed with a regex pattern
		* `-f`: followed by the path to a file

	* by name: `csvgrep -c "track_id" -m 5RCPsfzmEpTXMCTNk7wEfQ Spotify_Popularity.csv`
	* by position: `csvgrep -c 1 -m 5RCPsfzmEpTXMCTNk7wEfQ Spotify_Popularity.csv`

## 2.3 Stacking data and chaining commands with csvkit

* **csvstack: stacking multiple CSV files**

	* `csvstack`: stacks up the rows from two or more CSV files
	* Syntax: `csvstack Spotify_Rank6.csv Spotify_Rank7.csv > Spotify_AllRanks.csv`

	* `-g`: named group
	
	```bash
	csvstack -g "Rank6","Rank7" \
	Spotify_Rank6.csv Spotify_Rank7.csv > Spotify_AllRanks.csv
	```

	* `-n`: renamed the column from "group" to "Source"
	
	```bash
	csvstack -g "Rank6","Rank7" -n "Source" \
	Spotify_Rank6.csv Spotify_Rank7.csv > Spotify_AllRanks.csv
	```
	
* **Chaining command-line commands**

	* `;`: links commands together and runs sequentially         
	`csvlook SpotifyData_All.csv; csvstat SpotifyData_All.csv`
	
	* `&&`: links commands together, but only runs the 2nd command if the 1st succeeds         
	`csvlook SpotifyData_All.csv && csvstat SpotifyData_All.csv`
	
	* `>`: redirects the output from the 1st command to the location indicated as the 2nd        
	`in2csv SpotifyData.xlsx > SpotifyData.csv`

	* `|`: uses the output of the 1st command as input to the 2nd
	`csvcut -c "track_id","danceability" Spotify_Popularity.csv | csvlook`

# 3. Database Operations on the Command Line

## 3.1 Pulling data from database

* `sql2csv`: querying against the database
	* executes an SQL query on a large variety of SQL databases (e.g. MS SQL, MySQL, Oracle, PostgreSQL, Sqlite)
	* outputs the result to a CSV file
	
* Syntax: 

	* Establishing database connection
		* `--db`: is followed by the database connection string
		* **SQLite**: starts with `sqlite:///` and ends with `.db`
		* **Postgres** & **MySQL**: starts with `postgres:///` or `mysql:///` and with no `.db`

	* Querying against the database
		* `--query`: is followed by the SQL query string
		* Use SQL syntax compatible with the database
		* Write query in one line with no line breaks

	* Saving the output
		* `>`: redirect output to new local CSV file
		* Otherwise, will only print query results to console

```bash
sql2csv --db "sqlite:///SpotifyDatabase.db" \
		--query "SELECT * FROM Spotify_Popularity" \
		> Spotify_Popularity.csv
```

## 3.2 Manipulating data using SQL syntax

* `csvsql`: Applying SQL to a local CSV file
	* applies SQL statements to one or more CSV files
	* creates an in-memory SQL database that temporarily hosts the file being processed
	* suitable for small to medium files only

* Syntax

```bash
csvsql --query "SELECT * FROM Spotify_MusicAttributes LIMIT 1" \
	Spotify_MusicAttributes.csv
```

```bash
csvsql --query "SELECT * FROM Spotify_MusicAttributes LIMIT 1" \
	data/Spotify_MusicAttributes.csv | csvlook
```

```bash
csvsql --query "SELECT * FROM Spotify_MusicAttributes LIMIT 1" \
	data/Spotify_MusicAttributes.csv > OneSongFile.csv
```

* csvsql: joining CSVs using SQL syntax
	* SQL Query must be written in one line, no breaks
	* Indicate CSV files in order of appearance in SQL

```
csvsql --query "SELECT * FROM file_a INNER JOIN file_b .." file_a.csv file_b.csv
```

## 3.3 Pushing data back to database

* `csvsql`: Pushing data back to database
	* execute SQL statements directly on a database
	* supports both creating tables and inserting data
	* More option arguments:
		* `--db`
		* `--insert`: Insert the data into the table
		* `--no-inference`: Disable type inference when parsing CSV input. It treats every column as text, whether it looks like numbers, dates, or string
		* `--no-constraints`: Generate a schema without length limits or null checks. Useful when sampling big tables. It allows the table to be created without any character length limits, which is helpful for particularly large data tables and considerably speeds up the insertion process.

* Syntax:
	* Line break is used to keep code clean and readable
	* Use three forward slashes to initiate database name
	* End with file extension `.db` for SQLITE database

```
csvsql --db "sqlite:///SpotifyDatabase.db" \
	   --insert Spotify_MusicAttributes.csv
```

```
csvsql --no-inference --no-constraints \
	   --db "sqlite:///SpotifyDatabase.db" \
	   --insert Spotify_MusicAttributes.csv
```

# 4. Data Pipeline on the Command Line

## 4.1 Python on the command line


## 4.2 Python package installation with pip

* **Python standard library**

	* built-in functions (e.g. print())
	* built-in packages (e.g. math, os)

* `pip`: standard package manager for Python, via the command line, download packages

* `pip list`: displays the Python packages in your current Python environment

* `pip install`: 
	* `pip install scikit-learn`: install the latest version of the package
	* `pip install scikit-learn==0.19.2`: install a specific version of the library
	* Upgrade packages: `pip install --upgrade scikit-learn`
	* Install multiple packages: `pip install scikit-learn statsmodels`
	* Upgrade multiple packages: `pip install --upgrade scikit-learn statsmodels`
	* Install multiple packages with "requirements.txt": 
		* "requirements.txt" file: contains a list of packages to be installed
		* using `-r`: `pip install -r requirements.txt`

## 4.3 Data job automation with cron










