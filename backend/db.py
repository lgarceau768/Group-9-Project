import mysql.connector
import os
from flask import Flask, request
import json
from flask_cors import CORS

app = Flask('PokeViewer API')
CORS(app)

cnx = None

def connect():
    global cnx
    try:
        cnx = mysql.connector.connect(user='root', password='Spook524*', host='127.0.0.1', database='database')
    except Exception as e:
        return e
    
def checkNone():
    global cnx
    if cnx == None:
        connect()
                                     
def close():
    global cnx
    if cnx != None:
        cnx.close()
    

def search(column, searchVal):
    global cnx
    sqlString = "select * from pokemon where {0} like '%{1}%' order by case when {0} like '{1}' then 1 when {0} like '{1}%' then 2 when {0} like '%{1}' then 4 else 3 end".format(column, searchVal)
    checkNone()
    cursor = cnx.cursor()
    try:
        response = []
        cursor.execute(sqlString)
        for val in cursor:
            response.append({
                'Number': val[0],
                'Name': val[1],
                'Type_1': val[2],
                "Type_2": '' if val[3] == None else val[3],
                'Total': val[4],
                'HP': val[5],
                'Attack': val[6],
                'Defense': val[7],
                'Sp_Atk': val[8],
                'Sp_Def': val[9],
                'Speed': val[10]
            })
        print("search done")
        return (response, True)
    except Exception as e:
        print(str(e))
        return (str(e), False)
    
@app.route('/search', methods=['GET'])
def searchEndPoint():
    column = request.args.get("column")
    query = request.args.get("query")
    resp = search(column, query)
    if resp[1]:
        return {
            'success': True,
            "results": resp[0]
        }
    else:
        return {
            'success': False,
            'error': resp[0]
        }


app.run(host='192.168.56.1', port="9000")