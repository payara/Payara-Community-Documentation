# Deploying an Exploded War

An exploded war can be deployed to a Payara Micro instance just be specifying the path to the exploded war root directory on the `--deploy` command line or via the api. The exploded war can be redeployed by creating a file .reload in the root directory of the explded war and updating its timestamp for example using 
`touch .reload` in LINUX.
