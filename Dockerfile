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
