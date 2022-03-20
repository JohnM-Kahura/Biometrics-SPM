
from rest_framework import generics
from  student.models import Student
from .serializers import StudentSerializer
# from rest_framework.permissions import IsAuthenticated


class StudentList(generics.ListCreateAPIView):
    queryset=Student.objects.all()
    serializer_class=StudentSerializer
    # permission_classes=[IsAuthenticated]
    
class StudentDetail(generics.RetrieveAPIView):
    queryset=Student.objects.all()
    serializer_class=StudentSerializer