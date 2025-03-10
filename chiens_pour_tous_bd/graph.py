import psycopg2

conn = psycopg2.connect(database="kkherrazi_v4",
                        host="54.171.78.185",
                        user="khalid",
                        password="datascientest",
                        port="5432")

cur = conn.cursor()
cur.execute("SELECT * FROM Chiens LIMIT 10;")

rows = cur.fetchall()
for row in rows:
    print(row)

cur.close()

TITLE="Effectuez une jointure entre la table Chiens et Clients pour retrouver les prorpriétaires des chiens."
REQUEST = "SELECT Chiens.Nomchien, Clients.PrenomClient, Clients.NomClient FROM Chiens INNER JOIN Clients ON Chiens.IdClient=Clients.IdClient;"
print("-------------------------")
print("Objectif:\n"+TITLE)
print("\nRequest:\n"+REQUEST)
print("\nResultat:")
cur = conn.cursor()
cur.execute(REQUEST)

rows = cur.fetchall()
for row in rows:
    print(row)

cur.close()
conn.close()
