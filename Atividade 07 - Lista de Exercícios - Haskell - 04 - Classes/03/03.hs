class (Integral x) => MeuInt x where
    bigger :: x -> x -> x
    smaller :: x -> x -> x
    par :: x -> Bool
    impar :: x -> Bool
    primo :: x -> Bool
    primoR :: x -> x -> Bool
    mdc :: x -> x -> x
    (===) :: x -> x -> Bool
    potencia :: x -> x -> x -- Eleva um numero ao outro
    (+++) :: x -> x -> x -- Multiplicação por somas sucessivas

    bigger a b  | a > b = a
                | otherwise = b

    smaller a b | a == (bigger a b) = b
                | otherwise = a

    par a = (mod a 2) == 0

    impar a = not (par a)

    primo n = primoR n 2

    primoR n r  | (r >= n) = True
                | (not ((mod n r) == 0)) = False
                | otherwise = (primoR n (r + 1))

    mdc a 0 = a
    mdc a b = (mdc b (mod a b))

    a === b = ((bigger a b) - (smaller a b)) <= 1

    -- Metodo para obter a potencia de a por b
    potencia 0 _ = 0
    potencia _ 0 = 1
    potencia a b = a * (potencia a (b-1))

    -- Metodo para Multiplicação de A por B
    _ +++ 0 = 0
    a +++ b = a + (a +++ (b - 1))

instance MeuInt Integer
instance MeuInt Int

main = do
    print("Teste bigger:")
    print (bigger (4::Integer) (12::Integer))
    print("Teste smaller:")
    print (smaller (4::Integer) (12::Integer))
    print("Teste par:")
    print (par (3::Integer))
    print("Teste impar:")
    print (impar (3::Integer))
    print("Teste primo:")
    print (primo (13::Integer))
    print (primo (12::Integer))
    print("Teste mdc:")
    print (mdc (66::Integer) (12::Integer))
    print("Teste ===:")
    print ((13::Integer) === (10::Integer))
    print ((11::Integer) === (10::Integer))
    print ((10::Integer) === (11::Integer))
    print("Teste potencia:")
    print (potencia (2::Integer) (5::Integer))
    print("Teste Multiplicação:")
    print ((13::Integer) +++ (10::Integer))
    print ((11::Integer) +++ (10::Integer))
