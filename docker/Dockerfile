FROM rubydata/notebooks:latest

RUN mkdir -p $HOME/taiwan2018
ADD . $HOME/taiwan2018

USER root
RUN apt-get update && apt-get install -y --no-install-recommends unzip

USER $NB_USER

RUN mkdir -p $HOME/data/mnist && cd $HOME/data/mnist \
    && wget -O mnist.zip http://data.mxnet.io/mxnet/data/mnist.zip
RUN mkdir -p $HOME/data/cifar10 && cd $HOME/data/cifar10 \
    && wget -O cifar10.zip http://data.mxnet.io/mxnet/data/cifar10.zip
RUN mkdir -p $HOME/data/cifar100 && cd $HOME/data/cifar100 \
    && wget -O cifar100.zip http://data.mxnet.io/mxnet/data/cifar100.zip

RUN cd $HOME/data/mnist \
    && unzip -x mnist.zip \
    && rm -f mnist.zip
RUN cd $HOME/data/cifar10 \
    && unzip -x cifar10.zip \
    && mv cifar/* . \
    && rmdir cifar \
    && rm -f cifar10.zip
RUN cd $HOME/data/cifar100 \
    && unzip -x cifar100.zip \
    && rm -f cifar100.zip

RUN git clone https://github.com/mrkn/mxnet.rb $HOME/mxnet.rb

RUN git clone https://github.com/RubyData/wine_data_viewer.git $HOME/wine_data_viewer

USER root

RUN cd $HOME/taiwan2018 && bundle install
ADD start-taiwan2018.sh /usr/local/bin

RUN cd $HOME/wine_data_viewer && bundle install

CMD ["start-taiwan2018.sh"]

USER $NB_USER
