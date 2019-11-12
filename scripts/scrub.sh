#!/bin/bash

# This script scrubs the resume of sensitive info before commit 
sed  's/phone.*/phone: Please contact me by email/g' resume/resume.yaml  > resume/resume_scrubbed.yaml