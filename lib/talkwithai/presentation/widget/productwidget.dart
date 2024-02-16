import 'package:flutter/material.dart';
import 'package:nomabe/core/data/constants/currencyconverter.dart';
import 'package:nomabe/core/themes/nomabedimens.dart';
import 'package:nomabe/core/themes/nomabetokens.dart';
import 'package:nomabe/list/data/model/productmodel.dart';

class ProductWidget extends StatelessWidget {
  final ProductItem productItem;

  const ProductWidget({
    super.key,
    required this.productItem,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(
        NomabeDimens.nomabe_med_size,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            NomabeDimens.nomabe_rounded_value,
          ),
          color: Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: NomabeDimens.nomabe_std_card_height,
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(
                    NomabeDimens.nomabe_rounded_value,
                  ),
                  bottom: Radius.circular(
                    NomabeDimens.nomabe_zero_value,
                  ),
                ),
                child: Image.network(
                  productItem.itemImage,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(
                NomabeDimens.nomabe_med_size,
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            productItem.itemName,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: NomabeTokens.nomabeBlack,
                              fontSize: NomabeDimens.nomabe_title_text_size,
                            ),
                          ),
                        ),
                        Text(
                          productItem.itemPrice.formatAsPrice(),
                          maxLines: 1,
                          style:
                              const TextStyle(color: NomabeTokens.nomabeGreen),
                        ),
                      ],
                    ),
                    Text(
                      productItem.itemNutrition.getItemNames(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                    Container(
                      height: NomabeDimens.nomabe_med_size,
                    ),
                    Container(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        productItem.itemNutrition.getDescription(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          fontSize: NomabeDimens.nomabe_bottom_text_size,
                        ),
                      ),
                    ),
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
