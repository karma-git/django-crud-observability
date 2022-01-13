from django.db import models

from django_prometheus.models import ExportModelOperationsMixin

class Position(ExportModelOperationsMixin('position'), models.Model):
    title = models.CharField(max_length=50)

    def __str__(self):
        return self.title

class Employee(ExportModelOperationsMixin('employee'), models.Model):
    fullname = models.CharField(max_length=100)
    emp_code = models.CharField(max_length=3)
    mobile= models.CharField(max_length=15)
    position= models.ForeignKey(Position,on_delete=models.CASCADE)
