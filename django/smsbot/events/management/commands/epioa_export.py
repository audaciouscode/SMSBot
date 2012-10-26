import codecs
import datetime
import re

from django.core.management.base import BaseCommand, CommandError

from messages.models import *
from profiles.models import *
 
OUTPUT_FOLDER = '/usr/local/smsbot/export'

class Command(BaseCommand):
    def handle(self, *args, **options):
        print('Exporting EpiOA Excel file...')
        
        profiles = UserProfile.objects.all()
        
        non_decimal = re.compile(r'[^\d]+')
        
        now = datetime.datetime.now()
        
        profiles_answers = {}
        
        resp_keys = ['medication', 'physacti', 'kneepain']
        max_len = -1
        
        for profile in profiles: 
            profile_answers = []
            
            variables = ScriptVariable.objects.filter(script__recipient=profile).order_by('recv_date')
            
            if len(variables) > 0:
                start_date = variables[0].recv_date
                start_date = datetime.datetime(start_date.year, start_date.month, start_date.day, 0, 0, 0, 0)
                
                day_count = 0
            
                while start_date < now:
                    day_count += 1
                    
                    if max_len < (day_count * 3):
                        max_len = (day_count * 3)
                        
                    end_date = start_date + datetime.timedelta(1)
                
                    day_answers = {  }
                
                    for key in resp_keys:
                        count = 0

                        day_answers[key + "_0"] = ''
                        day_answers[key + "_1"] = ''
                        day_answers[key + "_2"] = ''

                        day_answers[key + "_timestamp_0"] = ''
                        day_answers[key + "_timestamp_1"] = ''
                        day_answers[key + "_timestamp_2"] = ''
                        
                        for variable in ScriptVariable.objects.filter(script__recipient=profile, key=key, recv_date__gte=start_date, recv_date__lte=end_date).order_by('recv_date'):
                            day_answers[key + '_' + str(count)] = non_decimal.sub('', variable.value)
                            day_answers[key + '_timestamp_' + str(count)] = str(variable.recv_date)
                            
                            count += 1
                        
                    profile_answers.append(day_answers)
                
                    start_date = end_date
                
                profiles_answers[profile.user.username] = profile_answers

        filename = OUTPUT_FOLDER + '/kneepain-' + datetime.datetime.now().strftime('%y.%m.%d-%H.%M') + '.txt'
        f = codecs.open(filename, 'w', 'utf-8')
        
        f.write('Id\t')
        f.write('Adherence\t')
        
        for i in range(0, max_len):
            f.write('Timestamp ' + str(i) + '\t')
            f.write('Data ' + str(i) + '\t')
            
        f.write('\n')
        
        for user, days in profiles_answers.items():
            count = 0
            total = 0

            for answers in days:
                total += 3
                
                if answers['kneepain_0']  != '':
                    count += 1

                if answers['kneepain_1']  != '':
                    count += 1

                if answers['kneepain_2']  != '':
                    count += 1
                    
            adherence = float(count) / float(total)

            f.write(user + '\t' + str(adherence) + '\t')
            
            for answers in days:
                f.write(answers['kneepain_timestamp_0'] + '\t')
                f.write(answers['kneepain_0'] + '\t')
                f.write(answers['kneepain_timestamp_1'] + '\t')
                f.write(answers['kneepain_1'] + '\t')
                f.write(answers['kneepain_timestamp_2'] + '\t')
                f.write(answers['kneepain_2'] + '\t')

            f.write('\n')
                
        f.close()
        
        # ---

        filename = OUTPUT_FOLDER + '/medication-' + datetime.datetime.now().strftime('%y.%m.%d-%H.%M') + '.txt'
        f = codecs.open(filename, 'w', 'utf-8')
        
        f.write('Id\t')
        f.write('Adherence\t')
        
        for i in range(0, max_len):
            f.write('Timestamp ' + str(i) + '\t')
            f.write('Data ' + str(i) + '\t')
            
        f.write('\n')
        
        for user, days in profiles_answers.items():
            count = 0
            total = 0

            for answers in days:
                total += 3
                
                if answers['medication_0']  != '':
                    count += 1

                if answers['medication_1']  != '':
                    count += 1

                if answers['medication_2']  != '':
                    count += 1
                    
            adherence = float(count) / float(total)

            f.write(user + '\t' + str(adherence) + '\t')
            
            for answers in days:
                f.write(answers['medication_timestamp_0'] + '\t')
                f.write(answers['medication_0'] + '\t')
                f.write(answers['medication_timestamp_1'] + '\t')
                f.write(answers['medication_1'] + '\t')
                f.write(answers['medication_timestamp_2'] + '\t')
                f.write(answers['medication_2'] + '\t')

            f.write('\n')
                
        f.close()

        # ---

        filename = OUTPUT_FOLDER + '/physacti-' + datetime.datetime.now().strftime('%y.%m.%d-%H.%M') + '.txt'
        f = codecs.open(filename, 'w', 'utf-8')
        
        f.write('Id\t')
        f.write('Adherence\t')
        
        for i in range(0, max_len):
            f.write('Timestamp ' + str(i) + '\t')
            f.write('Data ' + str(i) + '\t')
            
        f.write('\n')
        
        for user, days in profiles_answers.items():
            count = 0
            total = 0

            for answers in days:
                total += 3
                
                if answers['physacti_0']  != '':
                    count += 1

                if answers['physacti_1']  != '':
                    count += 1

                if answers['physacti_2']  != '':
                    count += 1
                    
            adherence = float(count) / float(total)

            f.write(user + '\t' + str(adherence) + '\t')
            
            for answers in days:
                f.write(answers['physacti_timestamp_0'] + '\t')
                f.write(answers['physacti_0'] + '\t')
                f.write(answers['physacti_timestamp_1'] + '\t')
                f.write(answers['physacti_1'] + '\t')
                f.write(answers['physacti_timestamp_2'] + '\t')
                f.write(answers['physacti_2'] + '\t')

            f.write('\n')
                
        f.close()

        print('Exported data for ' + str(len(profiles)) + ' profiles.')
