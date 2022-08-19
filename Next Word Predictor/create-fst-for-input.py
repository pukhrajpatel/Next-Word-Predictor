import argparse


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--sentence", help="Enter the sentence whose blank is to be filled", type=str)
    args = parser.parse_args()
    sentence = args.sentence

    with open("F.txt", mode='w', encoding='utf-8') as f:
        words = sentence.split(" ")

        f.write(f"0\t1\t<s>\t<s>\n")
        for i, word in enumerate(words):
            if word == "XXX":
                with open("vocab.txt", mode='r', encoding='utf-8') as vocabulary:
                    vocab = vocabulary.read().splitlines()
                    for v in vocab:
                        f.write(f"{i+1}\t{i+2}\t{word}\t{v}\n")
            else:
                f.write(f"{i+1}\t{i+2}\t{word}\t{word}\n")
        f.write(f"{len(words)+1}\t{len(words)+2}\t</s>\t</s>\n")
        f.write(f"{len(words)+2}")
