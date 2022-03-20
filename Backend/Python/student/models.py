from django.db import models
from django.contrib.auth.models import User

class Student(models.Model):
    firstname=models.CharField(max_length=200)
    middlename=models.CharField(max_length=200)
    lastname=models.CharField(max_length=200)
    studentID=models.CharField(max_length=20)
    # fingerprint=models.CharField(max_length=5000)
    def __str__(self):
        return self.firstname

   
