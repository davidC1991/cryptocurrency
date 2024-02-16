import 'dart:io';

import 'package:crypto/features/cryptocurrencies/data/model/cryptocurrency_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

abstract class CryptocurrencyDataSourceRepository {
  Future<Either<String, List<CryptocurrencyModel>>> getCryptocurrencies();
}

class CryptocurrencyDataSourceWith
    implements CryptocurrencyDataSourceRepository {
  @override
  Future<Either<String, List<CryptocurrencyModel>>>
      getCryptocurrencies() async {
    try {
      final Uri url = Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=10&page=1&sparkline=false');
      final response = await http.get(url);
      if (response.statusCode == 200) {
        final List<CryptocurrencyModel> cryptocurrencies =
            cryptocurrencyModelFromJson(response.body);
        /*  final List<CryptocurrencyModel> cryptocurrencies =
            cryptocurrencyModelFromJson(response.body); */
        return Right(cryptocurrencies);
      }
      final List<CryptocurrencyModel> fake =
          dataFake.map((e) => CryptocurrencyModel.fromJson(e)).toList();
      return Right(fake);
      return const Left('Error to get cryptocurrencies');
    } catch (e) {
      return Left(e.toString());
    }
  }
}

final dataFake = [
  {
    "id": "bitcoin",
    "symbol": "btc",
    "name": "Bitcoin",
    "image":
        "https://assets.coingecko.com/coins/images/1/large/bitcoin.png?1696501400",
    "current_price": 52200,
    "market_cap": 1019872943535,
    "market_cap_rank": 1,
    "fully_diluted_valuation": 1091101448969,
    "total_volume": 25597198026,
    "high_24h": 52801,
    "low_24h": 51384,
    "price_change_24h": -21.830156303833064,
    "price_change_percentage_24h": -0.0418,
    "market_cap_change_24h": -3786271555.8270264,
    "market_cap_change_percentage_24h": -0.36988,
    "circulating_supply": 19629093.0,
    "total_supply": 21000000.0,
    "max_supply": 21000000.0,
    "ath": 69045,
    "ath_change_percentage": -24.69001,
    "ath_date": "2021-11-10T14:24:11.849Z",
    "atl": 67.81,
    "atl_change_percentage": 76582.46272,
    "atl_date": "2013-07-06T00:00:00.000Z",
    "roi": null,
    "last_updated": "2024-02-16T02:17:05.566Z"
  },
  {
    "id": "ethereum",
    "symbol": "eth",
    "name": "Ethereum",
    "image":
        "https://assets.coingecko.com/coins/images/279/large/ethereum.png?1696501628",
    "current_price": 2852.79,
    "market_cap": 341808595163,
    "market_cap_rank": 2,
    "fully_diluted_valuation": 341808595163,
    "total_volume": 24498075249,
    "high_24h": 2860.65,
    "low_24h": 2765.76,
    "price_change_24h": 56.83,
    "price_change_percentage_24h": 2.03259,
    "market_cap_change_24h": 6458539325,
    "market_cap_change_percentage_24h": 1.92591,
    "circulating_supply": 120165596.089964,
    "total_supply": 120165596.089964,
    "max_supply": null,
    "ath": 4878.26,
    "ath_change_percentage": -41.63964,
    "ath_date": "2021-11-10T14:24:19.604Z",
    "atl": 0.432979,
    "atl_change_percentage": 657431.03571,
    "atl_date": "2015-10-20T00:00:00.000Z",
    "roi": {
      "times": 72.16078296567801,
      "currency": "btc",
      "percentage": 7216.078296567801
    },
    "last_updated": "2024-02-16T02:16:59.339Z"
  },
  {
    "id": "tether",
    "symbol": "usdt",
    "name": "Tether",
    "image":
        "https://assets.coingecko.com/coins/images/325/large/Tether.png?1696501661",
    "current_price": 1.003,
    "market_cap": 97218313157,
    "market_cap_rank": 3,
    "fully_diluted_valuation": 97218313157,
    "total_volume": 61026932068,
    "high_24h": 1.004,
    "low_24h": 0.99729,
    "price_change_24h": 0.00205366,
    "price_change_percentage_24h": 0.20521,
    "market_cap_change_24h": 15750457,
    "market_cap_change_percentage_24h": 0.0162,
    "circulating_supply": 97116788125.7176,
    "total_supply": 97116788125.7176,
    "max_supply": null,
    "ath": 1.32,
    "ath_change_percentage": -24.38624,
    "ath_date": "2018-07-24T00:00:00.000Z",
    "atl": 0.572521,
    "atl_change_percentage": 74.74331,
    "atl_date": "2015-03-02T00:00:00.000Z",
    "roi": null,
    "last_updated": "2024-02-16T02:15:17.152Z"
  },
  {
    "id": "binancecoin",
    "symbol": "bnb",
    "name": "BNB",
    "image":
        "https://assets.coingecko.com/coins/images/825/large/bnb-icon2_2x.png?1696501970",
    "current_price": 363.92,
    "market_cap": 55647082447,
    "market_cap_rank": 4,
    "fully_diluted_valuation": 55647082447,
    "total_volume": 2164710695,
    "high_24h": 363.71,
    "low_24h": 339.3,
    "price_change_24h": 22.11,
    "price_change_percentage_24h": 6.46894,
    "market_cap_change_24h": 3297623328,
    "market_cap_change_percentage_24h": 6.29925,
    "circulating_supply": 153856150.0,
    "total_supply": 153856150.0,
    "max_supply": 200000000.0,
    "ath": 686.31,
    "ath_change_percentage": -47.40029,
    "ath_date": "2021-05-10T07:24:17.097Z",
    "atl": 0.0398177,
    "atl_change_percentage": 906520.13587,
    "atl_date": "2017-10-19T00:00:00.000Z",
    "roi": null,
    "last_updated": "2024-02-16T02:17:10.246Z"
  },
  {
    "id": "solana",
    "symbol": "sol",
    "name": "Solana",
    "image":
        "https://assets.coingecko.com/coins/images/4128/large/solana.png?1696504756",
    "current_price": 113.74,
    "market_cap": 50081818568,
    "market_cap_rank": 5,
    "fully_diluted_valuation": 64770560522,
    "total_volume": 2540835375,
    "high_24h": 117.55,
    "low_24h": 111.83,
    "price_change_24h": -3.526724938885849,
    "price_change_percentage_24h": -3.00742,
    "market_cap_change_24h": -1101951615.662506,
    "market_cap_change_percentage_24h": -2.15293,
    "circulating_supply": 440510235.304875,
    "total_supply": 569709640.579705,
    "max_supply": null,
    "ath": 259.96,
    "ath_change_percentage": -56.34096,
    "ath_date": "2021-11-06T21:54:35.825Z",
    "atl": 0.500801,
    "atl_change_percentage": 22562.8282,
    "atl_date": "2020-05-11T19:35:23.449Z",
    "roi": null,
    "last_updated": "2024-02-16T02:17:10.401Z"
  },
  {
    "id": "ripple",
    "symbol": "xrp",
    "name": "XRP",
    "image":
        "https://assets.coingecko.com/coins/images/44/large/xrp-symbol-white-128.png?1696501442",
    "current_price": 0.567528,
    "market_cap": 30972388976,
    "market_cap_rank": 6,
    "fully_diluted_valuation": 56762161657,
    "total_volume": 1789465796,
    "high_24h": 0.572702,
    "low_24h": 0.541645,
    "price_change_24h": 0.02455324,
    "price_change_percentage_24h": 4.52199,
    "market_cap_change_24h": 1437955151,
    "market_cap_change_percentage_24h": 4.86874,
    "circulating_supply": 54558598490.0,
    "total_supply": 99987895338.0,
    "max_supply": 100000000000.0,
    "ath": 3.4,
    "ath_change_percentage": -83.35463,
    "ath_date": "2018-01-07T00:00:00.000Z",
    "atl": 0.00268621,
    "atl_change_percentage": 20958.86636,
    "atl_date": "2014-05-22T00:00:00.000Z",
    "roi": null,
    "last_updated": "2024-02-16T02:16:58.126Z"
  },
  {
    "id": "usd-coin",
    "symbol": "usdc",
    "name": "USDC",
    "image":
        "https://assets.coingecko.com/coins/images/6319/large/usdc.png?1696506694",
    "current_price": 1.002,
    "market_cap": 28174478876,
    "market_cap_rank": 7,
    "fully_diluted_valuation": 28174426486,
    "total_volume": 7605139538,
    "high_24h": 1.005,
    "low_24h": 0.995506,
    "price_change_24h": 0.00109008,
    "price_change_percentage_24h": 0.10887,
    "market_cap_change_24h": 158038264,
    "market_cap_change_percentage_24h": 0.56409,
    "circulating_supply": 28119413249.3853,
    "total_supply": 28119360960.8696,
    "max_supply": null,
    "ath": 1.17,
    "ath_change_percentage": -14.73036,
    "ath_date": "2019-05-08T00:40:28.300Z",
    "atl": 0.877647,
    "atl_change_percentage": 13.93677,
    "atl_date": "2023-03-11T08:02:13.981Z",
    "roi": null,
    "last_updated": "2024-02-16T02:17:01.959Z"
  },
  {
    "id": "staked-ether",
    "symbol": "steth",
    "name": "Lido Staked Ether",
    "image":
        "https://assets.coingecko.com/coins/images/13442/large/steth_logo.png?1696513206",
    "current_price": 2852.06,
    "market_cap": 27842729623,
    "market_cap_rank": 8,
    "fully_diluted_valuation": 27842729623,
    "total_volume": 15039497,
    "high_24h": 2860.33,
    "low_24h": 2764.55,
    "price_change_24h": 53.86,
    "price_change_percentage_24h": 1.92473,
    "market_cap_change_24h": 684870940,
    "market_cap_change_percentage_24h": 2.52181,
    "circulating_supply": 9769254.3257913,
    "total_supply": 9769254.3257913,
    "max_supply": null,
    "ath": 4829.57,
    "ath_change_percentage": -41.15217,
    "ath_date": "2021-11-10T14:40:47.256Z",
    "atl": 482.9,
    "atl_change_percentage": 488.55242,
    "atl_date": "2020-12-22T04:08:21.854Z",
    "roi": null,
    "last_updated": "2024-02-16T02:16:52.840Z"
  },
  {
    "id": "cardano",
    "symbol": "ada",
    "name": "Cardano",
    "image":
        "https://assets.coingecko.com/coins/images/975/large/cardano.png?1696502090",
    "current_price": 0.605916,
    "market_cap": 21227637601,
    "market_cap_rank": 9,
    "fully_diluted_valuation": 27185738033,
    "total_volume": 765817906,
    "high_24h": 0.610897,
    "low_24h": 0.573536,
    "price_change_24h": 0.02589957,
    "price_change_percentage_24h": 4.46531,
    "market_cap_change_24h": 910100379,
    "market_cap_change_percentage_24h": 4.47938,
    "circulating_supply": 35137677369.1983,
    "total_supply": 45000000000.0,
    "max_supply": 45000000000.0,
    "ath": 3.09,
    "ath_change_percentage": -80.47505,
    "ath_date": "2021-09-02T06:00:10.474Z",
    "atl": 0.01925275,
    "atl_change_percentage": 3030.55572,
    "atl_date": "2020-03-13T02:22:55.044Z",
    "roi": null,
    "last_updated": "2024-02-16T02:17:11.073Z"
  },
  {
    "id": "avalanche-2",
    "symbol": "avax",
    "name": "Avalanche",
    "image":
        "https://assets.coingecko.com/coins/images/12559/large/Avalanche_Circle_RedWhite_Trans.png?1696512369",
    "current_price": 41.79,
    "market_cap": 15302880170,
    "market_cap_rank": 10,
    "fully_diluted_valuation": 18135805857,
    "total_volume": 913734036,
    "high_24h": 43.44,
    "low_24h": 41.17,
    "price_change_24h": -0.8033196750867688,
    "price_change_percentage_24h": -1.88604,
    "market_cap_change_24h": -314517144.30620575,
    "market_cap_change_percentage_24h": -2.01389,
    "circulating_supply": 367499745.713365,
    "total_supply": 435532655.713365,
    "max_supply": 720000000.0,
    "ath": 144.96,
    "ath_change_percentage": -71.2516,
    "ath_date": "2021-11-21T14:18:56.538Z",
    "atl": 2.8,
    "atl_change_percentage": 1387.79283,
    "atl_date": "2020-12-31T13:15:21.540Z",
    "roi": null,
    "last_updated": "2024-02-16T02:17:06.041Z"
  }
];
