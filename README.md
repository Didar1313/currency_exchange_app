# Currency Exchange App

This is a Flutter application that allows users to view and exchange currency rates.

## Features

- View current exchange rates for various currencies
- Convert amounts from one currency to another
- Select base and target currencies from a dropdown list
- Shows exchange rates for all available currencies

## Screenshots

![Home Screen]((https://github.com/Didar1313/currency_exchange_app/assets/73778140/0eb0fb27-bf3a-4f2c-8a98-28e1bb479a54)
)
![Exchange Screen](
![Screenshot 2024-05-20 at 11 15 44 PM](https://github.com/Didar1313/currency_exchange_app/assets/73778140/b39f96a6-c190-4c84-a72c-010fe4db890d))
![After Exchange Currency](![Screenshot 2024-05-20 at 11 18 03 PM](https://github.com/Didar1313/currency_exchange_app/assets/73778140/08783b4a-9afc-42d3-a91f-31dc2eea8dd5))

## Getting Started

To run this project on your local machine, follow these steps:

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A suitable IDE (e.g., [Android Studio](https://developer.android.com/studio), [VSCode](https://code.visualstudio.com/))

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/Didar1313/currency_exchange_app.git
   cd currency_exchange_app
   
## Folder Structure

currency_exchange_app/
├── android

├── build

├── ios

├── lib

│   ├── api_service

│   │   └── apiService.dart

│   ├── component

│   │   └── all_currency.dart

│   ├── constant

│   │   └── constant.dart

│   ├── list

│   │   ├── exchange.dart

│   │   ├── home.dart

│   ├── model

│   │   └── api_model.dart

│   ├── home_page.dart

│   └── main.dart

├── test

├── .gitignore

└── pubspec.yaml


## API

const String base_url = "https://api.currencyapi.com/v3/latest?";

const String api_key = "your_api_key";

