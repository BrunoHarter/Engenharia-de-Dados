import hashlib

print("=== Mascarar dados com SHA-1 ===\n")

while True:
    texto = input("Digite uma palavra/frase (ou ENTER para sair): ").strip()
    
    if texto == "":
        print("\nEncerrando...")
        break

    # Gerar hash SHA-1
    hash_obj = hashlib.sha1(texto.encode("utf-8"))
    hash_hex = hash_obj.hexdigest()

    print(f"Texto original : {texto}")
    print(f"Hash SHA-1     : {hash_hex}")
    print("-" * 60)
