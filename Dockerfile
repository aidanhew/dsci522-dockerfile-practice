FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

COPY conda-linux-64.lock /tmp/conda.lock

RUN pip install conda-lock \
    && conda-lock install --prefix /opt/conda/envs/dockerfile-practice /tmp/conda.lock \
    && conda clean --all -f -y \
    && fix-permissions /opt/conda/envs/dockerfile-practice \
    && fix-permissions "/home/${NB_USER}"

ENV PATH="/opt/conda/envs/dockerfile-practice/bin:$PATH"
ENV CONDA_DEFAULT_ENV="dockerfile-practice"
ENV CONDA_PREFIX="/opt/conda/envs/dockerfile-practice"