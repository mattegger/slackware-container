#!/bin/sh

slackpkg -batch=on -default_answer=n update
slackpkg -batch=on -default_answer=y install-new
slackpkg -batch=on -default_answer=y upgrade-all
slackpkg -batch=on -default_answer=y clean-system

echo '\n\n slackware is up to date \n\n'
