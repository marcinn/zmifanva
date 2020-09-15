FROM alpine:3.10
ADD run.sh /
RUN apk --update add git boost boost-dev build-base boost-build bash zlib zlib-dev tcl-dev tk-dev bzip2-dev python2-dev xmlrpc-c-dev xmlrpc-c py2-pip py2-virtualenv
RUN git clone https://github.com/moses-smt/mosesdecoder.git
RUN mkdir -p /opt/moses
WORKDIR mosesdecoder
RUN ./bjam --prefix=/opt/moses debug-symbols=off \
	 --no-xmlrpc-c \
	 --install-scripts=/opt/moses/moses-scripts \
	 -j4 -q
WORKDIR /
RUN git clone https://github.com/marcinn/zmifanva.git
WORKDIR zmifanva/web
RUN virtualenv env && pip install -r requirements.txt
WORKDIR /
CMD sh run.sh
