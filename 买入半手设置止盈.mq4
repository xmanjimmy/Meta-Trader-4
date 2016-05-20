//+------------------------------------------------------------------+
//|                                                     买入半手设置止盈.mq4 |
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

#define COMMENTS "buy 0.5 lot"
#define MAGIC 2222

void OnStart()
  {
//---
    if(OrderSend(Symbol(), OP_BUY, lots ,Ask, 3, 0, Ask + take_profit * Point, COMMENTS, MAGIC, 0, clrNONE) == -1) //Bid + take_profit * Point
    {
        Print("FATAL failed to buy");
    }
  }
//+------------------------------------------------------------------+
