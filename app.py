# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.
import smtplib
from email import encoders
from email.mime.application import MIMEApplication
from email.mime.base import MIMEBase
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText

from oct2py import octave
import shutil
import os

from firebase_admin import credentials, firestore, storage
import firebase_admin
cred = credentials.Certificate('E:\pythonProject1\meme-6e703-firebase-adminsdk-nv6k3-c03afef500.json')
firebase_admin.initialize_app(cred, {
    'storageBucket': 'meme-6e703.appspot.com'
})
db = firestore.client()
bucket = storage.bucket()
blobs = list(bucket.list_blobs())
toaddr = ""


for i in range(0,len(blobs),5):
    blob = bucket.blob(str(blobs[i+1]).split(",")[1][1:])
    print(str(blobs[i]).split(",")[1][1:])
    blob.download_to_filename("cameraman.tif")
    #blob.delete()
    blob = bucket.blob(str(blobs[i+1]).split(",")[1][1:])
    blob.download_to_filename("canoe.png")
    #blob.delete()
    blob = bucket.blob(str(blobs[i+2]).split(",")[1][1:])
    blob.download_to_filename("forest.tif")
    #blob.delete()
    blob = bucket.blob(str(blobs[i+3]).split(",")[1][1:])
    blob.download_to_filename("leaves.png")
    #blob.delete()
    blob = bucket.blob(str(blobs[i+4]).split(",")[1][1:])
    blob.download_to_filename("totem.png")
    toaddr = str(blobs[i+4]).split(",")[1][1:].split("/")[0]
    #blob.delete()

    def exp1():
        for i in range(1,16):
            try:
                octave.eval("exp"+str(i)+"()")
            except Exception as e:
                pass
        shutil.make_archive("output", 'zip', "outputs")
        os.remove("cameraman.tif")
        os.remove("forest.tif")
        os.remove("canoe.png")
        os.remove("leaves.png")
        os.remove("totem.png")
        os.remove("z1binary.tif")
        os.remove("A.tif")
        shutil.rmtree("outputs", ignore_errors=True)

    def print_hi(name):
        # Use a breakpoint in the code line below to debug your script.
        print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.

    # Press the green button in the gutter to run the script.
    exp1()

    fromaddr = "dontbeaminimumguy@gmail.com"


    # instance of MIMEMultipart
    msg = MIMEMultipart()

    # storing the senders email address
    msg['From'] = fromaddr

    # storing the receivers email address
    msg['To'] = toaddr

    # storing the subject
    msg['Subject'] = "Subject of the Mail"

    # string to store the body of the mail
    body = "Body_of_the_mail"

    # attach the body with the msg instance
    msg.attach(MIMEText(body, 'plain'))

    # open the file to be sent
    filename = "output.zip"
    attachment = open("E:\pythonProject\output.zip", "rb")

    # instance of MIMEBase and named as p
    p = MIMEBase('application', 'octet-stream')

    # To change the payload into encoded form
    p.set_payload((attachment).read())

    # encode into base64
    encoders.encode_base64(p)

    p.add_header('Content-Disposition', "attachment; filename= %s" % filename)

    # attach the instance 'p' to instance 'msg'
    msg.attach(p)

    # creates SMTP session
    s = smtplib.SMTP('smtp.gmail.com', 587)

    # start TLS for security
    s.starttls()

    # Authentication
    s.login(fromaddr, "***********")

    # Converts the Multipart msg into a string
    text = msg.as_string()

    # sending the mail
    s.sendmail(fromaddr, toaddr, text)

    # terminating the session
    s.quit()
