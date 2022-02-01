FROM jupyter/base-notebook

USER root
RUN apt update && apt install -y git


USER jovyan

RUN conda install -y -c conda-forge jupyterlab-git jupyterlab-lsp python-lsp-server jupyter-resource-usage \
    && conda install -y -c fastai nbdev \
    && jupyter lab build --minimize=False \
    && conda install -y nb_conda_kernels \ 
    && pip install nbgitpuller
