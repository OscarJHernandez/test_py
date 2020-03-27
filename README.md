
# Test

This is a simple TEST application to set up a docker image and run multiple instances of a simple application.



# Docker commands

## Building a Docker Image

We must first build the docker image. The file the file that
descibes how build the image is contained in the `Dockerfile`

```
FROM continuumio/miniconda3


# Creates the environment
COPY test.yml .
RUN conda env create -f test.yml

# Activate the environment
#RUN source activate test
#RUN echo "source activate test" > ~/.bashrc

# Load in the project files 
COPY main.py .
#COPY input.json .


ENTRYPOINT ["/bin/bash", "-c"]
#CMD ["/bin/bash"]
CMD ["source activate test && python main.py container_input/input.json" ]
```

After writing the dockerfile we can build the image using the following commands:

```
$ sudo service docker start
```

```
$ docker build -t test .
```

## Saving the Docker Image to a file
```
$ docker save -o ./test.tar <image name>
```

## Loading the Docker Image from a file
```
$ docker load -i <path to the image tar file>
```


## Running the image

After building the image we can run the image using the following command:

```
$ docker run -v /home/oscar/Documents/test_py/container_output:/container_output -v /home/oscar/Documents/test_py/container_input:/container_input --rm -d test
```

This file runs the docker image named `test` using the following
* `-v` : mounts a volume in the format `host_directory:image_directory`
* `--rm`: Docker containers persist after running, therefore they are removed  
* `-d` : detach from the image, allows you to run in the background

