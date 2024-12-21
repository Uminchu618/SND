# ノウハウ集

## 起動方法
1. 本リポジトリをクローンする
2. SNDフォルダへ移動
3. init.shを実行
- python3.10のインストール
- venvの作成
- 関連パッケージのインストールが行われる
4. venvへの切り替え
`source ../venv/bin/activate`
5. スクリプト実行
`python main.py -a ppo --env coinrun --config 4 --device cuda --gpus 0 -p --num_threads 4 --num_process 4`
4プロセス並列実行 coinrunの パターン4を実行
実際にどのようなパラメータで実行しているかは、config/ppo.config.json を参照する

## 実行時のポイント
試行回数やステップ数が大きめで時間がかかる。減らしたほうがよい。
```
      "model": "snd",
      "type": "vanilla",
      "n_env": 128,
      "trials": 9,→ 試行回数 とりあえず１回でもそれなりに時間かかる
      "steps": 64, グラフ見ながら減らす
```
## トラブルシュート
### 起動時エラー①
```
Traceback (most recent call last):
  File "/workspace/SND/main.py", line 205, in <module>
    run(i, args.algorithm, args.env, experiment)
  File "/workspace/SND/main.py", line 76, in run
    env_class.run_snd_model(experiment, id)
  File "/workspace/SND/PPO_Montezuma.py", line 27, in run_snd_model
    PPO_HardAtariGame.run_snd_model(config, trial, env_name)
  File "/workspace/SND/PPO_HardAtariGame.py", line 79, in run_snd_model
    experiment.run_snd_model(agent, trial)
  File "/workspace/SND/experiment/ppo_nenv_experiment.py", line 211, in run_snd_model
    s[i] = observation
ValueError: setting an array element with a sequence. The requested array has an inhomogeneous shape after 1 dimensions. The detected shape was (2,) + inhomogeneous part.
```
/workspace/SND/experiment/ppo_nenv_experiment.pyの戻り値が異なっている。
全てのコンフィグで起きるのではなく、モンテズマなどの特定のケースだけ発生する

