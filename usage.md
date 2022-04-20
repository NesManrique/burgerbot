## How to run

* [Create a bot in telegram](https://core.telegram.org/bots#3-how-do-i-create-a-bot)

* Create a .env file with the bot token in the following variable

```
TELEGRAM_API_KEY=0123456789:AAEEXXXXXXXXXXXXXXXXXXXXXXXXXXX
```

* Add your bot to a group chat

* Run the bot

```
docker build -t burgerbot .
docker run --rm --name burgerbot --env-file $(pwd)/.env burgerbot
```

* Go to the chat and use the command `/start`

* Add the service you want to book with `/add_service`. Possible IDs:

```
    120686: 'Anmeldung'
    120680: 'Beglaubigungen'
    120701: 'Personalausweis beantragen'
    121151: 'Reisepass beantragen'
    121921: 'Gewerbeanmeldung'
    327537: 'Fahrerlaubnis - Umschreibung einer ausländischen'
    120926: 'Führungszeugnis beantragen'
```

* By default the bot will look for Führungszeugnis beantragen appointments but this can be changed inside [burgerbot.py](burgerbot.py) line 42 and 44. Or it can be changed by creating a `chats.json` file with the a content like this.

```
[{"chat_id": <CHAT_ID>, "services": [<SERVICE_ID>]}]
```