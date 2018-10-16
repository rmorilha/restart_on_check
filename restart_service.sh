#!/bin/bash

################################################################################

# This script will check to see if a website is up/down by checking the url
# If there is no response, restart the webserver service

# begin status                 #################################################
stat=0 # UP = 0; DOWN = 1

# target url ###################################################################
url="http://localhost"

# check url ####################################################################

        wget --server-response --spider $url # Check the URL

if [ "$?" -eq 0 ] # so if we have exit status of zero then server is UP
    then
            if [ "$stat" -eq 1 ]
            then
            service tomcat8 restart
            stat=0
            echo "Tomcat Reiniciado com status ${stat}"
            fi
            echo "Tomcat NORMAL status ${stat}"
    else
            if [ "$stat" -eq 0 ]
            then
            service tomcat8 restart
            stat=1
            echo "Tomcat Reiniciado com status ${stat}"
            fi
            echo "Tomcat ANORMAL status ${stat}"
    fi
exit
