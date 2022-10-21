class CashRegister
    attr_accessor :total, :discount, :items, :last_item
    
        def initialize(discount=nil, total=0, items=[])
          @total = total
          @discount = discount
          @items = items
        end
    
        def add_item(title, price, quantity=1)
            self.last_item = price * quantity
            self.total += (price * quantity)
            quantity.times {@items.<<(title)}
        end
    
        def apply_discount
            if @discount
                item_discount = self.discount / 100.0
                self.total -= (self.total * item_discount).to_i
                "After the discount, the total comes to $#{self.total}."
            else
                "There is no discount to apply."
            end
        end
        
        def void_last_transaction
            void_item = @items.pop(1)
            self.total -= self.last_item
        end
    end