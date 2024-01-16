const mockedRequestListItems = '''
  [
    {
      "itemName": "Refeição 1",
      "itemImage": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
      "itemNutrition": {
        "nutritionItems": [
          {
            "itemName": "Arroz",
            "weight": 100,
            "calories": 130,
            "proteins": 2.5,
            "fats": 0.3,
            "carbohydrates": 28
          },
          {
            "itemName": "Feijão",
            "weight": 100,
            "calories": 116,
            "proteins": 7.5,
            "fats": 0.5,
            "carbohydrates": 20
          }
        ]
      },
      "itemPrice": 10.99
    },
    {
      "itemName": "Refeição 2",
      "itemImage": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
      "itemNutrition": {
        "nutritionItems": [
          {
            "itemName": "Frango",
            "weight": 100,
            "calories": 165,
            "proteins": 31,
            "fats": 3.6,
            "carbohydrates": 0
          },
          {
            "itemName": "Salada",
            "weight": 100,
            "calories": 15,
            "proteins": 1.2,
            "fats": 0.2,
            "carbohydrates": 3
          }
        ]
      },
      "itemPrice": 12.99
    },
    {
      "itemName": "Refeição 1",
      "itemImage": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
      "itemNutrition": {
        "nutritionItems": [
          {
            "itemName": "Arroz",
            "weight": 100,
            "calories": 130,
            "proteins": 2.5,
            "fats": 0.3,
            "carbohydrates": 28
          },
          {
            "itemName": "Feijão",
            "weight": 100,
            "calories": 116,
            "proteins": 7.5,
            "fats": 0.5,
            "carbohydrates": 20
          }
        ]
      },
      "itemPrice": 10.99
    },
    {
      "itemName": "Refeição 2",
      "itemImage": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
      "itemNutrition": {
        "nutritionItems": [
          {
            "itemName": "Frango",
            "weight": 100,
            "calories": 165,
            "proteins": 31,
            "fats": 3.6,
            "carbohydrates": 0
          },
          {
            "itemName": "Salada",
            "weight": 100,
            "calories": 15,
            "proteins": 1.2,
            "fats": 0.2,
            "carbohydrates": 3
          }
        ]
      },
      "itemPrice": 12.99
    },
    {
      "itemName": "Refeição 1",
      "itemImage": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
      "itemNutrition": {
        "nutritionItems": [
          {
            "itemName": "Arroz",
            "weight": 100,
            "calories": 130,
            "proteins": 2.5,
            "fats": 0.3,
            "carbohydrates": 28
          },
          {
            "itemName": "Feijão",
            "weight": 100,
            "calories": 116,
            "proteins": 7.5,
            "fats": 0.5,
            "carbohydrates": 20
          }
        ]
      },
      "itemPrice": 10.99
    },
    {
      "itemName": "Refeição 2",
      "itemImage": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
      "itemNutrition": {
        "nutritionItems": [
          {
            "itemName": "Frango",
            "weight": 100,
            "calories": 165,
            "proteins": 31,
            "fats": 3.6,
            "carbohydrates": 0
          },
          {
            "itemName": "Salada",
            "weight": 100,
            "calories": 15,
            "proteins": 1.2,
            "fats": 0.2,
            "carbohydrates": 3
          }
        ]
      },
      "itemPrice": 12.99
    },
    {
      "itemName": "Refeição 1",
      "itemImage": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
      "itemNutrition": {
        "nutritionItems": [
          {
            "itemName": "Arroz",
            "weight": 100,
            "calories": 130,
            "proteins": 2.5,
            "fats": 0.3,
            "carbohydrates": 28
          },
          {
            "itemName": "Feijão",
            "weight": 100,
            "calories": 116,
            "proteins": 7.5,
            "fats": 0.5,
            "carbohydrates": 20
          }
        ]
      },
      "itemPrice": 10.99
    },
    {
      "itemName": "Refeição 2",
      "itemImage": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
      "itemNutrition": {
        "nutritionItems": [
          {
            "itemName": "Frango",
            "weight": 100,
            "calories": 165,
            "proteins": 31,
            "fats": 3.6,
            "carbohydrates": 0
          },
          {
            "itemName": "Salada",
            "weight": 100,
            "calories": 15,
            "proteins": 1.2,
            "fats": 0.2,
            "carbohydrates": 3
          }
        ]
      },
      "itemPrice": 12.99
    },
    {
      "itemName": "Refeição 1",
      "itemImage": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
      "itemNutrition": {
        "nutritionItems": [
          {
            "itemName": "Arroz",
            "weight": 100,
            "calories": 130,
            "proteins": 2.5,
            "fats": 0.3,
            "carbohydrates": 28
          },
          {
            "itemName": "Feijão",
            "weight": 100,
            "calories": 116,
            "proteins": 7.5,
            "fats": 0.5,
            "carbohydrates": 20
          }
        ]
      },
      "itemPrice": 10.99
    },
    {
      "itemName": "Refeição 2",
      "itemImage": "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fwallpaperaccess.com%2Ffull%2F256124.jpg&f=1&nofb=1&ipt=72a8055710a0c86d941de6722d9a753e0d40ada2b904d051a79dd0bdee892baa&ipo=images",
      "itemNutrition": {
        "nutritionItems": [
          {
            "itemName": "Frango",
            "weight": 100,
            "calories": 165,
            "proteins": 31,
            "fats": 3.6,
            "carbohydrates": 0
          },
          {
            "itemName": "Salada",
            "weight": 100,
            "calories": 15,
            "proteins": 1.2,
            "fats": 0.2,
            "carbohydrates": 3
          }
        ]
      },
      "itemPrice": 12.99
    }
  ]
''';
