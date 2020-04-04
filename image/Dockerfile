from centos:7

RUN yum update -y
RUN yum install gcc-c++ htop make gcc gcc-gfortran git -y
RUN mkdir -p /srv/build-tools

RUN mkdir -p /srv/drizzlepac
COPY ./ /srv/drizzlepac

RUN curl https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -o /tmp/miniconda3-install.sh
RUN bash /tmp/miniconda3-install.sh -b -p /data1/miniconda3

WORKDIR /srv/drizzlepac

RUN \
    source /data1/miniconda3/bin/activate && \
    conda config --add channels http://ssb.stsci.edu/astroconda && \
    conda create --name drizzlepac_build_env python=3.6 && \
    conda activate drizzlepac_build_env && \
    pip install numpy astropy codecov pytest-cov && \
    pip install -r requirements-dev.txt --upgrade -e '.[test]'

COPY ./image/build-tools/repl.sh /srv/build-tools
RUN chmod u+x /srv/build-tools/repl.sh

ENTRYPOINT ["/srv/build-tools/repl.sh"]
