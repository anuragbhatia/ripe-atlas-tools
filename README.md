This is unofficial docker image with RIPE Atlas Tools based on Alpine base image. 

One can use this to quickly bring up RIPE Atlas Tools without installating any dependencies and running measurements. Image is on dockerhub [here](https://hub.docker.com/r/anuragbhatia/ripe-atlas-tools)
<br/><br/>

## Requirements

Make sure you have a RIPE Account and hosting a RIPE Atlas [hardware](https://atlas.ripe.net/get-involved/become-a-host/) or software [probe](https://labs.ripe.net/Members/alun_davies/ripe-atlas-software-probes). That way you would have credits to use RIPE Atlas platform. Incase you aren't hosting but still would like to try then create a RIPE Account & drop me a message with the email ID you used for creating account. I will add some credit so you can play around. 

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
<br/><br/>

### Example of running traceroute?
Here's an example of traceroute to he.net from RIPE Atlas probes in the US
<br/>
IPv4 traceroute: 
```
docker run --rm -v ~/.config:/root/.config -it anuragbhatia/ripe-atlas-tools ripe-atlas measure traceroute --from-country us --af 4 --target he.net

Looking good!  Your measurement was created and details about it can be found here:

  https://atlas.ripe.net/measurements/29056795/


Connecting to stream...

Probe #29383
Sat Feb 06 17:30:33 UTC 2021

  1 192.168.0.1                              0.837 ms     1.383 ms     0.575 ms
  2 216.218.236.2                            4.525 ms     4.734 ms     4.779 ms

Probe #51365
Sat Feb 06 17:30:34 UTC 2021

  1 192.168.0.1                              1.302 ms     0.804 ms     0.781 ms
  2 108.198.2.1                              1.467 ms      1.23 ms       1.3 ms
  3 71.147.108.52                            8.245 ms     8.351 ms     8.339 ms
  4 12.123.240.254                          19.726 ms    19.589 ms    19.559 ms
  5 12.123.16.85                            15.906 ms    17.511 ms    16.135 ms
  6 216.66.78.121                           14.576 ms     14.56 ms    14.527 ms
  7 184.104.196.169                          15.07 ms    14.693 ms    14.906 ms
  8 184.105.64.221                           52.05 ms    52.086 ms    52.044 ms
  9 184.105.80.93                           65.628 ms    75.164 ms    52.127 ms
 10 216.218.236.2                           52.403 ms    52.436 ms    52.342 ms

Probe #33109
Sat Feb 06 17:30:34 UTC 2021

  1 192.168.1.1                               1.59 ms     0.516 ms     0.455 ms
  2 63.231.10.67                             2.886 ms     2.728 ms     2.758 ms
  3 63.226.198.17                            8.328 ms    24.902 ms     4.483 ms
  4 4.68.38.173                              3.248 ms     3.291 ms     3.459 ms
  5 4.69.219.206                             3.248 ms     3.397 ms     3.293 ms
  6 216.218.134.233                          2.977 ms     3.297 ms     3.328 ms
  7 184.105.223.217                         21.329 ms    22.242 ms    21.263 ms
  8 72.52.92.57                             80.815 ms     48.21 ms    21.781 ms
  9 216.218.236.2                           21.866 ms    21.703 ms    21.771 ms
(and more!)
```
<br/>

IPv6 traceroute: 

```
docker run --rm -v ~/.config:/root/.config -it anuragbhatia/ripe-atlas-tools ripe-atlas measure traceroute --from-country us --af 6 --target he.net

Looking good!  Your measurement was created and details about it can be found here:

  https://atlas.ripe.net/measurements/29056798/


Connecting to stream...

Probe #52590
Sat Feb 06 17:32:16 UTC 2021

  1 2606:5d00:1000:1::1                     13.051 ms     7.423 ms     1.573 ms
  2 2606:5d00::1                             1.562 ms     1.476 ms     1.511 ms
  3 2606:5d00::3                             1.641 ms     1.516 ms     1.506 ms
  4 2001:504:45:f3e8::1f                     1.712 ms     1.764 ms     1.715 ms
  5 2001:470:0:576::2                       10.081 ms     9.532 ms      9.54 ms
  6 2001:470:0:217::1                       12.284 ms    12.279 ms    12.264 ms
  7 2001:470:0:564::1                       31.754 ms    22.858 ms    44.155 ms
  8 2001:470:0:4b4::2                       25.383 ms     25.42 ms    25.525 ms
  9 2001:470:0:4b6::1                       34.078 ms    34.018 ms    34.245 ms
 10 2001:470:0:243::1                       48.785 ms    49.145 ms    48.877 ms
 11 2001:470:0:1a7::1                       56.992 ms    59.913 ms    65.193 ms
 12 2001:470:0:503::2                       50.952 ms    50.894 ms    51.087 ms

Probe #10377
Sat Feb 06 17:32:16 UTC 2021

  1 2603:7080:7800:84:8a1f:a1ff:fe2b:130a    1.672 ms     0.792 ms     1.259 ms
  2 2604:6000:400:1d::1                     10.442 ms    14.649 ms    11.991 ms
  3 2604:6000:0:4:0:2003:0:15da             12.938 ms    18.674 ms    15.491 ms
  4 2604:6000:0:4:0:2003:0:1734             11.945 ms     11.88 ms    23.331 ms
  5 *                                               *            *            *
  6 2001:1998:0:8::12                       38.924 ms    37.908 ms    38.148 ms
  7 2001:1998:0:4::519                      38.115 ms    34.324 ms    34.468 ms
  8 2001:470:0:2a0::1                       38.164 ms    37.687 ms    36.946 ms
  9 2001:470:0:296::2                       98.632 ms    83.337 ms    86.198 ms
 10 2001:470:0:1a7::1                       88.598 ms    91.168 ms    90.403 ms
 11 2001:470:0:503::2                       85.492 ms    84.223 ms    84.247 ms

Probe #55360
Sat Feb 06 17:32:16 UTC 2021

  1 2600:1700:5b70:3398::a70:1               1.154 ms     0.872 ms     0.928 ms
  2 2001:506:6000:11b:69:235:122:64          3.036 ms     2.801 ms     1.543 ms
  3 2001:506:6000:11b:71:156:215:77           5.73 ms      2.48 ms     2.085 ms
  4 *                                               *            *     4.783 ms
  5 2001:470:0:369::1                        5.187 ms     5.218 ms     5.263 ms
  6 2001:470:0:1a7::1                      434.625 ms    479.62 ms   508.061 ms
  7 2001:470:0:503::2                        7.443 ms     5.243 ms     6.837 ms
(and more!)
```