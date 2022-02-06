FROM ubuntu:18.04

LABEL maintainer="4R0N-IN"

# Install packages
RUN \
    apt-get update && \
    apt-get install -y \
    python-setuptools \
    python3-setuptools \
    python3-pip \
    chromium-browser \
    libglib2.0-dev \
    tree \
    git \
    curl \
    nmap \
    wget \
    dnsutils \
    python \
    python3 \
    zip \
    unzip

COPY M134/M134.sh M134/ 
RUN chmod +x M134/M134.sh

# Install go
WORKDIR /tmp
RUN wget -q https://dl.google.com/go/go1.16.13.linux-amd64.tar.gz -O go.tar.gz && \
    tar -C /usr/local -xzf go.tar.gz
ENV GOROOT "/usr/local/go"
ENV GOPATH "/root/go"
ENV PATH "$PATH:$GOROOT/bin:$GOPATH/bin"
RUN echo "GO-GO-GO-GO-GO-GO-GO-GO-GO-GO-GO-GO-GO-GO"
RUN echo $GOROOT
RUN echo $GOPATH

# TOOLS
RUN mkdir tools \
    mkdir -p /tools/findomain \
    mkidr -p /tools/amass \
    mkdir -p /tools/aquatone
     
WORKDIR /tools/
# Install assetfinder
RUN go get -u github.com/tomnomnom/assetfinder

    # Install findomain
    RUN wget --quiet https://github.com/Edu4rdSHL/findomain/releases/download/1.5.0/findomain-linux -O /tools/findomain/findomain
    RUN chmod +x /tools/findomain/findomain
    RUN ln -s /tools/findomain/findomain /usr/bin/findomain

    # Install amass
    RUN wget --quiet https://github.com/OWASP/Amass/releases/download/v3.5.5/amass_v3.5.5_linux_amd64.zip -O /tools/amass/amass.zip
    RUN unzip /tools/amass/amass.zip -d /tools/amass/ 
    RUN rm /tools/amass/amass.zip 
    RUN ln -s /tools/amass/amass_v3.5.5_linux_amd64/amass /usr/bin/amass 

    # Install httprobe
    RUN go get -u github.com/tomnomnom/httprobe

    # Install waybackurls
    RUN go get github.com/tomnomnom/waybackurls

    # Install aquatone
    RUN wget --quiet https://github.com/michenriksen/aquatone/releases/download/v1.7.0/aquatone_linux_amd64_1.7.0.zip -O /tools/aquatone/aquatone.zip
    RUN unzip /tools/aquatone/aquatone.zip -d /tools/aquatone/
    RUN rm /tools/aquatone/aquatone.zip
    RUN ln -s /tools/aquatone/aquatone /usr/bin/aquatone

    # Install Nez Zilev2/cmd/subfinder
    RUN go get github.com/tomnomnom/waybackurls

    # Install subfinder. Runs only on 1.17.*
    #RUN go get github.com/projectdiscovery/subfinder/v2/cmd/subfinder

    # Install ParamSpider
    RUN git clone https://github.com/devanshbatham/ParamSpider
    RUN pip3 install -r ParamSpider/requirements.txt

    # Install Dirsearch
    RUN git clone https://github.com/maurosoria/dirsearch.git

    # Install ffuf
    RUN go get github.com/ffuf/ffuf

    # Install unfurl
    RUN go get -u github.com/tomnomnom/unfurl

    # Install subjs
    RUN go get -u github.com/lc/subjs

    # Install Linkfinder
    RUN git clone https://github.com/GerbenJavado/LinkFinder.git
    RUN pip3 install termcolor

# Findomain configuration
ENV findomain_fb_token="ENTER_TOKEN_HERE"
ENV findomain_virustotal_token="ENTER_TOKEN_HERE"
ENV findomain_securitytrails_token="ENTER_TOKEN_HERE"
ENV findomain_spyse_token="ENTER_TOKEN_HERE"

WORKDIR /tools/LinkFinder/
RUN \
    python3 setup.py install && \
    pip3 install -r requirements.txt


# Change workdir
WORKDIR /mainData
ENTRYPOINT ["/M134/M134.sh"]