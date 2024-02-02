export PYTHONPATH="$PWD"

""" Generate Data """

# Generate Goal data (usage도 붙어야 하는거 아님? Training / Testing으로?)
python vh/data_gene/gen_data/vh_init.py --port "8083" --task all --mode simple --num-per-apartment 40

python vh/data_gene/gen_data/vh_init.py --port "8084" --task all --mode full --num-per-apartment 40

# Generate expert data (seen 환경, 수작업 휴리스틱으로 trajectories 생성)
python vh/data_gene/testing_agents/gene_data.py --mode simple \
    --dataset_path vh/dataset/env_task_set_40_simple.pik\
    --base-port 8103

python vh/data_gene/testing_agents/gene_data.py --mode full \
--dataset_path vh/dataset/env_task_set_40_full.pik\
--base-port 8104 

# pre-process the expert data
python mcts/virtualhome/expert_data.py


""" Test the agent """

# Construct the virtuahome
python mcts/virtualhome/llm_model.py

# LLM-MCTS (llm-policy에 따른 mcts로 Trajectory 생성)
python mcts/virtualhome/mcts_agent.py \
    --exploration_constant 24 \
    --max_episode_len 50 \
    --max_depth 20 \
    --round 0 \
    --simulation_per_act 2 \
    --simulation_num 100 \
    --discount_factor 0.95  \
    --uct_type PUCT \
    --mode simple \
    --seen_item \
    --seen_apartment\
    --seen_comp


# data_gen2

# Generate Goal data

# python vh/data_gene/gen_data/vh_init.py --port "8083" --task all --mode simple --usage train --num-per-apartment 10 
# python vh/data_gene/testing_agents/gene_data.py --mode simple \
#     --dataset_path ./vh/dataset/env_task_set_500_full.pik\
#     --base-port 8104 
# python vh/data_gene/gen_data/vh_init.py --port "8083" --task all --mode full --usage train --num-per-apartment 10
# python vh/data_gene/testing_agents/gene_data.py --mode full \
#     --dataset_path ./vh/dataset/env_task_set_500_full.pik\
#     --base-port 8104 

# python vh/data_gene/gen_data/vh_init.py   --port "8095" --task all --mode simple --usage test --num-per-apartment 10

# python vh/data_gene/gen_data/vh_init.py   --port "8096" --task all --mode full --usage test --num-per-apartment 10 

# python vh/data_gene/gen_data/vh_init.py   --port "8097" --task all --mode simple --unseen-apartment --usage test  --num-per-apartment 10 
# python vh/data_gene/gen_data/vh_init.py  --port "8098" --task all --mode full --unseen-apartment --usage test  --num-per-apartment 10 

# python vh/data_gene/gen_data/vh_init.py   --port "8099" --task unseen_comp --mode full --usage test --num-per-apartment 10 

# python vh/data_gene/gen_data/vh_init.py   --port "8100" --task all --mode full --unseen-item --usage test --num-per-apartment 10 
# python vh/data_gene/gen_data/vh_init.py   --port "8101" --task all --mode simple --unseen-item --usage test  --num-per-apartment 10 
# python vh/data_gene/gen_data/vh_init.py   --port "8102" --task unseen_comp --mode full --unseen-item  --usage test --num-per-apartment 10 