//+------------------------------------------------------------------+
//| 自动对锁.mq4                                                |
//|                                                                  |
//| - Jimmy                                     |
//| -                      |
//+------------------------------------------------------------------+
#property copyright "Jimmy"

#define MAGIC  1234
#define IDENT  "自动对锁"

extern double  lots           = 1;

int start(){

   OrderSend(Symbol(), OP_BUY, lots ,Ask, 3, 0, 0, IDENT, MAGIC, 0, Blue); //Bid + take_profit * Point
   OrderSend(Symbol(), OP_SELL, lots ,Bid, 3, 0, 0, IDENT, MAGIC, 0, Red); //Ask - take_profit * Point 
   return(0);
}

