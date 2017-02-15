# Micro Instance Names
Payara Micro instances are automatically assigned a name on boot. These names are generated from a dictionary of adjectives and fish names as `adjective-fish`. For example: _`Magnanimous-Payara`_, _`Disgruntled-Goldfish`_, and _`Bamboozled-Tetra`_.

## Setting a Custom Instance Name
Instance names can be overridden with the `--name` command-line argument on start-up. Manually entered instances names are non-unique.

As an example, see below:
```Shell
java -jar payara-micro.jar --name MicroInstance1
```
