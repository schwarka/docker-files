FROM java:8-alpine

ENV SCALA_VERSION=2.11.8
ENV SCALA_FILE=scala-$SCALA_VERSION.tgz
ENV SCALA_URL=http://downloads.lightbend.com/scala/$SCALA_VERSION/$SCALA_FILE
ENV SCALA_HOME=/usr/share/scala 

RUN echo "===== install helpers =====" && \
    apk add --no-cache curl bash && \
    \
    echo "===== install vim =====" && \
    apk add --no-cache vim && \
    \
    echo "===== install scala.vim syntax =====" && \
    mkdir -pv ~/.vim/ftdetect && \
    mkdir -pv ~/.vim/indent && \
    mkdir -pv ~/.vim/syntax && \
    for d in ftdetect indent syntax ; do \
       curl -#SLo ~/.vim/$d/scala.vim https://raw.githubusercontent.com/derekwyatt/vim-scala/master/syntax/scala.vim; \
    done && \
    \
    echo "===== install pathogen =====" && \
    mkdir -pv ~/.vim/autoload ~/.vim/bundle && \
    curl -#SLo ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim && \
    \
    echo "===== install scala =====" && \
    cd /tmp && \
    curl -#SL $SCALA_URL -o $SCALA_FILE && \
    tar xzf $SCALA_FILE && \
    mkdir $SCALA_HOME && \
    rm /tmp/scala-$SCALA_VERSION/bin/*.bat && \
    mv /tmp/scala-$SCALA_VERSION/bin /tmp/scala-$SCALA_VERSION/lib $SCALA_HOME && \
    ln -s $SCALA_HOME/bin/* /usr/bin/ && \
    \
    echo "===== cleanup =====" && \
    rm -f *.deb && \
    apk del curl && \
    rm -rf /tmp/*

CMD 'bash'
