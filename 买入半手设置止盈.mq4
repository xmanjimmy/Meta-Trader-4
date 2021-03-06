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
double  take_profit_audusd    = 30;  // (30 pips)
double  take_profit_nzdusd    = 40;  // (40 pips)
double lots = 0.5;

#define COMMENTS "buy 0.5 lot"
#define MAGIC 2222

void OnStart()
  {
//---
    double take_profit = 0.0;
    if(Symbol() == "AUDUSD")
    {
        take_profit = take_profit_audusd;
    }
    else if(Symbol() == "NZDUSD")
    {
        take_profit = take_profit_nzdusd;
    }
    if(OrderSend(Symbol(), OP_BUY, lots ,Ask, 3, 0, Ask + take_profit * Point, COMMENTS, MAGIC, 0, clrNONE) == -1) //Bid + take_profit * Point
    {
        Print("FATAL failed to buy");
    }
  }
//+------------------------------------------------------------------+
