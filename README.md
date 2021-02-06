This is unofficial docker image with RIPE Atlas Tools based on Alpine base image. 

One can use this to quickly bring up RIPE Atlas Tools without installating any dependencies and running measurements. Image is on dockerhub [here](https://hub.docker.com/r/anuragbhatia/ripe-atlas-tools)
<br/><br/>

## Requirements

Make sure you have a RIPE Account and hosting a RIPE Atls [hardware](https://atlas.ripe.net/get-involved/become-a-host/) or software [probe](https://labs.ripe.net/Members/alun_davies/ripe-atlas-software-probes). That way you would have credits to use RIPE Atlas platform. Incase you aren't hosting but still would like to try then create a RIPE Account & drop me a message with the email ID you used for creating account. I will add some credit so you can play around. 

Besides RIPE Account with credit, you need docker engine installed to use this container. 


<br/><br/>

### How to use this? 

First initialise config. This will keep container in one off use mode & will remove after use. It will store data on your docker host machine at ~/.config
```
docker run --rm -it --name ripe-atlas-tools ~/.config:/root/.config anuragbhatia/ripe-atlas-tools ripe-atlas configure --init
```
<br/>

Next, create an API key in your RIPE Atlas account (instructions [here](https://beta-docs.atlas.ripe.net/apis/)) and add it in your config
```
docker run --rm -it --name ripe-atlas-tools ~/.config:/root/.config anuragbhatia/ripe-atlas-tools ripe-atlas --set authorisation.create=YOUR_API_KEY
```
<br/>

Now you are ready to run measurements from CLI. For detailed instructions checkout RIPE Atlas Tools official documentation [here](https://ripe-atlas-tools.readthedocs.io/en/latest/use.html). 

<br/>

### How to remember this long run time command?
You do not need to! Explore alias in your shell. If you are using fish, you add an alias as:
```
alias ripe-atlas='docker run --rm -v ~/.config:/root/.config -it anuragbhatia/ripe-atlas-tools ripe-atlas'
funcsave ripe-atlas
```
