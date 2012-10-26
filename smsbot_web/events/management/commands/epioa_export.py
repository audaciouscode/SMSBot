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
        
        for profile in profiles: 
            profile_answers = []
            
            variables = ScriptVariable.objects.filter(script__recipient=profile).order_by('recv_date')
            
            if len(variables) > 0:
                start_date = variables[0].recv_date
                start_date = datetime.datetime(start_date.year, start_date.month, start_date.day, 0, 0, 0, 0)
            
                while start_date < now:
                    end_date = start_date + datetime.timedelta(1)
                
                    day_answers = { 'medication': '', 'physacti': '', 'kneepain': '' }
                
                    for key in day_answers.keys():
                        day_answers[key + "_timestamp"] = ''
                        
                        for variable in ScriptVariable.objects.filter(key=key, recv_date__gte=start_date, recv_date__lte=end_date).order_by('recv_date'):
                            day_answers[key] = non_decimal.sub('', variable.value)
                            day_answers[key + "_timestamp"] = str(variable.recv_date)
                        
                    profile_answers.append(day_answers)
                
                    start_date = end_date
                
                profiles_answers[profile.user.username] = profile_answers
        
        max_len = -1
        
        for key, value in profiles_answers.items():
            value_len = len(value)
            
            if value_len > max_len:
                max_len = value_len

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
                total += 1
                
                if answers['kneepain']  != '':
                    count += 1
                    
            adherence = float(count) / float(total)

            f.write(user + '\t' + str(adherence) + '\t')
            
            for answers in days:
                f.write(answers['kneepain_timestamp'] + '\t')
                f.write(answers['kneepain'] + '\t')

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
                total += 1
                
                if answers['medication']  != '':
                    count += 1
                    
            adherence = float(count) / float(total)

            f.write(user + '\t' + str(adherence) + '\t')
            
            for answers in days:
                f.write(answers['medication_timestamp'] + '\t')
                f.write(answers['medication'] + '\t')

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
                total += 1
                
                if answers['physacti']  != '':
                    count += 1
                    
            adherence = float(count) / float(total)

            f.write(user + '\t' + str(adherence) + '\t')
            
            for answers in days:
                f.write(answers['physacti_timestamp'] + '\t')
                f.write(answers['physacti'] + '\t')

            f.write('\n')
                
        f.close()

        print('Exported data for ' + str(len(profiles)) + ' profiles.')
