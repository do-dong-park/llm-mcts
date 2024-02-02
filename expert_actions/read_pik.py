import glob
import os
import pickle

base_path = os.path.dirname(__file__)

for pik_file_path in glob.glob(os.path.join(base_path, "*.pik")):
    try:
        with open(pik_file_path, "rb") as file:
            loaded_object = pickle.load(file)[0]

            if isinstance(loaded_object, list):
                object = loaded_object[0]
            else:
                object = loaded_object

            print(f"{os.path.basename(pik_file_path)} : {object}")

            print()

    except Exception as e:
        print(f"Error while processing {pik_file_path} : {e}")

""" generated task_lang, obs_lang, act_lang list info

task_lang_list : 자연어로 기술된 목표 ; Goal: put 1 cupcake inside the fridge
obs_langs_list : 관측할 수 있는 obj 목록; floor, closet
act_langs_list : agent가 수행할 수 있는 action; walk to kitchen
"""
