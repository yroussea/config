import sys

def get_common_path(p1:str, p2:str):
    common: str = ""
    sp1, sp2 = p1.split('/'), p2.split('/')
    lp1, lp2 = len(sp1), len(sp2)
    for k in range(min(lp1, lp2)):
        if sp1[k] == sp2[k]:
            common += sp1[k]
        else:
            break
        common += '/'
    print(common)


if __name__ == "__main__":
    p1, p2 = list(sys.argv[1:3])
    get_common_path(p1, p2)
