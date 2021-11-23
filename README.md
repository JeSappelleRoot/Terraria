
<!-- vim-markdown-toc GFM -->

* [Terraria on Docker - POC](#terraria-on-docker---poc)
	* [How to craft Docker image ?](#how-to-craft-docker-image-)
	* [How to start the server ?](#how-to-start-the-server-)
	* [Plugins](#plugins)
	* [About config file](#about-config-file)

<!-- vim-markdown-toc -->


# Terraria on Docker - POC

Here a quick Proof Of Concept to run Terraria multiplayer game server on Docker ;)

## How to craft Docker image ? 

Clone the repo, then `docker build -t terraria:latest .`

You can also customize the given Dockerfile : 
- `server_version` will give to build context Terraria archive to download (may cause broken build...)  
- `tshock_url` to customize TShock archive download url  
- `terraria_home` to customize the Terraria user home folder and the location of server files

## How to start the server ? 

Once the Docker image is ready, use the following command :   

`docker run --name terraria --hostname terraria -p 7777:7777/tcp -p 7777:7777/udp -v $PWD/worlds:/home/terraria/worlds -it terraria:latest`

Or the multi line version : 
```
docker run --name terraria `
--hostname terraria `
-p 7777:7777/tcp `
-p 7777:7777/udp `
-v $PWD/worlds:/home/terraria/worlds `
-it terraria:latest
```

## Plugins

Docker image include the TShock addons to improve server functions
Feel free to check [here](https://terraria.fandom.com/wiki/TShock) description and usage


## About config file

You can edit the server configuration file in `./data/config`

Please refer the [official documentation](https://terraria.fandom.com/wiki/Server#Server_config_file) for more details 
