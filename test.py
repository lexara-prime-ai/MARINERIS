class Test:
    def __init__(self) -> None:
        self.status = "Running"

    def run(self):
        print(f"PROGRAM_STATUS: {self.status}...")

    def __call__(self):
        self.run()


if __name__ == "__main__":
    Test()()
