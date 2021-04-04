from flask import Flask, render_template, request, url_for, redirect, make_response, flash, send_from_directory
import os
import random

app = Flask(__name__)
FLAG_VALUE = open("./flag").read()
title = "Simple File Zipper"
app.secret_key = "very_random_string"
app.config["MAX_CONTENT_LENGTH"] = 16 * 1024
app.config["UPLOAD_FOLDER"] = "uploads"


@app.route("/")
def main():
    return render_template("index.html", title=title)

def make_zip(filename, zip_type, mode, new_name):
    print("got here make zip")
    if zip_type == "7z":
        if mode:
            first_file = new_name
            second_file = filename
            zip_str = "7z a"
        else:
            first_file = filename
            second_file = "-o" + new_name
            zip_str = "7z x"
    else:
        if mode:
            first_file = new_name
            second_file = filename
            zip_str = zip_type
        else:
            first_file = filename
            second_file = "-d " + new_name
            zip_str = "unzip"
    command = "{} -P{} {} {}".format(zip_str, FLAG_VALUE, first_file, second_file)
    print(command)
    os.system(command)

@app.route("/upload", methods=["POST"])
def upload_file():
    if "mode" in request.form:
        mode = request.form["mode"]
        if not mode:
            flash("No mode selected.", "danger")
            return redirect("/")
        real_mode = mode == "zip"
    else:
        flash("No mode selected.", "danger")
        return redirect("/")

    real_zip_type = ""
    if "zip_type" in request.form:
        zip_type = request.form["zip_type"]
        if zip_type:
            if zip_type == "zip":
                real_zip_type = "zip"
            else:
                real_zip_type = "7z"
    if not real_zip_type:
        flash("No zip type selected.", "danger")
        return redirect("/")

    if "file" in request.files:
        file = request.files["file"]
        if file.filename:
            # zip
            if real_mode:
                filename = "{:32x}".format(random.randrange(16**32))
                new_name = "{:32x}.{}".format(random.randrange(16**32), real_zip_type)
            # unzip
            else:
                filename = "{:32x}.{}".format(random.randrange(16**32), real_zip_type)
                new_name = "{:32x}".format(random.randrange(16**32))
            full_path = app.config["UPLOAD_FOLDER"] + "/" + filename
            full_new = app.config["UPLOAD_FOLDER"] + "/" + new_name
            file.save(full_path)
            make_zip(full_path, zip_type, real_mode, full_new)
            if real_mode:
                return redirect(url_for("uploaded_file", filename=new_name))
            else:
                temp_dir = app.config["UPLOAD_FOLDER"] + "/" + new_name + "/uploads/"
                return send_from_directory(temp_dir, os.listdir(temp_dir)[0])

    flash("No file selected.", "danger")
    return redirect("/")

@app.route("/uploads/<filename>")
def uploaded_file(filename):
    return send_from_directory(app.config["UPLOAD_FOLDER"], filename)

if __name__ == "__main__":
    app.run()
