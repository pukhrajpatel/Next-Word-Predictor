import argparse


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument("--sentence", help="Enter the sentence whose blank is to be filled", type=str)
    args = parser.parse_args()
    sentence = args.sentence

    with open("best_sentence_fst.txt", mode='r', encoding='utf-8') as f:
        lines = f.read().splitlines()
        for line in lines:
            words = line.split("\t")
            if len(words) >= 2:
                if words[2] == "XXX":
                    prediction = words[3]
                    break

    print(prediction)
