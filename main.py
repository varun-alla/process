# This is a sample Python script.

# Press Shift+F10 to execute it or replace it with your code.
# Press Double Shift to search everywhere for classes, files, tool windows, actions, and settings.

from oct2py import octave
from flask import Flask, render_template, flash, request,Markup,redirect,send_file
from werkzeug.utils import secure_filename
import shutil
import os
app = Flask(__name__,template_folder='Template')
app.secret_key=b'_5#y2L"F4Q8z\n\xec]/'
@app.route("/",methods=['GET','POST'])
def hello() :
    return render_template('hello.html')

@app.route("/uploader",methods=['GET','POST'])
def hello3() :
    try:
        if request.method == 'POST':
            f = request.files['myfile1']
            f.save(secure_filename("cameraman.tif"))
            f = request.files['myfile2']
            f.save(secure_filename("forest.tif"))
            f = request.files['myfile3']
            f.save(secure_filename("canoe.png"))
            f = request.files['myfile4']
            f.save(secure_filename("leaves.png"))
            f = request.files['myfile5']
            f.save(secure_filename("totem.png"))
            exp1()
            shutil.make_archive("output", 'zip', "outputs")
            os.remove("cameraman.tif")
            os.remove("forest.tif")
            os.remove("canoe.png")
            os.remove("leaves.png")
            os.remove("totem.png")
            os.remove("z1binary.tif")
            shutil.rmtree("outputs", ignore_errors=True)
        return send_file("output.zip")
    except Exception as e:
        print(e)
    return "booo"


def exp1():
    for i in range(1,16):
        try:
            octave.eval("exp"+str(i)+"()")
        except Exception as e:
            pass
@app.route('/signup', methods = ['POST'])
def signup():
    email = request.form['email']
    print("The email address is '" + email + "'")
    return redirect('/')

def print_hi(name):
    # Use a breakpoint in the code line below to debug your script.
    print(f'Hi, {name}')  # Press Ctrl+F8 to toggle the breakpoint.

# Press the green button in the gutter to run the script.
if __name__ == '__main__':
    app.run(debug=True)

# See PyCharm help at https://www.jetbrains.com/help/pycharm/
