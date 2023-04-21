import PPO_ProcgenGame

env_name = 'procgen-climber-v0'


def test(config, path):
    PPO_ProcgenGame.test(config, path, env_name)


def run_baseline(config, trial):
    PPO_ProcgenGame.run_baseline(config, trial, env_name)


def run_rnd_model(config, trial):
    PPO_ProcgenGame.run_rnd_model(config, trial, env_name)


def run_sp_model(config, trial):
    PPO_ProcgenGame.run_sp_model(config, trial, env_name)


def run_icm_model(config, trial):
    PPO_ProcgenGame.run_icm_model(config, trial, env_name)


def run_snd_model(config, trial):
    PPO_ProcgenGame.run_snd_model(config, trial, env_name)