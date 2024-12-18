#!/bin/bash

# 実行するPythonコマンド
PYTHON_CMD="python main.py -a ppo --env coinrun --config 4 --device cuda --gpus 0 -p --num_threads 4 --num_process 4"

# Hibernateスクリプトのパス
HIBERNATE_SCRIPT="./hibernate.sh"

# インスタンスID
INSTANCE_ID="1923592b-14a1-45e8-8bc1-c19672558c0f"

# Pythonコマンドを実行
echo "Executing Python command..."
eval "$PYTHON_CMD"

# Pythonコマンドが終了後、hibernateスクリプトを呼び出し
echo "Python command completed. Calling hibernate script..."
$HIBERNATE_SCRIPT "$INSTANCE_ID"

echo "Hibernate script executed."

# nohup ./run_and_hibernate.sh > run_and_hibernate.log 2>&1 &
