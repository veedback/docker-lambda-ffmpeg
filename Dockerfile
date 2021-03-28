FROM public.ecr.aws/lambda/nodejs:14
USER root

RUN yum update -y && \
	yum install tar xz wget unzip -y && \
	cd /usr/local/bin && \
	mkdir ffmpeg && chown root.root ffmpeg && \
	cd ffmpeg && \
	wget https://johnvansickle.com/ffmpeg/releases/ffmpeg-release-amd64-static.tar.xz && \
	wget --no-check-certificate  https://github.com/vot/ffbinaries-prebuilt/releases/download/v3.4/ffserver-3.4-linux-64.zip && \
	tar xf ffmpeg-release-amd64-static.tar.xz && \
	unzip ffserver-3.4-linux-64.zip  && \
	cd ffmpeg*  && \
	./ffmpeg -version  && \
	chown root.root -R *  && \
	mv * ../  && \
	ln -s /usr/local/bin/ffmpeg/ffmpeg /usr/bin/ffmpeg  && \
	ln -s /usr/local/bin/ffmpeg/ffprobe /usr/bin/ffprobe && \
	ln -s /usr/local/bin/ffmpeg/qt-faststart /usr/bin/qt-faststart && \
	ln -s /usr/local/bin/ffmpeg/ffserver /usr/bin/ffserver

