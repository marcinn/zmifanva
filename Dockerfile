FROM alpine
RUN apk --update add git boost boost-dev build-base boost-build bash zlib zlib-dev tcl-dev tk-dev bzip2-dev python2-dev
RUN git clone https://github.com/moses-smt/mosesdecoder.git
WORKDIR mosesdecoder
RUN bjam -j4

