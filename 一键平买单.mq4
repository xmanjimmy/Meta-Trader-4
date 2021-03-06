//+------------------------------------------------------------------+
//|                                                        一键平买单.mq4 |
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

int orderList[50] = {0};
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
            if(OrderSymbol() != symbol || OrderType() != OP_BUY)
            {
                continue;
            }
            orderList[orderIndex++] = OrderTicket();
            
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
            printf("close buy order: %d, order lots: %f\n", ordernum, orderlots);
            RefreshRates();
            bool ret = OrderClose(ordernum, orderlots, Bid, 0);
            if(ret == false)
            {
                allSuccess = false;
                int error = GetLastError();
                printf("close buy order failed, order: %d, error no: %d", ordernum, error);
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
