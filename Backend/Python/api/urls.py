from django.urls import path
from .views  import StudentList,StudentDetail
app_name='api'
urlpatterns = [
    path('<int:pk>/',StudentDetail.as_view(),name='detailcreate'),
    path('',StudentList.as_view(),name='listcreate'),

]
