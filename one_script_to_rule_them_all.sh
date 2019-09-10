# This needs to run at 5:30AM everyday.

# Creates and begins populating the status.txt file, which will be the body of the email.
echo "touch /home/jline/t2.txt" | at 17:35
echo "echo \"# TILE2 PI #\" >> /home/jline/t2.txt" |at 17:36
echo "echo \" \" >> /home/jline/t2.txt" |at 17:37
echo "echo \"[05:30AM]: Sourced one_script_to_rule_them_all.sh \" >> /home/jline/t2.txt" |at 17:38
# Creates a queue of at jobs from 6AM-6AM.
# Adds  line to status.txt, confirming that jobs for the next day are in the queue.
at 17:39 < make_night_schedule.sh 

# At 6:05AM, check to see if there are 24*2*4 files in ./data/*/*.
# If there are, source do_rsync.sh then source clear_data.sh. Send email to Aman.
# If there are files missing, source do_rsync, but don't clear data. Send email to Aman, Jack, Nichole.
# Emails are sent at 6:20AM

echo "echo \"[06:00AM]: A new day begins \" >> /home/jline/t2.txt" |at 18:29
echo "echo \"[06:02AM]: Checking for missing data files from the last 24 hours.\" >> /home/jline/t2.txt" | at 18:30
at 18:31 < /home/jline/check_missing.sh
at 18:32 < /home/jline/do_rsync_clear.sh

echo "scp /home/jline/t2.txt achokshi@ozstar.swin.edu.au:/fred/oz048/achokshi/mwa_sats/data/status" | at 18:40

# Clean up and get ready for next day
echo "rm /home/jline/t2.txt" | at 18:41
