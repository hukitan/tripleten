def looks(datos):
    print("Se ejecuta la descripcion de los datos:")
    print(datos.describe(include= "all"))
    print()
    print("se hace exploracion con metodo info:")
    datos.info()
    print()
    print("se hace una observacion con el metodo Head:")
    print(datos.head())
    print()
    print("hay NA?:")
    print(datos.isna().sum())
    print()
    print("Duplicados:")
    print(datos.duplicated().sum())
