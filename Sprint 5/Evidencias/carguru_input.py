import random
import hashlib

# Lista de carros disponíveis
carros = ['Chevrolet Agile','Chevrolet C-10','Chevrolet Camaro','Chevrolet Caravan',
          'Chevrolet Celta','Chevrolet Chevette','Chevrolet Corsa','Chevrolet Covalt',
          'Chevrolet D-20','Chevrolet Monza','Chevrolet Onix','Chevrolet Opala',
          'Chevrolet Veraneio','Citroën C3','Fiat 147','Fiat Argo','Fiat Cronos',
          'Fiat Mobi','Fiat Panorama','Ford Corcel','Ford Escort','Ford F-1000',
          'Ford Ka','Ford Maverick','Honda City','Honda Fit','Hyundai Azera',
          'Hyundai HB20','Hyundai IX-35','Hyundai Veloster','Peugeot 2008',
          'Peugeot 206','Peugeot 208','Peugeot 3008','Peugeot 306','Peugeot 308',
          'Renault Kwid','Renault Logan','Renault Sandero','Renault Twingo',
          'Renault Zoe','Toyota Etios','Toyota Yaris','Volkswagen Apolo',
          'Volkswagen Bora','Volkswagen Brasilia','Volkswagen Fusca','Volkswagen Gol',
          'Volkswagen Kombi','Volkswagen Parati','Volkswagen Passat','Volkswagen Polo',
          'Volkswagen SP2','Volkswagen Santana','Volkswagen Voyage','Volkswagen up!']

# Solicitar entrada do usuário
print("=== CarGuru - Qual carro você deveria dirigir? ===\n")
nome_usuario = input("Digite seu nome: ").strip()

if not nome_usuario:
    nome_usuario = "Motorista Anônimo"

# Gerar hash SHA-1 do nome (para sistema de "sorte")
hash_nome = hashlib.sha1(nome_usuario.encode()).hexdigest()

# Usar hash como seed para reprodutibilidade
random.seed(int(hash_nome, 16) % (2**32))

# Escolher um carro aleatório baseado no nome
carro_sorteado = random.choice(carros)

# Exibir resultado
print(f"\n{'='*50}")
print(f"Olá, {nome_usuario}!")
print(f"{'='*50}")
print(f"\n🚗 Você deve dirigir um: {carro_sorteado}\n")
print(f"Hash do seu nome (SHA-1): {hash_nome}\n")
print(f"{'='*50}\n")
