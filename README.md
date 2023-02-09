# DataEngineer
TimeChecker Class:

A class that checks if the given date and time falls within the specified time range in an excel file.

Requirements:

pandas
datetime
re

Usage:
import pandas as pd
from datetime import datetime
import re

class TimeChecker:
    days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

    def __init__(self, fname):
        """
        Initialize the TimeChecker class with the excel file name.
        
        Args:
        fname: str : The name of the excel file to be used.
        """
        self.df = pd.read_excel(fname, header=None)

    def check_time(self, dt):
        """
        Check if the given date and time falls within the specified time range in the excel file.
        
        Args:
        dt: datetime : The date and time to be checked.
        
        Returns:
        list : A list of strings that correspond to the categories where the given date and time falls within the specified time range.
        """
        day1 = dt.strftime("%a")
        hour1 = dt.strftime("%I")
        minute1 = dt.strftime("%M")
        am_pm1 = dt.strftime("%p")
        dt_string = f"{hour1}:{minute1} {am_pm1}"
        dt = datetime.strptime(dt_string, "%I:%M %p")
        result = []
        for z in range(0, len(self.df)):
            res = re.split('  / ', self.df[1][z])
            for i in res:
                res1 = re.split('/', i)
                eday = ''
                nday = ''
                sday = ''
                for j in res1:
                    res2 = re.search(r"\b\s\d", j)
                    a = res2.span()
                    b = a[0]
                    eti = re.split(j[a[0]], j)[-2:]
                    eti = ' '.join(eti)
                    sti = re.split(j[a[0]], j)[-5:-3]
                    sti = ' '.join(sti)
                    day = re.split(j[a[0]], j)[:1]
                    sday = re.split('-', j)[:1][0]
                    eday = re.split('-', j)[1:2][0][:3]
                    if ',' in day[0]:
                        day=re.split(j[a[0]],j)[:2]
                        if '-' in day[0]:
                            nday=day[1]
                            if self.days.index(sday)<=self.days.index(day1) and self.days.index(day1)<=self.days.index(eday):
                                if ':' in sti:
                                    sti1 = datetime.strptime(sti, "%I:%M %p")
                                else:
                                    sti1 = datetime.strptime(sti, "%I %p")
                                if ':' in eti:
                                    eti1 = datetime.strptime(eti, "%I:%M %p")
                                else:
                                    eti1 = datetime.strptime(eti, "%I %p")
                                if sti1<=dt and dt<=eti1:
                                    result.append(self.df[0][z])
                            if self.days.index(nday)==self.days.index(day1):
                                if ':' in sti:
                                    sti1 = datetime.strptime(sti, "%I:%M %p")
                                else:
                                    sti1 = datetime.strptime(sti, "%I %p")
                                if ':' in eti:
                                    eti1 = datetime.strptime(eti, "%I:%M %p")
                                else:
                                    eti1 = datetime.strptime(eti, "%I %p")
                                if sti1<=dt and dt<=eti1:
                                    result.append(self.df[0][z])
                        elif len(day[0])==4:
                            day=re.split(j[a[0]],j)[:2]
                            sday=re.split('-',j)[:1][0][5:]
                            nday=day[0][:3]
                            if self.days.index(sday)<=self.days.index(day1) and self.days.index(day1)<=self.days.index(eday):
                                if ':' in sti:
                                    sti1 = datetime.strptime(sti, "%I:%M %p")
                                else:
                                    sti1 = datetime.strptime(sti, "%I %p")
                                if ':' in eti:
                                    eti1 = datetime.strptime(eti, "%I:%M %p")
                                else:
                                    eti1 = datetime.strptime(eti, "%I %p")
                                if sti1<=dt and dt<=eti1:
                                    result.append(self.df[0][z])
                            if self.days.index(nday)==self.days.index(day1):
                                if ':' in sti:
                                    sti1 = datetime.strptime(sti, "%I:%M %p")
                                else:
                                    sti1 = datetime.strptime(sti, "%I %p")
                                if ':' in eti:
                                    eti1 = datetime.strptime(eti, "%I:%M %p")
                                else:
                                    eti1 = datetime.strptime(eti, "%I %p")
                                if sti1<=dt and dt<=eti1:
                                    result.append(self.df[0][z])
                    elif '-' in day[0]:
                        if self.days.index(sday)<=self.days.index(day1) and self.days.index(day1)<=self.days.index(eday):
                            if ':' in sti:
                                sti1 = datetime.strptime(sti, "%I:%M %p")
                            else:
                                sti1 = datetime.strptime(sti, "%I %p")
                            if ':' in eti:
                                eti1 = datetime.strptime(eti, "%I:%M %p")
                            else:
                                eti1 = datetime.strptime(eti, "%I %p")
                            if sti1<=dt and dt<=eti1:
                                result.append(self.df[0][z])
                    elif len(day[0])==3:
                        nday=day[0]
                        if self.days.index(nday)==self.days.index(day1):
                            if ':' in sti:
                                sti1 = datetime.strptime(sti, "%I:%M %p")
                            else:
                                sti1 = datetime.strptime(sti, "%I %p")
                            if ':' in eti:
                                eti1 = datetime.strptime(eti, "%I:%M %p")
                            else:
                                eti1 = datetime.strptime(eti, "%I %p")
                            if sti1<=dt and dt<=eti1:
                                result.append(self.df[0][z])
                    elif len(day[1])==3:
                        nday=day[1]
                        if self.days.index(nday)==self.days.index(day1):
                            if ':' in sti:
                                sti1 = datetime.strptime(sti, "%I:%M %p")
                            else:
                                sti1 = datetime.strptime(sti, "%I %p")
                            if ':' in eti:
                                eti1 = datetime.strptime(eti, "%I:%M %p")
                            else:
                                eti1 = datetime.strptime(eti, "%I %p")
                            if sti1<=dt and dt<=eti1:
                                result.append(self.df[0][z])

        return result

# Example to run above class and get list of restaurant that will open on given datetime.

example_instance = TimeChecker(r"C:\Users\arakesh\Downloads\restaraunts-opening-hour.xlsx")
example_instance.check_time(datetime.strptime('2023-02-05 22:40:30', '%Y-%m-%d %H:%M:%S'))
