# FROM tensorflow/tensorflow:nightly-jupyter
FROM tensorflow/tensorflow:2.1.0-py3-jupyter

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
    python-pydot \
    python-pydot-ng \
    graphviz \
    wireshark \
    whois \
    wget \
    git \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /opt/app/requirements.txt

WORKDIR /opt/app

RUN pip install -U -r requirements.txt

RUN jupyter serverextension enable --py jupyter_http_over_ws
RUN jupyter nbextension enable --py --sys-prefix widgetsnbextension



RUN python -m ipykernel.kernelspec

EXPOSE 8888

CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter lab --notebook-dir=/opt/app --ip 0.0.0.0 --no-browser --allow-root"]


