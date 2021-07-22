from flask import Flask, request
# Create the Flask app
app = Flask(__name__)

#The root page
@app.route('/', methods=['GET', 'POST'])
def query_example():
    #Action for a POST request
    # if request.method == 'POST':
    #     request_data = request.get_json(force=True) #Fetch a user data
    #     #Check the user data
    #     try:
    #         #Get keys from the user data and transfer for the function
    #         return animal_say(emoji_dict.get(request_data['animal'].upper()), request_data['sound'], request_data['count'], emoji_dict.get("SPARKLING HEART"))
    #     except:
    #         #If the user data is incorrect
    #         return f"""Use this format: {{animal:"dog", sound:"woof", count: 4}}"""+"\n"
    #The root page
    res_text = f"""
    Hello!<br/>
    This is Python App!<br/>
    Made with 💖 by Antosha<br/>"""
    return res_text

if __name__ == '__main__':
    #context = ('cert.pem', 'key.pem') #Self signed certificate
    app.run(host="0.0.0.0", port=8080) #, ssl_context=context