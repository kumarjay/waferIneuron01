FROM ubuntu:18.04

#ENV PATH="/root/.local/bin:${PATH}"
#ARG PATH="/root/.local/bin:${PATH}"

# ENV export LC_ALL=C.UTF-8
# ENV export LANG=C.UTF-8

EXPOSE 5000

RUN apt-get update
RUN apt-get install --assume-yes --fix-broken
RUN apt-get install -y python3-dev wget git
# RUN wget https://bootstrap.pypa.io/get-pip.py && \
# 	python3 get-pip.py --user && \
# 	rm get-pip.py
RUN apt-get install python3-pip -y
RUN apt-get install -y gcc

RUN pip3 install --upgrade pip
RUN pip3 install scikit-build
COPY . src/
WORKDIR /src/
RUN  pip3 install -r requirements.txt

# ENV LC_ALL=C.UTF-8
# ENV LANG=C.UTF-8
ENTRYPOINT ["python3"]
CMD ["main.py"]
# CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
