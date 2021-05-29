import os, sys

def main():
	command = input("Enter A Command: ")
	if command == "build":
		os.system("make && sh script/build.sh")

	elif command == "test":
		os.system("make test")

	elif command == "install":
		pass
	elif command == "setup":
		pass
	elif command == "clean":
		os.system("make clean")
	elif command == "exit":
		exit()
	else:
		print("Error: invalid command")

main()
