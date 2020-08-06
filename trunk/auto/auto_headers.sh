#!/bin/bash

# output variables:
# SRS_AUTO_HEADERS_H: the auto generated header file.

SRS_AUTO_HEADERS_H="${SRS_OBJS}/srs_auto_headers.hpp"

# write user options to headers
echo "// auto generated by configure" > $SRS_AUTO_HEADERS_H
echo "#ifndef SRS_AUTO_HEADER_HPP" >> $SRS_AUTO_HEADERS_H
echo "#define SRS_AUTO_HEADER_HPP" >> $SRS_AUTO_HEADERS_H
echo "" >> $SRS_AUTO_HEADERS_H

echo "#define SRS_BUILD_TS \"`date +%s`\"" >> $SRS_AUTO_HEADERS_H
echo "#define SRS_BUILD_DATE \"`date \"+%Y-%m-%d %H:%M:%S\"`\"" >> $SRS_AUTO_HEADERS_H
echo "#define SRS_UNAME \"`uname -a`\"" >> $SRS_AUTO_HEADERS_H
echo "#define SRS_USER_CONFIGURE \"${SRS_AUTO_USER_CONFIGURE}\"" >> $SRS_AUTO_HEADERS_H
echo "#define SRS_CONFIGURE \"${SRS_AUTO_CONFIGURE}\"" >> $SRS_AUTO_HEADERS_H
echo "" >> $SRS_AUTO_HEADERS_H

function srs_define_macro()
{
    macro=$1 && file=$2
    echo "#define $macro" >> $file
    echo "#define ${macro}_BOOL true" >> $file
}

function srs_define_macro_value()
{
    macro=$1 && value=$2 && file=$3
    echo "#define $macro $value" >> $file
    echo "#define ${macro}_BOOL true" >> $file
}

function srs_undefine_macro()
{
    macro=$1 && file=$2
    echo "#undef $macro" >> $file
    echo "#define ${macro}_BOOL false" >> $file
}

# export the preset.
if [ $SRS_X86_X64 = YES ]; then
    srs_define_macro "SRS_X86_X64" $SRS_AUTO_HEADERS_H
fi
if [ $SRS_PI = YES ]; then
    srs_define_macro "SRS_PI" $SRS_AUTO_HEADERS_H
fi
if [ $SRS_CUBIE = YES ]; then
    srs_define_macro "SRS_CUBIE" $SRS_AUTO_HEADERS_H
fi
echo "#undef SRS_EXPORT_LIBRTMP" >> $SRS_AUTO_HEADERS_H

echo "" >> $SRS_AUTO_HEADERS_H

#####################################################################################
# generate auto headers file, depends on the finished of options.sh
#####################################################################################
# auto headers in depends.
if [ $SRS_HDS = YES ]; then
    srs_define_macro "SRS_HDS" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_HDS" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_LAS = YES ]; then
    srs_define_macro "SRS_LAS" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_LAS" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_SRT = YES ]; then
    srs_define_macro "SRS_SRT" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_SRT" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_CXX11 = YES ]; then
    srs_define_macro "SRS_CXX11" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_CXX11" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_CXX14 = YES ]; then
    srs_define_macro "SRS_CXX14" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_CXX14" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_RTC = YES ]; then
    srs_define_macro "SRS_RTC" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_RTC" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_FFMPEG_FIT = YES ]; then
    srs_define_macro "SRS_FFMPEG_FIT" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_FFMPEG_FIT" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_SIMULATOR = YES ]; then
    srs_define_macro "SRS_SIMULATOR" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_SIMULATOR" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_GB28181 = YES ]; then
    srs_define_macro "SRS_GB28181" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_GB28181" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_HTTPS = YES ]; then
    srs_define_macro "SRS_HTTPS" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_HTTPS" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_MEM_WATCH = YES ]; then
    srs_define_macro "SRS_MEM_WATCH" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_MEM_WATCH" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_UTEST = YES ]; then
    srs_define_macro "SRS_UTEST" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_UTEST" $SRS_AUTO_HEADERS_H
fi

# whatever the FFMPEG tools, if transcode and ingest specified,
# srs always compile the FFMPEG tool stub which used to start the FFMPEG process.
if [ $SRS_FFMPEG_STUB = YES ]; then
    srs_define_macro "SRS_FFMPEG_STUB" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_FFMPEG_STUB" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_GPERF = YES ]; then
    srs_define_macro "SRS_GPERF" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_GPERF" $SRS_AUTO_HEADERS_H
fi
if [ $SRS_GPERF_MC = YES ]; then
    srs_define_macro "SRS_GPERF_MC" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_GPERF_MC" $SRS_AUTO_HEADERS_H
fi
if [ $SRS_GPERF_MD = YES ]; then
    srs_define_macro "SRS_GPERF_MD" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_GPERF_MD" $SRS_AUTO_HEADERS_H
fi
if [ $SRS_GPERF_MP = YES ]; then
    srs_define_macro "SRS_GPERF_MP" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_GPERF_MP" $SRS_AUTO_HEADERS_H
fi
if [ $SRS_GPERF_CP = YES ]; then
    srs_define_macro "SRS_GPERF_CP" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_GPERF_CP" $SRS_AUTO_HEADERS_H
fi

#####################################################################################
# for embeded.
#####################################################################################
# for log level compile settings
if [ $SRS_LOG_VERBOSE = YES ]; then
    srs_define_macro "SRS_VERBOSE" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_VERBOSE" $SRS_AUTO_HEADERS_H
fi
if [ $SRS_LOG_INFO = YES ]; then
    srs_define_macro "SRS_INFO" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_INFO" $SRS_AUTO_HEADERS_H
fi
if [ $SRS_LOG_TRACE = YES ]; then
    srs_define_macro "SRS_TRACE" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_TRACE" $SRS_AUTO_HEADERS_H
fi
if [ $SRS_CROSS_BUILD = YES ]; then
    srs_define_macro "SRS_CROSSBUILD" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_CROSSBUILD" $SRS_AUTO_HEADERS_H
fi
if [ $SRS_OSX = YES ]; then
    srs_define_macro "SRS_OSX" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_OSX" $SRS_AUTO_HEADERS_H
fi

if [ $SRS_DEBUG = YES ]; then
    srs_define_macro "SRS_DEBUG" $SRS_AUTO_HEADERS_H
else
    srs_undefine_macro "SRS_DEBUG" $SRS_AUTO_HEADERS_H
fi

# prefix
echo "" >> $SRS_AUTO_HEADERS_H
echo "#define SRS_PREFIX \"${SRS_PREFIX}\"" >> $SRS_AUTO_HEADERS_H

echo "" >> $SRS_AUTO_HEADERS_H

#####################################################################################
# generated the contributors from AUTHORS.txt
#####################################################################################
if [[ -f ../AUTHORS.txt ]]; then
	SRS_CONSTRIBUTORS=`cat ../AUTHORS.txt|grep "*"|awk '{print $2}'`
	echo "#define SRS_CONSTRIBUTORS \"\\" >> $SRS_AUTO_HEADERS_H
	for CONTRIBUTOR in $SRS_CONSTRIBUTORS; do
	    echo "${CONTRIBUTOR} \\" >> $SRS_AUTO_HEADERS_H
	done
	echo "\"" >> $SRS_AUTO_HEADERS_H
else
	echo "#define SRS_CONSTRIBUTORS \"ossrs\"" >> $SRS_AUTO_HEADERS_H
fi

# new empty line to auto headers file.
echo "" >> $SRS_AUTO_HEADERS_H

#####################################################################################
# auto header EOF.
#####################################################################################
echo "#endif" >> $SRS_AUTO_HEADERS_H
echo "" >> $SRS_AUTO_HEADERS_H

