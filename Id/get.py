from functions import getUrlFromMediaId

while True:
    user_input = input("Please enter a media ID (or type 'exit' to quit): ")
    if user_input.lower() == 'exit':
        break
    try:
        media_id = int(user_input)
        print(getUrlFromMediaId(media_id))
    except ValueError:
        print("Invalid input. Please enter a valid media ID.")

