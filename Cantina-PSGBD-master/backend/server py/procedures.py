import json
import cx_Oracle

#Default values
DB_CONFIG = {
"username": "STUDENT",
"password": "STUDENT",
"address": "localhost",
"database": "XE"
}

try:
    with open("db_login_info.json", "rb") as f:
        DB_CONFIG = json.load(f)
except:
    try:
        with open("db_login_info.json", "w") as f:
            f.write(json.dumps(DB_CONFIG, indent=4))
        print("Failed to find db_login_info.json")
    except:
        print("Failed to write db_login_info.json")


_conn = cx_Oracle.connect('{}/{}@{}/{}'.format(
    DB_CONFIG["username"],
    DB_CONFIG["password"],
    DB_CONFIG["address"],
    DB_CONFIG["database"])
    )

_cursor = _conn.cursor()

available_procedures = [
    "AddStation",
    "DeleteStation",
    "AddDriver",
    "DeleteDriver",
    "AddVehicle",
    "DeleteVehicle",
    "MoveVehicle",
    "AddTraseu",
    "StartCursa",
    "EndCursa",
    "PassagerIn",
    "PassagerOut"
]

def ExecuteProcedure(procedure, args_list):
    if procedure in available_procedures:
        try:
            _cursor.callproc(procedure, args_list)
            _cursor.execute("commit")
        except Exception, e:
            print("Error encountered while executing procedure '{}':\n{}".format(procedure, e))
            return False
        return True
    print("Procedure '{}' is not in the 'available procedures' list.".format(procedure))
    return False

ExecuteProcedure("AddDriver", ["test", "test", "0737555666", "1983234456252"])

import atexit
def _atexit(connection):
    connection.close()
atexit.register(_atexit, _conn)