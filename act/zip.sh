#!/bin/bash

# @param [string] zip source
# @param [string] zip name
# @param [boolean] Must be zipped?
function zip {
	TAR_PARAMS='-c'
	if test $3 -eq 1
		then
		TAR_PARAMS=$TAR_PARAMS'z'
	fi
		TAR_PARAMS=$TAR_PARAMS'f'

	tar $TAR_PARAMS $2 $1
}