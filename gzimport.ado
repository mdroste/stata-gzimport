*! Version 1.00, 6jul2020, Michael Droste, mdroste@fas.harvard.edu
*===============================================================================
* Program: gzimport.ado 
* Purpose: Import gzip compressed delimited text datasets into Stata
* Authors: Michael Droste and Michael Stepner
*===============================================================================

program define gzimport
version 16.0
syntax anything using/, [*]

*-------------------------------------------------------------------------------
* Exception handling
*-------------------------------------------------------------------------------

* Make sure using file exists
cap confirm file "`using'"
if _rc!=0 {
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
python: gunzip("`using'",r"`gzimport_tempfile'")

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

def gunzip(filename,temp_file):
	with gzip.open(filename,'rb') as f_in:
		with open(temp_file,'wb') as f_out:
			shutil.copyfileobj(f_in,f_out)

end
