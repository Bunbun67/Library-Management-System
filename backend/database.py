
import mysql.connector
from mysql.connector import Error
from dotenv import load_dotenv
import os

# Load database settings
load_dotenv()

def get_db_connection():
    try:
        connection = mysql.connector.connect(
            host=os.getenv("DB_HOST", "127.0.0.1"),
            port=int(os.getenv("DB_PORT", "3306")),
            user=os.getenv("DB_USER", "root"),
            password=os.getenv("DB_PASSWORD"),
            database=os.getenv("DB_NAME", "library_management")
        )

        return connection

    except Error as e:
        print("Database connection error:", e)
        return None
