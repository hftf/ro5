# See http://www.sciencedirect.com/science/article/pii/0012365X88902038
# for description of algorithm

def binom2(n):
    return n * (n - 1) / 2

def first_seq(n):
    return range(n)

def next_seq(s):
    n = len(s)
    next = [None] * n

    if s[n - 1] - s[0] <= 1:
        return None

    k = 0
    for i in range(n):
        if s[n - 1] - s[i] < 2:
            break
        k = i

    next[:k] = s[:k]
    next[k] = s[k] + 1

    j = 0
    for j in range(k + 1, n):
        next[j] = s[k] + 1
        if sum(next[:j+1]) <= binom2(j+1):
            break

    next[j] = binom2(j+1) - sum(next[:j])
    next[j+1:] = range(j+1, n)

    return next

if __name__ == '__main__':
    for n in range(4, 7):
        print
        print '====', n, '===='
        first = first_seq(n)
        print first
        while first:
            first = next_seq(first)
            print first
