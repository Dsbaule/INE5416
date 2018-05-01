instance Enum EstadosCodigo where
   fromEnum = fromJust . flip lookup table
   toEnum = fromJust . flip lookup (map swap table)
table = [(Init, 0), (Run, 1), (End, 2)]

main = do
    print("Enum:")
    print(EstadosCodigo 0)
    print(EstadosCodigo 0)
    print(EstadosCodigo 0)
