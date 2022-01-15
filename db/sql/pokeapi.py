import requests
import json
import sys

# pokemon generation map based by id
def pokemon_generation(pokemon_id):
    if pokemon_id <= 151:
        return 1
    elif pokemon_id <= 251:
        return 2
    elif pokemon_id <= 386:
        return 3
    elif pokemon_id <= 493:
        return 4
    elif pokemon_id <= 649:
        return 5
    elif pokemon_id <= 721:
        return 6
    elif pokemon_id <= 809:
        return 7
    elif pokemon_id <= 901:
        return 8

# translate pokemon types from english to german
def translate_pokemon_type(pokemon_type):
    if pokemon_type == "normal":
        return "Normal"
    elif pokemon_type == "fighting":
        return "Kampf"
    elif pokemon_type == "flying":
        return "Flug"
    elif pokemon_type == "poison":
        return "Gift"
    elif pokemon_type == "ground":
        return "Boden"
    elif pokemon_type == "rock":
        return "Gestein"
    elif pokemon_type == "bug":
        return "Kaefer"
    elif pokemon_type == "ghost":
        return "Geist"
    elif pokemon_type == "steel":
        return "Stahl"
    elif pokemon_type == "fire":
        return "Feuer"
    elif pokemon_type == "water":
        return "Wasser"
    elif pokemon_type == "grass":
        return "Pflanze"
    elif pokemon_type == "electric":
        return "Elektro"
    elif pokemon_type == "psychic":
        return "Psycho"
    elif pokemon_type == "ice":
        return "Eis"
    elif pokemon_type == "dragon":
        return "Drache"
    elif pokemon_type == "dark":
        return "Unlicht"
    elif pokemon_type == "fairy":
        return "Fee"
    else:
        return "Null"

def translate_damage_class(damage_class):
    if damage_class == "physical":
        return "Physisch"
    elif damage_class == "special":
        return "Speziell"
    else:
        return "Null"

def translate_learn_method(learn_method):
    if learn_method == "level-up":
        return "Level"
    elif learn_method == "machine":
        return "TM/HM"
    elif learn_method == "egg":
        return "Ei"
    elif learn_method == "tutor":
        return "Tutor"
    else:
        return "Null"

def translate_time_of_day(time_of_day):
    if time_of_day == "day":
        return "Tag"
    elif time_of_day == "night":
        return "Nacht"
    else:
        return "Null"

def call(url):
    response = requests.get(url)
    if response.status_code != 200:
        #print("Error: " + str(response.status_code))
        return json.loads(response.text)
    return response.json()

# ================ Pokemon ================
# get pokemon name
def get_pokemon_name_by_id(pokemon_id):
    name_url = "https://pokeapi.co/api/v2/pokemon-species/" + str(pokemon_id)
    return call(name_url)

# get pokemon 
def get_pokemon_by_id(pokemon_id):
    pokemon_url = "https://pokeapi.co/api/v2/pokemon/" + str(pokemon_id)
    return call(pokemon_url)

def get_pokemon(pokemon_id):
    pokemon = get_pokemon_name_by_id(pokemon_id)
    pokemon_names = pokemon["names"]
    pokemon_name = ""
    for name in pokemon_names:
        if name["language"]["name"] == "de":
            pokemon_name = name["name"]
            break
    
    pokemon = get_pokemon_by_id(pokemon_id)
    pokemon_height = pokemon["height"]
    pokemon_weight = pokemon["weight"]  

    pokemon_types = pokemon["types"]

    pokemon_type_1 = ""
    pokemon_type_2 = "Null"
    for type in pokemon_types:
        if pokemon_type_1 == "":
            pokemon_type_1 = translate_pokemon_type(type["type"]["name"])
        else:
            pokemon_type_2 = translate_pokemon_type(type["type"]["name"])

    print(f'({pokemon_id}, \"{name["name"]}\", {pokemon_height / 10.0}, {pokemon_weight / 10.0}, {pokemon_generation(int(pokemon_id))}, \"{pokemon_type_1}\", \"{pokemon_type_2}\")')

def get_pokemon_list():
    for pokemon_id in range(898):
        if pokemon_id != 0:
            get_pokemon(pokemon_id)

# ================ Evolutions ================
def get_evolution(pokemon_id):
    evolution_url = "https://pokeapi.co/api/v2/evolution-chain/" + str(pokemon_id)
    return call(evolution_url)

# print evolutions recursively
def print_evolution(evolutions, species):
    if len(evolutions) == 0:
        return
    else:
        for evolution in evolutions:
            evolved_species = evolution["species"]["url"].split("/")[-2] if (evolution["species"] is not None) else "Null"
            min_level = evolution["evolution_details"][0]["min_level"] if (evolution["evolution_details"][0]["min_level"] is not None) else "Null"
            item_id = evolution["evolution_details"][0]["item"]["url"].split("/")[-2] if (evolution["evolution_details"][0]["item"] is not None) else "Null"
            time_of_day = f'"{translate_time_of_day(evolution["evolution_details"][0]["time_of_day"])}"' if (evolution["evolution_details"][0]["time_of_day"] != "") else "Null"
            held_item = evolution["evolution_details"][0]["held_item"]["url"].split("/")[-2] if (evolution["evolution_details"][0]["held_item"] is not None) else "Null"

            print(f'({species}, {evolved_species}, {min_level}, {item_id}, {held_item}, {time_of_day}),')
            print_evolution(evolution["evolves_to"], evolution["species"]["url"].split("/")[-2])


def get_evolution_list():
    for pokemon_id in range(898):
        if pokemon_id != 0:
            try:
                evolutions = get_evolution(pokemon_id)
                #print(evolutions)
                print_evolution(evolutions["chain"]["evolves_to"], evolutions["chain"]["species"]["url"].split("/")[-2])
            except:
                pass

# ================ Items ================
def get_item_list():
    for item_id in range(1608):
        if item_id != 0:
            try:
                print_item(get_item(item_id))
            except:
                pass

def get_item(item_id):
    item_url = "https://pokeapi.co/api/v2/item/" + str(item_id)
    return call(item_url)

def print_item(item):
    for name in item["names"]:
        if name["language"]["name"] == "de":
            print(f'({item["id"]}, "{name["name"]}"),')      

# ================ Moves ================
def get_move_list():
    for move_id in range(826):
        if move_id != 0:
            try:
                print_move(get_move(move_id))
            except:
                pass

def get_move(move_id):
    move_url = "https://pokeapi.co/api/v2/move/" + str(move_id)
    return call(move_url)

def print_move(move):
    for name in move["names"]:
        if name["language"]["name"] == "de":
            move_type = translate_pokemon_type(move["type"]["name"])

            damage_class = f'"{translate_damage_class(move["damage_class"]["name"])}"' if (translate_damage_class(move["damage_class"]["name"]) != "Null") else "Null"
            generation = move["generation"]["url"].split("/")[-2]
            power = move["power"] if (move["power"] is not None) else "Null"
            accuracy = move["accuracy"] if (move["accuracy"] is not None) else "Null"

            print(f'({move["id"]}, "{name["name"]}", "{move_type}", {damage_class}, {power}, {accuracy}, {move["pp"]}, {generation}),')


# ================ Pokemon Learns Move ================
def get_pokemon_learns_moves(pokemon_id):
    pokemon_url = "https://pokeapi.co/api/v2/pokemon/" + str(pokemon_id)
    pokemon = call(pokemon_url)
    moves = pokemon["moves"]
    for move in moves:
        move_id = move["move"]["url"].split("/")[-2]
        level = move["version_group_details"][0]["level_learned_at"]
        move_learn_method = translate_learn_method(move["version_group_details"][0]["move_learn_method"]["name"])

        print(f'({pokemon_id}, {move_id}, {level}, "{move_learn_method}"),')
        # write to temp.txt
        with open("temp.txt", "a") as file:
            file.write(f'({pokemon_id}, {move_id}, {level}, "{move_learn_method}"),')

def get_pokemon_learns_moves_list():
    for pokemon_id in range(898):
        if pokemon_id != 0:
            get_pokemon_learns_moves(pokemon_id)

# ================ Machines ================
def get_machine_list():
    for item_id in range(1443):
        if item_id != 0:
            try:
                print_machine(get_machine(item_id))
            except:
                pass

def get_machine(machine_id):
    machine_url = "https://pokeapi.co/api/v2/machine/" + str(machine_id)
    return call(machine_url)

def print_machine(machine):
    item_id = machine["item"]["url"].split("/")[-2]
    move_id = machine["move"]["url"].split("/")[-2]
    version_group_id = machine["version_group"]["url"].split("/")[-2]
    # use german name
    version = get_version(version_group_id)
    for name in version["names"]:
        if name["language"]["name"] == "de":
            version = name["name"]

    print(f'({item_id}, {move_id}, "{version}"),')
    #print(f'({item_id}, {move_id}),')

# ================ Versions ================
def get_version_list():
    for version_id in range(34):
        if version_id != 0:
            try:
                print_version(get_version(version_id))
            except:
                pass

def get_version(version_id):
    version_url = "https://pokeapi.co/api/v2/version/" + str(version_id)
    return call(version_url)

def print_version(version):
    for name in version["names"]:
        if name["language"]["name"] == "de":
            print(f'("{name["name"]}"),')

# ================ Regional Variants ================
def get_regional_variant_list():
    for pokemon_id in range(898):
        if pokemon_id != 0:
            try:
                print_regional_variant(get_regional_variant(pokemon_id))
            except:
                pass

def get_regional_variant(pokemon_id):
    regional_variant_url = "https://pokeapi.co/api/v2/pokemon-form/" + str(pokemon_id)
    return call(regional_variant_url)
    
def print_regional_variant(regional_variant):
    for name in regional_variant["names"]:
        if name["language"]["name"] == "de":
            pokemon_type_1 = ""
            pokemon_type_2 = "Null"
            for type in regional_variant["types"]:
                if pokemon_type_1 == "":
                    pokemon_type_1 = translate_pokemon_type(type["type"]["name"])
                else:
                    pokemon_type_2 = translate_pokemon_type(type["type"]["name"])
            print(f'({regional_variant["id"]}, "{name["name"]}, {pokemon_type_1}, {pokemon_type_2}"),')
            
def main():
    #get_pokemon(898)
    #get_pokemon_list()
    #get_evolution_list()
    #get_item_list()
    #get_move_list()
    #get_pokemon_learns_moves_list()
    #get_version_list()
    #get_machine_list()
    get_regional_variant_list()
    

# run
if __name__ == "__main__":
    main()
