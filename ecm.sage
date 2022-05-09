def ecm(n, B=10^4, trials=100):
    R = Zmod(n)
    primes = list(prime_range(B+1))

    for _ in range(trials):
        while True:
            a = R.random_element()
            if gcd(4 * Integer(a)^3 + 27, n) == 1:
                break

        E = EllipticCurve([a, 1])
        P = E([0,1])

        try:
            for p in primes:
                P = P * p^floor(math.log(B,p))

        except ZeroDivisionError as e:
            return gcd(Integer(str(e).split()[2]), n)

    return -1
