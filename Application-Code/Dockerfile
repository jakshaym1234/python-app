FROM python:3.8
RUN addgroup --gid 1000 python_group
#Add User to Group
RUN adduser --disabled-password --gecos '' --uid 1000 --gid 1000 python_user
WORKDIR /app
COPY . /app
USER python_user 
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py"]