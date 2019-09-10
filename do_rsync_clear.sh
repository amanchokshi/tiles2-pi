MISSING_STATUS=`cat /home/jline/missing_status.txt`

if [ $MISSING_STATUS = ALL_FILES ]; then

    at 18:33 < do_rsync.sh
    echo "echo \"[18:37AM]: All data has been tranferred to Ozstar.\" >> /home/jline/t2.txt" | at 18:36
    at 18:37 < clear_data.sh
    echo "echo \"[18:37AM]: Data directory has been cleared.\" >> /home/jline/t2.txt" | at 18:38
    echo "echo \"\" >> /home/jline/t2.txt" | at 18:39
    echo "echo \"\" >> /home/jline/t2.txt" | at 18:39


elif [ $MISSING_STATUS = MISSING_FILES ]; then
    
    at 18:33 < do_rsync.sh
    echo "echo \"[18:37AM]: All data has been tranferred to Ozstar. \" >> /home/jline/t2.txt" | at 18:36
    echo "echo \"[18:37AM]: Did not clear data. Something went wrong yesterday.\" >> /home/jline/t2.txt" | at 18:38
    echo "echo \"\" >> /home/jline/t2.txt" | at 18:39
    echo "echo \"\" >> /home/jline/t2.txt" | at 18:39


else

    echo "echo \"[18:33AM]: No rsync or clear_data required as there were no data.\" >> /home/jline/t2.txt" | at  18:38
    echo "echo \"\" >> /home/jline/t2.txt" | at 18:39
    echo "echo \"\" >> /home/jline/t2.txt" | at 18:39

fi

rm /home/jline/missing_status.txt
