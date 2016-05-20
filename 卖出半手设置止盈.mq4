//+------------------------------------------------------------------+
//|                                                     卖出半手设置止盈.mq4 |
//|                                                            Jimmy |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Jimmy"
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
//+------------------------------------------------------------------+
//| Script program start function                                    |
//+------------------------------------------------------------------+
extern double  take_profit    = 30;  // (75 pips)

double lots = 0.5;

#define COMMENTS "卖出半手"
#define MAGIC 2223

void OnStart()
  {
//---
    if(OrderSend(Symbol(), OP_SELL, lots , Bid, 3, 0, Bid - take_profit * Point, COMMENTS, MAGIC, 0, clrNONE) == -1) //Bid + take_profit * Point
    {
        Print("FATAL failed to buy");
    }
  }
//+------------------------------------------------------------------+
