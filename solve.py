with open("enc", "r") as f:
    flag = "test"
    print(flag)
    solved = ''.join([chr((ord(flag[i]) << 8) + ord(flag[i + 1])) for i in range(0, len(flag), 2)])
    print(solved)
