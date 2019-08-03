class CashRegister

    attr_accessor :total, :discount, :last_transaction, :cart

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @cart = []
    end

    #
    # def total
    #     @total
    # end

    def add_item(title, price, quantity = 1)
        item_details = {}
        item_details[:name] = title
        item_details[:price] = price
        item_details[:quantity] = quantity

        @cart << item_details

        @total += price * quantity
        @last_transaction = @total
#        @total.to_f
    end

    def apply_discount
        if @discount > 0
        @discount = @discount/100.to_f
        @total = @total - (@total * @discount)
        return "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def items
        items = []
        @cart.each do | item_details |
            for qty in 1..item_details[:quantity]
                items << item_details[:name]
            end
        end
        items
    end

    def void_last_transaction()
        @total -= @last_transaction
    end



end
