#!/bin/sh

slackpkg -batch=on -default_answer=n update
slackpkg -batch=on -default_answer=y install-new
slackpkg -batch=on -default_answer=y upgrade-all
slackpkg -batch=on -default_answer=y clean-system
echo "=============== Update Finished ==============="
