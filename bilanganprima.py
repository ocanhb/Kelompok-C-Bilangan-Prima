# Selamat datang di pemrograman python bilangan prima
print ("selamat datang di pemrograman python bilangan prima")

# Fungsi untuk mengecek apakah suatu bilangan adalah bilangan prima atau tidak
def bilangan_prima(n):
    # Memeriksa apakah n kurang dari atau sama dengan 1
    if n <= 1:
        return False
    
    # Iterasi dari 2 hingga akar kuadrat dari n
    for i in range(2, int(n**0.5) + 1):
        # Jika n habis dibagi oleh i, maka n bukan bilangan prima
        if n % i == 0:
            return False
    
    # Jika tidak ada pembagi habis, n adalah bilangan prima
    return True

# Mendapatkan input bilangan dari pengguna
num = int(input("Masukkan sebuah bilangan: "))

# Menampilkan hasil apakah bilangan tersebut prima atau bukan
if bilangan_prima(num):
    print("Bilangan prima.")
else:
    print("Bukan bilangan prima.")

# Ucapan terima kasih kepada pengguna
print("Terimakasih sudah menggunakan programan saya, Syahrul Arifin 0640002300031")
