FROM tensorflow/tensorflow:nightly-py3-jupyter

ENV PATH /usr/local/bin:$PATH

ENV LANG C.UTF-8
ENV LANGUAGE=en_US
ENV TZ=US/Pacific
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    pandoc \
    texlive-full \
    inkscape \
    wireshark \
    wget \
    && rm -rf /var/lib/apt/lists/*


WORKDIR /opt/app

RUN pip install -U pip
RUN pip install -U matplotlib
RUN pip install -U scikit-learn
RUN pip install -U scapy
RUN pip install -U networkx 
RUN pip install -U boto3 
RUN pip install -U awscli 
RUN pip install -U nbconvert
RUN pip install -U psycopg2-binary
RUN pip install -U scikit-learn
RUN pip install -U s3fs
RUN pip install -U sagemaker
RUN pip install -U xgboost
RUN pip install -U dnsdb

RUN pip install jupyter_http_over_ws -U
RUN jupyter serverextension enable --py jupyter_http_over_ws

EXPOSE 8888

RUN python -m ipykernel.kernelspec

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/opt/app --ip 0.0.0.0 --no-browser --allow-root"]







