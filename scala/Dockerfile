FROM java:8

ENV SCALA_VERSION 2.11.8
ENV SCALA_TARBALL http://www.scala-lang.org/files/archive/scala-$SCALA_VERSION.deb

RUN echo "===== install helpers =====" && \
    apt-get update && \
    apt-get install -y curl && \
    \
    echo "===== install vim =====" && \
    apt-get install -y vim && \
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
    curl -#SL $SCALA_TARBALL -o scala.deb && \
    dpkg -i scala.deb && \
    \
    echo "===== cleanup =====" && \
    rm -f *.deb && \
    apt-get remove -y --auto-remove curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

CMD 'bash'
