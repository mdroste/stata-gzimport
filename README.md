
gzimport
=================================

[Overview](#overview)
| [Installation](#installation)
| [Usage](#usage)
| [Acknowledgements](#acknowledgments)
| [License](#license)

Import gzip-compressed delimited data into Stata

`version 0.3 30jun2020`


Overview
---------------------------------

gzimport allows users to import gzip-compressed delimited data directly into Stata. For instance, if you've got a gzip-compressed CSV called auto.csv.gz, gzimport will uncompress the file into a temporary file on your disk and then call the built-in Stata module -import delimited- to import the CSV. 


Prequisites
---------------------------------

gzimport requires Stata 16.0 or higher, since it uses Stata's built-in Python integration to uncompress gzipped files. In principle, of course this can also be done with command-line utilities and a lower version of Stata.

Installation
---------------------------------

Installing gzimport is very simple.

1. First, make sure Python is installed on your computer so that Stata can interface with it. If Stata cannot find your Python installation, [this installation guide](https://raw.githubusercontent.com/mdroste/stata-pyforest/master/docs/install.md) that I wrote for another program might be useful.

2. Next, install the Stata code and documentation. You can run the following Stata command to install directly from this GitHub repository:

```stata
net install gzimport, from(https://raw.githubusercontent.com/mdroste/stata-gzimport/master/) replace
```

Usage
---------------------------------

Using gzimport is very simple. All options for -import delimited- are supported. For convenience, this repository contains an example gzip-compressed dataset, auto.csv.gz, that you can play with for demonstration.

For instance, the following gzimport command:
```stata
gzimport using auto.csv.gz, clear
```

is equivalent to extrating the contents of auto.csv.gz to auto.csv and running:
```stata
import delimited using auto.csv, clear
```


Acknowledgements
---------------------------------

This program was (very quickly) written by [Michael Droste](https://github.com/mdroste) and [Michael Stepner](https://github.com/michaelstepner).

License
---------------------------------

gzimport is [MIT-licensed](https://github.com/mdroste/stata-gzimport/blob/master/LICENSE).
