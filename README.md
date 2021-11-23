
<!-- vim-markdown-toc GFM -->

* [Terraria on Docker - POC](#terraria-on-docker---poc)
* [How to craft Docker image ?](#how-to-craft-docker-image-)
* [How to start the server ?](#how-to-start-the-server-)

<!-- vim-markdown-toc -->


# Terraria on Docker - POC

Here a quick Proof Of Concept to run Terraria multiplayer game server on Docker ;)

# How to craft Docker image ? 

Clone the repo, then `docker build -t terraria:latest .`

# How to start the server ? 

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
