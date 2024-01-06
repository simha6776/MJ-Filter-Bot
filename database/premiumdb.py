import pymongo
import os
from util.date import add_date
DB_NAME = os.environ.get("DB_NAME", "")
DB_URL = os.environ.get("DB_URL", "")
mongo = pymongo.MongoClient(DB_URL)
db = mongo[DB_NAME]
dbcol = db["user"]

# Total User


# insert user data
def insert(chat_id):
    user_id = int(chat_id)
    user_det = {"_id": user_id, "daily": 0, "date": 0,
                "usertype": "Free", "prexdate": None}
    try:
        dbcol.insert_one(user_det)
    except:
        return True
        pass


def dateupdate(chat_id, date):
    dbcol.update_one({"_id": chat_id}, {"$set": {"date": date}})


def usertype(chat_id, type):
    dbcol.update_one({"_id": chat_id}, {"$set": {"usertype": type}})


def addpre(chat_id):
    date = add_date()
    dbcol.update_one({"_id": chat_id}, {"$set": {"prexdate": date[0]}})


def addpredata(chat_id):
    dbcol.update_one({"_id": chat_id}, {"$set": {"prexdate": None}})


def daily(chat_id, date):
    dbcol.update_one({"_id": chat_id}, {"$set": {"daily": date}})


def getid():
    values = []
    for key in dbcol.find():
        id = key["_id"]
        values.append((id))
    return values

def delete(id):
    dbcol.delete_one(id)


def find_one(id):
    return dbcol.find_one({"_id": id})
