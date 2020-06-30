{smcl}
{* *! version 0.3  30jun2020}{...}
{viewerjumpto "Syntax" "gzimport##syntax"}{...}
{viewerjumpto "Description" "gzimport##description"}{...}
{viewerjumpto "Author" "gzimport##author"}{...}
{title:Title}
 
{p2colset 9 14 21 2}{...}
{p2col :{hi:gzimport} {hline 2} Import gzip-compressed delimited data files into Stata}{p_end}
{p2colreset}{...}
 
 
{marker syntax}{title:Syntax}
 
{p 8 15 2}
{cmd:gzimport} using filename.gz, [{cmd:}{it:options}]
                               
 
{synoptset 40}{...}
{marker Options}{...}
{synopthdr :Option}
{synoptline}
{synopt :{opt rowr:ange([start][:end])}}row range of data to load{p_end}
{synopt :{opt colr:ange([start][:end])}}column range of data to load{p_end}
{synopt :{cmdab:varn:ames(}{it:#}|{cmd:nonames)}}treat row {it:#} of data as variable names or the data do not have variable names{p_end}
{synopt :{cmd:case(preserve}|{cmd:lower}|{cmd:upper)}}preserve the case or read variable names as lowercase (the default) or uppercase{p_end}
{synopt :{opt asflo:at}}import all floating-point data as {cmd:float}s{p_end}
{synopt :{opt asdoub:le}}import all floating-point data as {cmd:double}s{p_end}
{synopt :{cmdab:enc:oding(}{help import delimited##encoding:{it:encoding}}{cmd:)}}specify the encoding of the text file being imported{p_end}
{synopt :{cmdab:bindq:uotes(loose}|{cmd:strict}|{cmd:nobind)}}specify how to handle double quotes in data{p_end}
{synopt :{cmdab:stripq:uotes(yes}|{cmd:no}|{cmd:default)}}remove or keep double quotes in data{p_end}
{synopt :{cmdab:delim:iters("}{it:chars}{cmd:"}[{cmd:, }{cmd:collapse}|{cmd:asstring}]{cmd:)}}use {it:chars} as delimiters{p_end}
{synopt :{cmdab:parsel:ocale(}{help import delimited##locale:{it:locale}}{cmd:)}}specify the locale to use for interpreting numbers in the text file being imported{p_end}
{synopt :{cmdab:decimals:eparator(}{it:character}{cmd:)}}character to use for the decimal separator when parsing numbers{p_end}
{synopt :{cmdab:groups:eparator(}{it:character}{cmd:)}}character to use for the grouping separator when parsing numbers{p_end}
{synopt :{cmdab:maxquotedr:ows(}{it:#} | {cmd:unlimited)}}number of rows of data allowed inside a quoted string when {cmd:bindquote(strict)} is specified{p_end}
{synopt :{cmdab:numericc:ols(}{it:{help numlist}}|{cmd:_all)}}force specified columns to be numeric{p_end}
{synopt :{cmdab:stringc:ols(}{it:{help numlist}}|{cmd:_all)}}force specified columns to be string{p_end}
{synopt :{opt clear}}replace data in memory{p_end}
{synoptline}
{p2colreset}{...}

 Refer to the help file for {help import delimited} for more information on these options.
 
{marker description}{...}
{title:Description}
 
{pstd}
{opt gzimport} uncompresses gzip archives into a temporary file on your disk, then uses the built-in Stata program -import delimited- to load it into memory in Stata. All options that are supported by -import delimited- are supported with the same syntax here. See the help file for import delimited for more information.

 
 
{marker author}{...}
{title:Author}
 
{pstd}Michael Droste{p_end}
{pstd}mdroste@fas.harvard.edu{p_end}

{pstd}Michael Stepner{p_end}
{pstd}stepner@mit.edu{p_end}
 
 