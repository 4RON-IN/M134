<br />
<p align="center">
  <a href="https://hub.docker.com/u/4RON-IN">
    <img
      alt="M134 for bugbounty hunter"
      src="img/banner.png"
      width="600"
    />
  </a>

  <h3 align="center">M134</h3>
</p>
  M134 for bugbounty hunter is an image with a bash script with some of the tools used at recon workflow.
</p>

## Table of Contents

- [Table of Contents](#table-of-contents)
- [About M134](#about-M134)
- [Features](#features)
- [Flow](#flow)
- [M134.sh](#M134sh)
- [Usage](#usage)
  - [Prerequisites](#prerequisites)
  - [Option 1 - Use the github repository](#option-1---use-the-github-repository)
  - [Option 2 - Use the image from docker hub](#option-2---use-the-image-from-docker-hub)
  - [Considerations to run the container](#considerations-to-run-the-container)
  - [targets.txt](#targetstxt)
  - [Create telegram webhook](#create-telegram-webhook)
- [M134 scan results](#M134-scan-results)
  - [h1-Recon](#h1-recon)
  - [M134 Alert](#M134-alert)
- [Environment tested](#environment-tested)
- [Coffee Time](#coffee-time)
- [Contributing](#contributing)
- [Stargazers over time](#stargazers-over-time)
- [Credits](#credits)
- [Disclaimer](#disclaimer)
- [License](#license)

## About M134

M134 is an automated reconnaissance docker image for bug bounty hunter write in bash script. This image has the basic tools used in the recon workflow. The purpose is to simplify the recon workflow in a simple way.

You can run the docker image in your PC o [VPS](https://www.digitalocean.com/?refcode=b5a9fc36fd95&utm_campaign=Referral_Invite&utm_medium=Referral_Program).

## Features

- Subdomain Enumeration
- Checks alive subdomain
- Finds URLs at Wayback Machine
- Screenshots of the subdomains
- Headers responses files
- Finds js files
- Search tokes in js files
- Search endpoints in js files
- Finds parameters
- Finds directories
- Telegram notifications

## Flow
<p align="center">
  <a href="https://hub.docker.com/u/4RON-IN">
    <img
      src="img/M134_flow.png"
      width="600"
    />
  </a>
</p>

## M134.sh

| **Name**          | **Repository**                                        |
| ----------------- | ----------------------------------------------------- |
| findomain         |  https://github.com/Edu4rdSHL/findomain               |                                     
| assetfinder       |  https://github.com/tomnomnom/assetfinder             |                                               
| Amass             |  https://github.com/OWASP/Amass                       |                                              
| subfinder         |  https://github.com/projectdiscovery/subfinder        |
| httprobe          |  https://github.com/tomnomnom/httprobe                |
| waybackurls       |  https://github.com/tomnomnom/waybackurls             |
| aquatone          |  https://github.com/michenriksen/aquatone             |
| subjs             |  https://github.com/lc/subjs                          |
| new-zile          |  https://github.com/bonino97/new-zile                 |    
| LinkFinder        |  https://github.com/GerbenJavado/LinkFinder           |
| paramspider       |  https://github.com/devanshbatham/ParamSpider         |
| dirsearch         |  https://github.com/maurosoria/dirsearch              |
| TelegramBot       |  https://core.telegram.org/bots                       |

## Usage
### Prerequisites

- [Docker](https://docs.docker.com/get-docker/) service installed

You can use the docker image by the next two options:

### Option 1 - Use the github repository

If you want to build the container yourself manually, git clone the repo, then build and run the following commands

    git clone --depth 1 https://github.com/4RON-IN/M134.git
    cd M134

If you want Telegram Alert, you must modify the telegram bot_token and telegram chat_ID in M134.sh

Also, you can configure access token for run findomain. You must configure the Dockerfile ("ENTER_TOKEN_HERE").

Build your docker container

    docker build -t M134 .

After building the container using either way, run the following:

    docker run --rm -it -v /path/to/local/directory:/mainData M134 -p [--program] <hackerone> -f [--file] targets.txt 


### Option 2 - Use the image from docker hub

Use image from docker hub: [4RON-IN/M134](https://hub.docker.com/u/4RON-IN/M134)

    docker pull 4RON-IN/M134
    docker run --rm -it --env chat_ID="your_chat_ID" --env token="your_token" \
    --env findomain_fb_token="fb_token" \
    --env findomain_spyse_token="spyse_token" \
    --env findomain_virustotal="virustotal_token" \
    --env findomain_securitytrails_token="securitytrails_token" \
    -v /path/to/local/directory:/mainData --name M134 4RON-IN/M134 -p [--program] <hackerone> -f [--file] targets.txt

### Considerations to run the container

There are differents use cases for use the image and you should know how to run the container properly.

  Share information from your local directory to container directory and save information on your local directory. You should save information under /mainData directory.

        docker run --rm -it -v /path/to/local/directory:/mainData --name M134 4RON-IN/M134 -p [--program] <hackerone> -f [--file] targets.txt 


### targets.txt

Your targets.txt should include a list of domains you're checking and should look something like:

        hackerone.com
        hackerone-ext-content.com
        hackerone-user-content.com

### Create telegram webhook        

Thank you [Edu4rdSHL](https://github.com/Edu4rdSHL/) for you telegram webhook write-up.

- [create_telegram_webhook](https://github.com/Edu4rdSHL/findomain/blob/master/docs/create_telegram_webhook.md)

## M134 scan results

### h1-Recon

In the following repository you will obtain all [h1 recon results](https://github.com/4RON-IN/M134-h1-enum)

<img
      alt="M134 for bugbounty hunter"
      src="img/h1-results.png"
      width="600"
/>

### M134 Alert

<img
      alt="M134 for bugbounty hunter"
      src="img/h1-recon.png"
      width="600"
/>

## Environment tested

The image was tested in the following environments:

- Docker service for Mac: Docker version 19.02.7, build afacb8b

- Docker service for Ubuntu 19.20 in [Digital Ocean VPS](https://www.digitalocean.com/?refcode=b5a9fc36fd95&utm_campaign=Referral_Invite&utm_medium=Referral_Program): Docker version 18.09.7, build build 2d0083d

## Coffee Time

If you like my content, please consider inviting me to a coffee. Thank you for your support!

[![Buy me a coffee](https://www.buymeacoffee.com/assets/img/custom_images/orange_img.png)](https://www.buymeacoffee.com/4RON-IN)

## Contributing

[Contributing](CONTRIBUTING.md)

## Stargazers over time

[![Stargazers over time](https://starchart.cc/4RON-IN/M134.svg)](https://starchart.cc/4RON-IN/M134)

## Credits

M134 has been possible thank you to the following projects.

- [Edu4rdSHL](https://github.com/Edu4rdSHL)                                             
- [tomnomnom](https://github.com/tomnomnom/)         
- [OWASP](https://github.com/OWASP/)               
- [michenriksen](https://github.com/michenriksen/)
- [bonino97](https://github.com/bonino97/)
- [GerbenJavado](https://github.com/GerbenJavado/)
- [devanshbatham](https://github.com/devanshbatham/)
- [subjs](https://github.com/lc/subjs/)
- [maurosoria](https://github.com/maurosoria/)
- [Telegram BOT](https://core.telegram.org/bots)
- [LazyRecon](https://github.com/capt-meelo/LazyRecon)
- [SubEnum](https://github.com/bing0o/SubEnum)
- [aaaguirre](https://github.com/aaaguirrep/pentest)

## Disclaimer

- M134 was written for education purposes only.

## License

[MIT](LICENSE)
Copyright (c) 2020, 4RON-IN