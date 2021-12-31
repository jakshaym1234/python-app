FROM python:3.8
#Add Group
RUN addgroup --gid 1000 python_group
#Add User to Group
RUN adduser --disabled-password --gecos '' --uid 1000 --gid 1000 python_user
#Add Working dir
WORKDIR /app
#Copy Files
COPY . /app
#Expose port
EXPOSE 5000
#Switch User
USER python_user 
#Install Requirements
RUN pip install -r requirements.txt
#Set Runtime for Python
ENTRYPOINT ["python"]
#Start App
CMD ["app.py"]