//+------------------------------------------------------------------+
//|                                                        一键平所有.mq4 |
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

int orderList[100] = {0};
int orderIndex = 0;    
    
void OnStart()
  {
//---
    string symbol = Symbol();
    int total = OrdersTotal();
    for(int i = 0; i<OrdersTotal(); i++)
    {
        if(OrderSelect(i, SELECT_BY_POS) == true)
        {
            if(OrderSymbol() == symbol && (OrderType() == OP_BUY || OrderType() == OP_SELL))
            {   
                orderList[orderIndex++] = OrderTicket();
            }
        }
    }
    
    CloseAllOrder();
  }
  
  void CloseAllOrder()
  {
    if(TryClose() == false)
    {
        TryClose();
    }
  }
  
  bool TryClose()
  {
    bool allSuccess = true;
    for(int i = 0; i<orderIndex; i++)
    {
        int ordernum = orderList[i];
        if(ordernum != 0 && OrderSelect(ordernum, SELECT_BY_TICKET) == true)
        {
            double orderlots = OrderLots();
            printf("close order: %d, order lots: %f\n", ordernum, orderlots);
            double closeprice = 0.0;
            if(OrderType() == OP_BUY)
            {
                closeprice = Bid;
            }
            else if(OrderType() == OP_SELL)
            {
                closeprice = Ask;
            }
            RefreshRates();
            bool ret = OrderClose(ordernum, orderlots, closeprice, 0);
            if(ret == false)
            {
                allSuccess = false;
                int error = GetLastError();
                printf("close order failed, order: %d, error no: %d", ordernum, error);
            }
            else
            {
                orderList[i] = 0;
            }            
        }
    }
    return allSuccess;
  }  
  
//+------------------------------------------------------------------+
