# machine-learning-tf
Tensorflow image with network analysis and publishing tools.

RUN jupyter labextension install @ijmbarr/jupyterlab_spellchecker

RUN jupyter labextension install @jupyterlab/toc

RUN jupyter labextension install @aquirdturtle/collapsible_headings

RUN jupyter labextension install @jupyterlab/google-drive

RUN jupyter serverextension enable jupyterlab_sql --py --sys-prefix

RUN jupyter lab build



