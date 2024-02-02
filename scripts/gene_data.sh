export PYTHONPATH="$PWD"

""" Generate Data """
# Generate Goal data

# 1. training all simple task
python vh/data_gene/gen_data/vh_init.py --port "8083" --task all --mode simple --usage train --num-per-apartment 50
# 2. generate full observable env & heuristic agent trajectories
python vh/data_gene/testing_agents/gene_data.py --mode simple \
    --dataset_path ./vh/dataset/env_task_set_50_simple.pik\
    --base-port 8103

python vh/data_gene/gen_data/vh_init.py --port "8084" --task all --mode full --usage train --num-per-apartment 50

python vh/data_gene/testing_agents/gene_data.py --mode full \
    --dataset_path ./vh/dataset/env_task_set_50_full.pik\
    --base-port 8104 

# python vh/data_gene/gen_data/vh_init.py   --port "8095" --task all --mode simple --usage test --num-per-apartment 10

# python vh/data_gene/gen_data/vh_init.py   --port "8096" --task all --mode full --usage test --num-per-apartment 10 

# python vh/data_gene/gen_data/vh_init.py   --port "8097" --task all --mode simple --unseen-apartment --usage test  --num-per-apartment 10 
# python vh/data_gene/gen_data/vh_init.py  --port "8098" --task all --mode full --unseen-apartment --usage test  --num-per-apartment 10 

# python vh/data_gene/gen_data/vh_init.py   --port "8099" --task unseen_comp --mode full --usage test --num-per-apartment 10 

# python vh/data_gene/gen_data/vh_init.py   --port "8100" --task all --mode full --unseen-item --usage test --num-per-apartment 10 
# python vh/data_gene/gen_data/vh_init.py   --port "8101" --task all --mode simple --unseen-item --usage test  --num-per-apartment 10 
# python vh/data_gene/gen_data/vh_init.py   --port "8102" --task unseen_comp --mode full --unseen-item  --usage test --num-per-apartment 10 