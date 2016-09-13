#!/usr/bin/perl

use warnings;
use strict;
use Mail::Sender;

my ($line,@array);

@array=`mysql -usproot -psocialpatrol -e 'SELECT SUM(action_count) FROM  processor_action_log WHERE action_code = "SAVE_ENTRIES" 
AND action_time > DATE_SUB(NOW(), INTERVAL 20 MINUTE);' -hicuc-prod-log.czrsywfk6vbk.us-west-2.rds.amazonaws.com -Dsocial_patrol_logs`;

        foreach $line (@array)
                {
                        while ($line =~ /(\d+)/mgx)
                        {
                                if ( "$1" < '50' )
                                        {
                                        email("Database Log File attached.Amount of content pulled in the last 20mins is less than 50");                                 $
                                        }
                                         else
                                            {

                                             }
                         }
                }


sub email {

my $sender = new Mail::Sender
 {smtp => 'jenkins', from => 'jenkins@socialpatrol.net'};
  $sender->MailFile({to => 'andrew.morgan@icuc.social,brian.wawrow@icuc.social,justin.bowler@icuc.social,TechSupport@icuc.social',
 subject => '**URGENT** No Content Pulled',
  msg => "$_[0]",
 file => '/scripts/file.txt'
});

}
