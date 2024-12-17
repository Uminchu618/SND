#!/bin/bash
apt install -y software-properties-common
add-apt-repository ppa:deadsnakes/ppa
apt install -y python3.10-dev python3.10-venv
python3.10 -m venv venv
source ./venv/bin/activate

# git config --global --add user.name uminchu
# git config --global --add user.email uminchu@uminchu.jp

git clone https://github.com/Iskandor/SND.git
cd SND/
pip install -r requirements.txt
pip install torch procgen psutil tqdm torchvision ray etaprogress matplotlib
pip install gym[atari,accept-rom-license]
pip install autorom
AutoROM --accept-license

pip install umap-learn[plot]


# python main.py -a ppo --env coinrun --config 2 --device cuda --gpus 0 --num_threads 4


