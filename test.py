import os

base_path = os.path.dirname(os.path.abspath(__file__))
pik_path = os.path.join(base_path, "vh/dataset/env_task_set_40_simple.pik")
open(pik_path, "rb")
