*! Version 1.10, 13sept2021, Michael Droste, mdroste@fas.harvard.edu
*===============================================================================
* Program: gzimport.ado
* Purpose: Import gzip compressed data into Stata
* Author: Michael Droste, Michael Stepner, and Matt Bell
*===============================================================================

program define gzimport
version 16.0
syntax anything using/, [*]

*-------------------------------------------------------------------------------
* Exception handling
*-------------------------------------------------------------------------------

* Make sure using file exists
cap confirm file "`using'"
if _rc!=0 & substr("`using'", 1, 4)!="http" {
	di as error "file `using' not found"
	exit 601
}

*-------------------------------------------------------------------------------
* Main
*-------------------------------------------------------------------------------

* Print out helpful input
display "Importing gzipped data in `using'"

* Create tempfile
tempfile gzimport_tempfile

* Use Python to unzip
python: gunzip(r"`using'",r"`gzimport_tempfile'")

* Import delimited
import `anything' using `gzimport_tempfile', `options'

end


*-------------------------------------------------------------------------------
* Python code
*-------------------------------------------------------------------------------

version 16.0
python:

import gzip
import shutil
import urllib.parse
import urllib.request


def is_url(filename: str) -> bool:
		return all(list(urllib.parse.urlparse(filename))[:2])


def gunzip(filename: str, temp_file: str) -> None:
		if is_url(filename):
			response = urllib.request.urlopen(filename, timeout = 30)
			with gzip.GzipFile(fileobj=response) as f_in:
				with open(temp_file,'wb') as f_out:
					shutil.copyfileobj(f_in,f_out)
		else:
			with gzip.open(filename,'rb') as f_in:
				with open(temp_file,'wb') as f_out:
					shutil.copyfileobj(f_in,f_out)

end
