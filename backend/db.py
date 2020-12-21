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
        cnx = mysql.connector.connect(user='full5end', password='Spook524*', host='full5end.mysql.pythonanywhere-services.com', database='full5end$default')
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
    sqlString = "select * from Pokemon where {0} like '%{1}%' order by case when {0} like '{1}' then 1 when {0} like '{1}%' then 2 when {0} like '%{1}' then 4 else 3 end".format(column, searchVal)
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

@app.route('/search', methods=['OPTIONS'])
def good():
    return 'OK'

@app.route('/search_filter', methods=['OPTIONS'])
def goodAgain():
    return 'OK'

@app.route('/search', methods=['GET'])
def searchEndPoint():
    connect()
    column = request.args.get("column")
    query = request.args.get("query")
    resp = search(column, query)
    close()
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

@app.route('/search_filter', methods=['GET'])
def searchFilter():
    connect()
    column = request.args.get("type")
    query = request.args.get("query")
    resp = searchFilterQuery(column, query)
    close()
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

def searchFilterQuery(typeVal, searchVal):
    global cnx
    sqlString = "select * from Pokemon where Name like '%{0}%' and (Type_1 like '{1}' or Type_2 like '{1}')".format(searchVal, typeVal)
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
