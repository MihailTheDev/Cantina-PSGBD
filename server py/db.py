from __future__ import print_function

import cx_Oracle

_connectionString = "student/student@localhost/XE"
connection = cx_Oracle.connect(_connectionString)

_cursor = connection.cursor()
# _cursor.execute(" BEGIN DBMS_OUTPUT.PUT_LINE('9 squared is ' || generate() );END;")
args_list = []
# _cursor.callproc("generate_menu", [])
# print (_cursor.callfunc("get_number_of_products",  _cursor.var(cx_Oracle.OBJECT, typename='int_list', arguments=[7])).aslist())
print (_cursor.callfunc("generate",int, [] ) )
_cursor.execute("commit")
# for result in _cursor:
#     print (result)

_cursor.close()
connection.close()